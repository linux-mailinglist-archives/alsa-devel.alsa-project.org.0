Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EAE802C35
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F2C5843;
	Mon,  4 Dec 2023 08:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F2C5843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675628;
	bh=wfuttC72zhocQgWHnGzXAW/a8HHCjWfZozuRqFZq/Uo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W1LfdGqmWOVza2lBdd4qcEEBtgrpvvbN9rny+gGGOgrQMWHpmHK95S7mhVTGfpg0u
	 POOdr5xAQqtZe2IiQ15TA84jDYeaX9l54thmjlomBlYGfqW9IEmTPhc2QPOu8ez97s
	 ov4Qs0RSc+mTzMB1kh46ZlSYn4ZcYz5LHIuIdBt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744CCF805BE; Mon,  4 Dec 2023 08:39:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA99F805B2;
	Mon,  4 Dec 2023 08:39:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC730F8016E; Fri,  1 Dec 2023 19:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB0BFF80104
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 19:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0BFF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=srd.tw header.i=@srd.tw header.a=rsa-sha256
 header.s=google header.b=VvEe1Iqo
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9c30c7eafso30926571fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=srd.tw; s=google; t=1701454618; x=1702059418; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7FrdAzX37kkU9YcW0NJ4L1EyECNYLSwlEoWGd/OQfs=;
        b=VvEe1IqoDXf3DTDsHOK8qKbM0DYI1ZrUoAMMLASx6EkE27TMHdTEF3zuHMTPf7bN6U
         CsFicvpZhujHs8SxRzOg1kI79lOGV7mh/P48Fc/CrS5cDhs3FyDyzYUJW9uk/CqTWk5g
         zWJe6FHmIyke1x1ctRKavST/LOKMRbnQPla5/g9YKHTTO1ifWfbrwX47d+I8RAJK0Hzg
         zrmE39bvO5gFPhPqekuYHFfwiiFt8yykss3B50fa30M4Bk8jHAuAXCDhd2IAHoBENutN
         xf/6KcQm1tv0UKiu4xBUy3IzjLlvs0VPjnv8i0IJuQ2dExDuac9Z1HGfvhDp/Oc/RJ6Q
         c2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701454618; x=1702059418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7FrdAzX37kkU9YcW0NJ4L1EyECNYLSwlEoWGd/OQfs=;
        b=jtc4WPRgs+d+SReKQsEAx8qNx3zGD4803VIGWQ5LOdt6STb36SpG85Ic7KwWk34b4v
         ejovR0Blp9kmL+snKV2OmpgML2Gyd8xj72HcLhg5qD+5i2Fjzsr+pw3YijGLXB9aO8hQ
         xekAKJUUW0MMJ9wXjMAEUrCrinWiTBXGS0WyTwo10OT0NrRhgnFhKQnimoU2kyaw6USG
         j8ipTTH0myN691SeXhYgE8Eh5/2wefnPB6A2WIjQmoPjXi0yuJki/etUrgMj6Dmkt41M
         wssRjv8nXYSYPR4SBbOpIT7zUgxpxsAk1RuUNv8eAHMikorkf+XBVj7IS0WFWpvFfk2x
         mzsA==
X-Gm-Message-State: AOJu0YzoNahSL4mGizquaibVoaUS1Gp57pRRfkxhqgAvAv0r45PqrQRp
	uA05iYlEcU6Nnu8UQP2z1ocuwycIMPUa7Wp1OmsJY3bg
X-Google-Smtp-Source: 
 AGHT+IHVh6uAXoKNyqAekgFNUW2hIEvuHu6zu+cNwhtLyeG8QQcJU1W5eqWUSPc/hecajIu3VPtP5g==
X-Received: by 2002:a19:7016:0:b0:50b:d763:fe49 with SMTP id
 h22-20020a197016000000b0050bd763fe49mr1058788lfc.100.1701454617927;
        Fri, 01 Dec 2023 10:16:57 -0800 (PST)
Received: from fox.fritz.box
 (2a02-a468-ca02-1-e0d7-2fdb-33b4-8bf0.fixed6.kpn.net.
 [2a02:a468:ca02:1:e0d7:2fdb:33b4:8bf0])
        by smtp.gmail.com with ESMTPSA id
 o18-20020aa7dd52000000b0054b50b024b1sm1837336edw.89.2023.12.01.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:16:57 -0800 (PST)
From: Sarah Grant <s@srd.tw>
To: alsa-devel@alsa-project.org
Cc: Sarah Grant <s@srd.tw>
Subject: [PATCH] ALSA: usb-audio: Add Pioneer DJM-450 mixer controls
Date: Fri,  1 Dec 2023 18:16:54 +0000
Message-Id: <20231201181654.5058-1-s@srd.tw>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: s@srd.tw
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UVA4J6W35PZX5IRWJTVAY2ZLIFQQROHW
X-Message-ID-Hash: UVA4J6W35PZX5IRWJTVAY2ZLIFQQROHW
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:36:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVA4J6W35PZX5IRWJTVAY2ZLIFQQROHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These values mirror those of the Pioneer DJM-250MK2 as the channel layout
appears identical based on my observations. This duplication could be removed in
later contributions if desired.

Signed-off-by: Sarah Grant <s@srd.tw>
---
 sound/usb/mixer_quirks.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 898bc3baca7b..c8d48566e175 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2978,6 +2978,7 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_850_IDX		0x2
 #define SND_DJM_900NXS2_IDX	0x3
 #define SND_DJM_750MK2_IDX	0x4
+#define SND_DJM_450_IDX		0x5
 
 
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
@@ -3108,6 +3109,31 @@ static const struct snd_djm_ctl snd_djm_ctls_250mk2[] = {
 };
 
 
+// DJM-450
+static const u16 snd_djm_opts_450_cap1[] = {
+	0x0103, 0x0100, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d, 0x010a };
+
+static const u16 snd_djm_opts_450_cap2[] = {
+	0x0203, 0x0200, 0x0206, 0x0207, 0x0208, 0x0209, 0x020d, 0x020a };
+
+static const u16 snd_djm_opts_450_cap3[] = {
+	0x030a, 0x0311, 0x0312, 0x0307, 0x0308, 0x0309, 0x030d };
+
+static const u16 snd_djm_opts_450_pb1[] = { 0x0100, 0x0101, 0x0104 };
+static const u16 snd_djm_opts_450_pb2[] = { 0x0200, 0x0201, 0x0204 };
+static const u16 snd_djm_opts_450_pb3[] = { 0x0300, 0x0301, 0x0304 };
+
+static const struct snd_djm_ctl snd_djm_ctls_450[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   450_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   450_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   450_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch1 Output",   450_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch2 Output",   450_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch3 Output",   450_pb3, 2, SND_DJM_WINDEX_PB)
+};
+
+
 // DJM-750
 static const u16 snd_djm_opts_750_cap1[] = {
 	0x0101, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010f };
@@ -3203,6 +3229,7 @@ static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_850_IDX] = SND_DJM_DEVICE(850),
 	[SND_DJM_900NXS2_IDX] = SND_DJM_DEVICE(900nxs2),
 	[SND_DJM_750MK2_IDX] = SND_DJM_DEVICE(750mk2),
+	[SND_DJM_450_IDX] = SND_DJM_DEVICE(450),
 };
 
 
@@ -3454,6 +3481,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
 		err = snd_djm_controls_create(mixer, SND_DJM_250MK2_IDX);
 		break;
+	case USB_ID(0x2b73, 0x0013): /* Pioneer DJ DJM-450 */
+		err = snd_djm_controls_create(mixer, SND_DJM_450_IDX);
+		break;
 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
 		err = snd_djm_controls_create(mixer, SND_DJM_750_IDX);
 		break;
-- 
2.39.3 (Apple Git-145)

