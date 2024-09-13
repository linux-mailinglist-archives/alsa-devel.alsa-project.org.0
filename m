Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E2978A98
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 23:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB920DEC;
	Fri, 13 Sep 2024 23:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB920DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726262953;
	bh=w8fE9Mhx7As26Vsb5ZGVNpEylkuJlzd+9HnImMdWlmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aI5k3cwwC096567CiqRZOAhFHCdjOQHz6XdQIGwMkS4fI/F/Fg2vJ6fluc+hdf4jj
	 dZm4+J0O7PrLDNViVau0OokFB+SIGn4sjWfAo7IvFpOzLLqBsYMLvFSfWoO6PRhnwC
	 Xd8NQQzM7A2XF7tBujQxbckSkJy1kQipxvfF1iq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F39E1F805A9; Fri, 13 Sep 2024 23:28:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F37EF80301;
	Fri, 13 Sep 2024 23:28:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70B6FF801F5; Fri, 13 Sep 2024 23:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99516F8010B
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 23:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99516F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QAWPIxPo
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2053f6b8201so24731225ad.2
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Sep 2024 14:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726262914; x=1726867714;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUXF5H5IXAzMNdp+0PMvadCYVO9boEDpM2jvPihbWCo=;
        b=QAWPIxPoW1S0lLLi5QGrK1/5kEaTNo5k3Lczxrv7jDO2zmo45C9yNibYhGa2+40cdo
         MxaxQukBDM+/QgiDUabcYBRbCMni3EXfu9eZpN0033GULjEC5SxCGvIUYFM8RQn+sLcz
         PZ60uOPqwEsGH4kAA20CA030wrP+bz1sjap0t+RbLN413TvPM1e/kCTll9IgvoX7+/yc
         ivMIasRWQWlPARquFq37ZiuktJtuL/pjCl4giPuzTJYn8SVs0qvdg+qfn4582YfjRJTn
         x94xQSj2aGPRh3vbDQKJdyR+S1MQBQst1EmUl7G26P1pd9sP1Tv91a1sWLqkAc3ME+J3
         Uj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726262914; x=1726867714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUXF5H5IXAzMNdp+0PMvadCYVO9boEDpM2jvPihbWCo=;
        b=f6hd8zkMEZ5RUmyaSWn3rpbcAC8By7Wa7JZjdYrb78S+IoOsPP2O530oFxfIixLtaU
         JisaB39piZJI65s2/PIwv+d8RUrCNIbX0M11zKu0awhs/qHnE+sEtrLPpwOM0KRQw1q3
         cuBQNvG35VexvsPazfPJzZcBnOWw0ICamolG9SYxq/v7rUlcTdltmEXRhMZ8Zm2Ine9+
         I/8MQqlxoU4CFqdEhkavMeviOoPYGc+bLPobjGFFN9SZxMPImL2bNtX9uo6QZ2nZCHqv
         h1SC30d883qbJOLDcYCehHuxyaV+BEY7cPQDKzItHVmHXVr4eDjPNeZDyqGwFAUJtzGJ
         Srgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsT0/TQd+tdjhh7idJzDqD4LBW6YDTu+6tD9G0XAqzYA5++DwHVEMYyL9gf3TthR7ny5SZdCGstsaF@alsa-project.org
X-Gm-Message-State: AOJu0YxIOeJT/L8pvHoW+OuWJ2bir4HkRIet7hrCSee+BVkxamZOzm/U
	lGeRQDrESrSfb+/RxqeXdud6OqeZlJgbd0ZNSTvzJghh16oHJL/H
X-Google-Smtp-Source: 
 AGHT+IErA4QcPhjRnWC+bHzkpYBAkSoV3mGELKKhRk+7WAcjf+ONdJ1RhUqC8LGm0+14W5f3lPmJOA==
X-Received: by 2002:a17:902:e54a:b0:205:7835:38dc with SMTP id
 d9443c01a7336-2076e44917bmr108642345ad.60.1726262913925;
        Fri, 13 Sep 2024 14:28:33 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9f55:654b:622b:2859:2848])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794731494sm680765ad.257.2024.09.13.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:28:33 -0700 (PDT)
Date: Fri, 13 Sep 2024 18:28:29 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	ALSA-devel <alsa-devel@alsa-project.org>,
	dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <ZuSufaLavkdMdsSL@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
Message-ID-Hash: VOX2KATAR5V5DUJLAYCFFHXBOUBZFUAW
X-Message-ID-Hash: VOX2KATAR5V5DUJLAYCFFHXBOUBZFUAW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOX2KATAR5V5DUJLAYCFFHXBOUBZFUAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> the value is 4, i.e. insert_pcuv is already set.
> 
> According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> but before this driver sets the hw_params, and this patch sets it back to the
> correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> no longer necessary (but is a harmless no-op).

Hi Hugh,

Thank you for your extensive testing. It seems then there's no action we
need to take for mainline, as it's already fixed there.

> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> 
> btw, this patch doesn't apply without edits as these filenames are incorrect.
> 

Yeah, I see. My bad.

Thank you,
Geraldo Nascimento
