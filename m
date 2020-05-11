Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428E1CDB2A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 15:27:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39AF1612;
	Mon, 11 May 2020 15:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39AF1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589203660;
	bh=5KSnyFMDYBLMBK8a+N2ZS9MXpTzBZtGAIOmDLjzfsGU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B6gAgXC+MG0mjdpMMSd/Ua7cR4UvsaGcO/wWRLSGyjFEV0S3zcEwnZ9tK0ZI5UBbb
	 M0boHn+qGkjaYRqKqsZfpGy1p82BXgHQGJthZcn3SFU/2f9Hexfs2FTENAPXpislsd
	 8HSlzeLNr7WUwOUw+5SBzPXxfa5NfzdlTcpZJuVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E9BF8027D;
	Mon, 11 May 2020 15:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF487F80107; Mon, 11 May 2020 15:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1906F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 15:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1906F80107
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id A82692A13E8
Received: by jupiter.universe (Postfix, from userid 1000)
 id D7B7D480100; Mon, 11 May 2020 15:25:45 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCHv3 0/5] ASoC: da7213: support for usage with simple-card
Date: Mon, 11 May 2020 15:25:39 +0200
Message-Id: <20200511132544.82364-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This extends the da7213 driver to be used with simple-audio-card in
combination with a fixed clock. Here is a snippet of the downstream
board's DT, that is supposed to be supported by this patchset.

---------------------------------------------------------------------
/ {
	sound {
		compatible = "simple-audio-card";
		simple-audio-card,name = "audio-card";
		simple-audio-card,format = "i2s";
		simple-audio-card,bitclock-master = <&dailink_master>;
		simple-audio-card,frame-master = <&dailink_master>;

		simple-audio-card,widgets = "Speaker", "Ext Spk";
		simple-audio-card,audio-routing = "Ext Spk", "LINE";

		simple-audio-card,cpu {
			sound-dai = <&ssi1>;
		};

		dailink_master: simple-audio-card,codec {
			sound-dai = <&codec>;
		};
	};


	clk_ext_audio_codec: clock-codec {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <12288000>;
	};
};

&i2c1 {
	codec: audio-codec@1a {
		compatible = "dlg,da7212";
		reg = <0x1a>;
		#sound-dai-cells = <0>;
		VDDA-supply = <&reg_2v5_audio>;
		VDDSP-supply = <&reg_5v0_audio>;
		VDDMIC-supply = <&reg_3v3_audio>;
		VDDIO-supply = <&reg_3v3_audio>;
		clocks = <&clk_ext_audio_codec>;
		clock-names = "mclk";
	};
};
---------------------------------------------------------------------

This is mostly a resend of PATCHv2. There was quite a bit of discussion
for the last patch. As far as I can see no better solution was found and
the patch is fine as is. Sorry for the delay in sending another revision.

Changes since PATCHv2:
 * https://lore.kernel.org/alsa-devel/20191120152406.2744-1-sebastian.reichel@collabora.com/
 * dropped patch converting DA7213 into selectable Kconfig option (merged)
 * fix compatible string in patch 1 (DT binding) as pointed out by Adam Thomson
 * collected Reviewed-by from Adam Thomson for patch 2-4

Changes since PATCHv1:
 * https://lore.kernel.org/alsa-devel/20191108174843.11227-1-sebastian.reichel@collabora.com/
 * add patch adding da7212 compatible to DT bindings
 * update regulator patch, so that VDDA is enabled together with VDDIO
   while the device is enabled to avoid device reset
 * update clock patch, so that automatic PLL handling is not enabled
   when PLL is configured manually
 * update clock patch, so that automatic PLL is disabled when the device
   is suspended
 * update clock patch, so that automatic PLL is configured into bypass
   mode when possible

-- Sebastian

Sebastian Reichel (5):
  ASoC: da7213: Add da7212 DT compatible
  ASoC: da7213: Add regulator support
  ASoC: da7213: move set_sysclk to codec level
  ASoC: da7213: move set_pll to codec level
  ASoC: da7213: add default clock handling

 .../devicetree/bindings/sound/da7213.txt      |   8 +-
 sound/soc/codecs/da7213.c                     | 172 ++++++++++++++++--
 sound/soc/codecs/da7213.h                     |  11 ++
 3 files changed, 175 insertions(+), 16 deletions(-)

-- 
2.26.2

