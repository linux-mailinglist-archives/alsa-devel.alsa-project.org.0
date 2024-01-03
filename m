Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DA823958
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 00:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C943E97;
	Thu,  4 Jan 2024 00:53:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C943E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704326025;
	bh=s1Ddmxdfym7l5K/gCAq++uvtxwRfiwF4P9l0AM6TKAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PcNJnzrQDjEF/9zA9+NzEbVMuArn8wQim0dlM/zhnw/sfl9uPPPLnjNol+wd9MAxP
	 5AbCCRThK3IyqhC8mlDUwmVJKpB5LifgyMEoMEmT8dfARrpfUndkxImt+/La44XB86
	 wW8NhQ89SeOOh1zbb6GTo9fGS/sAFXSyROHi8Nw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 088E6F80564; Thu,  4 Jan 2024 00:53:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B64AF80580;
	Thu,  4 Jan 2024 00:53:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73BDCF804B0; Thu,  4 Jan 2024 00:53:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 584CBF802DB
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 00:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 584CBF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kxhMB7kk
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d480c6342dso44762205ad.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 15:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704325976; x=1704930776;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rd68II1L0TFJm+D7eGj86VKo7YNY3VGiRHXn4Lw/o9o=;
        b=kxhMB7kk+m2hypfNAhBOo+4DyYWy8S6r/G4Fx2UsOWEZ1D6xZNUZnErZkM3s0gDT/Q
         9QrVtLx82kfLNFF0g9RLEvJ4bWcH4c/71xr5FPDvFTZQ5aud1tfROpKu+aZDPn40Fhd5
         /q8E/PSMOGRwKz/vKrm/xB3YbTdjch7EtJACPwKeRySOUnkgFBOVX0OKgk3r9wk88UWy
         arNSPOdX7DybEaHjb2toWA5smcQqJxD3kzqjfOrmymP5uHZEbzSYhKxoIkZoo82PrTa8
         6hKlPQZEuxHCCjnJTnBErOYKJilhOGpGdkk/9qsCvluzZY7VPpKVgdsfeHZrNUA6/08u
         MmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704325976; x=1704930776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd68II1L0TFJm+D7eGj86VKo7YNY3VGiRHXn4Lw/o9o=;
        b=B4DptvuOjx8o4YV0cNPdBVdzhi388oEtmBoVUpau7sd4YIisJxevaQ8TRkx83665/3
         lPWI+uqL1sd8DXMRHmNexCtfvnRavrVBMMtJQ1krw5RygN96xXD2lLzebPit91PnSmpr
         sjf0zRf8kTctKbRY36kU4/4Qb4bclSo/w/EYELpA+hktjSQlT77FMsZ/HsE6vInqkPR/
         xVo35tTWtOWg7f/viZ7qITpagVkxdlsL6jcUo9tKtW/uZwb1iHY9THTcRD4KbH+BZarX
         xcD6oVEeub54G+KjUxUL7BeD02uUFmgcOA2VAwiczL55ulb2gBacTOR5onv6g1wGNGKp
         wiVA==
X-Gm-Message-State: AOJu0YzWTSh/+IW7mtUg0EU5mklbjHTFLFsEp9qxsNvPBFXGfWLx2Syt
	Y2pd6hvRO31gHAVMkrDAAQM=
X-Google-Smtp-Source: 
 AGHT+IGz/vFJG7iZ2hXjsPiS4b5kkW8oFcsK+eXPIPkFISSSq0ZTyBb2uIgrwn2TFVvaHKB6Ps5ECQ==
X-Received: by 2002:a17:902:e5c3:b0:1d3:6c37:23b7 with SMTP id
 u3-20020a170902e5c300b001d36c3723b7mr22514193plf.87.1704325975498;
        Wed, 03 Jan 2024 15:52:55 -0800 (PST)
Received: from geday ([2804:7f2:8002:dd7c:7912:b8f2:dd57:c8ea])
        by smtp.gmail.com with ESMTPSA id
 iz4-20020a170902ef8400b001d08e080042sm24542622plb.43.2024.01.03.15.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 15:52:54 -0800 (PST)
Date: Wed, 3 Jan 2024 20:53:40 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Hills <mark@xwax.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: Regression in Final Scratch 'ScratchAmp' quirk (DJ interface)
Message-ID: <ZZXzhKbCEK04caa2@geday>
References: <05f7b47d-1762-c6aa-ddb1-3c6f6128cf44@xwax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f7b47d-1762-c6aa-ddb1-3c6f6128cf44@xwax.org>
Message-ID-Hash: ER3DQFHMANG4DJ2IFCL7TY3EGQGK4LGM
X-Message-ID-Hash: ER3DQFHMANG4DJ2IFCL7TY3EGQGK4LGM
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ER3DQFHMANG4DJ2IFCL7TY3EGQGK4LGM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 03, 2024 at 03:54:29PM +0000, Mark Hills wrote:
> The ScratchAmp worked perfectly with a quirk, but now that seems to have 
> regressed and the device is no longer detected [1].
> 
> It's design is from 2002, based on class-compliant (Philips UDA1325H) 
> chips. It hides itself behind a 'vendor specific' description, presumably 
> as it was launched in a closed system with specific hardware and software 
> for DJ'ing.

Hi Mark, great fan of your work with xwax here.

Perhaps adding USB_DEVICE_VENDOR_SPEC(0x103d, 0x0100) and
USB_DEVICE_VENDOR_SPEC(0x103d, 0x0101) to quirks-table.h can do the
trick?

Regards,
Geraldo Nascimento

> 
> So this quirk was introduced in 2007:
> 
> +/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
> +{
> +	USB_DEVICE(0x103d, 0x0100),
> +		.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
> +		.vendor_name = "Stanton",
> +		.product_name = "ScratchAmp",
> +		.ifnum = QUIRK_NO_INTERFACE
> +	}
> +},
> +{
> +	USB_DEVICE(0x103d, 0x0101),
> +		.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
> +		.vendor_name = "Stanton",
> +		.product_name = "ScratchAmp",
> +		.ifnum = QUIRK_NO_INTERFACE
> +	}
> +},
> 
> In a modern kernel, the (ineffective) quirk is now in sound/usb/card.c:
> 
> +	/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
> +	DEVICE_NAME(0x103d, 0x0100, "Stanton", "ScratchAmp"),
> +	DEVICE_NAME(0x103d, 0x0101, "Stanton", "ScratchAmp"),
> 
> Is there a functional difference between these quirks and/or any reason 
> the device would no longer be detected?
> 
> I noted the commits went via use of QUIRK_RENAME_DEVICE(), perhaps 
> misleading the refactoring to assume the quirk was purely a rename.
> 
> Below is an "lsusb" of the device, dated from 2008; I don't currently have 
> access to my own device, or know exactly when this regressed.
> 
> Many thanks
> 
> [1] https://sourceforge.net/p/xwax/mailman/message/48496984/
> [2] http://www.pogo.org.uk/~mark/linuxdj/scratchamp.html
> [3] https://finalscratch.sourceforge.net/innards/
> 
> -- 
> Mark
