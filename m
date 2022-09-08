Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229A5B233B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56E41725;
	Thu,  8 Sep 2022 18:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56E41725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653585;
	bh=s1PBe/pF5jJRbyhX3WY2pGtR1K/IVs/yQHt+cEPY7+0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ruHRGwlK22QoRifuVYoSApub5mjsi7IafrEMSFixZBthLYHHQrTgo+QInx97vhiMF
	 d6y41IJTShKuRrx9zVux6k5imSqrWbiYaNQjoCmxmAf2R6dn9M/lwitgWcWbiKw9nX
	 m6IlIcfQRcHOnHpIUvknmmTGbAyQcrzOQu1TOryM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B99EF8023B;
	Thu,  8 Sep 2022 18:12:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C277F80217; Thu,  8 Sep 2022 18:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D169F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D169F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="V7N5SxKg"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C7D66601FA8;
 Thu,  8 Sep 2022 17:11:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653520;
 bh=s1PBe/pF5jJRbyhX3WY2pGtR1K/IVs/yQHt+cEPY7+0=;
 h=From:To:Cc:Subject:Date:From;
 b=V7N5SxKgNXkE3uhhv7ZXVkgT4pvDUknukRkXkl61R4/jVZ4XBueUDpfCU1lxCPOwH
 LvJSO6jNTMRoOWPJGXIvz10MNmkDuCn9oi7WK1IurPMc+Qh74TKrzlDSt0U7SCcOqU
 MZhGzF6qsaA1i9eXPUFJJ0Gv38EZwaXcu2ELIplCvJCX9ivQkykgO2PkN85j6VxssY
 6vL/OwMn8f4Vm2jWxrj9Umayk+m33VIBt7i3gAXRghoKsZhArCMG0dbI8W+prz+EIt
 h6v7GWRjdI6+DINlzVa8Fy+v8DBRSouseVm9wT43xDi1joxYUxFzkxVpkYyA8txfop
 9djx3x4z6uSRg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine
 drivers
Date: Thu,  8 Sep 2022 12:11:44 -0400
Message-Id: <20220908161154.648557-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>, Chunxu Li <chunxu.li@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, kernel@collabora.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


The i2s ports on MediaTek SoCs only support a single data lane. In order
to achieve full-duplex operation thus two i2s ports, one for input and
one for output, need to be used together and sharing a single clock from
one of the ports.

This clock sharing setting was previously read by the sound platform
driver from the devicetree, but given that the input/output pairing is
closely related to which codecs are connected to which ports, the
machine sound driver can infer and set it, so that no DT property is
required.

At this point only mt8183-kukui was using the DT property, but given
that this property was never documented, and that the API introduced in
this series makes it obsolete, the undocumented DT property can safely
be removed.

This series adds a function to allow setting the i2s shared clocks,
makes use of it in the machine drivers as required, and removes the no
longer required DT properties and support for them in the drivers, for
all of mt8192, mt8183 and mt8186.


Nícolas F. R. A. Prado (10):
  ASoC: mediatek: mt8192: Allow setting shared clocks from machine
    driver
  ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
  ASoC: mediatek: mt8192: Remove clock share parsing from DT
  ASoC: mediatek: mt8183: Allow setting shared clocks from machine
    driver
  ASoC: mediatek: mt8183: Configure shared clocks
  ASoC: mediatek: mt8183: Remove clock share parsing from DT
  arm64: dts: mediatek: kukui: Remove i2s-share properties
  ASoC: mediatek: mt8186: Allow setting shared clocks from machine
    driver
  ASoC: mediatek: mt8186: Configure shared clocks
  ASoC: mediatek: mt8186: Remove clock share parsing from DT

 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  5 --
 sound/soc/mediatek/mt8183/mt8183-afe-common.h |  3 ++
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 33 +++++++++++++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c    | 45 ++++++++---------
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 33 +++++++++++++
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  3 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 44 ++++++++---------
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 18 +++++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 18 +++++++
 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  3 ++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 49 ++++++++-----------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  9 ++++
 12 files changed, 180 insertions(+), 83 deletions(-)

-- 
2.37.3

