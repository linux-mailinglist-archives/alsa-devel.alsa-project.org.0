Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FC794388
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 21:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33DF84C;
	Wed,  6 Sep 2023 21:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33DF84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694027073;
	bh=DL/vVGQJmUYLFObfYPWtDEk1+JS7JlOmp6oQnVr2cPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=exQOymSYsmLxJ0KWDnnNTL9JIIeEZCCLiS9K73xz55WsHEerxTibdKxofa+suYtLh
	 gRWakIG8RPA1SVLW9kf8IWkVhX4HnToUweVe7KGFJtWicKDqqQ5jGbYcnNuNunR5Hb
	 yW1IJVdUgMYELoKWr2BuEtQi008DkV0XaxlxkqPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD1F6F80551; Wed,  6 Sep 2023 21:03:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C187F8047D;
	Wed,  6 Sep 2023 21:03:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDAB2F80494; Wed,  6 Sep 2023 21:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A5CF800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 21:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A5CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=E5fRrM/K
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1c5451a1fbaso121760fac.1
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Sep 2023 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694026991; x=1694631791;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3q/T6tNlmeW82eZnvMrVcLhUOOtgnqhDwVveJXqFWk=;
        b=E5fRrM/KXHsOKiRlzYh/SpneFaT+pnCyUoctTbTNTh9K8i86YTMU5opXZ3myXA3Bq1
         WtqFbeCRnAB310dsdtjlNoj+E7ASNveXvIr9mA2WHS0Qdrhcdx0iC1DcDCjoU4ogNEGD
         T2R8ss8ni0PEJ1JjF6FnWDlyheRi7EcQOJrS/qt4jy+RsYy0AGXbtem7pAKpQgU6RV51
         EiV96UodPW1MSA5IEzwN03Tg/gBgfawJCAMcqfcrC6DiXC2fCJDpM38I7gOAug1j4gjm
         Wv12we2bLqNDyoRLWZta+CvHjibhvzGWDezqYnNduc/3dGM4Kzp0rLmCnzTgLKDmC7iR
         CbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694026991; x=1694631791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3q/T6tNlmeW82eZnvMrVcLhUOOtgnqhDwVveJXqFWk=;
        b=AiR2xMNBP1Xma30VeEc4E93jLQMB7R5UvlnOOZk4/ZQSCqEBRkvr8SsipLRTDr8/Ai
         b8GTtNrkmcSlT+wy6eUZm/DVNuPPkKkn9O8Ntoo/e9lsLDbmh8eT93jvZO0mwltSTq4t
         DibRg5w3L7ef9a3VYFjnnq4tPiiMXp2bkMyPDb4RBjMglH5vELbxi0Fn6bV6hjvsOLB3
         A1g28aTkBZiswr27gzACenalbOMrbLv6MAmybRBjLtO6NSm7z3vnon/NU47uCoahVohs
         zOyuWTBbRELZw/KmRKLQ5PbPOc8JRZU8Ouj5bOPCAJ0wMBZTzzlK0XTKcH15tU2/8Fcn
         Qeeg==
X-Gm-Message-State: AOJu0YyDD+vqLLWulfbfhl44tzh+EgwgF+hlNmgilYC3n3k+Z4W+WugB
	w+g0gE23HJEfTlYcPOSga2U=
X-Google-Smtp-Source: 
 AGHT+IFiZtabVhUuY1bomsXQZWF6oaToQkCFgYCHPt/3Khyme6ZSuBPbGJFAJ0jyeRFKC3p9n0wiWw==
X-Received: by 2002:a05:6870:5b81:b0:1bf:440:a055 with SMTP id
 em1-20020a0568705b8100b001bf0440a055mr18592017oab.4.1694026991204;
        Wed, 06 Sep 2023 12:03:11 -0700 (PDT)
Received: from geday ([2804:7f2:8006:99ef:50e4:98e3:42a7:1619])
        by smtp.gmail.com with ESMTPSA id
 tp10-20020a0568718b8a00b0019e6b96f909sm7918494oab.22.2023.09.06.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 12:03:10 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:03:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Message-ID: <ZPjM7op/B/CGCF/N@geday>
References: <ZPelHaX/Lt++kkOm@linaro.org>
 <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com>
 <ZPjGuCdmPgqznc5t@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPjGuCdmPgqznc5t@linaro.org>
Message-ID-Hash: TSAAYIYB2SBOSJJJ2Q4H4QYUXU5622X3
X-Message-ID-Hash: TSAAYIYB2SBOSJJJ2Q4H4QYUXU5622X3
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSAAYIYB2SBOSJJJ2Q4H4QYUXU5622X3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 06, 2023 at 03:36:40PM -0300, Antonio Terceiro wrote:
> On Wed, Sep 06, 2023 at 01:49:16PM +0100, Robin Murphy wrote:
> > On 2023-09-06 07:10, Takashi Iwai wrote:
> > > On Wed, 06 Sep 2023 00:01:01 +0200,
> > > Antonio Terceiro wrote:
> > > > 
> > > > Hi,
> > > > 

Hi Antonio, my 2 cents:

> > > > I'm using an arm64 workstation, and wanted to add a sound card to it. I bought
> > > > one who was pretty popular around where I live, and it is supported by the
> > > > snd-cmipci driver.

Specifically, which arm64 workstation? I'm guessing Compute Module 4 IO
Board + Raspbery Pi CM4? This detail is important because the stack
trace you provided only references generic PCI calls and there's a need
to know exactly which PCIe driver could be failing. Is it pcie-brcmstb?

Thanks,
Geraldo Nascimento

