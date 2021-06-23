Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD13B155E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522551686;
	Wed, 23 Jun 2021 10:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522551686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435433;
	bh=uKuUbEoJJ9PasAf0bIqrAO1JUVq3/Os5YGTTvuDNDn0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMJKPbOMp3QrRK3aQVU+YDcDm2RgKm3V9f8vGiFQxL9h1U3u5/GX5nDgE9sndFCc/
	 Vp09qgfxbQawq9eqZUj4EF7ZCtgqRm8luo5qtbQrsaevbsWlWrgI8Rc+/5VKsGI0/9
	 RnsTu8AnT09r6edQHLDR32qFpZCw9mGYzNoUcAkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AADF80506;
	Wed, 23 Jun 2021 10:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D05F8F804EB; Wed, 23 Jun 2021 10:00:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFA0F804E4
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 10:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFA0F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CXgV3rv+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lIYA2Uld"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8166610C6;
 Wed, 23 Jun 2021 04:00:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 04:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=WIJWu0FLrM2ac
 3hhH9t625EWYjm1NpmZuKBrZ12XXik=; b=CXgV3rv+ZAP0LxfYxf7oaVVASfCbe
 nBLaLjN9ngC+kU0HL5KI178TKhxU9UBC8bCCRS3ENCGr21IyMt6HGddcW6/TyiK/
 vCvkpub9obXT7edgGDf3lSYL/4ceLBooA/vTV0olhtb4LGdLeID+tdybrsK98pF6
 TuWfw7NpNvPfa/rw+EW+vRJVHirEkN/THPglTLzFh++u0RgAPBUJCd6LRpTJ2XfD
 oLmC+3cspG2UGAzZOIAZOrfzStSK5nMwSko0JZ2KuaMBeTBirLJbQuh8KLsrfp93
 EwUb3U+S3xXD2gd1teTBycj63EdwV4CZ4fzD8/Lz2oADWQz/rHIY3lo8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WIJWu0FLrM2ac3hhH9t625EWYjm1NpmZuKBrZ12XXik=; b=lIYA2Uld
 SAVRP+l/34XsBpoc0deYneJarQZ+scQthFTI6ixGfa99eS7OASHzhRazxI7ZV3wk
 XWcd50xik1Ma/Ruy+HV1HxWa2Jda0HMyk35SglFWxKTPqMXozyRa0I8qkoWkCW/P
 jc+b6LorlQFud2bH/KT7qBDsj4zTB+Q21Tcx8kMpQecku7jXV/cAuQYUFrfI6iMu
 xld1PFd29S3iocDzM6meeKhnrplhH9pS4MJ/vi1WZLgQM6mFLv6gIVLm2RxDwDnn
 d9dq2VI78kUnlEU0f470ampwVOaKgRBXQk6toVReaXVLWORGKgeCJ21N4e+dDazT
 nj9RA6SznXDqAA==
X-ME-Sender: <xms:BurSYPsEFYUtfrNlnKvLrWPmSPhMplhq0Etef8zkObK0Xb3SLD88Sg>
 <xme:BurSYAe9xhWOiPMwIAPJ5cYqaDOVrJZgaGS35FqaLmm5wKl-bO_U35u8ida3-H0HO
 rfDHwkhPwNf-8wIzRs>
X-ME-Received: <xmr:BurSYCweRx8FziJ51pcXvwhn98lQsw4ieKzWi-4zqc8i29pw3bNiujTGNzQ-nrDKPhWLL_qxbJHUERpllXbty5sNNgPigps5cYmsGj3wWz_9dSRX_ShO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BurSYOPM1nOEMmogp-02hGFTWbES9p_qGi3mVkNqc9aJ3zM91Q3zGg>
 <xmx:BurSYP_yEEZnRPRE2lu0q930HCNWpbJ30LzZ8SXVUj1Tl2SAcBjaug>
 <xmx:BurSYOUsg7Xsseyrvxis_DrvHrGHv3zcJBrvhMV67s7I4S0w5VY5OA>
 <xmx:BurSYJlxFw0lsIDPA72VEv4B8UiBBknIMAXUy6J_1yLT-UjpnMv-SA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 04:00:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 9/9] ALSA: firewire-motu: fix register handling for 896
Date: Wed, 23 Jun 2021 16:59:41 +0900
Message-Id: <20210623075941.72562-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
References: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

After further investigation, I find out some mistakes for 896 about its
register. This commit fixes it.

Fixes: b431f16f1685 ("ALSA: firewire-motu: add support for MOTU 896")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v1.c | 33 ++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v1.c b/sound/firewire/motu/motu-protocol-v1.c
index 3b766615a9ee..f1d6a326dc07 100644
--- a/sound/firewire/motu/motu-protocol-v1.c
+++ b/sound/firewire/motu/motu-protocol-v1.c
@@ -61,13 +61,21 @@
 
 // Status register for MOTU 896 (0x'ffff'f000'0b14).
 //
-// 0x20000000: fetch PCM frames from communication IC to DAC.
+// 0xf0000000: enable physical and stream input to DAC.
+//   0x80000000: disable
+//   0x40000000: disable
+//   0x20000000: enable (prior to the other bits)
+//   0x10000000: disable
+//   0x00000000: disable
 // 0x08000000: speed of word clock signal output on BNC interface.
-//   0x00000000: follow to system clock.
-//   0x08000000: half of system clock.
-// 0x01000000: Route main output to headphone output.
-// 0x00ffff00: input to monitor.
-//   0x00000000: none
+//   0x00000000: force to low rate (44.1/48.0 kHz).
+//   0x08000000: follow to system clock.
+// 0x04000000: something relevant to clock.
+// 0x03000000: enable output.
+//  0x02000000: enabled irreversibly once standing unless the device voluntarily disables it.
+//  0x01000000: enabled irreversibly once standing unless the device voluntarily disables it.
+// 0x00ffff00: monitor input mode.
+//   0x00000000: disabled
 //   0x00004800: analog-1/2
 //   0x00005a00: analog-3/4
 //   0x00006c00: analog-5/6
@@ -83,7 +91,7 @@
 //   0x00007f00: analog-8
 //   0x00104000: AES/EBU-1
 //   0x00104900: AES/EBU-2
-// 0x00000060: sample rate conversin for AES/EBU input/output.
+// 0x00000060: sample rate conversion for AES/EBU input/output.
 //   0x00000000: None
 //   0x00000020: input signal is converted to system rate
 //   0x00000040: output is slave to input, ignoring system rate
@@ -97,16 +105,18 @@
 //   0x00000000: internal
 //   0x00000001: ADAT on optical interface
 //   0x00000002: AES/EBU on XLR
+//   0x00000003: source packet header (SPH)
 //   0x00000004: word clock on BNC
 //   0x00000005: ADAT on Dsub 9pin
 
 #define CLK_896_STATUS_OFFSET			0x0b14
 #define  CLK_896_STATUS_FLAG_FETCH_ENABLE	0x20000000
-#define  CLK_896_STATUS_FLAG_MAIN_TO_HP		0x01000000
+#define  CLK_896_STATUS_FLAG_OUTPUT_ON		0x03000000
 #define  CLK_896_STATUS_MASK_SRC		0x00000007
 #define   CLK_896_STATUS_FLAG_SRC_INTERNAL	0x00000000
 #define   CLK_896_STATUS_FLAG_SRC_ADAT_ON_OPT	0x00000001
 #define   CLK_896_STATUS_FLAG_SRC_AESEBU	0x00000002
+#define   CLK_896_STATUS_FLAG_SRC_SPH		0x00000003
 #define   CLK_896_STATUS_FLAG_SRC_WORD		0x00000004
 #define   CLK_896_STATUS_FLAG_SRC_ADAT_ON_DSUB	0x00000005
 #define  CLK_896_STATUS_MASK_RATE		0x00000018
@@ -304,6 +314,9 @@ static int get_clock_source_896(struct snd_motu *motu, enum snd_motu_clock_sourc
 	case CLK_896_STATUS_FLAG_SRC_AESEBU:
 		*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
 		break;
+	case CLK_896_STATUS_FLAG_SRC_SPH:
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
+		break;
 	case CLK_896_STATUS_FLAG_SRC_WORD:
 		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
 		break;
@@ -362,9 +375,9 @@ static int switch_fetching_mode_896(struct snd_motu *motu, bool enable)
 		return err;
 	data = be32_to_cpu(reg);
 
-	data &= ~(CLK_896_STATUS_FLAG_FETCH_ENABLE | CLK_896_STATUS_FLAG_MAIN_TO_HP);
+	data &= ~CLK_896_STATUS_FLAG_FETCH_ENABLE;
 	if (enable)
-		data |= (CLK_896_STATUS_FLAG_FETCH_ENABLE | CLK_896_STATUS_FLAG_MAIN_TO_HP);
+		data |= CLK_896_STATUS_FLAG_FETCH_ENABLE | CLK_896_STATUS_FLAG_OUTPUT_ON;
 
 	reg = cpu_to_be32(data);
 	return snd_motu_transaction_write(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
-- 
2.30.2

