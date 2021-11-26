Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A4445E6F1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 05:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5347C18E4;
	Fri, 26 Nov 2021 05:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5347C18E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637901876;
	bh=TDwYnwqapzz4q+G+mih8il/d6D9oROepfoVLcSuav0Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9uC0GuL3/b10PwrpKNvjwPf8K9HAs/a+WMzGbVOGf/crOJIWwzNtcBgghJk31xkq
	 IF2Xs331x+iOD+fO0Sq3KbtZZEeOi7bIcU0ELWcWLodwiqtBarBcjArKjYXGhlBCrh
	 qjUs96ydg18lu5Y33sjSNsvbgP5pb9SHmwnSiNQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B236FF80259;
	Fri, 26 Nov 2021 05:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B17F80212; Fri, 26 Nov 2021 05:43:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F130F80087
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 05:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F130F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="OMrr+Nwu"
Received: by mail-pj1-x1034.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso7201395pjb.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 20:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2LgS2eMeGMdnukM8cUoBve3IMu8b+A022tBUdPAN3OI=;
 b=OMrr+Nwu0J1jMehGE7uVSNYBlFIZq8YEo1TshuWAuOw8rXnVxBWCnOTWjX0tJ8xk/B
 p/Y59W0vsB2Wi3nvclkhheA1yJPtWLGCQz5/4tkKL1gPMOU2yaJCZLPkduIJmevR+iY3
 vswhEHp1va64ULvN+IMrCNIV1d2YA61/uy2GPkHqP2FTr1PXJiPtEZ0UPZJBgLuBmyBf
 y8cGvCCOLzRmUZVK5fD4B7khJLpGmSqs27GzUwOIZBA8TW1UWIdSWXg5lNS+PXZKiJBG
 i8E2GgHrlX/vOX7yqdeWm+uof9bMapyGZc8cAcILcgUrEmOl0V9Ycq6yjJMMtFtCKdRx
 JRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2LgS2eMeGMdnukM8cUoBve3IMu8b+A022tBUdPAN3OI=;
 b=HpaH4p/BJLx9hr44UD+pI3ZUBcrDXadLUJnpXbIPy8JqycHwb8iIR3lfpTHbnqDfWd
 W9qhozXc+aD4g0nwjAFm59xdmqP7UnpdQA/Aa3yOd4i51Vx+1F67XZpyKeziwOpTCLKH
 VbJL9nsUvnUzu2wn5C25ELVofnMtFP3WczxNQjqC5yLvSV1AZcJfDhvp+NHTGFfRecez
 5mvW1y6WQHqgeu146Pv9lPQuVTBVab1EE25iJIzXXikfspAmWlF5VqLsPYGjeouPdS7U
 8YhAHPtXGglDFFa6dLsf8QxQMJv3KKaX70Op4c0gb2NHNvuIpvTiiQZNgtUBNsOPNvPm
 8wHg==
X-Gm-Message-State: AOAM531XZNvH+NBPXjkESXixaIV0IPTauzsYsFOtU9ADpze8eQl3xEVW
 6zygP0z/1YELarmzIiTYFoBFUw==
X-Google-Smtp-Source: ABdhPJzHNlb6Iu4GBBMDy3fHylI190Sir9kysQUFJV6XRqGjoRO7VKp/xNJdJgj00ozyg+MXwQzm1g==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id
 q16-20020a170902789000b00143c4f759e6mr36149485pll.87.1637901788687; 
 Thu, 25 Nov 2021 20:43:08 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id o23sm4843770pfp.209.2021.11.25.20.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 20:43:08 -0800 (PST)
Date: Fri, 26 Nov 2021 12:43:04 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v4 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaBl2PMPHnOMGKY+@google.com>
References: <20211125122925.1303-1-allen-kh.cheng@mediatek.com>
 <20211125122925.1303-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125122925.1303-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

On Thu, Nov 25, 2021 at 08:29:24PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +static void adsp_ipc_recv(struct mbox_client *c, void *msg)
> +{
> +	struct mtk_adsp_chan *chan = container_of(c, struct mtk_adsp_chan, cl);
> +
> +	if (chan->idx == MTK_ADSP_MBOX_REPLY)
> +		chan->ipc->ops->handle_reply(chan->ipc);
> +	else
> +		chan->ipc->ops->handle_request(chan->ipc);

Using switch ... case ... makes the intention more clear.

> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
[...]
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name)
> +			return -ENOMEM;

It needs to go error handling path.

> +static int mtk_adsp_remove(struct platform_device *pdev)
> +{
> +	struct mtk_adsp_chan *dsp_chan;
> +	struct mtk_adsp_ipc *dsp_ipc;
> +	int i;
> +
> +	dsp_ipc = dev_get_drvdata(&pdev->dev);

To be concise, I would prefer dev_get_drvdata() inline to the line where the variable is declared.
