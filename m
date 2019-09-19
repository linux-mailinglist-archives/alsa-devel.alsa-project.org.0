Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B79EB74A0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10209166A;
	Thu, 19 Sep 2019 10:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10209166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568880087;
	bh=eCGZlwhZqDzMQSrspPGXQfEuM/eTaK+sZ74JtwXcd7M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnxtqYJTZIguasagMFOqoSo3pQfF/0cN9JzQO8xjUudSAaFIjp12e3oa9qrmE9OHA
	 jbUirr/vY1zXz9MqHq8SBBMOV0GQx6I9oFLxLUAAWyhjHM0KOSczY/8BncBqRQ7n0i
	 KTLdgP8aXOjS9+/dS7YOgiq4ycRu6rdLNezqOVxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 411C2F80307;
	Thu, 19 Sep 2019 09:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4F52F803D6; Thu, 19 Sep 2019 09:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A02D5F80307
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 09:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02D5F80307
Received: by mail-wm1-f68.google.com with SMTP id 7so3189194wme.1
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 00:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yy/C8I+qsXanLkKnOE9DEzrTwx4wGS6sU0a5cnC4r3Y=;
 b=IFIkcFHnpkMSMmVVNCejqOCigH8pZE5XEIZ72pbqRWYQAq4yI7qRmpyrLHeUVdc3u7
 Ilp1h4AwkkqkJ3N2qnHaPQTP4xE7DTi4HQahCic/C4J5GC8swFMCAcX15Mq8KRu7JJUL
 8crlJI+2RMCnSFP3E4LPiNlxXX8X2hwVBi4pq/Xy+R7gwTz8OtA3CU6yRtoejQuAPNwp
 KuJCJ7ircuviPlcAQObQwgyPd24ZazOjaD6/xI/ooS1pOJ5IhISm6F5r3IJsJ1py5ZrP
 k6Kpt16+b+rmtLS0zyBQ/hdL3eONJy+eAz3BK3B6M9Su5DtD86ZN1rGWdPTUx258vYpA
 ctMw==
X-Gm-Message-State: APjAAAWm7paOy6JmcjwVPpY8lhhDzJR0uus+19X/WglA/8cRez9U7PhM
 73s2ZBhBB2StSCASZJQRtoQ=
X-Google-Smtp-Source: APXvYqy2o5grp6Rt7mjN78sEBbbA8GDZ94gEvftdESomIA11VKGYguGkQaar5ppls9OkNxJQa4i9kg==
X-Received: by 2002:a1c:8097:: with SMTP id b145mr1641289wmd.29.1568879967329; 
 Thu, 19 Sep 2019 00:59:27 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id q22sm3339362wmj.5.2019.09.19.00.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 00:59:26 -0700 (PDT)
Date: Thu, 19 Sep 2019 09:59:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919075924.GB13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
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

On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> part of the wm8994 driver so they can be further handled in the audio
> CODEC part.

I think these are needed only for the codec so how about getting them in
codec's probe?

Best regards,
Krzysztof


> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c       | 9 +++++++++
>  include/linux/mfd/wm8994/core.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 1e9fe7d92597..02c19a0bdeb0 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -7,6 +7,7 @@
>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -333,6 +334,14 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
>  
>  	dev_set_drvdata(wm8994->dev, wm8994);
>  
> +	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
> +	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
> +
> +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
> +					 wm8994->mclk);
> +	if (ret != 0)
> +		return ret;
> +
>  	/* Add the on-chip regulators first for bootstrapping */
>  	ret = mfd_add_devices(wm8994->dev, 0,
>  			      wm8994_regulator_devs,
> diff --git a/include/linux/mfd/wm8994/core.h b/include/linux/mfd/wm8994/core.h
> index e8b093522ffd..320297a1b70c 100644
> --- a/include/linux/mfd/wm8994/core.h
> +++ b/include/linux/mfd/wm8994/core.h
> @@ -10,12 +10,19 @@
>  #ifndef __MFD_WM8994_CORE_H__
>  #define __MFD_WM8994_CORE_H__
>  
> +#include <linux/clk.h>
>  #include <linux/mutex.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/mfd/wm8994/pdata.h>
>  
> +enum {
> +	WM8994_MCLK1,
> +	WM8994_MCLK2,
> +	WM8994_NUM_MCLK
> +};
> +
>  enum wm8994_type {
>  	WM8994 = 0,
>  	WM8958 = 1,
> @@ -60,6 +67,8 @@ struct wm8994 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  
> +	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
> +
>  	bool ldo_ena_always_driven;
>  
>  	int gpio_base;
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
