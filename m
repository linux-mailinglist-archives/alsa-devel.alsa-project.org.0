Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 281174C45C6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A84AA1B4C;
	Fri, 25 Feb 2022 14:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A84AA1B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795043;
	bh=uqjpTJBe6Nd3FiRBa+U7F3C7jNR3Aug+GJtadAQXnb8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKZVi4OQg6AwQ9zOqf7ZpIcqk//KQzG6avw0SN6EzFH/4EH2fWRgsombuml04H7cn
	 0e/4FapHLwP+XuzP882A5LYapamxHOYnRHuw7K/WOL4uyCQKEIZ/q3fHJlljAdGv7j
	 i/NWl70CeFhNeR3Y47QQn9ar8UNYPkr23f7HW3nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D557F805AE;
	Fri, 25 Feb 2022 14:11:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F878F800B6; Wed, 23 Feb 2022 20:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61527F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61527F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="cy9Wv+0v"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 778133F1B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643958;
 bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=cy9Wv+0vhqnXSv9NeqPwVN+8P8tUU+VhrO0gfcF2TXQYDd4ldCmwikslo8eH13Qu0
 exBF63/YWYp1t3o/gbMobOPB3eH3gczLv1axxGas7fLfK2fj1wKj1wfTf1KgputaTv
 Rp0iqmZNPr5guOvLKnkRJtBzVicWfLS5yr5KYRhPlmWEZ9/10a6GNK1NEq01vm/w2H
 0+UicL44kjwjixuVodUn3CnpyBOUkkaVKda+vdSi8sxlxo6JXMHZHBjiplauqBnutn
 wKDAWWwQmhmvAVFaWs346ZBSD8jN7GvjNYtls3pfo1FrpD/qpOHECsB0f9SBhLzRvt
 HkGbuS0DGGPTQ==
Received: by mail-ed1-f71.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso14062850edz.14
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
 b=AjUFYztI+pjE9s3U4p407a27gTjiJl2goYafqQWxo3gXYl9TnaEaNtRZ8uj/fWD+/8
 MjsoYkvQfBYEEoLoaRnoECamAMRfT7Se4ir5JoAk8o+UxBAkvzQM32Q3rl18zE3MEZuF
 8l1tPxKxzSVdJrkq7oKnyTaWOe9/aPGQ6OzismVi5nNd3WbEiq5p7UpEY7C95WzxIoJz
 IEHFhGwO7Cv5CN3K04NYWDpw+4tL1ATnh/v6Zat5l1/Hlln45LagG2zYegqCqn9wdMgm
 fjsKQiKJNZCTmtxnvAeLtd3HlHs22CL07H0axVHLA2W3+aySwMPIQP4/SRj4XCCePsWn
 nYLA==
X-Gm-Message-State: AOAM532RQME22EMJB5OrerFVqrFQlOmACV9/4OjCkmYuGM/3MO9Bd432
 Z8f58Tlfr8nxFrjdMeirkPCZhUUwg7dj5bcm0wrYjdo1VDBp8ecXtL+aISb+i1N8BpMHqoB7WlS
 mGiYTrdK9o/I84MLnmeWLk1462GxO3wlLDx7MlPy8
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id
 l14-20020a1709066b8e00b006b91f27073emr863443ejr.361.1645643947976; 
 Wed, 23 Feb 2022 11:19:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ9QUyPanWfiXE6vKIo8o+c2pwl8ckmaYif3CteDvcltA9YiJZAZD09dYlCxpl8UKoIvZBag==
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id
 l14-20020a1709066b8e00b006b91f27073emr863390ejr.361.1645643947743; 
 Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id x14sm302707edd.63.2022.02.23.11.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Message-ID: <31c4f987-6480-278f-1d49-02bd611b521c@canonical.com>
Date: Wed, 23 Feb 2022 20:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/11] clk: imx: scu: fix kfree() of static memory on
 setting driver_override
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org
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

On 23/02/2022 20:14, Krzysztof Kozlowski wrote:
> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/clk/imx/clk-scu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 083da31dc3ea..15e1d670e51f 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
>  		return ERR_PTR(ret);
>  	}
>  
> -	pdev->driver_override = "imx-scu-clk";
> +	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
> +				  "imx-scu-clk");
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;

This is wrong - should be ERR_PTR.


Best regards,
Krzysztof
