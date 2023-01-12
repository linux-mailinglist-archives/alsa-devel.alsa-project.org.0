Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AC6671C3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:12:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C884520F;
	Thu, 12 Jan 2023 13:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C884520F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525550;
	bh=c5u44GiTWkFZotG8x/UdUgo4YmgY68gGCQU0CbxS5ws=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p4AzvgnM6OHY3PdGeKPxxcT2u4/4fQLHCWQuD2niL+thEGqKHhJG6kcrlpfmIeqk6
	 zvxjP/wNd4uAZjqqon1IoqyLvQTw6Pk68/jTY1jcNzk+wHdZO9DEcwBzH5Q7ZudKBC
	 W5wDeET/Kt9Zk1XEjPic1nMasmz+yKJp1Vbr8C88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 765A3F80539;
	Thu, 12 Jan 2023 13:10:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C5CF80543; Thu, 12 Jan 2023 13:10:15 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id A82AAF804C1
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82AAF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=lOZ6P59N; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=beDhYvfS
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F0AE33200930;
 Thu, 12 Jan 2023 07:10:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 12 Jan 2023 07:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525409; x=
 1673611809; bh=UNlHD8gW0ngNuYF/LW1sYgMPqPGbma3iF/sGBB13x6Y=; b=l
 OZ6P59NE580QSkk3qo7SiF+v04RAdPRj4lfnDi3ZBHSuUpvFZFDNTe5c2D9VVjNE
 TGW5j3i9SCJfYmGjqi/rwMZvtGmQ8SPrfVksLUguinUtgKJ1LkRm1XbHrQWbH153
 tIydYVWknSlW8shmsI7Hq2Ru2zFpIRh6aV5S/MUgECdWG0WpB2gjP+9GPqXdivhr
 DxACvwL3ImcQamVNGK3ElvLyF0oZGF404NYt5y8JQYwK9UzJkhQjNJ1m4nBrXXfc
 iGCmWHB9pdSV3QezBTe/iLEz5t8isgTZKxh08tow2xJirRNkE490tKrzfe+mmkBG
 uUD2AfghXjFvkt/5MNbzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525409; x=1673611809; bh=UNlHD8gW0ngNu
 YF/LW1sYgMPqPGbma3iF/sGBB13x6Y=; b=beDhYvfSzon+ihqr49DdrzfpIaTAP
 lQZolt77+eG3z8n96EhNPlmkq7DeYFDqf4CbXb1tggMhqf4uNLGaNw9mhgeQn4LC
 oQbiybINyexQWFfyOwYllMVH1JXObY4CprIe43z10A+nn0mJhZ4W32o1SnTP6IGW
 pp4vczfawq7K/oWsXiRncESr4oMlduUMtDbgdJcVQPe3vKbLFy4f2rujNCvVwIMO
 eO3/dT0bj37OvmIe1wUPaqwWIbDXGR0RIRWDRoByQtf6VXIX7sE08j8CWyyJhlgX
 MyWmNiHx/AzO4klJs0i3WgCpcUmFex9XrwSECjy/6MqBdj4OEKBJyD3OA==
X-ME-Sender: <xms:ofi_Y0ZXcnDxnXK6_5RhHXIDlYixljRTvZmZyOw-Wlj4P6nu0LEzHQ>
 <xme:ofi_Y_YolgswzuHcHpsiTOMM71bQu5N2t9941Xrx6XRJxB9omlHxiUsMqb28ikSZm
 bfhu1i8VaZUrVjWuAM>
X-ME-Received: <xmr:ofi_Y-_M5OVJDQ7xE-iVv4adKcm1Y4h21F-TmbCdF4-pjHv0SyiaBTKasGRvi_P-mbeKzAm05u0I3k9LGHWVOHkoGcphlwHzcF9girpS3XQrpVa4Uww9VBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ofi_Y-pnweUMVPU5Q7lLdSGXWxvkp2p0vr7sMiN-PkC3cRuiMXvhRg>
 <xmx:ofi_Y_o-sYpBWNLpnnAujGT_8akN7eiXgavSCOVrEqelYnRKFfFPAg>
 <xmx:ofi_Y8QIa6cBaapevO1uR5aYkLyuW6wR05rskIj55JC_LIZt7FgXVQ>
 <xmx:ofi_Y4DGoTO6rcF9783pvIMtFBIDaSI7qYn_JCWrp_4o5CpGddw8TQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:08 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/6] ALSA: fireface: update UAPI for data of knob control
Date: Thu, 12 Jan 2023 21:09:52 +0900
Message-Id: <20230112120954.500692-5-o-takashi@sakamocchi.jp>
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

This commit adds a new event of knob control specific to RME Fireface 400.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 3532ac7046d7..50917581dd2b 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -14,6 +14,7 @@
 #define SNDRV_FIREWIRE_EVENT_MOTU_NOTIFICATION	0x64776479
 #define SNDRV_FIREWIRE_EVENT_TASCAM_CONTROL	0x7473636d
 #define SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE	0x4d545244
+#define SNDRV_FIREWIRE_EVENT_FF400_MESSAGE	0x4f6c6761
 
 struct snd_firewire_event_common {
 	unsigned int type; /* SNDRV_FIREWIRE_EVENT_xxx */
@@ -72,6 +73,28 @@ struct snd_firewire_event_motu_register_dsp_change {
 	__u32 changes[];	/* Encoded event for change of register DSP. */
 };
 
+/**
+ * struct snd_firewire_event_ff400_message - the container for message from Fireface 400 when
+ *					     operating hardware knob.
+ *
+ * @type: Fixed to SNDRV_FIREWIRE_EVENT_FF400_MESSAGE.
+ * @messages.message: The messages expressing hardware knob operation.
+ * @messages.tstamp: The isochronous cycle at which the request subaction of asynchronous
+ *		     transaction was sent to deliver the message. It has 16 bit unsigned integer
+ *		     value. The higher 3 bits of value expresses the lower three bits of second
+ *		     field in the format of CYCLE_TIME, up to 7. The rest 13 bits expresses cycle
+ *		     field up to 7999.
+ *
+ * The structure expresses message transmitted by Fireface 400 when operating hardware knob.
+ */
+struct snd_firewire_event_ff400_message {
+	unsigned int type;
+	struct {
+		__u32 message;
+		__u32 tstamp;
+	} messages[];
+};
+
 union snd_firewire_event {
 	struct snd_firewire_event_common            common;
 	struct snd_firewire_event_lock_status       lock_status;
@@ -81,6 +104,7 @@ union snd_firewire_event {
 	struct snd_firewire_event_tascam_control    tascam_control;
 	struct snd_firewire_event_motu_notification motu_notification;
 	struct snd_firewire_event_motu_register_dsp_change motu_register_dsp_change;
+	struct snd_firewire_event_ff400_message	    ff400_message;
 };
 
 
-- 
2.37.2

