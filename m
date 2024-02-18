Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A1A859552
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 08:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB72DB70;
	Sun, 18 Feb 2024 08:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB72DB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708242708;
	bh=AOVaQ5YGKkgnrRNpZ0b6UYjZgF5LpdiTlNskz7iNyX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D6qn4q2mHyxWxfYwukVOLukLdwybrVi5fWjaQQaE3EEBleL2jp58ali9pb59yvLij
	 1yI8gkLWpFj23nrt6+c/kQSCD0DjMHDc50TPku2NgGpfzCa4V8JqpLabIRe0byEFhn
	 6TdQsmCExwlM54DLqxDWrD/eva9l+Matan4QLfw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33180F80622; Sun, 18 Feb 2024 08:50:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94138F80603;
	Sun, 18 Feb 2024 08:50:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2681F804CC; Sun, 18 Feb 2024 08:44:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0DEF8019B
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 08:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0DEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=pkc4whEL;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=T6JBqpvu
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C739C5C006D;
	Sun, 18 Feb 2024 02:41:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 18 Feb 2024 02:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1708242097; x=
	1708328497; bh=0bqKb4iHHHHhoPr3Sb4CXuMDS1hoDWcvBFIABEkLLBA=; b=p
	kc4whELJ5lXbrdW7OlrtPWDZDqSqRoYH7XJq6kIBFouFnMlwJtO4gucqd8ddMimj
	4UDxB7MlvWKDoPpGCb22rUoTjuX4amAv3P5EIogBVzYfRFfRChj4/nBh99Z0DX7R
	pOnwhwzL/p2s9STlYZuemJ8cXQvDgrMgQDFyueqrQKJyB2p18RQH46TfWj+vzlkH
	Ei5M0HE51Leymw7h59ml9uAXSzsxliZ7gIurPk1qCISClhjziqjqO4LixrpzpN3G
	u84R4PL7w4D0Tz7HHBhczcV7QF92GpOv6wI8xuoWsRLNfMQ+nnTi9r85Uv6wHxRA
	NBiOiJgLw8cjBYuPMBlTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708242097; x=
	1708328497; bh=0bqKb4iHHHHhoPr3Sb4CXuMDS1hoDWcvBFIABEkLLBA=; b=T
	6JBqpvuEcCaCaIEaw74nzfmr2SdaS3ekHR2k8I5WmNljiCUxQPTvFX2mCuWZF90z
	tpdEtDvPY+Lg4zVzqNZZrKKhs9KLyfThpzVd+oHceJp48H36Fv9UEtDWB3T3GSSM
	8nNV+DoUlqSnFAUTWLhy4GxwJBvjUkbgh+znBETH7MwkjUY7h6qbTj7Xq4HeD4E0
	oyIfmBqtJ9uAetCQ/Uweb9VWAfG69IBhmOTvk+keoX8/RhBkBBZ073qfC+3RxyY4
	E7ItWkuSDs9MgOXU7UJpolV6yONgiiXx13xJ17G9nfVi2M+qsL/j4oeQj3iPa20B
	DFtWM50j65w5G0X2vOV6w==
X-ME-Sender: <xms:sbTRZRz2XUwpzkd7POHC5waUD2MorPVc4ozyRx8iEu7Ou4rs70ftZg>
    <xme:sbTRZRQO5WC92ETIbz_MDEphkJ4c2xcbFQBEi6_zWc40RFIVvgvWfNPuAmccqoQSL
    3qzsKbZ5l0z3OiBZPw>
X-ME-Received: 
 <xmr:sbTRZbVO_VXFJB3GSZ0jY06yBqkvrRg1ozklV68fWbda17S_yu0KjEqBGRparxIHGPnmE0ZzYBS6a8rxro5izrSInzol7-vVL693Nz2O9lYb>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:sbTRZTiNUPu3dcfMk9s2To1KKG0-Bx0zqe6YnOlEhrtge5v5hf8Z7w>
    <xmx:sbTRZTA1EFxeWR8zUYcfhVadGu8-Lgvsr5upirO3LMNa4KQBdg6hbQ>
    <xmx:sbTRZcJh1uvAaLNizbTsKkEc1TKa1BxHU41HZz7UkLEprj4ReFr-CQ>
    <xmx:sbTRZWqt_1x6H-mvkTBv39_r8Ayq92y3YWCyG7fL-4bNkztGMvTePA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Feb 2024 02:41:36 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: oxfw: support the case that AV/C Stream Format
 Information command is not available
Date: Sun, 18 Feb 2024 16:41:26 +0900
Message-Id: <20240218074128.95210-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
References: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TU2UXDLLMB3KS75RBFLAEAJXZVL2GWLV
X-Message-ID-Hash: TU2UXDLLMB3KS75RBFLAEAJXZVL2GWLV
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TU2UXDLLMB3KS75RBFLAEAJXZVL2GWLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Miglia Harmony Audio does neither support AV/C Stream Format Information
command nor AV/C Extended Stream Format Information command.

This commit adds a workaround for the case and uses the hard-coded formats.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 96 +++++++++++++++++++++++--------
 sound/firewire/oxfw/oxfw.h        |  2 +
 2 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 6d8722f9d3a5..40716bb989c7 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -486,26 +486,57 @@ int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
 				enum avc_general_plug_dir dir,
 				struct snd_oxfw_stream_formation *formation)
 {
-	u8 *format;
-	unsigned int len;
 	int err;
 
-	len = AVC_GENERIC_FRAME_MAXIMUM_BYTES;
-	format = kmalloc(len, GFP_KERNEL);
-	if (format == NULL)
-		return -ENOMEM;
+	if (!(oxfw->quirks & SND_OXFW_QUIRK_STREAM_FORMAT_INFO_UNSUPPORTED)) {
+		u8 *format;
+		unsigned int len;
 
-	err = avc_stream_get_format_single(oxfw->unit, dir, 0, format, &len);
-	if (err < 0)
-		goto end;
-	if (len < 3) {
-		err = -EIO;
-		goto end;
+		len = AVC_GENERIC_FRAME_MAXIMUM_BYTES;
+		format = kmalloc(len, GFP_KERNEL);
+		if (format == NULL)
+			return -ENOMEM;
+
+		err = avc_stream_get_format_single(oxfw->unit, dir, 0, format, &len);
+		if (err >= 0) {
+			if (len < 3)
+				err = -EIO;
+			else
+				err = snd_oxfw_stream_parse_format(format, formation);
+		}
+
+		kfree(format);
+	} else {
+		// Miglia Harmony Audio does not support Extended Stream Format Information
+		// command. Use the duplicated hard-coded format, instead.
+		unsigned int rate;
+		u8 *const *formats;
+		int i;
+
+		err = avc_general_get_sig_fmt(oxfw->unit, &rate, dir, 0);
+		if (err < 0)
+			return err;
+
+		if (dir == AVC_GENERAL_PLUG_DIR_IN)
+			formats = oxfw->rx_stream_formats;
+		else
+			formats = oxfw->tx_stream_formats;
+
+		for (i = 0; (i < SND_OXFW_STREAM_FORMAT_ENTRIES); ++i) {
+			if (!formats[i])
+				continue;
+
+			err = snd_oxfw_stream_parse_format(formats[i], formation);
+			if (err < 0)
+				continue;
+
+			if (formation->rate == rate)
+				break;
+		}
+		if (i == SND_OXFW_STREAM_FORMAT_ENTRIES)
+			return -EIO;
 	}
 
-	err = snd_oxfw_stream_parse_format(format, formation);
-end:
-	kfree(format);
 	return err;
 }
 
@@ -600,14 +631,33 @@ assume_stream_formats(struct snd_oxfw *oxfw, enum avc_general_plug_dir dir,
 	unsigned int i, eid;
 	int err;
 
-	/* get format at current sampling rate */
-	err = avc_stream_get_format_single(oxfw->unit, dir, pid, buf, len);
-	if (err < 0) {
-		dev_err(&oxfw->unit->device,
-		"fail to get current stream format for isoc %s plug %d:%d\n",
-			(dir == AVC_GENERAL_PLUG_DIR_IN) ? "in" : "out",
-			pid, err);
-		goto end;
+	// get format at current sampling rate.
+	if (!(oxfw->quirks & SND_OXFW_QUIRK_STREAM_FORMAT_INFO_UNSUPPORTED)) {
+		err = avc_stream_get_format_single(oxfw->unit, dir, pid, buf, len);
+		if (err < 0) {
+			dev_err(&oxfw->unit->device,
+				"fail to get current stream format for isoc %s plug %d:%d\n",
+				(dir == AVC_GENERAL_PLUG_DIR_IN) ? "in" : "out",
+				pid, err);
+			goto end;
+		}
+	} else {
+		// Miglia Harmony Audio does not support Extended Stream Format Information
+		// command. Use the hard-coded format, instead.
+		buf[0] = 0x90;
+		buf[1] = 0x40;
+		buf[2] = avc_stream_rate_table[0];
+		buf[3] = 0x00;
+		buf[4] = 0x01;
+
+		if (dir == AVC_GENERAL_PLUG_DIR_IN)
+			buf[5] = 0x08;
+		else
+			buf[5] = 0x02;
+
+		buf[6] = 0x06;
+
+		*len = 7;
 	}
 
 	/* parse and set stream format */
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 39316aeafeaa..3bf8d7bec636 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -52,6 +52,8 @@ enum snd_oxfw_quirk {
 	// performs media clock recovery voluntarily. In the recovery, the packets with NO_INFO
 	// are ignored, thus driver should transfer packets with timestamp.
 	SND_OXFW_QUIRK_VOLUNTARY_RECOVERY = 0x20,
+	// Miglia Harmony Audio does not support AV/C Stream Format Information command.
+	SND_OXFW_QUIRK_STREAM_FORMAT_INFO_UNSUPPORTED = 0x40,
 };
 
 /* This is an arbitrary number for convinience. */
-- 
2.40.1

