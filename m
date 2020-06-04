Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118381ED9D6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 02:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E7B166E;
	Thu,  4 Jun 2020 02:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E7B166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591229340;
	bh=guBPCWyssErbM2lE+OHSnFt5M8+33BoTTNKhw4n9i9E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuu4tMzLnHU6G4zCfrLWO1UCN2wHOPebpwrgz3yA+HuLEpP4/BfGGR1QVRSXSw30M
	 b4PBh11GaKwLEceL39+LGKcaF3pTh09AIW9wTawndDV7imK0Qesm7eN4ocaRz+W7w4
	 clnoU6lg+We58jgJ1VQXwx02ZtR4FbIa72JcxKMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8522FF801F5;
	Thu,  4 Jun 2020 02:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73684F800D0; Thu,  4 Jun 2020 02:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25373F800D0
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 02:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25373F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XCh1Bvui"
Received: by mail-pj1-x1043.google.com with SMTP id jz3so289292pjb.0
 for <alsa-devel@alsa-project.org>; Wed, 03 Jun 2020 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=37s08ZuqFcndX7aAAI+JFevMdaZ0bnJEocIhn4/lh78=;
 b=XCh1BvuiQnQ9Zm1oZ2yD4vKaikfXRb54M1szSL15zdmA4Wu3zIleoiijey1ihZJYmu
 yH73ihq2hNe4EPGty0ElAgH+2jO8uB3PwYRbUhMIb4DwZaakWiQkO4TsYbjZ5ZfQwLla
 Dqk8QEEEN5t2OKagg3lhOVoFlGROQAl6R4HBIvKnIpKE18gJTBbEaBog8i2qLQqPs1dN
 gxCOB8YGuOkwR1p5JZYt2ci26kspsM5+IdV/AzGK/7iHdc/Le+ZHHkfGXsx0vT868TpG
 GNtNEkGq5vrpV81Zk9flKNsy1k2xnXdO4yq9GaGhqZJdAhQZsPom222FE/RMcP8kfewk
 hkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=37s08ZuqFcndX7aAAI+JFevMdaZ0bnJEocIhn4/lh78=;
 b=Srfv9agevniPQJjPECJgPomyw0vTU3wPoP7xBYx6iFrlk1Lm4Gxb/l80IsOCAkT5+X
 ANZSSl0P8Ye01HKzgFpkRtjUDT4A/0ZQUn7EldsvoHoZv7G2BrVFR1YA0/gmK3hYJNbp
 REDLRJs+2lF0nYAuz9KjZW8CZUMIS505nBsDEpaZFDQc4N7nYjnUrJxeaGMUfPMR9Jth
 tdOOg9APRq4vvUUlLqIDwcOfwAvMqFRIZ35cgWZ7L3UBjn6MNSOZgkxiS8h9RbfafxMW
 wHBsE2nuXHwGg+lQIoJq9koKGIRzoQKw4xC8kuMSOx2KojWl1VzI0IR1FwFBuoZEVyPv
 T3ng==
X-Gm-Message-State: AOAM532uA6Y+1ZSVp/m8Mum+HAEk1nPMzvahAEzcCoZYaMB8qQ4um7oa
 kS2r6ITWA+qClys/Irers1o=
X-Google-Smtp-Source: ABdhPJyx19haOwN64kw7j8RFpa8HEmcAYpFxgEWl1NTCvbX0UCfPaYbv4AlWn6qfCVsMTOK0HzJ54Q==
X-Received: by 2002:a17:90a:a107:: with SMTP id
 s7mr2777391pjp.199.1591229277291; 
 Wed, 03 Jun 2020 17:07:57 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b14sm2549035pgb.32.2020.06.03.17.07.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jun 2020 17:07:56 -0700 (PDT)
Date: Wed, 3 Jun 2020 17:07:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_easrc: Fix "Function parameter not
 described" warnings
Message-ID: <20200604000753.GC17364@Asurada-Nvidia>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
 <d166b868e6d294de47a89857be03758ec82a0a61.1591155860.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d166b868e6d294de47a89857be03758ec82a0a61.1591155860.git.shengjiu.wang@nxp.com>
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

On Wed, Jun 03, 2020 at 11:39:41AM +0800, Shengjiu Wang wrote:
> Obtained with:
> $ make W=1
> 
> sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'easrc' not described in 'fsl_easrc_normalize_filter'
> sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'infilter' not described in 'fsl_easrc_normalize_filter'
> sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'outfilter' not described in 'fsl_easrc_normalize_filter'
> sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'shift' not described in 'fsl_easrc_normalize_filter'
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reported-by: kbuild test robot <lkp@intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
