Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0E1ED9D5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 02:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A691672;
	Thu,  4 Jun 2020 02:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A691672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591229317;
	bh=NWCdyyyPcSpsfpLc/FGn7Vtf6KY/76xESWZXOjQbNF0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCF0Dou8scsPh3POqEbYYWoKBAcj44RQhO4W3FOzSj2TjvNKQPTqdBdjBc9nW67ZM
	 1nDQW4w7fhbc2A3/mOZqMJnreQn/1RvhIorE9yAJ8Tm0oeS2QQbfQSXM+KolWd8MLF
	 v8oV1AEb3hHGqEPTYRxM41XNJqQZrZnvvdPMlgfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 445A4F800BC;
	Thu,  4 Jun 2020 02:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22C1AF80212; Thu,  4 Jun 2020 02:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D8EF800BC
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 02:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D8EF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hbRusUEB"
Received: by mail-pj1-x1043.google.com with SMTP id k2so288905pjs.2
 for <alsa-devel@alsa-project.org>; Wed, 03 Jun 2020 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wW9z6dg9gtAyJMDZbmTtIDy0Zz6R5BIjGsT/C/EraEE=;
 b=hbRusUEBEuXE43+h8g3Pvw81RsDWZKa0dvCSbxNYz78B1eNTcn2Pnq05G3QMZd5gzx
 70P3CSV0FOq+qRA076Tlw61da/eYYkgLKinDK4FfLSA4JeKaOSz5+ojszcktpXRtI34y
 GdgQbxNrr+wMFg9z9z9KVx7xyCoHDnkAg41ewHMrMeFmQvH433MmUryuwVTZxzTpHmT7
 nXCFnvpCkBeS2EUM4oRMqrworUamYwAajGO52p67jp+y8DJ7PDk1h2xoH5Ck3XIJH3BN
 YdZRpVQej+qKFERrZ0PH+nyJAvnZJbRPetvr/UssZd8jOBchORcWXDFyRMwLd+5Msjq6
 7GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wW9z6dg9gtAyJMDZbmTtIDy0Zz6R5BIjGsT/C/EraEE=;
 b=l0sEVLP2eB8GTzP1y/zdHvYme+OqRXY4noDsW6+Qi2FDzenuMPTuJCjukE4P4BXfqy
 ubq35gHUTRfjxo470OIGfp77Wma6vlXQrNFm2Xn836W5lnvH7NVCRAwaUmROrmP9q7r0
 6QdLoaCwf8PNbJ6yXRCWVMuvuJcFhepR0cSQmNdrewnHLGi6qQzaOC1XVt8vfojidt2P
 dVegaNxxwAFuEE4tEiWftdIbFFNMrwVFZgv9I4ULua5SMe341tgiDWOZzwlYR6E1LF7j
 GWbdUs2HzbdUvCtVY6YDzWLI4KXUVNtYj2SzGLWgCHuqDME2tmGCizRB9TpxjmF/F7jt
 XjXQ==
X-Gm-Message-State: AOAM531pnG5ZiLsk8c+efO24sct+Zd/+Az4tvYXYU2eDWenNuRYSwem0
 ArPoIRDdi8tMZcr4flkLT4o=
X-Google-Smtp-Source: ABdhPJySQ1XeZeT8TPYoiRNFfTzkpxUVKzVYueW0EDHFb2AOz5sAtiVyA6sIuTRIpxdg2f6zYH/GCA==
X-Received: by 2002:a17:90b:193:: with SMTP id
 t19mr2899534pjs.47.1591229225665; 
 Wed, 03 Jun 2020 17:07:05 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f136sm2691842pfa.59.2020.06.03.17.07.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jun 2020 17:07:05 -0700 (PDT)
Date: Wed, 3 Jun 2020 17:07:02 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_easrc: Fix -Wunused-but-set-variable
Message-ID: <20200604000701.GB17364@Asurada-Nvidia>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
 <91ceb59e3bce31c9e93abba06f5156692ff5c71e.1591155860.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91ceb59e3bce31c9e93abba06f5156692ff5c71e.1591155860.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Jun 03, 2020 at 11:39:40AM +0800, Shengjiu Wang wrote:
> Obtained with:
> $ make W=1
> 
> sound/soc/fsl/fsl_easrc.c: In function 'fsl_easrc_set_rs_ratio':
> sound/soc/fsl/fsl_easrc.c:182:15: warning: variable 'int_bits' set but not used [-Wunused-but-set-variable]
>   unsigned int int_bits;
>                ^
> sound/soc/fsl/fsl_easrc.c: In function 'fsl_easrc_set_ctx_organziation':
> sound/soc/fsl/fsl_easrc.c:1204:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
>   struct device *dev;
>                  ^
> sound/soc/fsl/fsl_easrc.c: In function 'fsl_easrc_release_context':
> sound/soc/fsl/fsl_easrc.c:1294:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
>   struct device *dev;
>                  ^
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reported-by: kbuild test robot <lkp@intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
