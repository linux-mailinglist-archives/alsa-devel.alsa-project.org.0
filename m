Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5A5529D5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538062891;
	Tue, 21 Jun 2022 05:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538062891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655783807;
	bh=MHYoyzHUGHTuSLsCS3ad+lr/2z+dqvo0DAfeaZ9U8jY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mc1Z8IPBMuCMDxVvJ+2CgZVJbHbAdB0D1ZYbEQegMF7kQnIjs78uklrSU/w5S1aiV
	 Wd+3t98YUobJxEO/fhxcMM5GU95FtjG204dnmBrgMAfKZkS8pij3YrDCpQmZa74tyy
	 ZmfAYNAT0fGOTjcOX2UMJeTzUPW/oYTk2AhVuZfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B0FF80155;
	Tue, 21 Jun 2022 05:55:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12AF9F80537; Tue, 21 Jun 2022 05:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2C5AF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C5AF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Jw48CXpL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dQzQzX1L"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 295F0320099F;
 Mon, 20 Jun 2022 23:54:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 20 Jun 2022 23:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655783697; x=1655870097; bh=86
 BF35YR8RTtkcmDKUgoRNK6UpY6pnyRSrVvGNnlz9g=; b=Jw48CXpLh3an5V8nrP
 Ltgws+4BesFtuxvoEAFHkcNLEoWdzuD5pjfH6TxdsTVnRNa7jG+iVg3mAbI2mhHs
 A2x5dJ+X5THf/eVVTyAFxIvBwWp4Zh37oXZaoDfs8PR6lMzIIDTCH1WOElxwWBA3
 J/euHa0jYgDLo3gOSQBsz6dl5xu+bCpMsmq2onvDz6uHp0aHc5RwFXY11n/GFuYC
 J9X/NiL1ZVfBYRkYpzD2XhB2MxL1NR4h/njuBoBBqV6LcHDHV9ZsqV/Z6twymJPV
 BQ8Xgv0AV7zl99vClDA6vLe3b1ZdLiYOK6qS29Y3KKWBLwwbkcgsZ9c5il4aOyCU
 I8CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655783697; x=1655870097; bh=86BF35YR8RTtk
 cmDKUgoRNK6UpY6pnyRSrVvGNnlz9g=; b=dQzQzX1Lw0EIWEw7GANiKcSDyOpuv
 Y9piGt8R4jtKXBMDkCOHVaEYWOvyG+S/ICx1s3R9F6PaX1ZXl2AuXohzB/r4D1DM
 hK6jQw+tG4RtBRKstyuveBmDAxCH3B//qA0pr1y6TwYll4mgWAJFdY3/C09LQ7ef
 uOWHtONmh+m9IPhlnWnp3TUnHelJ+j8bqKpAY/hZYGJNhQNiC4/LlBKZ1W/ud5IJ
 rzsbtH/lP/Fr+53op8sEuJJkUPetq2FHyk6G1fhtnfsAH3gC+vLZQXG669aFt9Zw
 SD+GGosCdGTFuas01d6b0pOH1xVYM82NtiUm3Z4iDAJlXR8KeGFa0QBog==
X-ME-Sender: <xms:EUGxYrkOSC6wi-LDrCVHTGJxdkz27wPaf8z0Cga4Si59goD6WeDMIw>
 <xme:EUGxYu2WarqnuAark-0AUHPNsLXJd9g_TO_dKKZQ0eFqGsV3qoVLh8La1CZ2KAuHG
 Hi71fwIxgSSTx3L1g>
X-ME-Received: <xmr:EUGxYhqJ18IBqLME0tkWVUKV09iKoSB03JOOAubRcgQFQEpTD4B2EzYsaMtjiOskRw_XqjFjX26edT6sGXB_nBaLOvAMy7s7NxQQykqXk_oNQpRpwTLsptTgOkajMMDhfvBS6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:EUGxYjkozs-on3jLGeNHpflO9qhE2gUWhulCWeML9EiSew0Yo1I00Q>
 <xmx:EUGxYp0aunE1vHp2qhblD4HCCIc1IjAU-AAEbz99LokCQ8uy52vTmg>
 <xmx:EUGxYiv_yM_VIrCbERGpnfw5ZdHKlbX8Gtl9bcEyP_SUziF4CUYl0g>
 <xmx:EUGxYjMJYo_GR8pIRNlb3tiiafYo8XMRhy7aaiWBxhwjKYgr8i9Vqw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:54:56 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: sun50i-codec: Add binding for
 internal bias
Date: Mon, 20 Jun 2022 22:54:50 -0500
Message-Id: <20220621035452.60272-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621035452.60272-1-samuel@sholland.org>
References: <20220621035452.60272-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

From: Arnaud Ferraris <arnaud.ferraris@collabora.com>

In order to properly bias headset microphones, there should be a pull-up
resistor between pins HBIAS and MIC2P. This can be an external resistor,
but the codec also provides an internal 2.2K resistor which is enabled
by a register.

This patch adds a device-tree property to the sun50i-codec-analog driver
to take advantage of this feature.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
[Samuel: split binding and implementation patches]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 .../bindings/sound/allwinner,sun50i-a64-codec-analog.yaml    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
index 3b764415c9ab..66859eb8f79a 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
@@ -21,6 +21,11 @@ properties:
     description:
       Regulator for the headphone amplifier
 
+  allwinner,internal-bias-resistor:
+    description:
+      Enable the internal 2.2K bias resistor between HBIAS and MICDET pins
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.35.1

