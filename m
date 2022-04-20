Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A050B91A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13890950;
	Fri, 22 Apr 2022 15:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13890950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635458;
	bh=Xfgc7L1yl3wVP8IOuGgJy32k1i00yu1ezwhfE9sCA/0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5sH1L6913qgg5bpbXaDZEZGrq+PdQrZ876s7tHdWvKmW7WQeFE8wUw2x036Yy/O5
	 zkMdl9FBWHeYvW/2qRIqm5wRhgkYgQ8Db7xblz4vIv/t/f1rng6jn8jhVFiAr7d195
	 XBJO8sOtBop2aPpTmpsOGfW8tbSMPbVN6prDSiqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3B3F80815;
	Fri, 22 Apr 2022 15:32:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E1CF80125; Wed, 20 Apr 2022 11:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D82CF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 11:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D82CF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rSRtnZiF"
Received: by mail-ej1-x633.google.com with SMTP id lc2so2167089ejb.12
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nAIc8jlNaoNP4j8LrfgKPUem0987eG/5mImWoVHHT10=;
 b=rSRtnZiF0xfnneRi/FQEzgnTo4L29Yzksiymt9g7h909EamxwG1M03+cfLGJz2BCOj
 30CAL0kYOBVzStPIrvYb0monKtCFSnzsD3kwCqSU+bWHouMJvSzgKzZ6TdGkdgNy2yzz
 C01rq4MLEeIVrGL5bI2/gmeJphR7o7jGVzdRCQK8jV3eM/SIu9DarQScr8dPeApgsm4q
 PVkvnWdJ0MciYcWlYYKEOAtj/lRtmYDnu4oNkN19u4GUIU3PjvK/cEdkwCiD73LdOoQg
 xyjB1TqyC1taYNXURg86XIpc8UnubKhBcODOIH7ohGWzGoAIPK9A3eD02O9kuRE3/jfE
 /lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nAIc8jlNaoNP4j8LrfgKPUem0987eG/5mImWoVHHT10=;
 b=0hhnBo+Rz6K3vHlrQQkfrTRswNP094cRZPcdB/Hb/yAnYsMnm9S7VJMif++DMe9oIF
 LzgTk+U4sJ3S6AHkAVsNar/VM4vU5rPMtI08qcOBmJi5xbfJJ4DZ9UN5CqPP6/rwn4ar
 eSHMdIMyTPUAcdJTgHg0nuNzxm2LF6o6F/TMCRHZFtzgBoGRdLfVtHYuG+zY6aJeXs9c
 7MWprjDNmJP15ua5mNfTqoCnaLkf9eiApJ3+GXz3SsfN/ILiWKITrop0eKabCL+4AOUp
 ZqYyQOy9mZQhx18PlCEVQd6yPxITvJ1w0esMyCRFeFj8BksahTd78IH4jAmw03BV6d3K
 XYWg==
X-Gm-Message-State: AOAM533pdxb5hMPeJbCHqQyh8iNlU4t0ZMqq+8FrcrRF5vlobosmq2Q8
 /MMmTJzdhi7pgkSCeQ/1/daTVQ==
X-Google-Smtp-Source: ABdhPJzOe0WrGTYQeCapieJbroGE75Jk3m16hGQK/9UYOPl2KmErfi3BqssRPBI5BShzU5h2D40NFw==
X-Received: by 2002:a17:906:7a51:b0:6e8:8e6c:f182 with SMTP id
 i17-20020a1709067a5100b006e88e6cf182mr17160922ejo.506.1650446408596; 
 Wed, 20 Apr 2022 02:20:08 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b006e1382b8192sm6643906ejc.147.2022.04.20.02.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 02:20:08 -0700 (PDT)
Message-ID: <529de1fd-7e98-1634-c61e-0e69ddcd9e73@linaro.org>
Date: Wed, 20 Apr 2022 11:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 00/12] Fix broken usage of driver_override (and kfree
 of static memory)
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
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
 linux-spi@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
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

On 19/04/2022 13:34, Krzysztof Kozlowski wrote:

Hi Greg, Rafael,

The patchset was for some time on the lists, got some reviews, some
changes/feedback which I hope I applied/responded.

Entire set depends on the driver core changes, so maybe you could pick
up everything via drivers core tree?

> Dependencies (and stable):
> ==========================
> 1. All patches, including last three fixes, depend on the first patch
>    introducing the helper.
> 2. The last three commits - fixes - are probably not backportable
>    directly, because of this dependency. I don't know how to express
>    this dependency here, since stable-kernel-rules.rst mentions only commits as
>    possible dependencies.


Best regards,
Krzysztof
