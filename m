Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2516F9CC8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 01:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E6C11D7;
	Mon,  8 May 2023 01:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E6C11D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683502806;
	bh=VvZVXqArpVJrVUaxpbu2BrlizezsbzLm2U326SrqHiA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eAl8VYu5j98cOGIwP+mTDOqnrINGbPy4CS9Of8mQwsenjuMdgWKDXQdJAu5VCu9bv
	 Sn1JLwdGCPLtUBwsl+cK/PjMukLpndvGeuslXvRcY6uS7kAyovBFxguxURSYu6AKY0
	 T1wz6f6iQ4cxViPSBhQ1qU0pzvDzko341Jq5mpJw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B58F8053B;
	Mon,  8 May 2023 01:38:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 750E9F8053B; Mon,  8 May 2023 01:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 855FDF80087;
	Mon,  8 May 2023 01:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 855FDF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=P82qcFxY
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38dec65ab50so2213260b6e.2;
        Sun, 07 May 2023 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683502695; x=1686094695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EvccuMVjUtSF2NFW22KwWN5zywoaOwoiPVdivQWooI=;
        b=P82qcFxYkubGR68W/36zj1Zpmn8pKT9/VWpRD/WqWnnoPymCEeBLsHjVNEzfDeouvD
         +QMBS3IPlJU3VS4adjaKsw8owV+W++9dURo9KyB8lMTz7nChNGVEjSanFoZvsNidjQbf
         OIeQIemASandvGOyNr14nQEcjKYi4FBKGHyBdb/9tXBa5W4LWoZZwfof15N8KcxIyZ+E
         bVNMJ1aptx6pSk3EZl2pCR7usm1kO8og/XicpsTURD4DmcSfAz5X1IEqEVUwUypsEonb
         63Ro+djaWEZ0XvigHnjy0KAlSgGNoOxshJPHCre8NtXIesjr4DPFlDiD6Er3MRRWRlfZ
         LqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683502695; x=1686094695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EvccuMVjUtSF2NFW22KwWN5zywoaOwoiPVdivQWooI=;
        b=XVp0M1A48aPnE45RHPa+P24T9LHXobQ/gmzh3hY5BrxoWEUfryES42aNYHrOFj5KOu
         0r1yyPzddKR+fJkJ8W1gRH+ZHhNf0BQBcNVTeX876pRm5CopFi4IsG/1ul5Yc6ctFbJv
         DnOObyH0T2CtNS/gnpOt/7VMfUYAs94obPGd1+Kxc5jy5rgRXNkZq4S9TlL4qCk+dnSD
         UCDtF0v+6k2GzH4+RywPr+4CCokolyo6jsNGM1LN9B6HUguxKh9t0uW7TF0gpwQf8kQk
         ViiSPyPenI1PzUTQbolX2GbDXRl+RLJ1z9V3T0UCFcAumgYuI52feTA3ObBNct2CKWLE
         5U3A==
X-Gm-Message-State: AC+VfDzQVBgdeMKNjHRAH6TaEOvKPOe2bNrbUV4kqGGmLpO4Gbi/FLzz
	3GOQZjI/Cwx67oqPN7vGM1o=
X-Google-Smtp-Source: 
 ACHHUZ79U90jLDqUye/Jl2AqaXiVSRyxmjXPvz5cXM+xnxvekH8xxaM/8XoyIi1Mbcb8bibRbf7EoA==
X-Received: by 2002:a05:6808:8:b0:378:c02:bd51 with SMTP id
 u8-20020a056808000800b003780c02bd51mr4415386oic.33.1683502695337;
        Sun, 07 May 2023 16:38:15 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 d19-20020a0568301b7300b006a651cd2522sm3539267ote.59.2023.05.07.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 16:38:14 -0700 (PDT)
Date: Sun, 7 May 2023 20:38:17 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFg2aS++KP6AVRtM@geday>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <ZFVpRKM5vxpWWaI9@geday>
 <ZFWbksDaG2EQNqSK@finisterre.sirena.org.uk>
 <ZFW3KpLU+VJBYQLc@geday>
 <ZFg1Zwpg+6iK4bqk@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFg1Zwpg+6iK4bqk@finisterre.sirena.org.uk>
Message-ID-Hash: 6DCAOLJ4YG2AZDSMCBWBV54D4GS2IQ52
X-Message-ID-Hash: 6DCAOLJ4YG2AZDSMCBWBV54D4GS2IQ52
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: postmaster@alsa-project.org, sound-open-firmware-owner@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DCAOLJ4YG2AZDSMCBWBV54D4GS2IQ52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 08, 2023 at 08:33:59AM +0900, Mark Brown wrote:
> On Fri, May 05, 2023 at 11:17:19PM -0300, Geraldo Nascimento wrote:
> > On Sat, May 06, 2023 at 09:13:06AM +0900, Mark Brown wrote:
> 
> > > Not just the headers in the message, the author information for the mail
> > > also got rewritten.  Try applying the patches with git am...
> 
> > Mark, I think Jaroslav can change the behaviour in the the added Headers in the
> > body of the message (the added Headers in the body have e.g. the correct From:
> > email information).
> 
> > If the message body *starts* with the "From:", "Subject:" and "Date:" fields
> > I think git-am will pickup the correct information from the body instead of from
> > the mangled headers.
> 
> > Hopefully...
> 
> No, it absolutely doesn't work properly - I only noticed this was
> happening because b4/lore keep picking the copy from alsa-devel which is
> mangled to the point of not being usable.

Hi Mark, sorry to hear that. The fact mailman is disrupting your
workflow as ASoC maintainer is alarming, and I hope you and Jaroslav can
work out a solution. But besides my suggestion that the added headers in
the body of the message *start* with at least the correct "From:" field,
I can't be of much help.

Thanks for the hard work,
Geraldo Nascimento
