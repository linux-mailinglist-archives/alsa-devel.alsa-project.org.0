Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501145E6F3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 05:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FCD18F8;
	Fri, 26 Nov 2021 05:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FCD18F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637901900;
	bh=CjaF03uJsVcKGCXedxk3OMWrrlaG2+n0yt2SRiO3304=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2z7Q3Gyn0qZ0pKzRCw8tL7JpKXke22N9TIkwVokIJF7mnV6lv7vQxZjd51B8uGno
	 Z+HY3/F2TRcMNXzxebdHKzcYVKOg95C8/txxYXxjpazsrQevzL5JRxIumjNS4eZhJ4
	 G7jM4vRoPQllGVRpkomGj5iVri3SXtwxojRVSZgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90C28F804E7;
	Fri, 26 Nov 2021 05:43:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94DC1F804F1; Fri, 26 Nov 2021 05:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E62EBF804EB
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 05:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E62EBF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="p/HPnND/"
Received: by mail-pf1-x42d.google.com with SMTP id r130so7767075pfc.1
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 20:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gwJIiwnisD6cF408GW4bOCdNiOevm+kN2DCfktfQz/4=;
 b=p/HPnND/JDqjAz5osN2fiqxWxjwlxeukWlCnWFYdia3ksPcLdj2T2/w7EYHHk2wHzh
 8NoOKsyeh7nIRO3jA2Qp5+Zzr44CZP9J0vSuGvhzzd5Ul9T7StHo8IKBzGd2fG7GtWDY
 nTuYDnPwWGPJ6wmjXG3VlLZeKT3MdPKSc62rgr6+X422bqTD4m2MyX/LeNEwCfWWPAmJ
 WL1g3/QQ9L7Sk4aUC+UtrkapDFWHLz0QFTssZtHaZhFkEONtoJXKH8XKz0xoFpLLMfX9
 T9eYriy9fff/4MdXaIi3AukGZ6kvEwLf0KIs6V+L97ucwyXzlqO5xkmijlGi/tylQq5u
 qsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gwJIiwnisD6cF408GW4bOCdNiOevm+kN2DCfktfQz/4=;
 b=AMa6wCBvN6r16CF4F6Km985yP9+DRZyXQy5KiYtNSHRVu27+puyzZ/JwBh+ccxfoTQ
 4BDArKyIzKypeyVdZGxd5AGtPqfjApg/z/5v3lU8qQB5wJrKsaf/wP+jNGn8h7S+Z1Fi
 vW4AGQSQ4lcpOZ1aOQP3IdKfF/1b0OQU/mATd/hWA0wjpJAWgN3qp7i89cD1i7HRpymC
 vcNKB2zHtqHJBRyKcnLTj4TvM9AdxDtHHH1QM9AOustuJnZ73JGMbbnygBt85+2pFuF+
 olh8IRla8eT1QvVCMRL8sXP9rEybF+RltzsqtcmT84gAxOZxwCUirfjjSDUN1NN5hK55
 zgMg==
X-Gm-Message-State: AOAM533CHCMNyP7cuXLpiX1hHDcxf4hq+dbRWiX3KKmPbb8+OxwatLP0
 8Mzn9Rfuc4713WkIwQlSq3Qjkw==
X-Google-Smtp-Source: ABdhPJx0FjXR51YfULBYoNlN6azVm4pmsK/QdHHWCakrLIU0+ikdrQc99GBXkyRgdyNDpZyG+Rly5Q==
X-Received: by 2002:a63:150c:: with SMTP id v12mr19528275pgl.442.1637901808160; 
 Thu, 25 Nov 2021 20:43:28 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id g9sm5600382pfj.160.2021.11.25.20.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 20:43:27 -0800 (PST)
Date: Fri, 26 Nov 2021 12:43:23 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v4 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaBl66b7VFJK84F4@google.com>
References: <20211125122925.1303-1-allen-kh.cheng@mediatek.com>
 <20211125122925.1303-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125122925.1303-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Thu, Nov 25, 2021 at 08:29:25PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	return (readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0) ? true : false;

To be concise, readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0.

> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "no adsp mbox register resource\n");
> +		return -ENXIO;
> +	}
> +
> +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);

If using devm_platform_ioremap_resource(), it doesn't need to call platform_get_resource().  res is unused.
