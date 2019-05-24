Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAF29A20
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 16:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA4216EE;
	Fri, 24 May 2019 16:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA4216EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558708522;
	bh=13oxK8sUs67jChoHnFms5QxsWD9yNBc95GWwXYvYkuA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAVzhYbh4VGUDl5FMxdu36RfTdfVb9oPN23dJQvbxLdkSOvz/GOwrgbgXnIH5Td+N
	 mfUl2PLp8B4Gbi+j7Un3/mpbXoqdyEZHRF+sZrZjjx4NodLeVA7dX9XwmlAjHh9d4R
	 2ZS0idogGDnPKYvL4LJtQAU5quRSM4D/K1+FaPL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6495F806F7;
	Fri, 24 May 2019 16:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDC55F89630; Fri, 24 May 2019 16:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D8C9F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 16:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D8C9F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QDjjTITk"
Received: by mail-pl1-x644.google.com with SMTP id f97so4264146plb.5
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bkANiCU/QOHZhbNxPjGAJHjS7JejXUR7CHNVdlS4/ms=;
 b=QDjjTITkxQodeNlBDOvaMduMLdxc/XVqi1m23ey82bMaG6/I38qQn8QskKhffhvdI2
 zDl3+ofdsRdHQ85Ypnascg2McRI4/rjka2NHxgxWTvsVkwkA30RW/Qr5E0JVspgd91h8
 FcpaXsjy6/bsZf31X2j3zaXNQocT4e49DA4mYeOHt+CXU5uJgSqtQZwHdagEexnaJm0s
 5+y4+s9RIaDyn0/LoSUOdrqjgj3NKzEwJH0vLL7+rvoaKTD/7Tdx8cr+SVEX+bLpx2T/
 fJbi/LMjO2tVdoH7+ze4jinDC6atA6OFNjxLSudP+Y2pLxpQGagR0ZC9Zs9chjrAH+OU
 Vscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bkANiCU/QOHZhbNxPjGAJHjS7JejXUR7CHNVdlS4/ms=;
 b=OecorPmthaN8QvGKJnQV8ok9jAzLsjDIo2XWK+CClVaLOsQ+P9e8cWp8FBHbrUjGsp
 4EfL144KzQKcL1RyB0/v0FqS6dE3z8gSfM5wwE27DbDauvDHfNgEaIC7fO8orB5dxWi+
 H92Nb5F7D5Xf3PaOM5p42fX3SV2eFr3GEVdSucIyHSJjXtyc+9jOCVZz6wyE1iaigofc
 UerHjSFCWcZaEL3/fRlgk/AUAjAhaMXetKbP+BWEKf/v8fX/jqWIAd8rdmX2tp3xgFtM
 2uk0uz0ATcgBxYbkcsA21atA+MsyN8pYPMUj/mjH2B97R0cR6JjX+VwyDFM+cVQYknxQ
 fSkw==
X-Gm-Message-State: APjAAAUeeSV53E1xWmplH1MUisqNNTVByRlTYx1n9G6M+rb07ByCzbh2
 YO/3SRVU4eE4QzdgaAPEkps=
X-Google-Smtp-Source: APXvYqwye2akahN+OdAFoz3/avW9PE6yMBVVQi/FuXlUVOKHcANsVWoerj1ea1bSWcNDJSABYTiHrA==
X-Received: by 2002:a17:902:6a4:: with SMTP id
 33mr64032456plh.338.1558708411303; 
 Fri, 24 May 2019 07:33:31 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id s134sm3476408pfc.110.2019.05.24.07.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 07:33:30 -0700 (PDT)
Date: Fri, 24 May 2019 22:33:09 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190524143309.GA8631@zhanggen-UX430UQ>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, May 24, 2019 at 09:33:13AM +0100, Jon Hunter wrote:
> 
> On 24/05/2019 01:50, Gen Zhang wrote:
> > In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
> > platform_device_alloc(). When it is NULL, function returns ENOMEM.
> > However, 'machine' is allocated by devm_kzalloc() before this site.
> > Thus we should free 'machine' before function ends to prevent memory
> > leaking.
> 
> Memory allocated by devm_xxx() is automatically freed on failure so this
> is not correct.
Thanks for your comments, Jon. But after I examined the code, I am still
confused about the usage of devm_kmalloc(). You can kindly refer to 
hisi_sas_debugfs_init() in drivers/scsi/hisi_sas/hisi_sas_main.c. And
devm_kfree() is used to free a memory allocated by devm_kmalloc(). And
I found other situations similar to this in other files.

So, I hope you can give me some guidance on this. Thanks!
> 
> > Further, we should free 'machine->util_data', 'machine->codec' and
> > 'machine' before this function normally ends to prevent memory leaking.
> 
> This is also incorrect. Why would we free all resources after
> successfully initialising the driver?
I re-checked this part, and it is totally incorrect. It should be deleted.

Thanks
Gen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
