Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720916D96EF
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 14:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2409C886;
	Thu,  6 Apr 2023 14:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2409C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680783523;
	bh=GRjR8A4WRVIKD4oRHpVco0s9yZEfy/2WeB9lg2vWiOg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XVXG0vRhssv064e8JA+ouuoTPFt0BKXysup5LBqjPWpzr53ZpjYJv4nhhokOik6uy
	 ZG+Av42GO2dZL5syMkzWTuQb8+GeI1lPZ0vvoB4KZrgpD3IMVJgZTy6BolfkyRmOVa
	 MDVzoIdFzw0FOG0ve+GvmXXwmr3hVnFp3jWeB918=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB60F80171;
	Thu,  6 Apr 2023 14:17:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C01F80246; Thu,  6 Apr 2023 14:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F85AF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 14:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F85AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pwP0uwEl
Received: by mail-wr1-x433.google.com with SMTP id y14so39343982wrq.4
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680783464; x=1683375464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n61jYAD6dPbw2otCpc4Oe8515REV5GC/8MPBAjpZGx4=;
        b=pwP0uwEleAdlRfKZhE0uiqwhlnA3U7GlSgk3rUVwS5G/kOUN3xH+7PxvvgcidbdkMl
         fENbAOvC1T6CvM7u4vNo2GgHMjhU78JDEJFjm0bfTpzGd+qzyZucl5A4cApaEe1Qekkl
         lNj7skaOIVzE+UbjOoJm3Lv3XTKdSpeLQWAaUDYXRx7RpOnhWb/QTUX4XEhh06R90n3g
         4kdIOBOejsNsTLZBPyvkP5G+jZg6auWR7qUGMu5AtUfGOvkjlHwvPRUO2kUdCX0UJkrS
         siKJegkxUKRil3bxcciqkACy9fyWcjA94ik2BZCTiqCpQtFWyL9cKb4CzQ4XzABd7GTn
         9aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783464; x=1683375464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n61jYAD6dPbw2otCpc4Oe8515REV5GC/8MPBAjpZGx4=;
        b=YybBzdIZt07XikBjEj3YnOGRfEHVprnU+dXgiSb5uOUUO7KXvY8Nt4z3CbCPYZshMr
         jWqA1+ip0dFx7IWKjujbGT2ZwR4Flf7RjItAhNPFz0tBQW+UuNsFho6+16WK65cm8Zrv
         Ky7mdcTwnd4/fAVP0YMzws7bNkzIUqIaCzpSD6i91Y7QYBF59LxIRFUkQlo5RB3bTn74
         W+vjEoOhv9JoLPeVJ6+m4rRqo2y8mC+1kKy4rHik9pblN3klubgpT4vjUtGif69vo+Dj
         aLV6eIb/jSl2tABnPjIs/hlvXI/0DS992AN+1jO3BvJLyj0KjORvN4BCLKoLOrc7DePy
         FvKQ==
X-Gm-Message-State: AAQBX9eitJMmi3gshhxQzDSpMx45uEFpfG0ZQuI/yy3TBkAts0JRH9Go
	Vt8T8OjJilvibK9Q5VxWHc0=
X-Google-Smtp-Source: 
 AKy350au71EVpD159cTUd4VgIxLFQjQvHIgjYwc5kQMc1R19GrugvM5hnbCNZANl56ZOuAii2H7xBA==
X-Received: by 2002:a5d:604c:0:b0:2d7:6035:7d20 with SMTP id
 j12-20020a5d604c000000b002d760357d20mr7271212wrt.15.1680783464585;
        Thu, 06 Apr 2023 05:17:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 d7-20020adfef87000000b002daeb108304sm1634365wro.33.2023.04.06.05.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:17:44 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:17:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH] soundwire: amd: fix an IS_ERR() vs NULL bug
Message-ID: <a668e9cd-d19d-4647-8ecd-6a9fc03f68c9@kili.mountain>
References: <3be30516-a1b0-412b-8379-06011855e46f@kili.mountain>
 <701bef7f-77bb-63a6-429f-1293519a6b21@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <701bef7f-77bb-63a6-429f-1293519a6b21@amd.com>
Message-ID-Hash: GVCTFKVQNXYRQLPBX5SC5DB3GLPDWVKY
X-Message-ID-Hash: GVCTFKVQNXYRQLPBX5SC5DB3GLPDWVKY
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVCTFKVQNXYRQLPBX5SC5DB3GLPDWVKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 05:32:21PM +0530, Mukunda,Vijendar wrote:
> On 06/04/23 14:26, Dan Carpenter wrote:
> > The devm_ioremap() function returns NULL on error.  It never returns
> > error pointers.  Update the error checking accordingly.
> >
> > Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/soundwire/amd_manager.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> > index 9fb7f91ca182..9bb8ae8c5f32 100644
> > --- a/drivers/soundwire/amd_manager.c
> > +++ b/drivers/soundwire/amd_manager.c
> > @@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
> > -	if (IS_ERR(amd_manager->mmio)) {
> > +	if (!amd_manager->mmio) {
> This will break the functionality.  Condition should be
> if (!amd_manager->acp_mmio)
> 
> >  		dev_err(dev, "mmio not found\n");
> > -		return PTR_ERR(amd_manager->mmio);
> > +		return -ENOMEM;

Ah crap.  You're right.  Thanks.  I will resend.

regards,
dan carpenter

