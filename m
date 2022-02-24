Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC34C45E1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F7D1E03;
	Fri, 25 Feb 2022 14:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F7D1E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795210;
	bh=EEFmPKOg6/1J7DHc+MDzPntrhtwdRtsxsl6uxLI8ayI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuhUC7IOcjI1y/Ys65KziOmThwXQIc6OjEfyAFRZROlD+fqJknd7HqRs06USBz9uL
	 kLNxdVEUpb5fPt3F7wbGYSEDuE6IFCDdG+e9vH7V2+iBQ4dGIxNPX/8ubtg0Mkxfxk
	 AvXILv/QyQWAbcjbAlSAOQM19T4GF0KAvsgiZv+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CEE5F805E4;
	Fri, 25 Feb 2022 14:11:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFC9AF8030F; Thu, 24 Feb 2022 09:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DAEF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 09:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DAEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="vGoUGBSH"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E9253FCAF
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645692199;
 bh=Dcj0D0zPsXPEVS1eNhpQqfPztDcGavIHA1/tOM5ybJI=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
 In-Reply-To:Content-Type;
 b=vGoUGBSHR0NPxOJBu6YrNJbSU6AY1ZGUAsOXmrzup0QLfiuyWIPqHJc8nqaRS553y
 3jTQmUFQhnQkW/ID0oB2IDzeRhd5hObf7NfkWnsr4XYSqHIxvHk6QUM804OiCvxJIO
 HwawE0wtB2jrkj1Cuj0+Xhq4wwnXEYUQ3NK+1swZ6qfrhhc11O9S0ZGeeN+VVo1z7z
 NVsBYtTqyaHYqXUxhtWxfnglZ69JBCEbkYkMyhYNzt9uF+R48sPOxDvEJzMb8evrD6
 piEQipAxzq/tpdM8G5o2SXUiVqF7wL5EtA0PGlT2M90BUGxIM7szEsc6B1qfLfsub7
 /HdvMa9qcPagw==
Received: by mail-ed1-f72.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so424519edz.8
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 00:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Dcj0D0zPsXPEVS1eNhpQqfPztDcGavIHA1/tOM5ybJI=;
 b=foY/2WnGEGa2wW1ocGFLliHAwJX1j9088rWilvC+1DBmaNR0T4Phk9TET9FUbMNjXD
 5OhTPeGfTT9BTsGUbUrNh9ZTA4pruW9NKTpdTX8pLYkqSoCF0ZKBuABe/LjUBWSffA6d
 pHm7vxnsBrKkSIv/dF7mBNK/R2hP1u5jITsVw+wbA9Obrq8YbcHIfGc91JzqiXceo/w1
 StQd0gcYbHhZ7B0+YkWovOndQn3y4pH0cgbPUxpU5PeSsHjm/cxmD+oF1Ko5S3Bm9ePy
 7eFLiuh+nlbweymVCbLp0+/uvm9b2otiYnxkR1i+tQojts/bRzgxd0SXeykp+UN1saCN
 sLVA==
X-Gm-Message-State: AOAM531tpQ2O3jp0VMtagBjb4OE/eacHmmdBsvt4k9Z3b8uE3WBVDKFp
 h5EiF4T2AfiX4S565TA40RZjf+MPJXxy7EiwZaocOlcyXE0GeXQpF6weJnErR2P4b7GJO1Dw6WT
 +tKMtJPZXUGBNkr4oWBsGq65iWQEOuoB1Bnqe8+8w
X-Received: by 2002:a05:6402:2744:b0:404:ba60:fec6 with SMTP id
 z4-20020a056402274400b00404ba60fec6mr1261663edd.235.1645692198580; 
 Thu, 24 Feb 2022 00:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR9ltyboSTjtHA8dcoqW8jhNMCdSS02AQooqb5CLRWmWM576orT/UQwLqy77zZSpmBsHCJBQ==
X-Received: by 2002:a05:6402:2744:b0:404:ba60:fec6 with SMTP id
 z4-20020a056402274400b00404ba60fec6mr1261610edd.235.1645692198343; 
 Thu, 24 Feb 2022 00:43:18 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id 16sm1006988eji.94.2022.02.24.00.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 00:43:17 -0800 (PST)
Message-ID: <cd89539b-92b8-0376-03c2-1a9268721b92@canonical.com>
Date: Thu, 24 Feb 2022 09:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220223215342.GA155282@bhelgaas>
 <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
In-Reply-To: <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
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

On 24/02/2022 08:47, Krzysztof Kozlowski wrote:
> On 23/02/2022 22:53, Bjorn Helgaas wrote:
>> On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
>>> Several core drivers and buses expect that driver_override is a
>>> dynamically allocated memory thus later they can kfree() it.
>>> ...
>>
>>> + * set_driver_override() - Helper to set or clear driver override.
>>
>> Doesn't match actual function name.
> 
> Good point. I wonder why build W=1 did not complain... I need to check.
> 

I see why - I missed kerneldoc /** opener.


Best regards,
Krzysztof
