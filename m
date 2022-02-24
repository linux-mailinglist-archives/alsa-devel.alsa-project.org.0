Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7954C45D8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:18:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF6881B62;
	Fri, 25 Feb 2022 14:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF6881B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795128;
	bh=0RvjZd75tm39j+FFlMx0cFBcKP2t9f9NBMITmIFUvfU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+3sYNI+JUqr3HnOHKPKoMD8kKunQP8HYppGTAD9nPOAhWwF6HIoS+hDoVWNYrsGU
	 df1DqHU8PDxVEARa2iDPPHZje/QFu8UiwBVno06DV0V/M/hA/0K4fCR2DUbRdxWj8W
	 J/vGPZMFFeBCIUilI3R+AxvdJwRlASQ43/aDB0ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D60BF805C3;
	Fri, 25 Feb 2022 14:11:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3409F8030F; Thu, 24 Feb 2022 08:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA3EF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 08:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA3EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="sKjdcD/Y"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 270E63FCAE
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645688958;
 bh=tIIHXtnNxTvsUSqBUvFfmiqo64/DEPmMQ0dgIpM1aoU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=sKjdcD/YmBWVXlhrij7viD3S4uNn+RuV5laaHQ1vc5WyM0uqFtUGQtIbNV+llwbUC
 9UNmfEQkBfWALYiN0K+a179BF4kGRvcZ7DkztreA8e6qHodE2UL/akATM81hnmQEw3
 pg8SZBHEPpHuNdPS4nksfGJlREzTtlI2e71sJ1eJ+R9Eqijvu82lVD4YhERT1okRZY
 w2ZC99vYWlHTxl7wcLKfYKZsqtAzjQiZBAAtS87slP8qgnAEfYnMx+saEKWQON4soT
 IgWyLyXj/uSt98+jz21ITfOs1AdcfxFJimpKmuoRpfRNcxz/TNUgm0utWu0KzRIEkF
 MUoKj8hDzPBcw==
Received: by mail-ej1-f71.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so822068ejd.8
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 23:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tIIHXtnNxTvsUSqBUvFfmiqo64/DEPmMQ0dgIpM1aoU=;
 b=SRSvW+DBUxR/VvzpdQO7Hul5j6RO4RG07by9VtST1oxsjWVavhFAhUGH9Zfw8vh0Jr
 ixJU5nkeWE3snRJSBxZ/F8+a65y1Y1dY3q9hHXIlVV0WUMYjEwiAmEDDrNpkZpOVxkrx
 lkJyghtC45w3uNDSwFxORVNGbbVlGHDkV7AuPzCsinbZjzbM+DO29lUJb0hkAuYrK3Dj
 NXOzTVy6OCBLBYw+XoKR7RgyMiz7nyxfL4nMvxvYn75EnvMSFxYt6dKdEN3YOaiDxs8T
 0qzpSBMy7oHUYckJcHkoUPzUm0V8sImVkE1yhjAnr+GKnubdAz5yiPX5Hnwmf1kw547i
 /5qg==
X-Gm-Message-State: AOAM533/lijNQsB5MEdfxajsvnjcDbWlNl+Jo1UTnxGi431bsJV74MbC
 aNfeV+r/hCSz6OjjgNOpU6AAdJ3OG2AG03pDqJNukTyoXhMCHmfIrvJVz2XObxhL/ksXo8OxgAV
 BykQrRoaJk8KKreS0XdpcHVx78B0cYpohJg7oowB7
X-Received: by 2002:a05:6402:177b:b0:413:2822:1705 with SMTP id
 da27-20020a056402177b00b0041328221705mr1116410edb.270.1645688957131; 
 Wed, 23 Feb 2022 23:49:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ4T6vTJDSRNBttoRjN0CBDIUiJLcd/AByD7b5Uhgs6BBbS824OeS6Yj6e4iHov1EozcksnA==
X-Received: by 2002:a05:6402:177b:b0:413:2822:1705 with SMTP id
 da27-20020a056402177b00b0041328221705mr1116367edb.270.1645688956871; 
 Wed, 23 Feb 2022 23:49:16 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id s15sm954628ejm.70.2022.02.23.23.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:49:16 -0800 (PST)
Message-ID: <f7347531-8aa4-c011-d405-dea93e29779f@canonical.com>
Date: Thu, 24 Feb 2022 08:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/11] pci: use helper for safer setting of
 driver_override
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220223215115.GA155125@bhelgaas>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223215115.GA155125@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
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
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On 23/02/2022 22:51, Bjorn Helgaas wrote:
> In subject, to match drivers/pci/ convention, do something like:
> 
>   PCI: Use driver_set_override() instead of open-coding
> 
> On Wed, Feb 23, 2022 at 08:13:04PM +0100, Krzysztof Kozlowski wrote:
>> Use a helper for seting driver_override to reduce amount of duplicated
>> code.
> 
> s/seting/setting/
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/pci/pci-sysfs.c | 24 ++++--------------------
>>  1 file changed, 4 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>> index 602f0fb0b007..16a163d4623e 100644
>> --- a/drivers/pci/pci-sysfs.c
>> +++ b/drivers/pci/pci-sysfs.c
>> @@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
>>  				     const char *buf, size_t count)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(dev);
>> -	char *driver_override, *old, *cp;
>> +	int ret;
>>  
>>  	/* We need to keep extra room for a newline */
>>  	if (count >= (PAGE_SIZE - 1))
>>  		return -EINVAL;
> 
> This check makes no sense in the new function.  Michael alluded to
> this as well.

I am not sure if I got your comment properly. You mean here:
1. Move this check to driver_set_override()?
2. Remove the check entirely?

> 
>> -	driver_override = kstrndup(buf, count, GFP_KERNEL);
>> -	if (!driver_override)
>> -		return -ENOMEM;
>> -
>> -	cp = strchr(driver_override, '\n');
>> -	if (cp)
>> -		*cp = '\0';
>> -
>> -	device_lock(dev);
>> -	old = pdev->driver_override;
>> -	if (strlen(driver_override)) {
>> -		pdev->driver_override = driver_override;
>> -	} else {
>> -		kfree(driver_override);
>> -		pdev->driver_override = NULL;
>> -	}
>> -	device_unlock(dev);
>> -
>> -	kfree(old);
>> +	ret = driver_set_override(dev, &pdev->driver_override, buf);
>> +	if (ret)
>> +		return ret;
>>  
>>  	return count;
>>  }
>> -- 
>> 2.32.0
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


Best regards,
Krzysztof
