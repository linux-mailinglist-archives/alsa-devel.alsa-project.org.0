Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7644596F604
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D523D14DF;
	Fri,  6 Sep 2024 15:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D523D14DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725630984;
	bh=lit5iBxVDFpk4ULIy0i42xv115wo/uqoPdVZId53JPk=;
	h=From:Date:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=afkCwysFviq5BTIAHl8j3KuoymsQSRpVO/p9T7/DxSeRO406E7VJ96VRTKfHG+aQh
	 tw7PZZmh1PDI53nEA/xNUzxsyiyQla2LfRpVuzYVqRYPrpq02ZgfNU9gUsXxHqP/3f
	 59IQ2GoV4nJ6qaPqox/At9knta+IJ4PAqn0E4S90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 891E0F8065C; Fri,  6 Sep 2024 15:55:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AACFFF80656;
	Fri,  6 Sep 2024 15:55:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88B1FF8032D; Thu,  5 Sep 2024 14:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0B94F8014C
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 14:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B94F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W1bDbcht
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so5767125e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539897; x=1726144697;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8tBVBv6hqzsh3Y7wmsPJR+JvC6LY/bf7F+mJ4H3uNA=;
        b=W1bDbchtrCF7gsp0oSF9tFjDBsN/FpaWjZUrYfBpkLfjRLyKl8aBHtmG9p98pq0Dyr
         G0H2arqzX9VHyY11F/ywTTvGwyNWjbe/wpHmDjRVwzEp6l3jvg2l3Pa6Mvp41zHJkyCd
         yz4LANEU7lb8F68Iv9iXybayPG6KfISO8jlvNvDBJvyKPm++sfmQwqgQ+elIp53cK+ub
         z0EEtSi7VyBw7wlEH1KXsxHYczmaYXipejkS5w5y0D1QS9hl4TY8+1HuTwOoBBxEd2ZF
         TLqs7Yv21r35qicReUo5dX3P+Fa3C8PsgzoIqztYYeGRsX2hdQf9VgA1XRgI4BHgb2R2
         KSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539897; x=1726144697;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8tBVBv6hqzsh3Y7wmsPJR+JvC6LY/bf7F+mJ4H3uNA=;
        b=taZjOIMNL3HcBJjdS10GxaccjzXHGKHWzZ9e8J2e6OeXIBpkcW4A2Vsq6RTBLvyfRo
         mEdacMYdbUJlsUPPDiVy7LwdoFJtn4G2C1nEVuUaQrbIXAU70+QeMNv/P9iQuOpu4yT1
         fNMJYXJg6/qJ7bPifWXD7PWJgTb1bUpH8bnZ5HdRi36ioO5xLeD3SUdBlL//JNAoI9X+
         tiPsnTmDsa9V28I9bePn1basB4fTzU+IklAe800PTPOhPSQPEdFENFd0phej9TVIX2Wc
         jV5CAiWk+n9uWmJ7ZN7xLK7gCGIVuybpugW769vMYht33m1xOSR+Z0Pa7BRvPwwUKQSu
         yACQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVamZqFv+3mvaHyiRixQOwSs01hWMFk85NOigPEvbdwYdO9EpTrrl+I2H56fgnN1P5sYBNdA7+zqdF@alsa-project.org
X-Gm-Message-State: AOJu0YynqGO9Tt0r+gqMJ5vZ8RnNZldwyBeV98+WqssZo0MhB4Kl0Oo8
	/S+qm+h52CKdDVajURQ9pz17AVzH9aLazhehWdQ7OnXxrEuMStdruFAKLw0hi+A=
X-Google-Smtp-Source: 
 AGHT+IEUeJhq6nXQUzmxvES2TVSIG9etjyshwco7odL0scyeNSEVlHlJx1JBy6Ds2ivDpmh9lPiSVQ==
X-Received: by 2002:a05:600c:1551:b0:428:ea8e:b48a with SMTP id
 5b1f17b1804b1-42c8de5f5c3mr51960955e9.8.1725539897504;
        Thu, 05 Sep 2024 05:38:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc127ec5sm205513245e9.19.2024.09.05.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:38:17 -0700 (PDT)
From: Hillf Danton <dan.carpenter@linaro.org>
X-Google-Original-From: Hillf Danton <hdanton@sina.com>
Date: Thu, 5 Sep 2024 15:38:13 +0300
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2 4.19.y] ALSA: usb-audio: Fix gpf in
 snd_usb_pipe_sanity_check
Message-ID: <d830ede4-1736-4548-94b3-51a21fa935c3@stanley.mountain>
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
Message-ID-Hash: 3SQV4QIOXFXYZJAAGSUO76IKWMZG4O4S
X-Message-ID-Hash: 3SQV4QIOXFXYZJAAGSUO76IKWMZG4O4S
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:54:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SQV4QIOXFXYZJAAGSUO76IKWMZG4O4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 5d78e1c2b7f4be00bbe62141603a631dc7812f35 ]

syzbot found the following crash on:

  general protection fault: 0000 [#1] SMP KASAN
  RIP: 0010:snd_usb_pipe_sanity_check+0x80/0x130 sound/usb/helper.c:75
  Call Trace:
    snd_usb_motu_microbookii_communicate.constprop.0+0xa0/0x2fb  sound/usb/quirks.c:1007
    snd_usb_motu_microbookii_boot_quirk sound/usb/quirks.c:1051 [inline]
    snd_usb_apply_boot_quirk.cold+0x163/0x370 sound/usb/quirks.c:1280
    usb_audio_probe+0x2ec/0x2010 sound/usb/card.c:576
    usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
    really_probe+0x281/0x650 drivers/base/dd.c:548
    ....

It was introduced in commit 801ebf1043ae for checking pipe and endpoint
types. It is fixed by adding a check of the ep pointer in question.

BugLink: https://syzkaller.appspot.com/bug?extid=d59c4387bfb6eced94e2
Reported-by: syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Fixes: 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
Cc: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index b1cc9499c57e..029489b490ca 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -85,7 +85,7 @@ int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
 	struct usb_host_endpoint *ep;
 
 	ep = usb_pipe_endpoint(dev, pipe);
-	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
+	if (!ep || usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;
 }
-- 
2.45.2

