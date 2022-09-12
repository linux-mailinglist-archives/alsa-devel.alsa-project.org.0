Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938925B5559
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:27:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1768C16CB;
	Mon, 12 Sep 2022 09:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1768C16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662967644;
	bh=by8t1WIr46BuEy1QdaFZZdhGy0uS/RCcCK4UN38eEKQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puSUQQBqdmEweIhs4RXY6NpeXvYWiJ4bwnuCPy98Ax6jeRuO5u6KnNbjeh0Z9JJx6
	 /vYFPMCfDe+dqtmUz/3mX51u3tCsjTgrgSfsYJ5q61NhmoKtKpZFf4Pzlmkw2MVnm+
	 srzS+LtWuZqWH95Ah3ghybRPxziA+0qq+CBW3C8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E21F8020D;
	Mon, 12 Sep 2022 09:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5CA9F80095; Mon, 12 Sep 2022 09:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51244F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51244F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="Z4QmvTFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662967581;
 x=1694503581;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=05diJUZu/cyIOJ1zFesddsZ3mo/aGhYsxj011+saq28=;
 b=Z4QmvTFMV4XDw8cgmsL0YmWCo6dUNu3R6dxAj/oQpWwlGKAoEyAERUwK
 x6AaZctEcHN3CXuK39IRBaFIvMZSligVPxDmvqoRuh2gj0eb4uOa2vACT
 fhBr00ILHUGF24wOKuptB8rdFktz/KLAE+bmkbqWEybvw1GY+GJZ98wNb
 VPDVIcArxQ9u9ZzoaWSzXyIzNct8CJ0nGzmwOSyCPwocRFgLzA3PKMGMK
 O0IN0c3/NaXfX5uaDn3jV7pgltbIPaSfJLhEEGwPaa6Zf0ZpDcfE22rg2
 njUwI6dDR360gHgjhKJnFy0g1Wpuf+NNznuhkb2jHr4HeJf3rzgZYBQvU Q==;
Message-ID: <d521d40e-c79d-b044-44b7-6f10845f4268@axis.com>
Date: Mon, 12 Sep 2022 09:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
 <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail05w.axis.com
 (10.20.40.11)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <Astrid.Rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, kernel <kernel@axis.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Hello,
> 
> It's more than one property and many other patch submitters were using
> this reason as well. As a result, few TXT bindings grew from 5 to 10
> properties within one year and there was still no conversion to YAML.

> 
> I understand your concerns however I have stronger motivation to do the
> conversion, than for accepting new features.

I agree, I will do the conversion.

Astrid
