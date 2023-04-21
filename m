Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2686EAD2A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E957A4F;
	Fri, 21 Apr 2023 16:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E957A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682087981;
	bh=Fb5wXxghz3VpS15iPeeAvBCvueKRCo8aJb5rQ63R3kg=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lRW2dq42zvaGJy+IaYdJGcUxXnZ1Asin+kXxNQj+sa7U/HvyOUoUJN0l16ilVZZ0K
	 O4ym9lVR8xTI58TO2mcsYgvoqIy16lSOw2gEV0XuV2iHsKkStB+PDSz3GSNGrLb5yH
	 rj1zXrPISrfpH7SOAr++o8gm2xXEpd8MI2ydmvjw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2269BF80149;
	Fri, 21 Apr 2023 16:38:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DCFDF80155; Fri, 21 Apr 2023 16:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A01C6F800D0
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01C6F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chrisdown.name header.i=@chrisdown.name
 header.a=rsa-sha256 header.s=google header.b=JHPN1tlN
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso4935975e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1682087922; x=1684679922;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wywWnhOuE+0DcIU4ueBcvpTkOXGVmA0wp8sn1mo73kY=;
        b=JHPN1tlNTN2wco5YysAMlww7I2VPprMyPlat9vVd5y9RjtQAthg5h62tLTT48gidC0
         wG4QYINpbTbiiVWd0SHKroZk73Hrqb02/w69C4zKa8rcSbtP77Blz0mts+h4eyy+z5ZG
         a9WXf4A3zroXWeKuMPvILGbWw7J+L9vIwBGBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087922; x=1684679922;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wywWnhOuE+0DcIU4ueBcvpTkOXGVmA0wp8sn1mo73kY=;
        b=ef+L6B4+uSLuVQc6WB/9wTjzK8N/2vFnwrJs8EWE/aeHZpMRhvcgFWGYQeXr7ID4mj
         XNZFkhnXFQmbGaQFUMDCAfinHCjUlhK83h8q90cjgjBhgCMEDFyIkU+V7txtzConG63m
         Tl1PazlM5YS3Uvh1Iey6pmEQ1dDyix5lzHSfPHmSQLgOjrH8TnTyECY9Tu3W9kRwYMcp
         3JBOvmrrigmZtf6va8Cv2goBi3sxMnYsbvY+fEq06TTpE8eejOTnLS+8oubYkeE+YOp2
         vuDyY6P685wzGnxfByeyXmnAqXe0LEmXpN7IwysD/Tvdvsg9ckYK7aJtvQOxXVBYt/CX
         hVww==
X-Gm-Message-State: AAQBX9cCDIJQpQ1/u0uBn7R9ZSYMktSwp2+i0KTRjC5i+3tl2ShRBb7f
	zz8KCVCf5AMnGeMEidMEBXSXdDT5/LyE2EopVuQ=
X-Google-Smtp-Source: 
 AKy350aEqS8sC+wbkiEZM0CsknXZhhHf/KGNghGClrvOUjU+3SvBSQx8CZUQt8Z/tSJP4fi0KG1ACg==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:94fe:65e0 with SMTP id
 n25-20020a7bcbd9000000b003f194fe65e0mr1484021wmi.26.1682087922446;
        Fri, 21 Apr 2023 07:38:42 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm8268375wmp.21.2023.04.21.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:38:41 -0700 (PDT)
Date: Fri, 21 Apr 2023 15:38:41 +0100
From: Chris Down <chris@chrisdown.name>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] usb-audio: Rate limit usb_set_interface error reporting
Message-ID: <ZEKf8UYBYa1h4JWR@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (2023-03-25)
Message-ID-Hash: 637IFG6VHM64WHUHMAIEJ2O7PBJHIP4B
X-Message-ID-Hash: 637IFG6VHM64WHUHMAIEJ2O7PBJHIP4B
X-MailFrom: chris@chrisdown.name
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/637IFG6VHM64WHUHMAIEJ2O7PBJHIP4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When an error occurs during USB disconnection sometimes things can go
wrong as endpoint_set_interface may end up being called repeatedly. For
example:

% dmesg --notime | grep 'usb 3-7.1.4' | sort | uniq -c | head -2
   3069 usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
    908 usb 3-7.1.4: 1:1: usb_set_interface failed (-71)

In my case, there sometimes are hundreds of these usb_set_interface
failure messages a second when I disconnect the hub that has my USB
audio device.

These messages can take a huge amount of the kmsg ringbuffer and don't
provide any extra information over the previous ones, so ratelimit them.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 sound/usb/endpoint.c | 5 +++--
 sound/usb/usbaudio.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 647fa054d8b1..2cd99cc8c360 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -916,8 +916,9 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 		      ep->iface, altset, ep->ep_num);
 	err = usb_set_interface(chip->dev, ep->iface, altset);
 	if (err < 0) {
-		usb_audio_err(chip, "%d:%d: usb_set_interface failed (%d)\n",
-			      ep->iface, altset, err);
+		usb_audio_err_ratelimited(
+			chip, "%d:%d: usb_set_interface failed (%d)\n",
+			ep->iface, altset, err);
 		return err;
 	}
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index f5a8dca66457..38a85b2c9a73 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -67,6 +67,8 @@ struct snd_usb_audio {
 
 #define usb_audio_err(chip, fmt, args...) \
 	dev_err(&(chip)->dev->dev, fmt, ##args)
+#define usb_audio_err_ratelimited(chip, fmt, args...) \
+	dev_err_ratelimited(&(chip)->dev->dev, fmt, ##args)
 #define usb_audio_warn(chip, fmt, args...) \
 	dev_warn(&(chip)->dev->dev, fmt, ##args)
 #define usb_audio_info(chip, fmt, args...) \
-- 
2.40.0

