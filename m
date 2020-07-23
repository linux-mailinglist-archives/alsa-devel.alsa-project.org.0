Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73022A6EE
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 07:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB245165E;
	Thu, 23 Jul 2020 07:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB245165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595482465;
	bh=SwNVbMLd5Elq4GGu9mLPqXXE8JPIdl45tv89rJhGyzI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4lAKwdQe1yd/9yj1COBbZPDerWJ/G7TsLUvSeCPbWs4J10/NCqCSAtQ7Qb9KOe0c
	 gfj6sHtQfroUb259iYf7uBQ0SEeWiTOXDb+frZ+YT7Blq0xsUqx40WmJnofrZcu/cD
	 utwnsnueYGUuj5zoLs7/hVzUGGBRs1xhKzkaHBds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A40F800CE;
	Thu, 23 Jul 2020 07:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B702AF80212; Thu, 23 Jul 2020 07:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A4D1F8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 07:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A4D1F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YWSfNpBy"
Received: by mail-pl1-x642.google.com with SMTP id 72so2050273ple.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 22:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Azbmlb+o4Fr+IIKuyAGgLbUxH3riL3SrFDqan1+Q4+M=;
 b=YWSfNpBy8DiSuE3KFCrrd51VFavpYZSf4IehxS6pt8vfV3qMCkCsreyShiAT+R6fLD
 6qcazoBPEvtCcEetZPDLBMsmAkp/v04ZW2cFFN/fKnHjv5h5IrzMocedHYgsxY0o/h1B
 uPSIU/Hf/OjdnrB+uczzCWgglf1A18DgHCT2oE2nzSi0LbZfLC+RYMLZWZnHPXRkklNE
 Z4lYNPZPXOTM5HoPTmTowANjCDl5E8vWiEVQkrN2qXyWmD5lNLX6pdb9HBxeuqsKshjL
 Ap/eOsPLMJZ5hTQECt33KdoA71jPCi+qMVdRx97wTmDFnSSjPPqn8LGMYYaU17giriRU
 Q8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Azbmlb+o4Fr+IIKuyAGgLbUxH3riL3SrFDqan1+Q4+M=;
 b=lSh7cAjNfJmSj/X/AoEFhywrNdaVpIFsRiN3sIBFnxzk6ZPRxKqYluM6cVAfHYgWv9
 g5B+xB2sbgdnV+KA2iCRpMnhT5861ISfrKDjV16aGw2H7sPXn7kQiyrht2nvnRCmya/0
 m9MATWABbwSxJQAZquaYmrqk4ckJKgsV3zM5j9dtGKCAfTj1uaxjMJR90DYbLOEF3A8C
 kfeSqzFwevL+bI4l569RfstvHHU1clF8kDoTonHsawbQY73PvriZNwjDt3VOuSK7MarA
 cAAwlCIycdZRHWEpxOyZvnpD6EhpGeh5jR48JpWlUi2JcTQQVoH0zYzlqVi/693qC1HF
 uiwg==
X-Gm-Message-State: AOAM533GF7m2PEWb505AhTiJPmIZWPaA6wWSZgUXeCDlOTNSlca/pERW
 vtKeawZCk674l4K2reP4VMI=
X-Google-Smtp-Source: ABdhPJy3Ixe5NDssWl2gkYZjneUuDd6lti+TH8cvo414EnOoMUuOEVvaFkXJt4jj5434vavQPR0Wcg==
X-Received: by 2002:a17:90b:3715:: with SMTP id
 mg21mr2603075pjb.113.1595482345592; 
 Wed, 22 Jul 2020 22:32:25 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y65sm1438245pfb.75.2020.07.22.22.32.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jul 2020 22:32:25 -0700 (PDT)
Date: Wed, 22 Jul 2020 22:31:50 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: add IRQF_SHARED for devm_request_irq
Message-ID: <20200723053150.GA5476@Asurada-Nvidia>
References: <1595476808-28927-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595476808-28927-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, Jul 23, 2020 at 12:00:08PM +0800, Shengjiu Wang wrote:
> ESAI interfaces may share same interrupt line with EDMA on
> some platforms (e.g. i.MX8QXP, i.MX8QM).
> Add IRQF_SHARED flag to allow sharing the irq among several
> devices
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
