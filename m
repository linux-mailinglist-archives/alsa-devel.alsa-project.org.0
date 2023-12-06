Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8B806505
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 03:35:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2877B820;
	Wed,  6 Dec 2023 03:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2877B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701830128;
	bh=wASPL97AkQXnUtfj1MB3l2GjekCOAQTLlFrQcJippcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8lLbE4qXv/Z4QHHeW/+ALtbAhPpKN9tHrQZLNGOvEDPUCvEWnXNRtC8V+OpHkc0f
	 UqvtKvwB6mPIsRdJDx3bAhaUCo5hyBBLrZCdaq+oY+kdfBDXwxvjYf/Gtu1LiAuDjH
	 6sv+BAcD+2wjLaiImV+mmdxUPUIkpKEkJzL7nBBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A1CF80568; Wed,  6 Dec 2023 03:34:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEDC4F80570;
	Wed,  6 Dec 2023 03:34:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA76FF8024E; Wed,  6 Dec 2023 03:33:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFD6BF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 03:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD6BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GKtLzoE8
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-58ce8513da1so4270715eaf.2
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 18:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701830007; x=1702434807;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gtni9tTiI3wh+6gitPHbCCQdIiWXUwPAOQD6+rWEq2c=;
        b=GKtLzoE8s/U6pRc5yglMtPWsxCH6r+D/MQrfTDL5LQ8cJNJihawul2lcYMGyh+x6C9
         OZqTERkmVvcERrsVEODeKXZKwOAqVb2QQvjeJzu9ksRpvy7ctKkr9jG2TGssb4VlbA2I
         F1MTYnK+e5MUuCtdMpl0wpcrk02R8IZKjh7XdbcaiPUldsmhCmraODq0yuxnvm0PaVG4
         H4fublyCBZ2zReAb2rRUOEp9/e5jCmYm24PTe/6wkop1lzXqbkbLWCrKy4M3/tJIQUiR
         oo/s3Kpv9iyxa24QnfQVWjruEWxqTTn5j+uzbONNG1biiYEZv+dOPLGBC/FIQ3rlLQxS
         QARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701830007; x=1702434807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtni9tTiI3wh+6gitPHbCCQdIiWXUwPAOQD6+rWEq2c=;
        b=ZCY5YsjVBoLRXEUTnsCcU04Sl27VcdLik2CBtaHQ/4lHC8AguEUPAD7DLI00/vUgap
         Gzx1cvmUPqYL1A8uJ9bw/isGlL5ze/54iIDucvTKATFgifzJ1v62zV8H6UDyOjCPx0XF
         GdB6D3iWd5m2Wxs1Dhmp+lTHCnMLrPAyYb7sCngJ/QtnGreWzCn3sc3i6LJzKWg3Bhe8
         +BdoF0uVuoemUtIytzWKlICvfGxI/Qy0JD93RHkAGeSb8uIbeqcgqWdi9r2PEC/Bv0Zy
         x6CABXrmnzcoymVSb4od996AnM5ptxeEPnjmBgnNyy3vbdTQa6ufFnfpQr/4v2Gkgc0X
         sH+A==
X-Gm-Message-State: AOJu0YzCVbRgDkKvhZdpzpTpZDnnEVVQz4onHB3LU3J/LzG7VE/bVZQj
	RrokahDaWbXd4XltZDW6ark=
X-Google-Smtp-Source: 
 AGHT+IFsQ5WEwWNBWKeWKzqQGzQZzcYWPCBpYTt+LIs9XRZfRYw/uQlzhJZMW5a0KOhe8J7ExX/NHQ==
X-Received: by 2002:a05:6358:918c:b0:16d:bc40:3273 with SMTP id
 j12-20020a056358918c00b0016dbc403273mr415250rwa.22.1701830007544;
        Tue, 05 Dec 2023 18:33:27 -0800 (PST)
Received: from geday ([2804:7f2:8006:29e6:900a:3114:a8a3:6281])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aea0500b00286d686b3d9sm1381306pjy.17.2023.12.05.18.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 18:33:27 -0800 (PST)
Date: Tue, 5 Dec 2023 23:33:33 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Tim Bosse <flinn@timbos.se>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: add new framework to quirk chain
Message-ID: <ZW/dfeBFt+9wipXH@geday>
References: <20231205234200.383832-1-flinn@timbos.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205234200.383832-1-flinn@timbos.se>
Message-ID-Hash: 2DAORYDKSDW73UK6AGAYE4Z2SHZJ7UQ2
X-Message-ID-Hash: 2DAORYDKSDW73UK6AGAYE4Z2SHZJ7UQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DAORYDKSDW73UK6AGAYE4Z2SHZJ7UQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 05, 2023 at 06:42:00PM -0500, Tim Bosse wrote:
> The Framework Laptop 13 (AMD Ryzen 7040Series) has an ALC 295 with
> a disconnected or faulty headset mic presence detect and works with the
> same quirk chain as 309d7363ca3d9fcdb92ff2d958be14d7e8707f68. This model
> has a VID:PID of f111:0006.
> 
> Signed-off-by: Tim Bosse <flinn@timbos.se>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f9ddacfd920e..59f2578839ed 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10271,6 +10271,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
>  	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
>  	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
>  
>  #if 0
>  	/* Below is a quirk table taken from the old code.
> -- 
> 2.43.0

Hi Tim, you forgot to add at least Takashi to the Cc: and your patch
will most likely be missed, so putting him in the loop.

Also, not much to say here since it's a simple desirable fix but would
you mind sending v2 with a rewording of the commit info? The way you put
it sounds like a new framework is being added to the realtek quirk
chain, which is not the case, you're adding a new Framework-brand laptop
to the quirks.

Thank you,
Geraldo Nascimento
