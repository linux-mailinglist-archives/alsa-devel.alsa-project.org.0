Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F286FE322
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583F71019;
	Wed, 10 May 2023 19:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583F71019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683738969;
	bh=WX7CvAgUee8GJ6439P5J9cCPterz0KwWN8rWPpjsDzc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=axX8MCN+yjWjYiqzhiADINCKIzq8vS4p5W8FXejpZHM3Rs9hHdfi9xKGOj0re01TR
	 NbYKGOxRR5WHemHIrvT6KOsk59X2uiDUYrk5RO12mjtnr6wWrTxbQjkP5hhaNbpUD/
	 OAxMyBHq5qWjqTODVRl3aA5sXKJHFaD/ksbfN0qY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ABC1F8032D;
	Wed, 10 May 2023 19:15:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 185EEF802E8; Wed, 10 May 2023 19:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2612F80087;
	Wed, 10 May 2023 19:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2612F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JCRz0TEs
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so45669287fac.1;
        Wed, 10 May 2023 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683738907; x=1686330907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3UaVZNQv94KIcNpMAWzAiIhbCTKJFaWKYWiYuzmyHXs=;
        b=JCRz0TEsG1pulXlh6gtzPdo3zasldh3zMsR7Do/dh21yeStol8Poo8mEHFUu2RmD2g
         KvZSsozt0SAhCgEGfSzVenbUjMkguyUL0TZ/XwWXXeHkd6p4PfNrnVHrjlC9DZUwwfFV
         kBxTV9NVB0HKiPHwrWX9aYJ5Rk+M6ZrIzN9yULxxIOEcaxL2Rq4ZeQwesiK99COdwy6w
         6ICQQmV2klV8rZcbqQCMfb84hhvLJukmZ+19LSXrGFMhFDRPlsstREY68IKa38g3qbAK
         d4GXm8WiUfq8aNJk21g61JYawToP2MnLlvtmE4meg+k+H+EfNzJs60phKouRhbFBNz22
         oRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683738907; x=1686330907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UaVZNQv94KIcNpMAWzAiIhbCTKJFaWKYWiYuzmyHXs=;
        b=Dc1Vss9d+PnVL48Zxqn1AUCeLJeb8elloRcxhGGmvzWvjOYsyRtuZGPOI1r9pY+7Ys
         eGZKQfrWr2MrS168Z04TUw7JuskIi+v0ZaEXRkLqfRS7ky+zSwkldVMCWZLjP1zBdpSc
         WkfZJBJJIv+23zx5pqaRZcvrrLx+6sdmoxB9JsaTY3NERNQu9bbfPH/Gvrof6yZFLfpZ
         63f5DcxmIJkfpuDLjAyVzQ2XE3mp1CiH+qKqzZ1g7nZWwvTzLWS9DOzfRSABRfP4AgVi
         VvZZFGLdDvNczKd+uerlLMJ+3phMGw1yS7nndCgIpEMYUkmqf+hdZhLNp+K/PbUTKGlK
         ZmgA==
X-Gm-Message-State: AC+VfDwoMRRiQTmaIV7RaxZutfWdVeTbe+o6iZUPzjXRJjdbpwDtgMUn
	PIKYsaVCHRKxfcnmZkz9yw0=
X-Google-Smtp-Source: 
 ACHHUZ6hh714rF0RtRdqd6V/nxymrzoesKzlUTLdruqm8OW68y4hWyHUBa1v+++r8tfxkv4SHIawtg==
X-Received: by 2002:a9d:63d6:0:b0:6aa:f1ac:a715 with SMTP id
 e22-20020a9d63d6000000b006aaf1aca715mr3406806otl.4.1683738907217;
        Wed, 10 May 2023 10:15:07 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 l3-20020a0568301d6300b006a643a2eeb5sm6425155oti.15.2023.05.10.10.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 10:15:06 -0700 (PDT)
Date: Wed, 10 May 2023 14:15:17 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFvRJRjKCsoGkpU7@geday>
References: <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
 <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
 <ZFsWgnAQy5Y/rwyb@geday>
 <185f52e2-afa5-87fa-c6c3-594f61e5b911@perex.cz>
 <20230510-puff-trees-hanoi-69d385@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510-puff-trees-hanoi-69d385@meerkat>
Message-ID-Hash: LO4WEPUGLNNT747BJCPBCUMDWFCHE225
X-Message-ID-Hash: LO4WEPUGLNNT747BJCPBCUMDWFCHE225
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LO4WEPUGLNNT747BJCPBCUMDWFCHE225/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 11:13:15AM -0400, Konstantin Ryabitsev wrote:
> On Wed, May 10, 2023 at 08:17:30AM +0200, Jaroslav Kysela wrote:
> > > The middle way could be to patch mailman 3 to "munge_from" while adding
> > > the correct "From:" as the first thing in the body of the message if it
> > > doesn't contain one already. This will make git-am pickup the correct
> > > author's details and it should be some simple logic.
> > 
> > Unfortunately, changing the message body will break the DKIM message
> > integrity (body hash)...
> 
> If you change the From: header, the DKIM signature doesn't matter any more, so
> this will work just fine.

Hi Konstantin,

I'm reading RFC 6377 from September 2001, "DKIM and Mailing Lists", and
the approach you say would work just fine I think is covered on section
5.7.,  "Signature Removal Issues".

Regards,
Geraldo Nascimento

> 
> -K
