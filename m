Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DC2293CB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33FB71662;
	Wed, 22 Jul 2020 10:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33FB71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407316;
	bh=fuAK4slEcJ/XRIFHg9b+o/+NYakImU0/pXzr3hS1hoI=;
	h=Subject:References:To:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wrkb0AWnKickCo60zN10PmhRzR8l9JQmgDSIozlDkcwJZvywFBbBuJZeWf8z+lY4v
	 buE4bQSxtr6kltDbmDHSfYqaHU4PiYQ6P4JA+ZxWzMxCd3wqrlPobKcJjK2Ur+NNE5
	 OClUGmpvHwcXaWNQLOQMU775YSW2T59GmpoTsfxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86745F8015A;
	Wed, 22 Jul 2020 10:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC081F8014C; Wed, 22 Jul 2020 07:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3051EF80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 07:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3051EF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BulE6d5u"
Received: by mail-pj1-x1031.google.com with SMTP id k5so540621pjg.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=LhvKHe0x0Vxk1UfTbL9MNG0KJ+mi+MFxDAymHvCYyhE=;
 b=BulE6d5uHTKTf2LJrb5LdYjzAj3eGa+3txwG678KAAvJOatuzFTnrgNsOESaxESfkW
 ogWj4KskaOoTQyY/ov2QjMRX5FZMF8feTSb54cQqYKzQPifhj3hN1ovaCBXVh1JEwO4o
 ZVbeXlwQb1TxIgo2sPQbYQ7SBMmSQgdjYT74jFhT/tPAgbhDWbUM2VWD+D2QgdRu0kix
 ZwgwFEvpxDC4bx9nuoKW83i6O3GjaZDUDN0OxKku3H76JtW8n3JBAo3wU1le4sLnjrJ3
 gd8d7DqBcXGxRsblHnE+2ABEZCav7rMJGHauFwDadfUGXxSyIW9EG5XzMAODd+DNGA+K
 xL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=LhvKHe0x0Vxk1UfTbL9MNG0KJ+mi+MFxDAymHvCYyhE=;
 b=iJ6RDcgEEmdBH3OjwupGTXWtKFai9ZOJlPF3gNR2TqjeNncKwwg8sj4i9BH+bncomJ
 f1HRGm7OKvlAgVjSdkq8E5GRK1uYLG+uxq5QTACJKY40i5/rtP6tKBfMWDmUGrD+lYgJ
 sMVvYsxL0nPWWd9xSZyl3BBDWlX5V1KACPKOk7QR9qkpheyASUKDM8Y6vvB9DUH5goRR
 lnDzw7k8dvO50i/s9ESKCA4INjVvDDpzeuV/MgDWAmj8ktNceRb0e4NPc0WDm3Ji4Enn
 oyOyyuveL1y1nrOfkUVhIFVPm4vmczpQIuPHChhzzjgBJDwiD4kHOt1czTqCbrg+xjrX
 yM8A==
X-Gm-Message-State: AOAM532OnfVq9PEVyrMCj9VzqvthJAWjHVXNuk5T9iTyxLhY63LtPWVM
 ZlsZxILrpcKBQKd6EmShFcru4b22
X-Google-Smtp-Source: ABdhPJxJ9YDoIyTBI0wgY4LpLOKwKLg6M9BaGnAVNs6xSvk/5BGs+ScsVK5Pk0PdFMcDC0C3LrYrIg==
X-Received: by 2002:a17:90a:2681:: with SMTP id
 m1mr7651589pje.204.1595394398280; 
 Tue, 21 Jul 2020 22:06:38 -0700 (PDT)
Received: from [192.168.1.5] (cpe-76-95-88-7.socal.res.rr.com. [76.95.88.7])
 by smtp.gmail.com with ESMTPSA id 66sm22213398pfg.63.2020.07.21.22.06.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 22:06:37 -0700 (PDT)
Subject: Fwd: Fwd: [PATCH] Add implicit feedback quirk for SSL2. (from
 laurie@tratt.net)
References: <20200615093639.p74zvyupivfxou4b@overdrive.tratt.net>
To: alsa-devel@alsa-project.org
From: Dmitry Pavlushko <dpavlushko@gmail.com>
X-Forwarded-Message-Id: <20200615093639.p74zvyupivfxou4b@overdrive.tratt.net>
Message-ID: <958bbdf1-5a97-72ac-b7f0-01bda32add70@gmail.com>
Date: Tue, 21 Jul 2020 22:06:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200615093639.p74zvyupivfxou4b@overdrive.tratt.net>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jul 2020 10:38:01 +0200
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi devs,

Sorry for the interruption. Any chance you can push the line for SSL2 
usb id?

Thanks,

Dmitry


-------- Forwarded Message --------
Subject: 	Fwd: [PATCH] Add implicit feedback quirk for SSL2. (from 
laurie@tratt.net)
Date: 	Mon, 15 Jun 2020 10:36:39 +0100
From: 	Laurence Tratt <laurie@tratt.net>
To: 	dpavlushko@gmail.com



I forgot to CC you. Sorry!


Laurie

----- Forwarded message from Laurence Tratt <laurie@tratt.net> -----

From: Laurence Tratt <laurie@tratt.net>
To: alsa-devel@alsa-project.org
Date: Mon, 15 Jun 2020 08:30:23 +0100
Subject: [PATCH] Add implicit feedback quirk for SSL2.

As expected, this requires the same quirk as the SSL2+ in order for the
clock to sync. This was suggested by, and tested on an SSL2, by Dmitry.

Signed-off-by: Dmitry <dpavlushko@gmail.com>
Signed-off-by: Laurence Tratt <laurie@tratt.net>
---
sound/usb/pcm.c | 1 +
1 file changed, 1 insertion(+)

diff --git sound/usb/pcm.c sound/usb/pcm.c
index 84c0ae4319..dc1608bdf6 100644
--- sound/usb/pcm.c
+++ sound/usb/pcm.c
@@ -367,6 +367,7 @@ static int set_sync_ep_implicit_fb_quirk(struct 
snd_usb_substream *subs,
ifnum = 0;
goto add_sync_ep_from_ifnum;
case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+ case USB_ID(0x31e9, 0x0001): /* Solid State Logic SSL2 */
case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
ep = 0x81;
ifnum = 2;

-- 
2.27.0


----- End forwarded message -----

