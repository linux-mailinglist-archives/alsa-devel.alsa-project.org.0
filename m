Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5229A9A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 17:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC57170E;
	Fri, 24 May 2019 17:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC57170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558710509;
	bh=fyKVy10Jl84Do/dvCe+9j9TUZdNJrKqwaCT3R4LT0Dk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRpZ/D8YPGjn7BP08Rbmhsh7dFtDri6C1cCMaD9uUcTKuR7DYBaJ9ECLOrKeua+An
	 mmc6q7Q3eECXNt4yP8BN/WQkWjLEfrHx+KqFlKIAPHEybVAX3VHm6Fs2SgBNUkYdkV
	 QzZdQn9fzyc5hycC+oFArObM+bIOgflC2/BGx5AY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC16F806F7;
	Fri, 24 May 2019 17:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A853F89630; Fri, 24 May 2019 17:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FCBAF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 17:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCBAF806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ME1ry+gK"
Received: by mail-pf1-x443.google.com with SMTP id a23so5497934pff.4
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qJHwzr2Xb9OgZp+GNKXElpzk8S4Bwefhiqqlqq7Ge9Q=;
 b=ME1ry+gKIK1PeITGct1uVTRK2mcRK1RzTn2KD7Z9M0OmDVCQHTnSHq59oNvKWeRyLz
 PM4bP6+0F/H7PTZtQ6NRL2g9iqzSzjZczuPgV+pQvGFVO75i81PxfWj8hSWYki52SOQf
 2d+ygBiKiwwZZb6SIeWznxRCkarblXGsRCZTGypu2abFllK9a3Qop1lF+pjaTx0UQVcZ
 k71AgLR+c0CiBGnaNBG2Qe2ry/z9+mj97MUJVg5fmhmf3NZo09wG2nsO/3gZy/4Xed68
 WjbWKw1PDUXzuSup9SI61Q+nt7JOYgKjHrFYb4J4M/gY7/wnvaJXnpN9Lp38ZDwHblyC
 vBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qJHwzr2Xb9OgZp+GNKXElpzk8S4Bwefhiqqlqq7Ge9Q=;
 b=QZjDR4JkWAMQKeHoq330msyAomLOK+cmNq7Zra6Z8wJ1Bd7ksKwGSue0xeZPpKlCxz
 rWYtAHkNFvDunivSUNWT0Ss7r/fUyl/m+cm4Lkwe+lw1Mtjy18B8XnVGqd4KS2grX0ol
 DauuV6A6Xu9rbPVULszxMt6j9hByriHDB86oiRN+2bmmofwc6JNSF5ZRGBno/hjhkMLz
 Vf9hC5tib4GGI4fCzyK7tH7TXDgk6NQ6aJ+GdWQwoNEyzEn5dmFfmBkNZOl5Y8QA/zlj
 RY5LGrzQpdY8Gq1FBDfKGtE80cwUwZckVJ9xU4ixlJfWScOdBvGjOl/tohr9g8Z8rs2Y
 vjzQ==
X-Gm-Message-State: APjAAAX0N93z+5CIgbuZhzvP/q8/xJSnpCAtZw1/IySNGThfj5SoTEpE
 SnQLSmU8wzb4Bhv9OiTd0KU=
X-Google-Smtp-Source: APXvYqzJdBKU5ZfnafzyYJdg6yuA4mPvK4pbUFl4lPClYZTImtuomicgJXntZbXamno6+euXA5i1OA==
X-Received: by 2002:a17:90a:f488:: with SMTP id
 bx8mr10054192pjb.62.1558710065929; 
 Fri, 24 May 2019 08:01:05 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id e10sm5504824pfm.137.2019.05.24.08.01.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 08:01:05 -0700 (PDT)
Date: Fri, 24 May 2019 23:00:53 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190524150053.GA9235@zhanggen-UX430UQ>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
 <20190524143309.GA8631@zhanggen-UX430UQ>
 <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
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

On Fri, May 24, 2019 at 03:47:34PM +0100, Jon Hunter wrote:
> 
> On 24/05/2019 15:33, Gen Zhang wrote:
> > On Fri, May 24, 2019 at 09:33:13AM +0100, Jon Hunter wrote:
> >>
> >> On 24/05/2019 01:50, Gen Zhang wrote:
> >>> In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
> >>> platform_device_alloc(). When it is NULL, function returns ENOMEM.
> >>> However, 'machine' is allocated by devm_kzalloc() before this site.
> >>> Thus we should free 'machine' before function ends to prevent memory
> >>> leaking.
> >>
> >> Memory allocated by devm_xxx() is automatically freed on failure so this
> >> is not correct.
> > Thanks for your comments, Jon. But after I examined the code, I am still
> > confused about the usage of devm_kmalloc(). You can kindly refer to 
> > hisi_sas_debugfs_init() in drivers/scsi/hisi_sas/hisi_sas_main.c. And
> > devm_kfree() is used to free a memory allocated by devm_kmalloc(). And
> > I found other situations similar to this in other files.
> > 
> > So, I hope you can give me some guidance on this. Thanks!
> 
> Please refer to the devres documentation [0].
> 
> Cheers,
> Jon
> 
> [0] https://www.kernel.org/doc/Documentation/driver-model/devres.txt
> 
> -- 
> nvpublic
Thanks for your reply. I figured out that devm_kmalloc will free the 
memory no matter fail or not. But I still want to ask why other codes
as I above mentioned use devm_kfree() to free memory allocated by 
devm_kmalloc(). If the memory is automatically freed, is this 
devm_kfee() redundant codes that should be removed? Am I 
misunderstanding this again or it is something else?

Thanks
Gen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
