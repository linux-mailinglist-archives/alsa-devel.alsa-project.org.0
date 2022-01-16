Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F403948FA19
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 02:02:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630FE17E1;
	Sun, 16 Jan 2022 02:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630FE17E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642294933;
	bh=Mvm5vUyKs5kYAHhlRX+tJ2Sag3I2sUu9dnHTlvrb5qA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Etw5IG7ADYLOCrlU399UkSdT6BCmSmybrAHJ18PGgIikYY47I8eQiWwrq47Ag6a28
	 m3OOero22DpaeG5OvXm+H1f9fuqhvCgzof7s8GVJtTbuo1wMLO1hsEPZEuOtvvx6ij
	 3NX8auFtN2PcI+ucr/p9J/S0VDJYQsB7kYuqDGCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D09F8020C;
	Sun, 16 Jan 2022 02:01:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1378F801D8; Sun, 16 Jan 2022 02:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4A25F800B0
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 02:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A25F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a5S18Xee"
Received: by mail-ot1-x331.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so14989338otu.10
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 17:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YBBa0f6uaBxxNY+oyqspNIPd8utEcYl+VVFRbkH/mGA=;
 b=a5S18Xee1rcNhUncm74H3VPvYiV6zRmal2lkOkR00Dq6izPNR45h0tXo7VwRL/3juI
 2sY6WO2+890VAbz/MY20PtKvpD7xe+8he2SJjqAc3Ko4WwW0w6zA4lMFTrPRkChpZ0Sc
 gzHyUpMuN/duzsRevaLZHUs47MCwp/bV9xDLfpyieHZoItcEsxcx0OSgYhQygxibQxFA
 zy0n/o7zpypnD+Fkvg2JAXVjzbuvq8ui1ovod8jcyy0EnsnMvQFR6SH3ynZK9TCg6lIC
 6th9N4+9g6KR2cr5M8qjMWsObx/ch3ZIitQH7SZODAAqLa0OiTpOGCLueutosy4C7KgJ
 AxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YBBa0f6uaBxxNY+oyqspNIPd8utEcYl+VVFRbkH/mGA=;
 b=aqq0ATkwoiVxEmsRFunHsreZmwFBdSapXJUVs8L015EtjMUD8iB6kZpjOfmXBo9Tga
 Z4rRAu0m0+Rjq6krF2VBTO7/k/1cxv6zev9Ho3TuE7FOUc9msRla1/0SvJvwiH2y9bD5
 QE3ZAQdiTbQPJ+MzIsdcj/PGGv4r9U5aoQY4YtA+8VaRjtBET/SoXBDd0XuiH88M1PZ+
 eVxNkhX8EhV1r2pWbzCXsIBpc1qRk7HCybNbpbBLc1/uSOf6TWMQJWgsRSY58kFsSMYk
 uiXZXYYsQ3v7UOaWGXOOK8Zrdakte6R7ppVsVoD9/YWM/hdQ/LnYcwsD8bOfTj5kGLnW
 yanA==
X-Gm-Message-State: AOAM533iIrxHtRlEWPSsZJR9EgYdijtlYZFdz6XHVmqC7U+ej1L87XNu
 jPdZBhIzkyIi3Q4TkNK1rnY=
X-Google-Smtp-Source: ABdhPJwneHI/BWmFI6/pTXeX5DxLB1K9NFI8Rn1jX2JIDFLlonxZEHbIy+G5dQJAbTZcjXI1QdH9pQ==
X-Received: by 2002:a9d:1b0f:: with SMTP id l15mr11495663otl.38.1642294858045; 
 Sat, 15 Jan 2022 17:00:58 -0800 (PST)
Received: from geday ([2804:7f2:8006:2ed4:dd1b:ebb9:4bfc:fcb3])
 by smtp.gmail.com with ESMTPSA id y2sm3907511otq.27.2022.01.15.17.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 17:00:57 -0800 (PST)
Date: Sat, 15 Jan 2022 22:00:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YeNuSip2RcH4DlV+@geday>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
 <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
 <YeEp5xUjf1DAeGTY@geday>
 <2137c7e3-805b-7371-6042-1c2d5f61e302@nandakumar.co.in>
 <YeH5FlQzM9PNm6s0@geday>
 <5fba3e63-6fd2-de1c-1564-ac6b8870e730@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fba3e63-6fd2-de1c-1564-ac6b8870e730@nandakumar.co.in>
Cc: ALSA-devel <alsa-devel@alsa-project.org>
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

On Sat, Jan 15, 2022 at 12:29:18PM +0530, Nandakumar Edamana wrote:
> Could compile and reload the module successfully, but the stuttering is 
> still there.

Hi Nandakumar,

OK, my mistake, scratch that patch.

The codepath that activates Implicit Feedback when implicit_fb=1 is
passed to the module as an option is the same that should activate when
the quirk is in place.

Like I said, it's very strange that your device skips implicit feedback
when the quirk is in place, but can pick implicit feedback when
implicit_fb=1 is passed to the module as an option.

I've prepared some printk's hooked up to every codepath I can think of
that will skip implicit feedback. Please test and share your results,
always with dyndbg on.

--- implicit.c	2022-01-14 16:41:53.946606013 -0300
+++ implicit.c	2022-01-15 21:45:15.108655890 -0300
@@ -90,8 +90,10 @@ static int add_implicit_fb_sync_ep(struc
 
 	if (!alts) {
 		iface = usb_ifnum_to_if(chip->dev, ifnum);
-		if (!iface || iface->num_altsetting < 2)
+		if (!iface || iface->num_altsetting < 2) {
+			printk(KERN_WARNING "implicit: add_implicit_fb_sync_ep(): not a usb_host_interface or less than 2 altsettings");
 			return 0;
+		}
 		alts = &iface->altsetting[1];
 	}
 
@@ -242,17 +244,23 @@ static int __add_generic_implicit_fb(str
 	struct usb_endpoint_descriptor *epd;
 
 	alts = snd_usb_get_host_interface(chip, iface, altset);
-	if (!alts)
+	if (!alts) {
+		printk(KERN_WARNING "implicit: __add_generic_implicit_fb(): not a usb_host_interface");
 		return 0;
+	}
 
 	if ((alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC &&
 	     alts->desc.bInterfaceClass != USB_CLASS_AUDIO) ||
-	    alts->desc.bNumEndpoints < 1)
+	    alts->desc.bNumEndpoints < 1) {
+		printk(KERN_WARNING "implicit: __add_generic_implicit_fb(): no endpoints or wrong Interface Class");
 		return 0;
+	}
 	epd = get_endpoint(alts, 0);
 	if (!usb_endpoint_is_isoc_in(epd) ||
-	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
+	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC) {
+		printk(KERN_WARNING "implicit: __add_generic_implicit_fb(): not Isochronous IN or not Asynchronous");
 		return 0;
+	}
 	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
 				       iface, alts);
 }
@@ -262,8 +270,10 @@ static int add_generic_implicit_fb(struc
 				   struct audioformat *fmt,
 				   struct usb_host_interface *alts)
 {
-	if ((fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
+	if ((fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC) {
+		printk(KERN_WARNING "implicit: add_generic_implicit_fb(): not Asynchronous");
 		return 0;
+	}
 
 	if (__add_generic_implicit_fb(chip, fmt,
 				      alts->desc.bInterfaceNumber + 1,
@@ -302,8 +312,10 @@ static int audioformat_implicit_fb_quirk
 	if (p) {
 		switch (p->type) {
 		case IMPLICIT_FB_GENERIC:
+			printk(KERN_WARNING "implicit: audioformat_implicit_fb_quirk(): matched GENERIC inside playback_implicit_fb_quirks[]");
 			return add_generic_implicit_fb(chip, fmt, alts);
 		case IMPLICIT_FB_NONE:
+			printk(KERN_WARNING "implicit: audioformat_implicit_fb_quirk(): matched SKIP_DEV inside playback_implicit_fb_quirks[]");
 			return 0; /* No quirk */
 		case IMPLICIT_FB_FIXED:
 			return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
@@ -311,6 +323,10 @@ static int audioformat_implicit_fb_quirk
 		}
 	}
 
+	else {
+		printk(KERN_WARNING "implicit: audioformat_implicit_fb_quirk(): no matches found inside playback_implicit_fb_quirks[]");
+	}
+
 	/* Special handling for devices with capture quirks */
 	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
 	if (p) {
@@ -354,6 +370,7 @@ static int audioformat_implicit_fb_quirk
 		return add_generic_implicit_fb(chip, fmt, alts);
 
 	/* No quirk */
+	printk(KERN_WARNING "implicit: audioformat_implicit_fb_quirk(): returning 0 because no quirk was found");
 	return 0;
 }
 
