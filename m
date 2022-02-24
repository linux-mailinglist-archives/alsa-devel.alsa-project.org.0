Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976B4C45D4
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:18:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF801B5D;
	Fri, 25 Feb 2022 14:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF801B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795112;
	bh=f5ppEg68WhZ2bhC7F4YLpaLp7AVr2pDblPjpsuy4aog=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSCyhY7+wzc36xpVV09AsCTFTN6/rTyPnYI1rHsRSl6sg57CdODInyUBUtG/PZwyL
	 6/HiJ9Yhu3aPKOs8yfmur9SClx8Prsvqzf4fLBF8U9Zj3otOZMSMl71/xPlI5p+Bi7
	 yTLt21oDjXZgCMpeNigR0HlXz6qX9kWBadI7dTLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4E7F805C2;
	Fri, 25 Feb 2022 14:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478B6F8030F; Thu, 24 Feb 2022 08:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A2BF80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 08:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A2BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="FOLRfkbw"
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1805B3FCAB
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645688857;
 bh=Zs4sP9i99NlTTPrJcg2NREY6h9bovqrYIvzZODv1Ymc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=FOLRfkbwBevtyKyaIaEOFJrEcXGlUuMrV7T+AFvZJ+VNvzhDZahpm6TAMUtLHgXMb
 9zPZ8obR2juBQi/IS9B1/An8KYNX5Nm3qoKst7P6S1ZNxY1U+zPx+4c2b+rk43hp2s
 UZVm9IYh+z46DyG0OXuKj4Os2Q34VHZAqympqqiwWSLV5/wV4QzDct+SX8+njHM9nB
 samjmzwIElDUdgR/OQX7P3w9ng3RUWfWpm31bkzs1BrX+OmW5M0xFLTXyTCl1CRs40
 KRp69GEEPSZ8XlDMf1wNPOymrXmKp/QwHJbbQHOTSZFjYTylD9ODo6jmvSIRDOKuZd
 vlJJz2+eocjAA==
Received: by mail-lj1-f197.google.com with SMTP id
 e17-20020a2ea551000000b002464772387fso679492ljn.1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 23:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zs4sP9i99NlTTPrJcg2NREY6h9bovqrYIvzZODv1Ymc=;
 b=4LtJLXG2oIoGFtaIZYTd4QAdC11flZsRLAYYiwGW/xYAexI04c1/rPrD8vrRDb7mgr
 70qHlJeJ7XNmmw5e50vOCe9cPMWy/GcVdj+IwLuXYdXO0XcYhSU69EDoJMBrV6p8pepE
 XKHDfojVPAg64lmKa8qggNEt9nye1jGUA7nGk65lXUeN1y6m9o0tkat4MmQBjUbOcMmp
 uCm9pMEk9J6Ch4hPIXFVjfnUtrKMWkcINTQBZWgXy2o68pyyp0QwhwtrQdkOZNTD5isK
 mhuk56p2igKqQew3AVmN/Cmx/esrydjlMS6pGV2O2YOEIplimiC/xPqgFIb4T+RbXYR7
 qOPg==
X-Gm-Message-State: AOAM533+06loIC2W+XARx5H/6CTpiA9z8UprLuAY0DFNRZLIarVmbVVe
 iyJ4rcFPr0RSbBVuqZpoDwD661d9z/O+eiM8dz0AZu+kY+pgPg2Yd/eAzERZTXOwMN0CZqXWKBp
 RAQHSSOar/W2d7HztJ1OUI2tHmmASlXqiLLG7rJz1
X-Received: by 2002:a17:906:aed4:b0:6ba:6d27:ac7 with SMTP id
 me20-20020a170906aed400b006ba6d270ac7mr1258043ejb.33.1645688844792; 
 Wed, 23 Feb 2022 23:47:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUYNmN/4hZMQwnBoVYe/1HJVh2ik7cDwSx+7g3/XCwKJDGgQtwwmTKf8PpD7KGJnApbTtGHA==
X-Received: by 2002:a17:906:aed4:b0:6ba:6d27:ac7 with SMTP id
 me20-20020a170906aed400b006ba6d270ac7mr1258017ejb.33.1645688844569; 
 Wed, 23 Feb 2022 23:47:24 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id v30sm942368ejv.76.2022.02.23.23.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:47:24 -0800 (PST)
Message-ID: <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
Date: Thu, 24 Feb 2022 08:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220223215342.GA155282@bhelgaas>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223215342.GA155282@bhelgaas>
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

On 23/02/2022 22:53, Bjorn Helgaas wrote:
> On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
>> Several core drivers and buses expect that driver_override is a
>> dynamically allocated memory thus later they can kfree() it.
>> ...
> 
>> + * set_driver_override() - Helper to set or clear driver override.
> 
> Doesn't match actual function name.

Good point. I wonder why build W=1 did not complain... I need to check.

> 
>> + * @dev: Device to change
>> + * @override: Address of string to change (e.g. &device->driver_override);
>> + *            The contents will be freed and hold newly allocated override.
>> + * @s: NULL terminated string, new driver name to force a match, pass empty
>> + *     string to clear it
>> + *
>> + * Helper to setr or clear driver override in a device, intended for the cases
>> + * when the driver_override field is allocated by driver/bus code.
> 
> s/setr/set/

Right. Thanks for checking.

> 
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int driver_set_override(struct device *dev, char **override, const char *s)
>> +{


Best regards,
Krzysztof
