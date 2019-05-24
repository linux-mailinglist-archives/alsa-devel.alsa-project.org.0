Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94C29B6C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 17:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DDA1714;
	Fri, 24 May 2019 17:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DDA1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558712708;
	bh=kpE+TIjqXePFlrapqGNp7DjroAgWdNleqhw4Yn/9JLk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCH2CTmRqbliXXVioy1I/LsBEw15lU3/sudVBoFjj9jFJGAYGJnaLopvg6WRXmYPK
	 kETNeVl23HhZ74pQePHjJxr/5b/3LZATM4odDemZO0yUEGiwjBuvOoKstPH2qBcZRj
	 zEoAwnORGnB30VPi29RhaHJLvvoJALNVq09fFFFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A9CF89630;
	Fri, 24 May 2019 17:43:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F11F89630; Fri, 24 May 2019 17:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC3A8F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 17:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3A8F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k//C0g7e"
Received: by mail-pf1-x442.google.com with SMTP id v80so5566866pfa.3
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b667PaiUgQ8Q7PpALzJt/7gtzGVjETB3D6yMZYIALTM=;
 b=k//C0g7exdcOJUzXWpFbNqGCMszp+12V7HlLpivolIypgaoPAXyanHxWMU4qG1gZcw
 j1aKpX5rg9hmij2IMvONUlM7bHhfdSlddZ9/R01ZA/zH/TJ5ijO7uDi0K2YYu7Rp+sAO
 vydLknKzVLK8+FqaHvqN7AmvInf2J6sfzVZNkLzeIAkAksKw1kc1y4VO6zlrDoBE2pVs
 da+DIMZQSrtnYqqjXcd+MybTXwHcrqDWHYikIlBJFmraFEGxoqcBklt7RwffmlQUXlkC
 Zd15JQuglsWt0Bmx0kQy2RRFlZH8ZwL+eEJQr1PoD989P1TC75l4ymQk7jyq81nc/YAS
 jGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b667PaiUgQ8Q7PpALzJt/7gtzGVjETB3D6yMZYIALTM=;
 b=p2kaPulrHpDPXSJybulUwd/wsYNvi0OGK+ZeXgtULkVcxnemZR1IRfGQ05Z7cMAa8E
 hZcco/k1xsLzmPvJ21JAWlQSpoN06dy193x5fApEnRybcNMkA9v8RuzVnfAepK2OlfWl
 PAdFDeENlg2kHdi0+vqeHS5uMvcbC7ZXrM5IxadSgw6Q9H8eGaH7o5krKP9e16T9HPox
 p2FdjqwJA+c9aAoQVmZDJNccUZnM/3RQgu8xSM2Ju9REDM8XVDC1/SeDSYzN7dSgV3Th
 HK7noQVzPyR/uX+Hk+U0PrmLGpl1mE4U6DxZ+6g0UpVX9bivQGEs6/oYm37OeDYfkr2x
 YqUg==
X-Gm-Message-State: APjAAAWsX/heIgUx+Sg652wRJ4XEnWztbfTua6fQ1ChRssIAeIfMfCoC
 Tkt+BSMOPvnbucpBsvsAuH8=
X-Google-Smtp-Source: APXvYqwhRl211cWfEVTBxkcGOE9w1J3jhmtE5k3PSWuOj9tEW3/mOIt0iLAt0La053XLjoZSI4kECg==
X-Received: by 2002:a62:e0cb:: with SMTP id d72mr20598365pfm.242.1558712597167; 
 Fri, 24 May 2019 08:43:17 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id e73sm4397753pfh.59.2019.05.24.08.43.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 08:43:16 -0700 (PDT)
Date: Fri, 24 May 2019 23:42:52 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190524154252.GA10186@zhanggen-UX430UQ>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
 <20190524143309.GA8631@zhanggen-UX430UQ>
 <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
 <20190524150053.GA9235@zhanggen-UX430UQ>
 <1740686f-a466-430c-9d01-ab83ea6998ac@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1740686f-a466-430c-9d01-ab83ea6998ac@nvidia.com>
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

On Fri, May 24, 2019 at 04:36:54PM +0100, Jon Hunter wrote:
> There could well be cases where you need to explicitly call
> devm_kfree(), but having a quick glance at the example above, I don't
> see why you would call devm_kfree() here and yes looks like that code
> could be simplified significantly. Notice that hisi_sas_debugfs_exit()
> does not free any memory as it is not necessary to explicitly do so.
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
Thanks for your suggestions, Jon! I think I need to e-mail to those
maintainers about this issue.

Thanks
Gen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
