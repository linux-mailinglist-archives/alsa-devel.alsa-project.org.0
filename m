Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D646FE346
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB371041;
	Wed, 10 May 2023 19:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB371041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739820;
	bh=RzMKP6awXlcZOXUe6Nw9/jtMEDu/AFVPsX830ydtebI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AvH6vHIBflprHOaLAdLErlROqIUdgdw4JCvd54aJ4b7wMKMIaxK/ECvOlbmvH76GO
	 0kPN2RnTDhxNbvU7NegTdnCqbiWgibGIWwWVKpHmBbgb3EK0Z7WL8ZZwEwnXZiCdv8
	 LFs+CR6cpNupMadM3slVF54a5TuY0xMA/3wmozNw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 876F7F8058C;
	Wed, 10 May 2023 19:27:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF936F804B1; Wed, 10 May 2023 17:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78B66F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 17:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B66F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=PmhG5FLO
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so6641113a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683731598; x=1686323598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNbzChCwstk8Mo7hN+bmZkFnD7UZ14k52uMeu4gfKcw=;
        b=PmhG5FLOaE4yb+lqrf+gyZC7pQOhcvK3ZCXacr63fJ91STiPUpkhtcWdvqE4lizFuK
         7kF0/HAR+PbnOiicXUcIcZ3vTjRJlK79LGXEgl+CDvvNujjjBZTnvGQBUrQd4gdxcoMg
         zYlp+KpmG2+2Td7CV7UBDNY+psdu3JFO377BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731598; x=1686323598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNbzChCwstk8Mo7hN+bmZkFnD7UZ14k52uMeu4gfKcw=;
        b=HW0XI9jTk2udjTXkAj7OQ/A0QG2GCbQNesYjI8Rr0T0qbk3Kdmv9XU13WD3DGRz9VK
         KEE8n2nPsjVDnv9MZpm2qfUyt0jI95kBfX2pKRVxsCA2zf0G9KtD5uP780YyQT6Ziltd
         dnHdJ5rYxAUj678GIooWPftWEEJ1asFimfkJT6I0hJU71DiWCiPo1gY5CH7YFHEAT/fm
         uzthtPHeecAMYZud+cMhOBdAmoGo8K9QqhaoRVSHkENaHqHvL4UzhK84y5mR6KMae05p
         IxrLCClucWmmYJ/XFYzLIBpjxwkKBLanptLd9ntdq23yCfqq5rkV4fyi9qYeobX8WiDk
         hK5A==
X-Gm-Message-State: AC+VfDx3y4H9MAOuze9pVpno5NK+RhukjJt7mVT1MMSBPpX1LAnV13JP
	32D8CjJnz188KNKE3mf4MLCKgQ==
X-Google-Smtp-Source: 
 ACHHUZ4l6+/XXg8d74VQaZYWiSlRVFrNzZnMOB4ONwK3SlBZWpZbzdc7WX5u8cThNizCf2zMVk63UA==
X-Received: by 2002:a17:903:2804:b0:1a6:d2af:5a3f with SMTP id
 kp4-20020a170903280400b001a6d2af5a3fmr15627401plb.3.1683731597830;
        Wed, 10 May 2023 08:13:17 -0700 (PDT)
Received: from nitro.local ([2001:4958:15a0:30:e305:5a3c:4c5a:1bc7])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a170902a50800b001ac8e0ea157sm3902142plq.144.2023.05.10.08.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:13:17 -0700 (PDT)
Date: Wed, 10 May 2023 11:13:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <20230510-puff-trees-hanoi-69d385@meerkat>
References: <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
 <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
 <ZFsWgnAQy5Y/rwyb@geday>
 <185f52e2-afa5-87fa-c6c3-594f61e5b911@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <185f52e2-afa5-87fa-c6c3-594f61e5b911@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZYEUFQKY2XNT4QY7XXSEBAOPKYGVLSNI
X-Message-ID-Hash: ZYEUFQKY2XNT4QY7XXSEBAOPKYGVLSNI
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYEUFQKY2XNT4QY7XXSEBAOPKYGVLSNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 08:17:30AM +0200, Jaroslav Kysela wrote:
> > The middle way could be to patch mailman 3 to "munge_from" while adding
> > the correct "From:" as the first thing in the body of the message if it
> > doesn't contain one already. This will make git-am pickup the correct
> > author's details and it should be some simple logic.
> 
> Unfortunately, changing the message body will break the DKIM message
> integrity (body hash)...

If you change the From: header, the DKIM signature doesn't matter any more, so
this will work just fine.

-K
