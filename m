Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687C5B6879
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 09:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616BB173A;
	Tue, 13 Sep 2022 09:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616BB173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663053441;
	bh=DG0FkOWLkuAWJO6aMBVGUAyCUusmS8pp7VWMlNga8H4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRvORcS0nJWQwJZ7nQJbQOlQe4gzuuIlFBtQvJ2dDGKRridb/M6i0tU+1vAvqJuuq
	 Lckq4iXDRWG5KJTxuJdXwYE//KsIfThdvoyGhwhty3YOaYARwnLGTU3XyLRa2BdRGT
	 KC9DpJnexftTkS1FQ7aSxT5vieIGyxlfJ3IH16dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AFA0F801EC;
	Tue, 13 Sep 2022 09:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A438F8025D; Tue, 13 Sep 2022 09:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBDCFF801EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 09:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBDCFF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="XhMLQAnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663053387;
 x=1694589387;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DG0FkOWLkuAWJO6aMBVGUAyCUusmS8pp7VWMlNga8H4=;
 b=XhMLQAnMldUGeo906HtVLoT4Q02OijvWcnO76sT6hADRHDDmbmj2JBCt
 CVJAYsnXaIPDkaC/+Zs+RNiL0uzhnNU03ntamkWAIAFhEm5T7fK2aZl1l
 jKVsdM3mnZeKKFuxFiZ2zHx89C5WaUTVoU1TRFoet6nExDiNeADjbaadP
 jcilHACxenJcyOwfoNgOTsQpDrlmJiM8ddiqzp0mZKHcns1scHY0NlRvD
 23u9BVr8E8UAJqlmC+uMjzOUxPSXE4pjECfx63Wpd+AN44gHMr2RO9bDF
 Bq9cFhnVwhapIxY/XWOFDtHQem9KjXK5XTY7XmsvTR4np6+/FVktr4ZHG A==;
Message-ID: <bdfa3f29-f63d-1fb7-f37b-0b4a1f6374b3@axis.com>
Date: Tue, 13 Sep 2022 09:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Astrid Rost <Astrid.Rost@axis.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Dylan Reid
 <dgreid@chromium.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
 <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
 <d521d40e-c79d-b044-44b7-6f10845f4268@axis.com>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <d521d40e-c79d-b044-44b7-6f10845f4268@axis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail05w.axis.com
 (10.20.40.11)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
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

I did the conversion from txt to YAML.
It requests me to add as a maintainer?

Dylan was the original Author.

Astrid
