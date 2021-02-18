Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14C31E656
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 07:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6261F1660;
	Thu, 18 Feb 2021 07:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6261F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613629902;
	bh=h9/PoZQXePkWzTdog6Rf1/p4HMMpGXBsM9xVmS2ZHGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjFz/EMwnkmpJOhi4/mpwdH14Ot967HGA4yLTSJBpwNe//Ok24FucvRqUO9K6cgcx
	 3ApJDgc7uqde7C+SAQJsb2y5QMFa5xlpkTrqEEUYjRC1YL95NWtu2cG8NvWHPeBrD8
	 7TNvFlNumc2aSFi/OOCYvVN0d2Ml9WZUfZWcn3GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB88EF800D0;
	Thu, 18 Feb 2021 07:30:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A94D0F8015A; Thu, 18 Feb 2021 07:30:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 618B3F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 07:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 618B3F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TOewui0l"
Received: by mail-pf1-x42f.google.com with SMTP id z15so624548pfc.3
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yHtGxWfPAIZEvBnGmWjlN6rdZWQnYSnX/GzqtFWIJg0=;
 b=TOewui0lXbhSkNw7mI+ljNrV0hf31Mu/TsPD3Fa99a3Vr6Wnm9DSIF/fn+PxPmZ2lm
 tCnpqmbQxbbYKPyZ2OPqkaj6iPF5hyQ8q2gKRvD3mQhYO7RH1mLUtxn0q/rU7DEZh/Tk
 8UXeYOMrr6MU7miSrQLfrsEcrdOWVSbATP8L3D3gyfXYo7wZnYkAhxBTipoRQKbDk3C9
 GWgh7s/u/U+rg2KvPgji7XIDuKTEWX5JjU/XkNK/F9/9u/QFi4SWv15o96VYRaiH1GLh
 PnbZTKe0NUeT9DyLjPVv8Z0CAbWHpNI0B+WwpKg6cj6gGW/F5oeygzONeFkGEguL2F2M
 n/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yHtGxWfPAIZEvBnGmWjlN6rdZWQnYSnX/GzqtFWIJg0=;
 b=Y7kxr6KZ86qXPtEjCmqYLkCEsinjiHB3KWfI4/K04ycVb0IeaUyXan7ky0IKjaoI+x
 lOA79TZ00bZobVt7vdkC1qsuv/i1qwAVaXo0IpAvjYcSLuNhioChQo9UyacpxB+5ltLe
 886VVk6UBteGlofBJQV+vRbWKwqFh4qsq2e2ZqZ6ayG+REb4Ws8V9xNDhLVQo86c7hhk
 W8z4uQ/Imx9h9NSKfKq7oqVAZoWEhyLc4KCs9DI6LAyhzf+DtVlAfrYcJvRgvk+RmgFj
 MtJ56+JFgaUs+ft2Pc55PRa21Oh4/e+LetrYC30CSoHdySNYM0U8nyzPSuamryQj5w13
 Jtsg==
X-Gm-Message-State: AOAM531RG+0Euha5x/71wMls9hckOGx9kxl7qDmef1gWAFcNVupdNzyN
 W6pD1CS8v9QxABjcOdZ1UB4=
X-Google-Smtp-Source: ABdhPJz8GKaArYRWqmtdtU85HLb1nnRXNt3gTtJ3OrKL0M5imqMeyfTUhg3Lq3SEzz53Npy/tWIGpA==
X-Received: by 2002:a63:547:: with SMTP id 68mr2736959pgf.196.1613629786117;
 Wed, 17 Feb 2021 22:29:46 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id l144sm4436954pfd.104.2021.02.17.22.29.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Feb 2021 22:29:45 -0800 (PST)
Date: Wed, 17 Feb 2021 22:30:39 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 4/4] ASoC: fsl: drop unneeded snd_soc_dai_set_drvdata
Message-ID: <20210218063038.GB13668@Asurada-Nvidia>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
 <20210213101907.1318496-5-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213101907.1318496-5-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Sat, Feb 13, 2021 at 11:19:07AM +0100, Julia Lawall wrote:
> snd_soc_dai_set_drvdata is not needed when the set data comes from
> snd_soc_dai_get_drvdata or dev_get_drvdata.  The problem was fixed
> usingthe following semantic patch: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,y,e;
> @@
> 	x = dev_get_drvdata(y->dev)
> 	... when != x = e
> -	snd_soc_dai_set_drvdata(y,x);
> 
> @@
> expression x,y,e;
> @@
> 	x = snd_soc_dai_get_drvdata(y)
> 	... when != x = e
> -	snd_soc_dai_set_drvdata(y,x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
