Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE866671B9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87693334;
	Thu, 12 Jan 2023 13:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87693334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525499;
	bh=xDfhK1WRu59UWNh13PlTKWQ8FnAXYBs0RZSQlMDLADw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hA4BoP3qkUcK2xseqmvFPOItx0GaT+64bUExSNiBfRSvqaCTFjhWLimXOP3rGD0UA
	 V/fxNU0F8DgMXFPzsgbs9FBBhsPpu8SVKS3Q4cltiS98JQNc/Do+JZneZy4vyk1DQp
	 ZyP0wZberolvQYKTF5XHaTpDu6tveu7m0Xov2ifM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B348F8016E;
	Thu, 12 Jan 2023 13:10:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1FFCF804C1; Thu, 12 Jan 2023 13:10:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7F02F804C1
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F02F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=N61/H9AK; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=M8njHdX7
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 657BF320092C;
 Thu, 12 Jan 2023 07:10:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 12 Jan 2023 07:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525405; x=
 1673611805; bh=QROKRqY2nM/HtDqTFwv3PBfv2g4ED2lHTZ9dBipP8Qc=; b=N
 61/H9AKK3GcodcN3f5XBvBeO8D8kv1YpmD7ACoIV7r4fDgkMgeerDKD1OMxoejS2
 sQ/DIDT1AsH1vMbBLH5jxADowmvEv2jM3GLvgS+EEueEzbVrRG+2fwgQ8basd14z
 LZAMs6zeVYRpOoOZ7Dhgf2aoBnBzXswv23DAnzBwWUudRd9kV6CbI+qsastXqc4a
 t4o3aG6mLZRUpTcZc40K7fC6ibKL6McSi7OISwPMHisEIelZ5BTTFKHR2Z4FphXj
 6ttDQY65Wn9VSVibup1Z6AdFmypODKp7nJ2FQLucuye80Lfmuqy4HcrFBS/MtpkH
 YzfInIvBJDpiCyXKRHHYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525405; x=1673611805; bh=QROKRqY2nM/Ht
 DqTFwv3PBfv2g4ED2lHTZ9dBipP8Qc=; b=M8njHdX7OoG14TwO9JCB6blODUGPh
 CPr/QnlZ2qLdHjeqC5eA3kg7L2jeez/Jcy+oalEYqZcnEE26k9TbJ2SZWJdf+s39
 Hm+VRSeY/9qESIOGthngu4CrzQlP9YNLxRVXuRJgLkXUwwO+6hXySCGY3fj9qeHp
 11947QY3KfrY/s26dXg8d9IfFQrGXvFkSo60Rcp/6ehMojTDCT1vQgHlnXWcDoWe
 NwoFWo8PJbK/Kw0VdyfwtT1IpLsxx+vVDCTNCHNFK43TVXuXcK3phQEIUvzNt5Bw
 jbpR+n7Jgyq3T9k/VP3J4uzm6mtnRLK0w3o1E1aAnPR53jMPZJAhirqxA==
X-ME-Sender: <xms:nPi_Y5JOta4ZhYCUx5zptl9MhjGPF0yVB3o76OnoQCg3Cy40ByoIzA>
 <xme:nPi_Y1K8V5rawdiiWSXm9bAIFqgPzf-vNBusDbMIsnRBBbAFFFPI5PDchmXm1Aw4U
 QETfpFEJHNcVRN_s08>
X-ME-Received: <xmr:nPi_YxszhTnZQW4_qEgHYULQb_sz0OiHsexj60pWAi3xSeNC1l-dwo76rgGVTj6HS_dCSFEjK_seygWYYPK_sBukyNyNVGpEoQ4RcuimDsrK5iGaXE2yCoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:nPi_Y6ZwaPW_-XygpJicrxo8n7rrCFP5v6OgRfh0MO9mPr6tbOMoXw>
 <xmx:nPi_Ywbf-FtimBhBaaqtNnsx-SIDWGgSwajTaVGtIVzcnNe9fXPyLw>
 <xmx:nPi_Y-D1xA8HH_LuKl_--QMkpMaWY-H9eKpE8NsYjxubBPvKZoko9w>
 <xmx:nfi_Y7yqwv0z5gHVXtqtR4OCkcqzrZAsNNalfXskRzFKd2vYhck1Jw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:03 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/6] ALSA: fireface: pick up time stamp for request subaction
 of asynchronous transaction
Date: Thu, 12 Jan 2023 21:09:50 +0900
Message-Id: <20230112120954.500692-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
References: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The time stamp of isochronous cycle at which asynchronous transaction is
sent is perhaps useful somehow. A commit b2405aa948b9 ("firewire: add
kernel API to access packet structure in request structure for AR context")
adds kernel API to retrieve the time stamp in inner structure of request
subaction.

This commit changes local framework to handle message delivered by the
asynchronous transaction so that time stamp is picked up by the kernel API.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 4 ++--
 sound/firewire/fireface/ff-protocol-latter.c | 2 +-
 sound/firewire/fireface/ff-transaction.c     | 3 ++-
 sound/firewire/fireface/ff.h                 | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 16afcb334e3c..22d6aee52de3 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -403,7 +403,7 @@ static void ff800_finish_session(struct snd_ff *ff)
 // A write transaction to clear registered higher 4 bytes of destination address
 // has an effect to suppress asynchronous transaction from device.
 static void ff800_handle_midi_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
-				  size_t length)
+				  size_t length, u32 tstamp)
 {
 	int i;
 
@@ -554,7 +554,7 @@ static void ff400_finish_session(struct snd_ff *ff)
 // in its lower offset and expects userspace application to configure the
 // register for it.
 static void ff400_handle_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
-			     size_t length)
+			     size_t length, u32 tstamp)
 {
 	int i;
 
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index e7a066fb1ead..9947e0c2e0aa 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -394,7 +394,7 @@ static void latter_dump_status(struct snd_ff *ff, struct snd_info_buffer *buffer
 // (0x'....'....'0000'0000) and expects userspace application to configure the
 // register for it.
 static void latter_handle_midi_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
-				   size_t length)
+				   size_t length, u32 tstamp)
 {
 	u32 data = le32_to_cpu(*buf);
 	unsigned int index = (data & 0x000000f0) >> 4;
diff --git a/sound/firewire/fireface/ff-transaction.c b/sound/firewire/fireface/ff-transaction.c
index 764c772a0b1e..79f733d8c98b 100644
--- a/sound/firewire/fireface/ff-transaction.c
+++ b/sound/firewire/fireface/ff-transaction.c
@@ -131,11 +131,12 @@ static void handle_msg(struct fw_card *card, struct fw_request *request, int tco
 {
 	struct snd_ff *ff = callback_data;
 	__le32 *buf = data;
+	u32 tstamp = fw_request_get_timestamp(request);
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
 	offset -= ff->async_handler.offset;
-	ff->spec->protocol->handle_msg(ff, (unsigned int)offset, buf, length);
+	ff->spec->protocol->handle_msg(ff, (unsigned int)offset, buf, length, tstamp);
 }
 
 static int allocate_own_address(struct snd_ff *ff, int i)
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 0358b444bd01..f430ebe157b3 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -111,7 +111,7 @@ enum snd_ff_clock_src {
 
 struct snd_ff_protocol {
 	void (*handle_msg)(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
-			   size_t length);
+			   size_t length, u32 tstamp);
 	int (*fill_midi_msg)(struct snd_ff *ff,
 			     struct snd_rawmidi_substream *substream,
 			     unsigned int port);
-- 
2.37.2

