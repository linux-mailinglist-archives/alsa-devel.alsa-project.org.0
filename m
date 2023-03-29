Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4394A6CEF01
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9AF5A4A;
	Wed, 29 Mar 2023 18:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9AF5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106548;
	bh=3vGYd55/P+PEX97Vg/b08oGHjOV038ZWmSkl0lFHJ5Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=klSNqkDp/Y7wFN/ec5EQhGf1RM50wEulKYYV9ZCGn896Fv+oFsU8qhFDoeVSe+rnn
	 PfygBs8pIK4pr8VzYhSX5PNd/kGQDCldDj86O3BMtpkC/AjBAApwpwXiZAemM5gqpj
	 kRKPNZV9sLN9j5+iBjIcZw1GpYhM7wis9yZvGoFY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D62AF80568;
	Wed, 29 Mar 2023 18:13:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7683EF80272; Wed, 29 Mar 2023 16:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C791CF80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 16:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C791CF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Vd7ndb2Z
Received: by mail-pj1-x1034.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso18808347pjb.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Mar 2023 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680100686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MraKaJyT3BxLWbc/N8gjzZ9ahqVsNJ0TWzuq+OChN70=;
        b=Vd7ndb2ZBTIVZPajT7DIVOKDlUwy3KQZaqVIqSZGlHtMS//uATg2SK5sMuGL1LslZb
         zwB8VYdD4ZIN0A2dSqN7nbBcGwxKbtMytevBSU2LQ6iYSH3G4z42T1eCLNvOCcziVZSw
         K5XP/yg+clTm2hH3qb2tiwlKD63EjCsYgNrijs2s/Jca8ukp1EuZQF3IBPeFqJQrSCSO
         a/w/6sla+BgMTBnNbdkJS/Mi62uqsbj5FO5oMYrVYpLEOBsmjnxZwuHpPS2aMWu1Eut9
         TlFYubwSzWoXo7pEcvoYfQOueVKt6XE5PCpzHKDfMdCW79CsGDkFEua2ZUlkD39LrlPt
         4x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680100686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MraKaJyT3BxLWbc/N8gjzZ9ahqVsNJ0TWzuq+OChN70=;
        b=t2naiO2CrE+TQ0C7uDg+jFGhZFZUQHCIBZFMJvN2iv8GPc88I82kJzKsKPmsmlDPz1
         xGPq3xmsPG1mAuUNncxlzKHIsnKNAsgBmf7BEh6rGe1Fn44zf6bwSXCytcOe9CiVAB77
         UHZ4YAYqah1i+gjLueXbEeZDQ4JDVcFiJUp7j0yF+wIpmM8raDEn6tdVO86CzZkOF5Tx
         hXsAIITrQsU2ybv5gvBSEO8LIVDJ/7gHPz48ZZl35ade86IFljFaGYBHaDD9jvL1uo8O
         vP8aviunTZ8NIKUldNykvEVzXF50md19EmcQ+EtyvBlx8d9a7PXpia2n1KuXkVnlHMPI
         3AjA==
X-Gm-Message-State: AO0yUKWH6TEOCJyt5ipHkGQYzPZ27e/UfaVMTgsyBBVoj+F0nGSkRwc2
	OJeNmpOqNR8EsbWR/ihcCDs=
X-Google-Smtp-Source: 
 AK7set/GjyQPCIf6KPRezVqHBp6kJIQQzh01GsQSpzJTlJuXy3kQls3oCILpoBTcCMTPnEhr8vkXbA==
X-Received: by 2002:a05:6a20:7921:b0:d4:b24b:4459 with SMTP id
 b33-20020a056a20792100b000d4b24b4459mr16274401pzg.13.1680100685823;
        Wed, 29 Mar 2023 07:38:05 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id
 a3-20020aa780c3000000b00628e9871c24sm14512864pfn.183.2023.03.29.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 07:38:05 -0700 (PDT)
Date: Wed, 29 Mar 2023 22:37:58 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
Message-ID: <ZCRNRhI3+6jUbqvy@Gentoo>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
 <20230329140524.GU68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329140524.GU68926@ediswmail.ad.cirrus.com>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BNV62Z747ONIXEESLKPUGXQDD6SDMVYI
X-Message-ID-Hash: BNV62Z747ONIXEESLKPUGXQDD6SDMVYI
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:49 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNV62Z747ONIXEESLKPUGXQDD6SDMVYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 29, 2023 at 02:05:24PM +0000, Charles Keepax wrote:
> 
> This direction seems slightly problematic, especially in the
> context of amps (which I presume this relates to, please let know
> if that is wrong). It would probably be better to be fixing
> things up such that the amp in question sets system_name when
> registered through DT. Generally speaking the idea is the amp
I also consider setting system_name when registered by DT, but I don't
known setting what name to it. Card name or something else?
> tuning is going to be specific to the enclosure/speaker involved,
> so a generic tuning for say left amps doesn't really make a lot
> of sense.
I don't known about amp tuning much, my need just is loading firmware for
more than 1 speaker amp at the platform using fdt.

One of the both way is good to me.
> 
> Thanks,
> Charles
