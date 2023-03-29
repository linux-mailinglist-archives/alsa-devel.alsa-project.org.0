Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EC6CEEFE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96E5A4F;
	Wed, 29 Mar 2023 18:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96E5A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106519;
	bh=kERI2e1pveZ/+V/aqxLkGYMBEvBdM7ObsT9JVU3pllI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uATV85YJl+Pjbggfd0N4GH2vJNT9pLWUpNo/+/aAb9avyEnJC4MXuxWdLxc9fmvvn
	 rGKEytAV8cWTBt5jos7DTVOY9tbrdvnMszwQ4PnSgTXuDAl5XkvpAFih6RQ7oXypX3
	 KThsjzgnkmJXGb9XLUK75LxdPMcSoRicNdadMmWI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5C4F8055B;
	Wed, 29 Mar 2023 18:13:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D32F80272; Wed, 29 Mar 2023 17:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA6D4F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA6D4F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b3Vl4oK8
Received: by mail-pl1-x636.google.com with SMTP id c18so15323995ple.11
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Mar 2023 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680104965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vL/Z2hUHOoRNlZ8vK1peaG8u3Hz3sYl8UlPc5uVwYo=;
        b=b3Vl4oK8IImeQKY80tYxKC8IbJrOpjTAU8OSMK8zTlThaX1Tmx2ZT6ZdO/wWRHrZZV
         0GgbMPHw9ztqIrW5OimlCMppP/IB2rlEJP9ZNNUC392AfLAuGp7rbzpimRVsr0qPxMHd
         7R9SnUt0zQiR1sX9EbIurdPC7d7xcHj/P7F8XW8G0n8IpO+qDzzN10eMqaaxEbIdQbRG
         vNKowQmJZ+w5mbMMxib8k57gfmR9hn2+Y0xIXlMeTY/QHfflUt2q8MbHPzoXTd3fweNQ
         +dXS89GUFJnTiM0ubBM83msg/CyYiNy3nyw/Q8fSJJwEX3yB5HgeKKb8SaqW3LSYPr+5
         Yn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vL/Z2hUHOoRNlZ8vK1peaG8u3Hz3sYl8UlPc5uVwYo=;
        b=GkQ0Z8odQejKklv6JADoRNJX7EqvF6K1tJpR2f5SVRXb9Yqij4U9DIanWjAziREFwY
         A/v2abuIwa9Ue9W0EH4KdyfIaGm0KLb5CSJ9xAR07hbFwOfNWD8vfqKIe1WY6IzoMXeI
         4PTN5mau72WiqBHJsH08ljnNPkg2cTngWw7IugTB0SNRcRMpH6N1JDop8p2Bf4N7mQYK
         zCRp8vADBRbDrGBE+gQ7ss3yHwaAjHf5JC3hgg9Pdbmuvxo9pCr0/VPB8KefSE3Uzdhq
         k2x/HmrMxSFKsRIT1pWhLVCHbSl8pAvve1UHCteO+xV74ajy/Bns5lPp9gedVIiQ67U1
         Yhsw==
X-Gm-Message-State: AO0yUKXyKetyviV76GcYrZxWToa+9fTkOaOwj29hKQndgQwRf8gT625Z
	ty+5EP5tUbkkukbcxWzvLXs=
X-Google-Smtp-Source: 
 AK7set++hCqmKovdelYiJ5+jJFzodnQekyeY7x/9RhGU2tIB+qRGmT1PcNtVFnyvuqMh+sEPgj3cAw==
X-Received: by 2002:a05:6a20:1e4d:b0:da:f525:e629 with SMTP id
 cy13-20020a056a201e4d00b000daf525e629mr17412798pzb.53.1680104964912;
        Wed, 29 Mar 2023 08:49:24 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b0062a474cd46asm12813979pfh.137.2023.03.29.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:49:24 -0700 (PDT)
Date: Wed, 29 Mar 2023 23:49:17 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
Message-ID: <ZCRd/Uph/BY6tkc/@Gentoo>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
 <20230329140524.GU68926@ediswmail.ad.cirrus.com>
 <ZCRNRhI3+6jUbqvy@Gentoo>
 <51cdc8df-9472-a604-3cca-ebaa7ae5d899@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51cdc8df-9472-a604-3cca-ebaa7ae5d899@opensource.cirrus.com>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q2CHVQBGVBL7SZPHH4RW2MCIEPMNHNJO
X-Message-ID-Hash: Q2CHVQBGVBL7SZPHH4RW2MCIEPMNHNJO
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:32 +0000
CC: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2CHVQBGVBL7SZPHH4RW2MCIEPMNHNJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 29, 2023 at 04:38:07PM +0100, Richard Fitzgerald wrote:
> On 29/3/23 15:37, Jianhua Lu wrote:
> > On Wed, Mar 29, 2023 at 02:05:24PM +0000, Charles Keepax wrote:
> >>
> >> This direction seems slightly problematic, especially in the
> >> context of amps (which I presume this relates to, please let know
> >> if that is wrong). It would probably be better to be fixing
> >> things up such that the amp in question sets system_name when
> >> registered through DT. Generally speaking the idea is the amp
> > I also consider setting system_name when registered by DT, but I don't
> > known setting what name to it. Card name or something else?
> 
> It just has to be a unique string.
> The normal process is that Cirrus would release the firmware with the
> correct name for the platform, so the system-name matches the string in
> those release firmware files.
> 
> Do you have an official firmware for your platform?
My device is Xiaomi Pad 5 Pro, vendor releases wmfw firmware with
default name, coeff firmware with prefix name(TL, TR and BL, BR....),
don't contain a unique string in firmware name.
> 
> >>
> >> Thanks,
> >> Charles
