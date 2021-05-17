Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C837F3873B4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44689169D;
	Tue, 18 May 2021 10:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44689169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621324920;
	bh=tMGvgRuHKs/jG8SLou2bFU+O4wGlocuI9WGoGSq3Q2s=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QQUjObNrX2Ye2c8ovxGdcHAdJZS/cAl/kjCgJ4EPDx4sRe4+amCXC/WgFvxPMiVXX
	 j+txjWqWhRf/ooMKpvSjSRMQ030pUDVEuoaJU4A+E9EREAkaspVs+kOzbIdD8drd/R
	 c54UEYTc+v+ghYXLmOHZHYPVPTZWTWVHHNrs4Cr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA2D3F80257;
	Tue, 18 May 2021 10:00:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09938F8020B; Mon, 17 May 2021 15:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4523F80082
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4523F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hv4ocnTu"
Received: by mail-pl1-x634.google.com with SMTP id h7so3144929plt.1
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=T299hw2nrjetWllzvpwXf6H+9SfZqQxyFY9qbEw8OLc=;
 b=hv4ocnTuuIi59K2Wus0fnCTAWIitgTfuwTZXxeM0ySr5nfPSbcT6zbh5esq/SGRAcp
 gH/jqPYgyNZQlYzzoH60815biA/GWrYneI+vIKZEzb4lnYUP2Rej7ipdVb/Ks/WtMOon
 TjW8GdHgQUCJhtZBWU/OXjJqHcz6fUaHqTWYdnQ41hQq91NeMI+zTFt6/SRIo9tqKRz9
 JIOvtSc0tGNEimGGUprDxhtgowPiQsVMr6bdxDxr2AM6IIQZw8m68b1JhddpDdYK/t08
 8fiixau7juQxF6FOSfboTkahD1h2oPNaijU3N1NEN5cnMM3uJv3TGxGZaalvF3spKUeL
 SHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=T299hw2nrjetWllzvpwXf6H+9SfZqQxyFY9qbEw8OLc=;
 b=QPToJbg4DDM/U0/8GDFz/ddHyLwx+lOlfp2vfGenqRy3MpxPg4WUjdn3p3Ta8/Ixgc
 nf4Qn/Nx+XiFtz+nJdWQBr6wADHRINUtgO2F/zm98+ugVUufRoKEJOZ3hjeHF0oDzeE0
 EtYEkZWfOQSORF4YbLi1B3Zc9K1/RW/bt+iT3c7ppwbi3Aki+n1NL/4xg/MTpBuvHcck
 uJOn0uXe1MFyE6U0Q9m18i8z8OJMIfPI+piY2vW4vGGh0JzDg9nGlnnvCW/bOlaUSiQ4
 ch5pJGL7luo02ArnU/ihKgz4GQRKjxSE1zlnqmSzPQBSqdBm3c9nfBk3MQ5/JQImzKRA
 TgtA==
X-Gm-Message-State: AOAM533UKxvBAhCRQbhtuRkOmCkaJaJ7LbT7flc3/3c1gJdYgfrVoabx
 iJejTO85MC5mmo6hG9tJUoo=
X-Google-Smtp-Source: ABdhPJxg0Xe36+0X0/7cmHUnlus3XHOtNV8SkeU9fGLe57mMyTnYFjMTQlAO84whktZVHOo9LDU45g==
X-Received: by 2002:a17:90b:1e43:: with SMTP id
 pi3mr68345190pjb.51.1621258051832; 
 Mon, 17 May 2021 06:27:31 -0700 (PDT)
Received: from hyeyoo ([121.135.181.35])
 by smtp.gmail.com with ESMTPSA id h19sm10504525pgm.40.2021.05.17.06.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:27:31 -0700 (PDT)
Date: Mon, 17 May 2021 22:27:25 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [RFC PATCH] sound: line6: Fix race condition in line6_probe
Message-ID: <20210517132725.GA50495@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 18 May 2021 10:00:15 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

syzbot reported general protection fault in midibuf_is_full.
the cause is linemidi pointer in struct usb_line6 isn't properly
initialized.

the pointer isn't initialized because there is race condition
in line6_probe. it calls line6_init_cap_control first, which submits urb.
and then it initializes it's data using private_init function.

so it's possible line6_data_received is called before it's
data isn't initialized.

Link: https://lkml.org/lkml/2021/5/17/543
Reported-by: syzbot+0d2b3feb0a2887862e06@syzkallerlkml..appspotmail.com
Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
---
 sound/usb/line6/driver.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index a030dd65eb28..2c183a2a30f0 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -788,17 +788,17 @@ int line6_probe(struct usb_interface *interface,
 
 	line6_get_usb_properties(line6);
 
+	/* initialize device data based on device: */
+	ret = private_init(line6, id);
+	if (ret < 0)
+		goto error;
+
 	if (properties->capabilities & LINE6_CAP_CONTROL) {
 		ret = line6_init_cap_control(line6);
 		if (ret < 0)
 			goto error;
 	}
 
-	/* initialize device data based on device: */
-	ret = private_init(line6, id);
-	if (ret < 0)
-		goto error;
-
 	/* creation of additional special files should go here */
 
 	dev_info(&interface->dev, "Line 6 %s now attached\n",
-- 
2.25.1

