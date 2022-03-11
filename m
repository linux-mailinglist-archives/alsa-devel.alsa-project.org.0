Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AB4D7B33
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5483917CF;
	Mon, 14 Mar 2022 08:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5483917CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241489;
	bh=XipGU6mIlcEaHKIyqiAxSzq5ZbU0Ueh2C2yOE12cgEg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCjSfpQ2b87PFOG17rg7Kvuy+t3eB7vpNHi3qA9gNK7vG+TXtCAoKvZPV/O2cPIyK
	 nduZZaTsWzKl7zmWAjkjve6gL6NI4NM3nGYjO2+H87bvPsLAkfOcaszBTreJaVdi0N
	 bv7ufKDw+U1RFopkf4yQ2KWEUDo3JrZ7YZJbl3+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA3BF80587;
	Mon, 14 Mar 2022 07:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99751F80085; Fri, 11 Mar 2022 21:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A74CF80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A74CF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JsI+MgGw"
Received: by mail-oi1-x22b.google.com with SMTP id w2so2538523oie.2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=byy3khpUB/C66OcuZpBogrh1vBdJYZWOahv4ARsAqeU=;
 b=JsI+MgGwcNWNo5mFTmDhFQFX43IPSGP8AHmpadTTq1/jegWXkSYGxRbyYSNd2GGAfZ
 QJL9ePsqy1+pQCjIkYOKeRZF/4ou56BLTl43xcIPQgKVuLYTvOOSpWVMBXvPzi3iVcEE
 M9OokvdpojzL0W3mpYKQGxN00uuF3MValP5LkZwv7tBK8MbHNCEdcUSp8EyQgNvmdObM
 dV8uEHfL0A+kbdg4/kBwvllnMdB0q6LY78GBq99WSqCsQB+n/5bFK7oLoh//RzZWPskK
 DuBKl43ZqA2bbLdc1tjjtMkwJymKeQrW5rKztLf0fnJNsCRRE5EUHhDiGz2DbwyIRrvz
 mrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=byy3khpUB/C66OcuZpBogrh1vBdJYZWOahv4ARsAqeU=;
 b=Y/xtLnCR1lClQo1OCSDCSc+fe++ikoOreiQTEspOXgFPEy4+IsgS5KdB1uEsFvGBaM
 56s6q2OeanEV51XK4hwlSFqyuB+QonJ+xwwdO242WZTgfEEwWb3HrRQVBhkw3J5xpBzN
 ty1y01ztDXbLlIg0qIpY83euY9yt+ZChassmacAHfLTkAixtJ4HAT5KUR6osqmQ6vpEW
 G9k33agtBmR+vbcKijrrnyjnfEJnBPnhBZdQkEmz6VXCy4K0qbcU4NNWhz1s6tm3EsOR
 +E1ijr4d9nob8awRHEOK7AZ+A3Y9Jh+ZQYgu+RhpEx6ZghDpjP6n65pgd73xQtoSXKGk
 7lGQ==
X-Gm-Message-State: AOAM530JBfeIhVJmIFE6EJkgPhrTmQRjlcZ29ruzXod5k2w2oLYwwilY
 3LmSvVARcnCKNBTVvGQlZYdwdw==
X-Google-Smtp-Source: ABdhPJwiCKmAYCnvMQUHkha6DRmgbP0TH7H+cC730Evh2nxJN9gacFfI6shVehimGVsKyYdMWq24uQ==
X-Received: by 2002:a05:6808:1406:b0:2d9:a01a:4bcb with SMTP id
 w6-20020a056808140600b002d9a01a4bcbmr7858798oiv.242.1647029943809; 
 Fri, 11 Mar 2022 12:19:03 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 r41-20020a056870582900b000d6cbaf589esm3887680oap.40.2022.03.11.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 12:19:02 -0800 (PST)
Date: Fri, 11 Mar 2022 14:19:00 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 11/11] rpmsg: Fix kfree() of static memory on setting
 driver_override
Message-ID: <YiuutCsuf4j192cJ@builder.lan>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
 <20220227135329.145862-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227135329.145862-5-krzysztof.kozlowski@canonical.com>
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 Shawn Guo <shawnguo@kernel.org>
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

On Sun 27 Feb 07:53 CST 2022, Krzysztof Kozlowski wrote:

> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 950a7388f02b ("rpmsg: Turn name service into a stand alone driver")
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_core.c     |  3 ++-
>  drivers/rpmsg/rpmsg_internal.h | 13 +++++++++++--
>  drivers/rpmsg/rpmsg_ns.c       | 14 ++++++++++++--
>  include/linux/rpmsg.h          |  6 ++++--
>  4 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index d9e612f4f0f2..6e2bf2742973 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -397,7 +397,8 @@ field##_store(struct device *dev, struct device_attribute *attr,	\
>  	      const char *buf, size_t sz)				\
>  {									\
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
> -	char *new, *old;						\
> +	const char *old;						\
> +	char *new;							\
>  									\
>  	new = kstrndup(buf, sz, GFP_KERNEL);				\
>  	if (!new)							\
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index b1245d3ed7c6..31345d6e9a7e 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -92,10 +92,19 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
>   */
>  static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>  {
> +	int ret;
> +
>  	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
> +				  "rpmsg_chrdev", strlen("rpmsg_chrdev"));
> +	if (ret)
> +		return ret;
> +
> +	ret = rpmsg_register_device(rpdev);
> +	if (ret)
> +		kfree(rpdev->driver_override);
>  
> -	return rpmsg_register_device(rpdev);
> +	return ret;
>  }
>  
>  #endif
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index 762ff1ae279f..95a51543f5ad 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -20,12 +20,22 @@
>   */
>  int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
>  {
> +	int ret;
> +
>  	strcpy(rpdev->id.name, "rpmsg_ns");
> -	rpdev->driver_override = "rpmsg_ns";
> +	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
> +				  "rpmsg_ns", strlen("rpmsg_ns"));
> +	if (ret)
> +		return ret;
> +
>  	rpdev->src = RPMSG_NS_ADDR;
>  	rpdev->dst = RPMSG_NS_ADDR;
>  
> -	return rpmsg_register_device(rpdev);
> +	ret = rpmsg_register_device(rpdev);
> +	if (ret)
> +		kfree(rpdev->driver_override);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(rpmsg_ns_register_device);
>  
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 02fa9116cd60..20c8cd1cde21 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -41,7 +41,9 @@ struct rpmsg_channel_info {
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
>   * @id: device id (used to match between rpmsg drivers and devices)
> - * @driver_override: driver name to force a match
> + * @driver_override: driver name to force a match; do not set directly,
> + *                   because core frees it; use driver_set_override() to
> + *                   set or clear it.
>   * @src: local address
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
> @@ -51,7 +53,7 @@ struct rpmsg_channel_info {
>  struct rpmsg_device {
>  	struct device dev;
>  	struct rpmsg_device_id id;
> -	char *driver_override;
> +	const char *driver_override;
>  	u32 src;
>  	u32 dst;
>  	struct rpmsg_endpoint *ept;
> -- 
> 2.32.0
> 
