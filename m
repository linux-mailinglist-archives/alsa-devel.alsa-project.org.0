Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422B3AB3B7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 14:37:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9E6916E9;
	Thu, 17 Jun 2021 14:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9E6916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623933472;
	bh=8DQ/+oN8t2FbtFTCq3mgL60RlGt60iq37GdmHehix5U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQrEwCzrR38UgbGcAYyJX5AZDm/XNVsDaYTP4yWhylQsJr8ooUCqxTVHxZZwc6D+B
	 gFzz2QtuZj5bUrbSRsUgrKbnOxVSxzT2FbbBiZqRdKMWSws0nx5JFyRWKt9knIEq08
	 537GCJbQNNIqFin49AN0ZyTh1EXTKNj4c6+X+a28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD30F8025E;
	Thu, 17 Jun 2021 14:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B52F8025A; Thu, 17 Jun 2021 14:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA68BF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA68BF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OFGIo3Ua"
Received: by mail-lj1-x229.google.com with SMTP id 131so8793757ljj.3
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dr4crDlnrBMTf+FSUe5umXcnVKoUvla4lRMeoioKKOU=;
 b=OFGIo3Ua/gjCqj/ghDAl4jmcBP/nE8v8cvQCfgcRkWK6GHbU4syvujBNNEKcU+9Oai
 MVXbv1fdJkLWvmpEqeg4rTuouaL7o/YmHTotr8ahEev4ccQz8XE1EDulq+G/Xy2iohUp
 rdbEoEVhFtmCA1kSYW9Ox+o5RJINRwuId1FRRCmO9IdWwJBFstZdBnHcmR3FMMDEtzdz
 wQPl+HO9s1aeA0bjDfUvpQIC/LZd/5DFdqJxHmp0eWlF2aTNVUmGPrpePnj9zUhzvr9Z
 mtUUcId1q1/CuK+BJdPP74z/g6JeTL/+JWnsnTyt4cKkaGPD5CcGJYQ0owcjJBu/WOL2
 UBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dr4crDlnrBMTf+FSUe5umXcnVKoUvla4lRMeoioKKOU=;
 b=T4GeaZgVQ2Y61hFG/J4g1qZSoSYHIgFC+oaxXiSnBSxoRXETr0VGIBEGDg4VSD6RnE
 dwb1XZA7x3tpWUccywDVmWXFGtFN1O5XGWmsdKrjVcJiwzfYaMPkxfFzLVylyjvFp7y/
 cwFM1Ff4dCmb8L5Wf6OPhFBmDYi6h0PSpcKGJQbziaVNBdBKtGhtQLuxircfZ9jRReOH
 ECkfvZdfQ6B8gCQexYLOaRRMn7+1ir5gJWLbkM/jo2+0NBGkeF1JL+FiSsOMFBIkz2zA
 GR5lD9cswwfWhITuFyU/IAev28JJ0Y/SLJUA49zmdW3DVfMKqvxqhXVEWy0Ir7UCb+qb
 EMSA==
X-Gm-Message-State: AOAM530nZ2Xj8ILIWYVDGvhdRXfU4sDEAf28kUNKisyuUCbrUYmQadTR
 75sq4Geeb0lHKNMoKSY8IGQ=
X-Google-Smtp-Source: ABdhPJygGzpNzVkUby3o7T5q1Od8zv9KgKqVOCbAGLsqc63ocZSC9wWlHIqEovEf6kwvhrOOSN+ryQ==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr4323873ljj.449.1623933376631; 
 Thu, 17 Jun 2021 05:36:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
 by smtp.googlemail.com with ESMTPSA id g2sm564896lfu.173.2021.06.17.05.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 05:36:16 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: tegra: Add missing of_node_put() in
 tegra_machine_parse_phandle()
To: Zou Wei <zou_wei@huawei.com>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <1623929447-4335-1-git-send-email-zou_wei@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1183fa4-2f13-d44e-20df-f8c6c847e3bd@gmail.com>
Date: Thu, 17 Jun 2021 15:36:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623929447-4335-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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

17.06.2021 14:30, Zou Wei пишет:
> The function is missing a of_node_put on node, fix this by adding the call
> before returning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index 397f326..cba55ca 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -336,9 +336,12 @@ tegra_machine_parse_phandle(struct device *dev, const char *name)
>  	}
>  
>  	err = devm_add_action_or_reset(dev, tegra_machine_node_release, np);
> -	if (err)
> +	if (err) {
> +		of_node_put(np);
>  		return ERR_PTR(err);
> +	}
>  
> +	of_node_put(np);
>  	return np;
>  }
>  
> 

You haven't tried to check what this auto-generated patch does, haven't
you? I assume it's auto-generated because it's a nonsense.
