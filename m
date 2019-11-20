Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5780103E45
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 16:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595B816F3;
	Wed, 20 Nov 2019 16:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595B816F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574263594;
	bh=f256qSlN90kqouDpPk7WU6RnioJoJHu7u+8tmzwKB8E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tuREsArQYMUi4nQdJrrr9DB6CQgv1wyg9G/n0X+pJe2W9tXE809EwWOMserlJCMct
	 VmgV9s8bjNJOUz3oBzW2fchp7zCezZkVUr+ylZQ0dUAu/5avqFgfWrX4ULfwx0jBab
	 lnS/6KOJmCw0WKSlabpYWyPASBpJ7SLu0nefvs28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6920EF8015B;
	Wed, 20 Nov 2019 16:24:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEDCF80157; Wed, 20 Nov 2019 16:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5385F8013D
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 16:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5385F8013D
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id B3D7C2910DB
Received: by earth.universe (Postfix, from userid 1000)
 id 1E69D3C0C71; Wed, 20 Nov 2019 16:24:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 20 Nov 2019 16:24:00 +0100
Message-Id: <20191120152406.2744-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [alsa-devel] [PATCHv2 0/6] ASoC: da7213: support for usage with
	simple-card
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Sebastian Reichel (6):
  ASoC: da7213: Add da7212 DT compatible
  ASoC: da7213: Add regulator support
  ASoC: da7213: Provide selectable option
  ASoC: da7213: Move set_sysclk to codec level
  ASoC: da7213: Move set_pll to codec level
  ASoC: da7213: Add default clock handling

 .../devicetree/bindings/sound/da7213.txt      |   8 +-
 sound/soc/codecs/Kconfig                      |   3 +-
 sound/soc/codecs/da7213.c                     | 171 ++++++++++++++++--
 sound/soc/codecs/da7213.h                     |  11 ++
 4 files changed, 177 insertions(+), 16 deletions(-)

-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
