Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F596F602
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672E6DFA;
	Fri,  6 Sep 2024 15:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672E6DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725630969;
	bh=ukkZyE7LXwdJJqRPK/L0BXZuSTBljsR0rbZyHsV5L6g=;
	h=From:Date:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Jx1wnk2T92bj5bU5bSSvLqitFkOxnFXyUZoyfYa63TW0QOEf0AdRzHjlqNpE5Rzkx
	 Tj61y/1dRtpypRQYfSOoDfp2TKD6v1xpOltMoIb6z6BG46OvrRCx3cH8wUd+vxXPV6
	 odzno/Ay5TLwx91oXjPEAh6DTnBmAmOfueitVYCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0883EF8061D; Fri,  6 Sep 2024 15:54:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEAE6F8062E;
	Fri,  6 Sep 2024 15:54:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2BC3F8016C; Thu,  5 Sep 2024 14:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3554F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 14:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3554F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k1ZiPmzd
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so458643f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539892; x=1726144692;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJg5IFa84xRILizcvK4k6RTiWZZ3HPdsh0baJag3tfc=;
        b=k1ZiPmzd+pYAhZDHKiWzrn1MmO+eff4WX3pUehm0/eAsEdECGdBLFF7aUAm7E8ZguI
         pLCKw5PB5g/HCt7iutMEJZX6Uud1Z4mQ1EqN2VXj8Hs9UOqn+nYefdiKcCDdKBzG3ole
         pJQewET/1Kic2EECoO+BkDLb2NNid1GBIm7nw1/nBfwqwwAIWs6WWpp1uIZfqp6G41NL
         LYgfPtdXEbqcNWZIoJReOs35GF3IW10o/dTGvvT+CkH9VCx2uBtWkMDdDKPouxB6wV/F
         nV/m+ZkVzQB8tmE48XjAZERR/Kgdd1VUUpSTs4hMp8H2G3BV+uOmddpmKy3biL7iGNja
         uxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539892; x=1726144692;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJg5IFa84xRILizcvK4k6RTiWZZ3HPdsh0baJag3tfc=;
        b=dcw6mN34I18t3MQaa7hd3aHOFHO7CP15uaqmPez2VRsp2K7RY5HyYhwR6ACYgby6wX
         PhwK9JrV67vwudiPC6lbm96yip2f5BJkCNtq787GyxUL78cXBP2LTcpHlcuCSoXnmXGV
         M84DhrFeqEnJuib19c24bD2fGOFBpUkNlUGh08UZwALrti8tD7C750MOypJVdL+VHSGI
         J2/nnBIEMhkGDc7CtI32VOrM8a76OyWWQ/9FE28Y83qpNcH18A83yyvprguBBeMDnlma
         TNBH1z+Qrg4JoreO1M9YwqzDpD4LBJ+kP/KpTPD4tUPR00eAwQaDIzpc/rhboajRgzJH
         8OiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlTqqc+mbigMu5FPL6J67ABdExS72E9gGGyvZ6L0+Qo8w1EKqvIViDof0nVTtzkSU/jD4lnri8mffn@alsa-project.org
X-Gm-Message-State: AOJu0Yw0R+SLTMsdqRxHT/BE7dv1MO6vSul+7jss6Ry1st2fcXwx2F1H
	PGelrMAssBmcGG2188wjR0D5S8X6k6geE2dFib2Fqi5RR+KsdIlbacKDsLEQ46A+97h7IE34JAo
	u
X-Google-Smtp-Source: 
 AGHT+IHB+NFWk2sx2SV+tsZrEs3O6Gl/8v4e/4O4iNCwpwj1Av4IuTeeGUrJOlHvENv25TFkx6zIWQ==
X-Received: by 2002:a5d:648d:0:b0:374:c6ad:a7c6 with SMTP id
 ffacd0b85a97d-374c6adab4amr10489721f8f.20.1725539891770;
        Thu, 05 Sep 2024 05:38:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb239sm237065515e9.5.2024.09.05.05.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:38:11 -0700 (PDT)
From: Takashi Iwai <dan.carpenter@linaro.org>
X-Google-Original-From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 5 Sep 2024 15:38:07 +0300
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Hillf Danton <hdanton@sina.com>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [PATCH 1/2 4.19.y] ALSA: usb-audio: Sanity checks for each pipe and
 EP types
Message-ID: <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76c0ef6b-f4bf-41f7-ad36-55f5b4b3180a@stanley.mountain>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DDNJCSYUFJUNWSYXNUFSUA2CN2CA7UT5
X-Message-ID-Hash: DDNJCSYUFJUNWSYXNUFSUA2CN2CA7UT5
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:54:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDNJCSYUFJUNWSYXNUFSUA2CN2CA7UT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 801ebf1043ae7b182588554cc9b9ad3c14bc2ab5 ]

The recent USB core code performs sanity checks for the given pipe and
EP types, and it can be hit by manipulated USB descriptors by syzbot.
For making syzbot happier, this patch introduces a local helper for a
sanity check in the driver side and calls it at each place before the
message handling, so that we can avoid the WARNING splats.

Reported-by: syzbot+d952e5e28f5fb7718d23@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/helper.c | 17 +++++++++++++++++
 sound/usb/helper.h |  1 +
 sound/usb/quirks.c | 14 +++++++++++---
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index 7712e2b84183..b1cc9499c57e 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -76,6 +76,20 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
 	return NULL;
 }
 
+/* check the validity of pipe and EP types */
+int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
+{
+	static const int pipetypes[4] = {
+		PIPE_CONTROL, PIPE_ISOCHRONOUS, PIPE_BULK, PIPE_INTERRUPT
+	};
+	struct usb_host_endpoint *ep;
+
+	ep = usb_pipe_endpoint(dev, pipe);
+	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
+		return -EINVAL;
+	return 0;
+}
+
 /*
  * Wrapper for usb_control_msg().
  * Allocates a temp buffer to prevent dmaing from/to the stack.
@@ -88,6 +102,9 @@ int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 	void *buf = NULL;
 	int timeout;
 
+	if (snd_usb_pipe_sanity_check(dev, pipe))
+		return -EINVAL;
+
 	if (size > 0) {
 		buf = kmemdup(data, size, GFP_KERNEL);
 		if (!buf)
diff --git a/sound/usb/helper.h b/sound/usb/helper.h
index f5b4c6647e4d..5e8a18b4e7b9 100644
--- a/sound/usb/helper.h
+++ b/sound/usb/helper.h
@@ -7,6 +7,7 @@ unsigned int snd_usb_combine_bytes(unsigned char *bytes, int size);
 void *snd_usb_find_desc(void *descstart, int desclen, void *after, u8 dtype);
 void *snd_usb_find_csint_desc(void *descstart, int desclen, void *after, u8 dsubtype);
 
+int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe);
 int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe,
 		    __u8 request, __u8 requesttype, __u16 value, __u16 index,
 		    void *data, __u16 size);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 43cbaaff163f..087eef5e249d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -743,11 +743,13 @@ static int snd_usb_novation_boot_quirk(struct usb_device *dev)
 static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
 {
 	int err, actual_length;
-
 	/* "midi send" enable */
 	static const u8 seq[] = { 0x4e, 0x73, 0x52, 0x01 };
+	void *buf;
 
-	void *buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
+	if (snd_usb_pipe_sanity_check(dev, usb_sndintpipe(dev, 0x05)))
+		return -EINVAL;
+	buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 	err = usb_interrupt_msg(dev, usb_sndintpipe(dev, 0x05), buf,
@@ -772,7 +774,11 @@ static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
 
 static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
 {
-	int ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	int ret;
+
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				  0xaf, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				  1, 0, NULL, 0, 1000);
 
@@ -879,6 +885,8 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "Waiting for Axe-Fx III to boot up...\n");
 
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
 	/* If the Axe-Fx III has not fully booted, it will timeout when trying
 	 * to enable the audio streaming interface. A more generous timeout is
 	 * used here to detect when the Axe-Fx III has finished booting as the
-- 
2.45.2

