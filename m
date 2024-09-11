Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E54977E4D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0FCDEAB;
	Fri, 13 Sep 2024 13:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0FCDEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226069;
	bh=BZq6+q8bbZt0R5ucjpyVPmu6SzP5lx4HOz9jWC47YHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P1pfS+rtNECbm4T7Z8KuOKLLo2YGDNUU6ooQv7y96pOxqBdu0dXiYTkH8WbBBrN5B
	 Qs24Pv3gWMjOxcGbe7Oe77TFoPTNKwKxecunAG9AMXVC5cOeRaWOmFovlEhk9l58rg
	 D4XYyoa//jMN23zva3WgVhkqNQOz6EjBZvkuBFRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57827F805BF; Fri, 13 Sep 2024 13:12:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D97F806D6;
	Fri, 13 Sep 2024 13:12:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41349F801F5; Wed, 11 Sep 2024 10:07:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C156F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 10:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C156F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KIq3uXIL
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cd46f3ac9so1594935e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Sep 2024 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726042036; x=1726646836;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlrFnjoiCduc+X7w1TixBUXFhOeoooXPO+ytTh1hP4g=;
        b=KIq3uXIL8aPTZ2WbX+lUSrGNV24qwE+vQ9prGc2PRETbllnOTc+c8IP9kZzb/hGikj
         EO/+p79LsxyOA0p+nxhc2LVh7kwQaUIWiQ/qJFlm9RPrF2kcQgA6quj4EHKCDuE49a15
         cdLLWuklxaP/WPYJeyH1Hp8OdDobepF1AaINtBek9qY+rIWlTIVhl8prap0VuwdvKn4M
         LNoF+m/ZrmmBwMQe+gWVu5v6LSnFdXyl2gJIeIX1QkpVbPg3/6bDMMBqfeJSyWQlY3u6
         hk9EU9AaItab1Yr34zW6cpj5vK7pqFaSE0gToVyQDOk2Zw5wGbmnCc+RKpbV9sJPRmZp
         zg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726042036; x=1726646836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlrFnjoiCduc+X7w1TixBUXFhOeoooXPO+ytTh1hP4g=;
        b=hRndH1r7u7fgm6iDr6kWre5xTE/k+fmK+hnu4cFxCcWxAAdxgKSq7sm9RspfgVZfuM
         fWs/aUf4fHzHXsx2K8Onz0CJ2I5msNOjc3GXZZvCtGuJA8cn3/N8otOk5CylQPTcH264
         m4z37dwj+FZFGqGroBcqujkax1ECa+JJwl4Gfz5aUiVa+z8GTu+HNcZ4QIbyt/mauha9
         sS/6ZfKAE+chVbEtpwEHRbacrf+j8IC+QZyTCd3VaugvPAzbcdWF6ai72YiP32Qnbjky
         g2rGSbS64Riefkvz51U7+MP4G/dK8+md1n4/rnzWDQcYPH9ZcMfZJtzZC5E+zZfTJ7bx
         ntlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpvv31OqSYygJ0r6h7MRAX4dibyEsRE5yNZsfRGlbblgo0nrB770o1TY5g9aVy2LPiTD9Yw6sQDDoH@alsa-project.org
X-Gm-Message-State: AOJu0Yw3ggFlTUICkcHMOXnV1qHFwwph+OxhyFVmBkjXeI51PHg0eBr/
	pV0qmRIoIaXth86CMTLiqVEkywkjtmR2KzzJ6gc1eb4MQR7vTnME
X-Google-Smtp-Source: 
 AGHT+IFtsWzA1krV4TnK5wYQrFD2heYZw9fKGrydZsvH/HYHpnoRdSvc7bg3h9Az1MjCWnJBSC2HzQ==
X-Received: by 2002:a05:600c:4713:b0:426:5fe1:ec7a with SMTP id
 5b1f17b1804b1-42c9f9d38a7mr122692515e9.31.1726042035638;
        Wed, 11 Sep 2024 01:07:15 -0700 (PDT)
Received: from void.void ([141.226.10.46])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb1f0140dsm120034425e9.39.2024.09.11.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:07:15 -0700 (PDT)
Date: Wed, 11 Sep 2024 11:07:12 +0300
From: Andrew Kreimer <algonell@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: Fix typos
Message-ID: <ZuFPsKkobcws-iZ4@void.void>
References: <20240910211302.8909-1-algonell@gmail.com>
 <a8e6f267-9eae-48db-8a8a-b9e6d93809c8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e6f267-9eae-48db-8a8a-b9e6d93809c8@sirena.org.uk>
X-MailFrom: algonell@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WHF5RDXDSCZ5K2KHHYK4LQBC3AVYTPKX
X-Message-ID-Hash: WHF5RDXDSCZ5K2KHHYK4LQBC3AVYTPKX
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHF5RDXDSCZ5K2KHHYK4LQBC3AVYTPKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 10, 2024 at 11:03:52PM +0100, Mark Brown wrote:
> On Wed, Sep 11, 2024 at 12:12:41AM +0300, Andrew Kreimer wrote:
> 
> > -		/* See bellow for details how fix this. */
> > +		/* See below for details on how to fix this. */
> >  		return -EINVAL;
> 
> This is audio, bellowing seems entirely appropriate!

My bad!
