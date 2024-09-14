Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120EF978C66
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2024 03:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25C8DF9;
	Sat, 14 Sep 2024 03:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25C8DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726276670;
	bh=Wfge6eyOyWowGGwlBzoydllj/FaN2+7DG8PF61qxw70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KnaiiHHn8r65rf/hlicdA/NJwLuZmhhpbdrjmeUhpJUBRD5pM0Reb/hLgsQQds2r6
	 zmb7SlzzNg7npxaRVwk/1xdNJ/WKr8mt38CjYWKQJ6kbyb+KKhoigljjBW0+sxVnHr
	 q+PJOUXe+opOvYIHmynDfMhW8WwOQ0cmv4hVXzaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B751F805B3; Sat, 14 Sep 2024 03:17:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D74AF805B1;
	Sat, 14 Sep 2024 03:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC32F801F5; Sat, 14 Sep 2024 03:17:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6D3F800E9
	for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2024 03:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6D3F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mBNvu4j0
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2d89dbb60bdso2021586a91.1
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Sep 2024 18:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726276630; x=1726881430;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTN/Iyx1fmNv4bUuNCbr/8MD5bSrQHUUXAacttKOu3k=;
        b=mBNvu4j0JdurLYGazAeWFXu5NBdpNfcmnhvkr34n/6o6HNjHfwUzY5zBY8NbwR2qeR
         4sn8zPh19D/oW0jNGqLHiSk6OIhTyVq+6MN21UlFlU0ILVALP8Rev3mkORVr3es3Dfb8
         iUwsgHM0Arq3Kr7R24wmRoatYomt112/INGdNQDwcI0Kc/llPteMj8UcfONj0Y/VEUeY
         Dg1onguVnUsQwXLxUVhtfabvwXe7bM4dKNMoRqllbMpQ89kU3ZAAw0mEjhpugViE5oc5
         VcLQbkc7qxdYJ0VLwbWjTEOtlOWXFNZIEszQVg3cB2R9bBX+vaNra/uDxqBSt8eBEJFj
         PErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726276630; x=1726881430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTN/Iyx1fmNv4bUuNCbr/8MD5bSrQHUUXAacttKOu3k=;
        b=DqdyUsSjvA2IO0ZeS6IhZuFnZ5Xw2YayIEROdaZLKrcxHo1C41xwH70jXyy0xfc+0j
         DjD9UAHSTlTMplpmzROyPULwD7nfy0IFKr7JQRC2eX+vVSMZcJYNImr/MLiAlinh7g4s
         xS0We08eHxShyRB0RIZ/23Te/LedYRTng4uf2QhaYu3dpFuZaptJagmnYIV3iK/viZdV
         udbGUTNlCWakHDbFDg1YctdIuyPc78reAtaSmqKdpL4bJx/3VaCczQOGML772VEELMN7
         cZHyjX76lwf+kd5c7kmvkMU8PK5vBtRKy+yTjRf8IYnZDF6MiZbS1bgcfIW+pzbhLHYQ
         WpSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHpZyEsz5SMl8mj6nR4M6B5tDFdgzvZcR/8gfDiaAOgo0wx+3YZ0LacuabRkv3IbrSMPx4rwdDKyAl@alsa-project.org
X-Gm-Message-State: AOJu0YwHk5DbZ69oa89P8S177kdCHQH827JA7ZsutHSgWf6fNvQDOcjM
	ty/6ushZO0zXl8Efo6KovYfdgvVa86X41D/HSYoiiPcaVhMmCM3C
X-Google-Smtp-Source: 
 AGHT+IGMf7gnqJVZSKs42t/gcn1+j6/nD/tGqsbkcOn8iLdJLkWkWIxDqgRtg60Y5HjYECc6+vcQVA==
X-Received: by 2002:a17:90a:d346:b0:2d8:dd14:79ed with SMTP id
 98e67ed59e1d1-2dba0048e18mr8253613a91.31.1726276629951;
        Fri, 13 Sep 2024 18:17:09 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9f55:654b:622b:2859:2848])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dbb9ccb87dsm2460726a91.32.2024.09.13.18.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 18:17:09 -0700 (PDT)
Date: Fri, 13 Sep 2024 22:17:00 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Hugh Cole-Baker <sigmaris@gmail.com>,
	ALSA-devel <alsa-devel@alsa-project.org>,
	dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <ZuTkDMx4qalIFKdH@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
 <ZuSufaLavkdMdsSL@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuSufaLavkdMdsSL@geday>
Message-ID-Hash: IRPM4PJ4CBBLYVOLR6XCJCIFNETLCYEG
X-Message-ID-Hash: IRPM4PJ4CBBLYVOLR6XCJCIFNETLCYEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRPM4PJ4CBBLYVOLR6XCJCIFNETLCYEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 13, 2024 at 06:28:34PM -0300, Geraldo Nascimento wrote:
> On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> > I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> > value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> > the value is 4, i.e. insert_pcuv is already set.
> > 
> > According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> > so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> > but before this driver sets the hw_params, and this patch sets it back to the
> > correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> > no longer necessary (but is a harmless no-op).
> 
> Hi Hugh,
> 
> Thank you for your extensive testing. It seems then there's no action we
> need to take for mainline, as it's already fixed there.

Unless Neil wants to pick-up it up for Stable? Neil, although not a
regression, this is definitely a show-stopper for sound on RK3399
for older, still supported kernels. And thanks to Hugh detailed
report we now have confirmation that this happens on vanilla
RK3399 and is not a quirk of my Rock Pi N10 board or sink.

Thanks,
Geraldo Nascimento
