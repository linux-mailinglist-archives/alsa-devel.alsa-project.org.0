Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75734DBFF2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823BB190D;
	Thu, 17 Mar 2022 08:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823BB190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500686;
	bh=MgO0bpb5ZIiUeLRkUv23h3XJ5Lr/GWqrOxnl60QHGIU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUuuYOZMPtxLk36FZ+fIrlYDcALIrSXffODv93efWmlZAiZgDa9NS2IGFJstZLZaF
	 wEYmQ+xSOi2bDdUg2g+oe/PnZdgW4j9BO5ChV6+Dg37uXVy7Fm+TBCrQ/4mk8mK96v
	 8cQTMGA1qEQT+roIK9RvLBkEmJEJH+yN0Ol+CydI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A75D3F805F7;
	Thu, 17 Mar 2022 07:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F126F80095; Wed, 16 Mar 2022 20:38:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E83BF80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 20:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E83BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="qsZipiOR"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B05E3F5F3
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647459493;
 bh=6+h9BeibtnFt0Fy4V0bEz+bagkoBJTSRfdm71NC24xs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qsZipiORv/nFk23zk3TB6ijV+rP1RnwVvsblAxN7JTa7UKNvcIIpSQZeStEwJRTNf
 EtYuJqzoGq8sLvWf5DDEd3THm1iEA/ryQaqR1AmmRcpvqyHHNfZLkkvkL41ExUXecG
 Wtz1tcFBdnOxadFd2DCXVuH2TFC7/m7d+vlVCGNpY8PUcycZloZw3U7dSe40gsOuBp
 OWbvjWSYqF99PqGONGin62JK0xf/LyFYf8F3stWMw6/EUSwf7jZcRxKN2Jjj0S/PZx
 lskY7xlovtPVUo3Jkzu++rCS2OfQ25H2UCHTw5cYcyqpLD6GRhvyLGxj8zidm0EA3K
 UDk2pXdpdxunA==
Received: by mail-wr1-f71.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so880898wrh.16
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 12:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+h9BeibtnFt0Fy4V0bEz+bagkoBJTSRfdm71NC24xs=;
 b=znoyihkmpxqZ/OvExVz/LLRPdiaeaPgSHZDXtQjgv3lotNo22w7cQS69m7COSLCc0s
 V3VPPAW8b/U3wqCKE8dn3vRrzdBK1nzuZ0CdQbqc6cDX/RQWwhF7auvKLo4VFnsPdDPI
 RKgd0TwKD0o73fVIapzh3jxHWbabXqVnCIDtyntNSKgZTV+DDNJMCFNnbLdnNXK8ZpUh
 KOaTdgrk5x68Xt13doMUkaKVVwDF9/qjFEph234jlcWM0vzH4OCvlgAIZvbxcDIoJVcU
 o6TWIGIKM3WA86farY3bM7ljNJejS3yXLtvAaJ2HaouA22e8Okno+R34VCRkJ8IeYeEU
 wfxQ==
X-Gm-Message-State: AOAM531vboao95uwxTy9gvgZzA51KPrmAXEXxsijWz+v18VKfM2QaSHI
 9DXfiuToq33fhrmczIV+abnZNcXKuB/aqAormL4Lzg4KT49aXC42nsJJGkDs8IhJZz/mmjQTqSB
 l+PF6b1GjPqRMhA1wgGAkDDqzFBb63oZ1RQ4RzvGt
X-Received: by 2002:a05:600c:4796:b0:386:45aa:667b with SMTP id
 k22-20020a05600c479600b0038645aa667bmr1045831wmo.104.1647459492728; 
 Wed, 16 Mar 2022 12:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz2q+ZfMVNL/xv6DCH0VHKA2cCReGbKqid/bgaItjng219g1bFLER3WRAwMzoyrwOoAn1bTw==
X-Received: by 2002:a05:600c:4796:b0:386:45aa:667b with SMTP id
 k22-20020a05600c479600b0038645aa667bmr1045789wmo.104.1647459492463; 
 Wed, 16 Mar 2022 12:38:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm2300253wru.75.2022.03.16.12.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 12:38:11 -0700 (PDT)
Message-ID: <0cc4e90d-c5e5-e6a3-6cc6-23d3058b9731@canonical.com>
Date: Wed, 16 Mar 2022 20:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/11] rpmsg: Fix kfree() of static memory on setting
 driver_override
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
 <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-spi@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On 16/03/2022 16:08, Krzysztof Kozlowski wrote:
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
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_core.c     |  3 ++-
>  drivers/rpmsg/rpmsg_internal.h | 11 +++++++++--
>  drivers/rpmsg/rpmsg_ns.c       | 14 ++++++++++++--
>  include/linux/rpmsg.h          |  6 ++++--
>  4 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 79368a957d89..95fc283f6af7 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -400,7 +400,8 @@ field##_store(struct device *dev, struct device_attribute *attr,	\
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
> index d4b23fd019a8..dd1f4ed616b6 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -95,9 +95,16 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
>  {
>  	strcpy(rpdev->id.name, "rpmsg_ctrl");
> -	rpdev->driver_override = "rpmsg_ctrl";
> +	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
> +				  "rpmsg_ctrl", strlen("rpmsg_ctrl"));

I made here a mistake while rebasing. This will need a v6.

Best regards,
Krzysztof
