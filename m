Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C702784B1DB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:02:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC3B83B;
	Tue,  6 Feb 2024 11:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC3B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213741;
	bh=Cq73BcEx/uYKDbOU3/mg9M1bMhtj7nZ8crkg4Fn+pc0=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TE32gPwJUbgowN8ojjRE0l3H0Um2GYK3c8oH88rCKdvD4Ta1QnG09/xnX+dixXGZ3
	 9Qg8/rNABo7zGOv1Vu5JRomSu007EdLmSA6pk5gxumJ8T9o3GYmSM7TtS1p2Fs8ye5
	 BaQHWP1JBeDyd6WXMlqEUoESt3Tb6d6Hl22FJCi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279C0F80602; Tue,  6 Feb 2024 11:00:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 059E2F8060D;
	Tue,  6 Feb 2024 11:00:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C282F8055C; Thu,  1 Feb 2024 08:07:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59BE7F80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 08:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59BE7F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=3Bl2lWu5
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-603f93acd7cso12655527b3.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 23:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706771232; x=1707376032;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nARAJpsDECWE0kiylBNBZDPewhI1rfVQYGPQbaScn7c=;
        b=3Bl2lWu5vTUpN8Q14DHdciK42kmeXubhyv82iM8NYAZCKE24NjiPyycaw0276MJu0p
         UT1nw26375E31dIBQHk//dc/hTdCHyv8swQAhEr6MHU1ANOeSY1D1hYEiZHLB5aj2AnM
         apdnM3godWD36veaBWWpfvC5Qi3GD2hp/3k0sa48TWu0eohBXbMKfYEWqJ5Z99Oj1/u+
         VDetM3IebRCP9dafij+IaBn8z+muPUxQ2KY6o7zjWwpag+2X1U56pNCfjPNaFAsOKHKC
         8VLUMaqCZBFKtJp0Q0Gqphj/n03N0s1lrr0tcWiAxsHx7cfuaJ1MGHTB8GDREHkG7m4k
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706771232; x=1707376032;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nARAJpsDECWE0kiylBNBZDPewhI1rfVQYGPQbaScn7c=;
        b=iBwhrBpq6Seixx5jWr0Z5g7iCO1CM5S73PfOW5CPS1Oqw81rUR4AYaMjVczX/pYOgC
         m2ZHr2y7+mWUBmn11suP6Gm00XaIWWMxBZlqkllZofDRTBHNa1C6/34caw9A3N2IeRzI
         ozr5YKvzN9Dlx/L+hlTVJ6EOASNswAMouGneOOPelp2dtBosDkMHrmH56YxWQo5WGnpZ
         s714PZJdl/hbiNbEE7IlSIk7vl0uo3er7s2L9MnWCgABYKStIQz/CHb7Wzb/ru/WlKDE
         hCSb2Fv30k9q5z4lz8R9JEARb8E+1IUzZNCdX8Z/8xfyZUh/Ze/bKf3hvRIsRYyvjbYB
         PBvg==
X-Gm-Message-State: AOJu0YxeQnYw7KNSFmUaeOQCVpAKuQ0miDBXS/bracCnRJxE317AV5m+
	XzcxjOGA7aXBjE6R077w5jckguwjuORY+5x8lITj5Wd+NxG126R//GAYE42ahahXcVRMtNmfVMq
	3Hj+5ulOa9dEh9H/aww==
X-Google-Smtp-Source: 
 AGHT+IHS6RTl0iDRKRZ2PQzkBsUbcBqzMJTi18Hw7Gd56oY2VMs1/QXeWN3CaEJwy1YoCP5dIyXlKQudFtJMpEj3
X-Received: from vincenttew1.c.googlers.com
 ([fda3:e722:ac3:cc00:3:22c1:c0a8:1bb2])
 (user=vincenttew job=sendgmr) by 2002:a81:9b12:0:b0:5fb:455a:df08 with SMTP
 id s18-20020a819b12000000b005fb455adf08mr928942ywg.7.1706771231672; Wed, 31
 Jan 2024 23:07:11 -0800 (PST)
Date: Thu,  1 Feb 2024 15:06:09 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240201070641.401684-1-vincenttew@google.com>
Subject: [PATCH] ALSA: usb-audio: retry clock validate when it takes some
 times
From: vincenttew <vincenttew@google.com>
To: perex@perex.cz, tiwai@suse.com, vincenttew@google.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc: alexander@tsoy.me
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3H0O7ZQoKCsY7uzoqz55q8s00sxq.o0ymx4m-pq7qxmx4m-130vqo5.03s@flex--vincenttew.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TT7PX3DHKCENSABXXJFJZO2S762JB5KK
X-Message-ID-Hash: TT7PX3DHKCENSABXXJFJZO2S762JB5KK
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:59:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Behringer UMC202HD and UMC404HD take some times to validate the clock
source. To prevent more DAC have the same delay which return the false
in the first time, remove the USB id check to have a chance to retry the
clock validate.

Signed-off-by: vincenttew <vincenttew@google.com>
---
 sound/usb/clock.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index b118cf97607f..16d7a456dd10 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -181,34 +181,27 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 			return true;
 	}
 
-	/*
-	 * MOTU MicroBook IIc
-	 * Sample rate changes takes more than 2 seconds for this device. Clock
-	 * validity request returns false during that period.
-	 */
-	if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
-		count = 0;
+	count = 0;
 
-		while ((!ret) && (count < 50)) {
-			int err;
+	while ((!ret) && (count < 50)) {
+		int err;
 
-			msleep(100);
-
-			err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
-					      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
-					      UAC2_CS_CONTROL_CLOCK_VALID << 8,
-					      snd_usb_ctrl_intf(chip) | (source_id << 8),
-					      &data, sizeof(data));
-			if (err < 0) {
-				dev_warn(&dev->dev,
-					 "%s(): cannot get clock validity for id %d\n",
-					   __func__, source_id);
-				return false;
-			}
-
-			ret = !!data;
-			count++;
+		msleep(100);
+
+		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
+				      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
+				      UAC2_CS_CONTROL_CLOCK_VALID << 8,
+				      snd_usb_ctrl_intf(chip) | (source_id << 8),
+				      &data, sizeof(data));
+		if (err < 0) {
+			dev_warn(&dev->dev,
+				 "%s(): cannot get clock validity for id %d\n",
+				   __func__, source_id);
+			return false;
 		}
+
+		ret = !!data;
+		count++;
 	}
 
 	return ret;
-- 
2.43.0.429.g432eaa2c6b-goog

