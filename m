Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66D387F62
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 20:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A5916AB;
	Tue, 18 May 2021 20:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A5916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621361771;
	bh=CT7CRP9o9t2Aa8Xo03+bXpHXtWdghxheOOT6/7UaXdo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFwjUAsQSKsWhAqFpktKu+uCwMaa/jB4/EkE++vE4aNEiOLhktfHFpJAbtkoLHbqS
	 XskiZQUh3mDFRNpRodHMkMCTziNVEXUaeQx79LLomtyvs6TTRbxpsbZtMhI6LfPkEB
	 z3CsZHziSBX+MrfEf301JmqoyeA4O7KrzXxC5mnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DF8F80229;
	Tue, 18 May 2021 20:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED885F80217; Tue, 18 May 2021 20:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B838F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 20:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B838F8012C
Received: by mail-ot1-f49.google.com with SMTP id
 s5-20020a05683004c5b029032307304915so2179142otd.7
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 11:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MqzmUfFQvWACmELeeJIeSI5XVhxUZgmOCwYifMZTRQk=;
 b=JXdLX4YTlAfFwN9aSy1Glio6zazq+TBXhfz6ox+wFnFelQd3rxcUMcQReU4mhiwkVy
 gCOc2h+k+kUbZ7hMUaFitMg+VFSxQS7ONOt/kRrT4QmTZvtBFAKbkaLXoHqxOE/TmZ3+
 +RSLqC7yE4ZHw+eHUo4lfiN5onfH8yvXDDFPZC4voir2K3SQSHzJdMCo3JjlDEGwtkYI
 7OBD8SelKlUi82dsdrJFvQXLt+FSmWrbEBGJw2iGWIM0clsb5eJd2326ZCGaFX6+6REF
 RkkT4eeNSyVchV39Wx/QoY7p3wWC3qz3kKcnks/U6tlecUzE+E/cgBxLohupj4Z4R6ks
 9rrA==
X-Gm-Message-State: AOAM532Gp1cuzBOiolnziRyRCD4TsF94n0USEETBZDhKEzvvPobJTMo9
 xV3CkTTfmeumvcJAqy+c8g==
X-Google-Smtp-Source: ABdhPJz0l2e+YzveBfbUDExvUUb4ozSZ0fEA9Sg7/956oxQts1fxdYml8imxKkVA8bXCFfL8lQBASA==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr5276878otk.262.1621361678442; 
 Tue, 18 May 2021 11:14:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o80sm3844961ooo.41.2021.05.18.11.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:14:37 -0700 (PDT)
Received: (nullmailer pid 968440 invoked by uid 1000);
 Tue, 18 May 2021 18:14:35 -0000
Date: Tue, 18 May 2021 13:14:35 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] of: base: Export of_device_compatible_match()
Message-ID: <20210518181435.GB949047@robh.at.kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518001356.19227-2-digetx@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Rowand <frowand.list@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, May 18, 2021 at 03:13:55AM +0300, Dmitry Osipenko wrote:
> The of_device_compatible_match() will be used by the updated NVIDIA Tegra
> ASoC WM8903 driver which could be build as a loadable module, export the
> OF function.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 48e941f99558..eeca92467531 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -556,6 +556,7 @@ int of_device_compatible_match(struct device_node *device,
>  
>  	return score;
>  }
> +EXPORT_SYMBOL(of_device_compatible_match);

I should document this, but there's a number of of_* functions that have 
only a few users and I want to get rid of. This is one of them. Grep 
this function and you'll notice most should be using 
of_machine_is_compatible instead and we're left with sunxi_mbus...

Rob
