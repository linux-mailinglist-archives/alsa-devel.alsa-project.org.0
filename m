Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C475161C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 04:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 870D784A;
	Thu, 13 Jul 2023 04:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 870D784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689214560;
	bh=BsmVqm3RvidZn4x6VEjOOlzrmAgWYZNGfRfIG0h8w8c=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tu4yM+AizFZuh4XiidcCwP9XxuoXsYm6sZARPtHV4gBwCjQt/7kiyW/sGF2vsJXlh
	 71BVtbbu+jcZ6VGMyQqQD+GjyLiZExxMO3Eqrx3U9Pi7nwTMx9u8GtA7ZrqNKMNaTt
	 y4GO8UEB9/8OwMStwoiGli4k2sYC6D5mB8Q7VALQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A1DFF80290; Thu, 13 Jul 2023 04:14:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C25F80236;
	Thu, 13 Jul 2023 04:14:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C6ADF80249; Thu, 13 Jul 2023 04:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 087D2F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 04:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087D2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mFJ/y+t4
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-c2cf4e61bc6so128773276.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 19:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689214474; x=1691806474;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJVrTQrTufVcCwlT4CPHU5xGi4jMsTBeIJe4cFgNtjg=;
        b=mFJ/y+t45pgpe+g2QmDFOWjELORZbFWZ6TmLx9GYXUXSvlZur42D92/gVjdbADWFM5
         91qmEEJQrAsCPRuKUjwXFzMmfSX3DY6BI+NawYGjw0jGxrs9C9pMdc8xdojjTsc00jl0
         Sy96SGENcPTg+wVHOG9OkdTAagiJ9I3zxNiSEApGsPhW/GhWNBgf8yaiNM8g1WaKqQ8Z
         DpHbySAhYuxCEv+gKnYfZ+jyadklGoCRaaxlfQ8oEnk8FhGXY58HVK8G42bf0wpTMRp/
         oTooTijLOm7oHTmDavrnjoUxSyXPP+qODTPdqfQjZ+670nKt/kXfX7hAqgb4xDHLO0Es
         EndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689214474; x=1691806474;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJVrTQrTufVcCwlT4CPHU5xGi4jMsTBeIJe4cFgNtjg=;
        b=bPSFFnZAjMPrHNMD7Z4m2qqWCXpcYBDOxs9fS6iv4ptJrQ4ovLFPlSSdCAesg7+9rw
         bfqdYqOvfbOk6uCdFyzaRB0/IgviF1nrhaY5MCPqioH6Ac1OIgFD8/0saPqxA1TgY+BR
         gGulBxpAyZB8sZ7Snfpojwt384LrNOeD7fbDJRk4P/mqdJkIVpwVvxZKcseC2WtnaaAi
         CP3bcm2V3+1dEEP/+6Lu6yA5YtfFaVviGeWtmLGZhaU8Aqcru+yIll/OYK/Y85ZQJa2x
         SYZ2wHYrTmSnNYJDbm+iRLKoqUVCEAEDJQhi9166Ku0UaDmXtsRXsJmRUksg81z1EkHk
         rJ2A==
X-Gm-Message-State: ABy/qLblDU/6hMc0fv2oD3yN4mR5kTfbLM2vifn1WvJql1s1JyWUnW3W
	tzKZSd5xn+E7y5H8qaPO5MNuopycCK5KDMFYUeQ=
X-Google-Smtp-Source: 
 APBJJlGpAC+AY1KsHciHzsmgtyPLBYxI3p065H/Tl+YJBPrhcPe6dKC15jYxjv3AfWALrEKpP1V1Mqwg9kpt8F0fvTA=
X-Received: by 2002:a0d:f2c4:0:b0:56c:e706:2e04 with SMTP id
 b187-20020a0df2c4000000b0056ce7062e04mr504483ywf.0.1689214474421; Wed, 12 Jul
 2023 19:14:34 -0700 (PDT)
MIME-Version: 1.0
From: Zhu Ning <zhuning0077@gmail.com>
Date: Thu, 13 Jul 2023 10:14:23 +0800
Message-ID: 
 <CANPLYpCfU-8nLCFNRQ7UfaLrzCNC1Qnx+sqtNN9rf3+s+d4C9A@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: es8326: Fix power-up sequence
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	yangxiaohua <yangxiaohua@everest-semi.com>, Ning Zhu <zhuning0077@gmail.com>,
	Zhu Ning <zhuning@everest-semi.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 73U3HVF6RUKH3BKYYBPAFAACSVUMKOB2
X-Message-ID-Hash: 73U3HVF6RUKH3BKYYBPAFAACSVUMKOB2
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/73U3HVF6RUKH3BKYYBPAFAACSVUMKOB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > Old power-up sequence causes large pop noise during start-up.
> > Using a new sequence instead.
>
> >  static const struct regmap_range es8326_volatile_ranges[] = {
> > -     regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
> > +     regmap_reg_range(ES8326_HPDET_TYPE, ES8326_HPDET_TYPE),
> >  };
>
> As well as not seeming to correspond to the patch description this seems
> obviously buggy - even if _HPDET_TYPE was missed from the list of
> volatile registers no software change should be able to make a volatile
> register non-volatile, that's a property of the hardware.  The changes
> to read from HPDET_TYPE also seem unrelated to the main change here in
> the resume function, this should probably be multiple commits.

Just a naming space change, will create a new patch for it.

> >  static int es8326_resume(struct snd_soc_component *component)
> >  {
> >       struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> > -     unsigned int reg;
> >
> >       regcache_cache_only(es8326->regmap, false);
> >       regcache_sync(es8326->regmap);
> >
> > +     /* reset register value to default */
> > +     regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> > +     usleep_range(1000, 3000);
> > +     regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
>
> This looks wrong, you're resyncing the cache and then start resetting
> registers?  It feels like the ordering is off here, and some of this
> reset sequence might want to be done with the cache bypassed.  Are you
> sure that there's no corruption of user visible state resulting from the
> power up sequence, especially around the HP driver?

Basically the chip runs through the start-up sequence every time in
the resume function.
Will move the reset sequence to es8326_suspend
