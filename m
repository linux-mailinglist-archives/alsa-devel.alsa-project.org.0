Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EA469266
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B04204B;
	Mon,  6 Dec 2021 10:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B04204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638783069;
	bh=7QlPAl7LvmToEx84U/O4cvCN8juk9NjC0krOueA/3lc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+ieagTMq1Px6jfzPprgpQXixI/lscWwjpSuyiCM/ZOkGmk1+gV6BDZtmp2TMgScY
	 zaS5AMMNNWVKlvRYJa4pNVU4dcctai+s6RWLR7XE1xNlN7IgYcYG2+WzKD9ZCQsc6O
	 q1YUOkKPMokYZc4pOxClRPxBOVWnA9e36gaWfXpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92183F80108;
	Mon,  6 Dec 2021 10:29:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7565F8026C; Mon,  6 Dec 2021 10:29:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C306BF80147
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 10:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C306BF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aLvp8qb0"
Received: by mail-wr1-x433.google.com with SMTP id j3so21106676wrp.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 01:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ct+p7VlKlUoKTbIoDDaK1/3A+2HLH4PhtmZuaPsHx1E=;
 b=aLvp8qb0/Ykf4uLdQfwoWQePkl7ChOoNElne/Q+3z6yewHPiRiaLrfJM5bXBQbFKov
 d/QCnT2ZZY38BNu78g1DjZWGnGTiZBTqV1cUYhfL/cuOQimFQcZ4Dwbpwo8fo9Y03sN9
 XqriaxaaXnhClU47iELaKykYTY3HefQQ6e5KK1c/ssvLh7yveLi3pJYuDMST+sLYgzet
 G7Sw+jDdYHffvTDU6lMNCO8k4ZJsIwRpvayT2Y7b1s8cyLX2jBCCoiJ2Afw0t/FIiLM0
 sa0IgapBTa5dNzDvBRBAw/91qSLHdMtFLw7LY1oB3NR6kTjWm76SxWeIw1dDVQqfh7tA
 MsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ct+p7VlKlUoKTbIoDDaK1/3A+2HLH4PhtmZuaPsHx1E=;
 b=Y7vrP6wTZPZnElT2x416x0oM4JGPpysrg4Zck3sMSxz0QVuJD7E/DbTs4BM4953DO6
 m0+xtaZ4kpoHUdzCaKV0JqGubnvoAvTVV3MQwxeQX/SHlihRThTklz+KWL1wAEbJarhX
 8TJpiLjjuBtei4YmQUrBnKHx00VsyKvOJbDlK9TCIANLsDVFTkso5wPETdcHH8U4JgTb
 h7y4l7vw6ugkY994jFysEyQfdlSvfuBEgK00qNOMbvf1/lyE3fqexUlDHY0yWNvh1okU
 8/JX904KWK2TDa46ECZ5Azsb803N45vuOniEjLN5Cuq1tnZDhEOadZK2VffxfI3Hxj1u
 pTOQ==
X-Gm-Message-State: AOAM533Op1TEqDNIslfwPpzXdGXw7DZcEzm4TVZjaeHwj7alvkRnvwJV
 BYjaO5kWxc67Hk5ZmP4zUkc=
X-Google-Smtp-Source: ABdhPJzk0o6XFyoPZi+U2EZCLv55RRVdp+0CpsDkL5sD67loqkWDMtYHz9jBuTZxn/Tl/opi7e06Bw==
X-Received: by 2002:a5d:6d01:: with SMTP id e1mr42061164wrq.157.1638782982192; 
 Mon, 06 Dec 2021 01:29:42 -0800 (PST)
Received: from hamza-OptiPlex-7040 ([39.48.147.147])
 by smtp.gmail.com with ESMTPSA id j18sm16118678wmq.44.2021.12.06.01.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 01:29:41 -0800 (PST)
Date: Mon, 6 Dec 2021 14:29:37 +0500
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: test-component: fix null pointer dereference.
Message-ID: <20211206092937.GA5609@hamza-OptiPlex-7040>
References: <20211205204200.7852-1-amhamza.mgc@gmail.com>
 <TYCPR01MB55813B26BB2B3BB6D1E072F2D46C9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB55813B26BB2B3BB6D1E072F2D46C9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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

On Sun, Dec 05, 2021 at 10:40:27PM +0000, Kuninori Morimoto wrote:
> 
> Hi Ameer
> 
> Thank you for your patch.
> 
> > Dereferncing of_id pointer will result in exception in current
> > implementation since of_match_device() will assign it to NULL.
> > Adding NULL check for protection.
> (snip)
> > @@ -532,13 +532,16 @@ static int test_driver_probe(struct platform_device *pdev)
> >  	struct device_node *node = dev->of_node;
> >  	struct device_node *ep;
> >  	const struct of_device_id *of_id = of_match_device(test_of_match, &pdev->dev);
> > -	const struct test_adata *adata = of_id->data;
> > +	const struct test_adata *adata;
> >  	struct snd_soc_component_driver *cdriv;
> >  	struct snd_soc_dai_driver *ddriv;
> >  	struct test_dai_name *dname;
> >  	struct test_priv *priv;
> >  	int num, ret, i;
> >  
> > +	if (!of_id)
> > +		return -EINVAL;
> > +	adata = of_id->data;
> 
> But hmm...
> Probing this driver without adata is strange for me.
> How did probe this driver ??
Thank you for your response. Unfortunately, I am not aware of
implementation details of this component. Coverity suggested that there
can be a potential NULL pointer access which seems logical to me. Do you
agree with coverity here?

> 
> Best regards
> ---
> Kuninori Morimoto
