Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B454FF2A6
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43C218B4;
	Wed, 13 Apr 2022 10:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43C218B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649839813;
	bh=m+Yh7lmTxwBcL8BAh8m5z47aRAGmVij+wlbpkRySIQk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHIOlwpsw6CMiuHlxnrqAfiqqP8DqUPiYfUjHGWqjS1vbdhkBApzekp044YZwapJN
	 HO26s/ln5ws5+rdoIzoyKs2GUIza9w5e6tVlA07z9vUBO/5dyQp/Nctwzh532nKhmY
	 i6icpSylg0Z29Qp3NdcqfIdMKH0inBhqwzMBhwto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6CA2F8011C;
	Wed, 13 Apr 2022 10:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40D8DF80248; Wed, 13 Apr 2022 10:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5A0CF804FA
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A0CF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JIbqyng6"
Received: by mail-ed1-x52b.google.com with SMTP id b15so1489398edn.4
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vnyM2Iiv5ssFwZ+YfhSIPkTVc84CfyYTFaqlrMujJwU=;
 b=JIbqyng6xlRV93M1Iu4dTb27ybe+M5EN2beeOTia2QovfKwHZWLGjr66cUx0YdX3/v
 8nbu5XWVqbuUMx1VHW7Jp0LjTMIRW/JvtKlPAPwmC12IguAK8nAZjvST8nPijS6soEVz
 lCEGXpJKRGImWyHRDfmKyn0IwmzTivzO/Vs8MDv+1cJ+MoZ5YxwAJ+kc5wqtfsrfRjlw
 dl24/2CzxrUZbd2CgYUV995GGUYyvDMWOghjruTd1pRrJ7LcOsA6BV8p7XbkZUzO9Tat
 9Hf6SigjF0nx23JEKIGKUT0nPYsQzEA7bWg8dt6IDJV7Ni9PpqpqRJKKkXLn7s8NY1Kj
 Fn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vnyM2Iiv5ssFwZ+YfhSIPkTVc84CfyYTFaqlrMujJwU=;
 b=O5ro3EADZWLIBrxh/yCwaKyGMeJaCPcZCRQK1OjG6BF51rtYHMgj0RGLm+7o6hU+6i
 I9OcFanuUn9bct+4+aErFUvbwUhzdNcLJEOAjXFArkzqz795HSa6qEl3HxBu+kEMLUTj
 x+jA/ZABebf9o0/aw1VLYYLHT3e9x+/yNup+fT+gK1Zn9yhi5nGo9Zn7jZWMDMMNg6j1
 eAhkMuUW7tqPdmsq0I/rVsVzaVMP1XYDjqDdvbXrHZx/IQQT4bQzhkIUGvoywWm5T4yp
 6n+vo4XciW7JK6N2ZCnltvrkGKqoVsnclbTbjaF/m1Ejj/JMa1Kwea8sIRIISotBcXrU
 k99A==
X-Gm-Message-State: AOAM5332KTNplg26eBvHV3NAs/NrwLvQZXOdfN+wVGiKYxSJ8gP214LW
 0c6cfkJ0UWsABhKEeuRxv2EP+w==
X-Google-Smtp-Source: ABdhPJwtqQ40ij3I2sXCRUOzsMpUdkisZ2t9soK7OyZx79O22lSzuKtXAWN17iTj1ggfo92pAD3X0Q==
X-Received: by 2002:aa7:c40b:0:b0:41d:9886:90a0 with SMTP id
 j11-20020aa7c40b000000b0041d988690a0mr5089328edq.275.1649839258932; 
 Wed, 13 Apr 2022 01:40:58 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 o15-20020a50d80f000000b0041cc1f4f5e0sm902910edj.62.2022.04.13.01.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 01:40:58 -0700 (PDT)
Message-ID: <f967f1b2-80a2-8418-d5e8-1e2ac41730a6@linaro.org>
Date: Wed, 13 Apr 2022 10:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 12/12] rpmsg: Fix kfree() of static memory on setting
 driver_override
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
 <20220403183758.192236-13-krzysztof.kozlowski@linaro.org>
 <OS0PR01MB59226666C2C6805C86304BE586ED9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59226666C2C6805C86304BE586ED9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 13 Apr 2022 10:48:43 +0200
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
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

On 12/04/2022 16:10, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the patch.
> 
>> Subject: [PATCH v6 12/12] rpmsg: Fix kfree() of static memory on setting
>> driver_override
>>
>> The driver_override field from platform driver should not be initialized
>> from static memory (string literal) because the core later kfree() it, for
>> example when driver_override is set via sysfs.
>>
>> Use dedicated helper to set driver_override properly.
>>
>> Fixes: 950a7388f02b ("rpmsg: Turn name service into a stand alone driver")
>> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  drivers/rpmsg/rpmsg_internal.h | 13 +++++++++++--
>>  drivers/rpmsg/rpmsg_ns.c       | 14 ++++++++++++--
>>  include/linux/rpmsg.h          |  6 ++++--
>>  3 files changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_internal.h
>> b/drivers/rpmsg/rpmsg_internal.h index d4b23fd019a8..1a2fb8edf5d3 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -94,10 +94,19 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
>>   */
>>  static inline int rpmsg_ctrldev_register_device(struct rpmsg_device
>> *rpdev)  {
>> +	int ret;
>> +
>>  	strcpy(rpdev->id.name, "rpmsg_ctrl");
>> -	rpdev->driver_override = "rpmsg_ctrl";
>> +	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
>> +				  "rpmsg_ctrl", strlen("rpmsg_ctrl"));
> 
> Is it not possible to use rpdev->id.name instead of "rpmsg_ctrl" ?
> rpdev->id.name has "rpmsg_ctrl" from strcpy(rpdev->id.name, "rpmsg_ctrl");
> 
> Same for "rpmsg_ns" as well

It's possible. I kept the pattern of duplicating the string literal
because original code had it, but I don't mind to change it. In the
output assembler that might be additional instruction - need to
dereference the rpdev pointer - but that does not matter much.


Best regards,
Krzysztof
