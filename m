Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F33E9C97
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 04:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB55C1926;
	Thu, 12 Aug 2021 04:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB55C1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628735454;
	bh=S+Ckp/ReYeriTnvGdBBNBGJ2s2ExlJ4GA/Az+hulZY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=batU2xjk5t4FdgbXP3tGhyj6ncKpo4raVm6qu7uRncS6WV0sC22RIbaWidu7k/Pjd
	 F31aw1e+Hsu3LLFHwZEWbEEegzsc7SdolC+dNQczATZQtye4dzjvWuezFfVUdK/hbR
	 8Hgu0X+aDzWWbB5qigtJV4PuHhHgPw+Nl5KZ8664=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D27C6F80279;
	Thu, 12 Aug 2021 04:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFB4F8025D; Thu, 12 Aug 2021 04:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A76F800E5
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 04:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A76F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="8admbe+Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="s7yIU+df"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A4005C0101;
 Wed, 11 Aug 2021 22:28:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 11 Aug 2021 22:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=/oWlzCQSGq1c0EM5NJGe2/7uMs
 6/P30U6TsCK2RrOT0=; b=8admbe+QIFtWxWpaNxgysmaWAtRhpGhuLhDMPDdvdz
 ZoPX38FwgSFQxRYynVKr/dw5Ve09rq59vRI/KTZgRIvtUHfkPvA0lgX4NiB+nmRt
 ZyMh11qjIzoyqv/Xyc2QmbL2xxDbFSS3G1TSUx4I0YfMM68hjL20xN1mkzT0hQbD
 oVfN7SfQjDCodbAxlF+mGnIwQzJZfehVOZIMBGNTiBXDuiH6I0Fvcq4ABPXYR+mL
 4nfLyDP05OQjNbMoRTqjHdyRrCLs6dKflR81lKAufDcD5zkhT/NRqb0iFs9mQXap
 imOQmaIly81MxjyyGbr3dHzRuP3ttHdScWgAxcpAdWUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/oWlzCQSGq1c0EM5N
 JGe2/7uMs6/P30U6TsCK2RrOT0=; b=s7yIU+dfwiNZn95xUUJov9P6Qsxcsh6L4
 v727GG7DeKXjuk+XXSb6auXNI0AUUf2wrbvASC3Tzk5TefwUPA1tvndHNoyFWKXV
 61XVdFRKfFyFQD6avx5HbdNrxR+1svn17A+Dw4JyT0gjY4dCfgFJ3ISHk1QQxCdp
 qMxap8KTPX2Rv/O8jLjA96m/Z68yzd4W1PB8RAw8PwW+XUvfx1K7JkyWr+u0t2LI
 BKI6NNaj7fDun4gR8j3428Zoe2WXPrt9ylV0okJc0nc0dF31mVpE43PKEkQbVK/D
 XcPxwfp2JOwpo4eklESX0myuSzdsuhOSUaZHnkvaJgr5YPaSkImrA==
X-ME-Sender: <xms:XYcUYUBRW8huNa7zhVu2VXJQWO988qtmsOVetq7wCIgMZR3THjGE4w>
 <xme:XYcUYWg01wgA99yMRd3-fgzCrMvb668RRsmJ14X04H_Yur5YX9bKHHWE9F1htuekH
 0sSEhtfHQTERVRCILY>
X-ME-Received: <xmr:XYcUYXkY95MTZk2w0WH6-Bj2hL35bt4Wlx-rNsJqjyHOypq6Eq_mguKZNLp5c-j-j8trBOy0cNfkpJst3-UD_-I1KcJuBEVqt9wrPjvnrjn1_A_Ng4UU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:XYcUYayNocILWVENkQ-4nriUPDMuoZ27H4MiifXaUPD6rtxCwzxmvg>
 <xmx:XYcUYZSe5QIkXX1oOvFfXqC19aYzl-JRzt2mtqD8t3kVSqzzgkJVuw>
 <xmx:XYcUYVYZlJH_O74lsf2SyFeClwl02KMncPdPdIOaeDaTXpHmviXN6g>
 <xmx:X4cUYUdqRpG1rLgLmP5DNKtRQ2-lf_NSeMFVGPcjNo5L5bsjoH5c6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Aug 2021 22:28:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: oxfw: fix functioal regression for silence in Apogee
 Duet FireWire
Date: Thu, 12 Aug 2021 11:28:39 +0900
Message-Id: <20210812022839.42043-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

OXFW 971 has no function to use the value in syt field of received
isochronous packet for playback timing generation. In kernel prepatch for
v5.14, ALSA OXFW driver got change to send NO_INFO value in the field
instead of actual timing value. The change brings Apogee Duet FireWire to
generate no playback sound, while output meter moves.

As long as I investigate, _any_ value in the syt field takes the device to
generate sound. It's reasonable to think that the device just ignores data
blocks in packet with NO_INFO value in its syt field for audio data
processing.

This commit adds a new flag for the quirk to fix regression.

Fixes: 029ffc429440 ("ALSA: oxfw: perform sequence replay for media clock recovery")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 9 ++++++++-
 sound/firewire/oxfw/oxfw.c        | 6 ++++--
 sound/firewire/oxfw/oxfw.h        | 5 +++++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 0ef242fdd3bc..fff18b5d4e05 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,7 +153,7 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
-	unsigned int flags = CIP_UNAWARE_SYT;
+	unsigned int flags = 0;
 	int err;
 
 	if (!(oxfw->quirks & SND_OXFW_QUIRK_BLOCKING_TRANSMISSION))
@@ -161,6 +161,13 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	else
 		flags |= CIP_BLOCKING;
 
+	// OXFW 970/971 has no function to generate playback timing according to the sequence
+	// of value in syt field, thus the packet should include NO_INFO value in the field.
+	// However, some models just ignore data blocks in packet with NO_INFO for audio data
+	// processing.
+	if (!(oxfw->quirks & SND_OXFW_QUIRK_IGNORE_NO_INFO_PACKET))
+		flags |= CIP_UNAWARE_SYT;
+
 	if (stream == &oxfw->tx_stream) {
 		conn = &oxfw->out_conn;
 		c_dir = CMP_OUTPUT;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 84971d78d152..cb5b5e3a481b 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -159,8 +159,10 @@ static int detect_quirks(struct snd_oxfw *oxfw, const struct ieee1394_device_id
 		return snd_oxfw_scs1x_add(oxfw);
 	}
 
-	if (entry->vendor_id == OUI_APOGEE && entry->model_id == MODEL_DUET_FW)
-		oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
+	if (entry->vendor_id == OUI_APOGEE && entry->model_id == MODEL_DUET_FW) {
+		oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION |
+				SND_OXFW_QUIRK_IGNORE_NO_INFO_PACKET;
+	}
 
 	/*
 	 * TASCAM FireOne has physical control and requires a pair of additional
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index ee47abcb0c90..c13034f6c2ca 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -42,6 +42,11 @@ enum snd_oxfw_quirk {
 	SND_OXFW_QUIRK_BLOCKING_TRANSMISSION = 0x04,
 	// Stanton SCS1.d and SCS1.m support unique transaction.
 	SND_OXFW_QUIRK_SCS_TRANSACTION = 0x08,
+	// Apogee Duet FireWire ignores data blocks in packet with NO_INFO for audio data
+	// processing, while output level meter moves. Any value in syt field of packet takes
+	// the device to process audio data even if the value is invalid in a point of
+	// IEC 61883-1/6.
+	SND_OXFW_QUIRK_IGNORE_NO_INFO_PACKET = 0x10,
 };
 
 /* This is an arbitrary number for convinience. */
-- 
2.30.2

