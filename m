Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132C6E061B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 06:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD05EDD;
	Thu, 13 Apr 2023 06:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD05EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681361256;
	bh=nvI9E4Ko0qw3YTi9csR8tXPHrjwbh2fnLS2pSrG5yUs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nXBq9g3K1zCYDsoqLJUUjaxAD/xPGUGCcE1vsWe/2udn8uzYAQquGvSGDzzLuCCmD
	 J8rAmC6HF9WgeF/TjmeaS9E+Qy6+9Mm1KpAReLIu4vg7vBbChfTDXcWWDc6ruXLTft
	 cfNEJ71ambIlKqz+9UCcVplsmB1flGbUWkzSzZOQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26360F8025E;
	Thu, 13 Apr 2023 06:46:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6858F8032B; Thu, 13 Apr 2023 06:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5130F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 06:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5130F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hIYejBWE
Received: by mail-wr1-x436.google.com with SMTP id i3so3593961wrc.4
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Apr 2023 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681361194; x=1683953194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOJ/KX1XHGj6bPAR/H3sio0nonghfKh60iBHqm26zT0=;
        b=hIYejBWE9qHqSVWpop+XEyVurZH0UgEQiJElhC6l9BVK/cfnwAJ/KDE7OgkDzusWwI
         sov1kt5DY+r2LljSBqNUR42QN+hmidWAQQhJXq50tvZKvXi+bqzWOjcoO29RdpO3FDC6
         d6Geq6PGgVWbA08lwAYurFH4bfucejlGzQ+AxR0gozQnLqVnlp71VYFgPWtqDo7Cq6aj
         HsZ3ADFY5QMorH8ea9UG6rNOht3TwWmuMr8ZSCWGU+g0ZtuzpspiLtlIvBiJlKLwtKBj
         BeeiMDxPTFBn0VjWeeqewQe3/NQ/fIr/v0ZqrKLmEDhRayjt9Nj2iYTVqObhwu/aM+Zi
         ulYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681361194; x=1683953194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOJ/KX1XHGj6bPAR/H3sio0nonghfKh60iBHqm26zT0=;
        b=fbJq88SgL9CUyMjfu+PmUxQbgVBgP1eGrsZidhzql6CDZcgvD1a3BvQS6yOuOu5FEg
         o9BJW6UHrrBYSKvCJGDslPym2r5AYkuEmMhCjaaqsdFOjsfuonc5wm95nZu2RLACawmp
         aETaISDwW3DgiH0lkVosK72E9NTkFlaeD+LWoIT70b6crXz+3BGKuBUkCin3c/JOt2Dn
         uZmPZPAXmnZCdxs00biKmBsfklD9llJiVyXIaLE7vl+91NZvryF9RCI+13B6xeSQanYL
         r1bepkoMQGd7ADvPxJ9vB0dtvFep/i3YHS0dxwlrEUkJJYQf8EOTnoO4buYGJyT8e+LB
         Hajg==
X-Gm-Message-State: AAQBX9fCe+y/Z55m4nQ3Uk5sfveAm3WzeaCO4rvzL0Y6i0ipJkZgMWxD
	HXmyznOHhJ+pSkQjMY3mdc0=
X-Google-Smtp-Source: 
 AKy350b6owCtPjQVgYxvoY430ZQmJ6NIoLUDkHy/MFwkhUVmGijoCnYRrUIOYWSOpalkwJgPQfWLAA==
X-Received: by 2002:adf:ffcb:0:b0:2f4:4616:1e27 with SMTP id
 x11-20020adfffcb000000b002f446161e27mr297290wrs.66.1681361193698;
        Wed, 12 Apr 2023 21:46:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 z13-20020a5d44cd000000b002e61e002943sm365229wrr.116.2023.04.12.21.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:46:33 -0700 (PDT)
Date: Thu, 13 Apr 2023 07:46:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Message-ID: <01fc101f-9310-46ee-846c-afb2fcd0746c@kili.mountain>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
 <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
 <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
 <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
 <471b8f95-1c13-48bd-0491-cae0fe2ce824@linux.intel.com>
 <d9dbf94-154f-f571-e4ef-43adef43881@intel.com>
 <62d6b3a8-9b41-4fd2-a7a9-1fdc92c12486@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d6b3a8-9b41-4fd2-a7a9-1fdc92c12486@kili.mountain>
Message-ID-Hash: HC4VNQCTTACXEA57LYQUJXPWYL7NZ5EM
X-Message-ID-Hash: HC4VNQCTTACXEA57LYQUJXPWYL7NZ5EM
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HC4VNQCTTACXEA57LYQUJXPWYL7NZ5EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 13, 2023 at 07:41:06AM +0300, Dan Carpenter wrote:
> On Tue, Apr 11, 2023 at 06:22:20PM +0200, Guennadi Liakhovetski wrote:
> > Hi,
> > 
> > Actually there's no black magic there because there's no dereference but
> > only pointer arithmetic. The compiler just adds the calculated offset to
> > NULL and passes that small pointer to printk().
> > 
> 
> The code in check_pointer_msg() is supposed to detect bugs but we're
> taking advantage of it and introducing bugs...  It's might not be magic
> but it's pretty astonishing.

"efault" is not a mispelling of default.  The "e" means error.

regards,
dan carpenter

