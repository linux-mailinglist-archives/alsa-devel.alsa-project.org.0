Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14775BF936
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 10:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B6786F;
	Wed, 21 Sep 2022 10:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B6786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663748906;
	bh=Gv2sf6lMKv2UdKNv0z8IaLXyrae+GO9mLoIbaFCaa3A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUDEOvJ1ZJ22351y5q6WA3oGLpp61n9bekdyoU4cFZrilAYvFZ33LrHZwjuSbU/8F
	 3ieTsqxskp/MJn2lLdMDEOSy6xZnPeE6zdI3tzd5yRUKXsxl/EWdPOnWj4Zg9JxCAv
	 0r4j8vmTIMFjzYs+FT6Ea/DrVuKN4GZu/MPTZcS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FFC0F804CF;
	Wed, 21 Sep 2022 10:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA13F804C2; Wed, 21 Sep 2022 10:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A923F80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 10:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A923F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DziEZGWt"
Received: by mail-lf1-x12e.google.com with SMTP id j16so7984211lfg.1
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gY2lzq3N2Qe2ssVBMXnL/s3SN8sMkBLrkElMWRrbxsA=;
 b=DziEZGWtHcHI4L/Gz3wfDxdm66CUhwr+qYwy2jz88G11sb0IHdQPEg0QPm9mNALHFi
 WCWgcC7pK3OrLLH5jhaZk1rPcM1wn3HheatWrvhwTM2BUiHTGwZUVsiYGuumE5KpUABx
 e4HHzRHWaE0XysvOCB8tZzUJgUd1PpPUw17eV7/L7fvGTpSirkV7oVGCnRupcQUDpYuw
 EfGz0Y6NgEJOX2b6iGU5LaKH5eT8Loc30hfbaQUgtiRI3YpQKbA7KXwoAvgSretfdhJE
 PKfzKPRx4R25Z4Y3QC1grCq5kHAsZB47xjyeSC8h7W/9l40YVzqZEmYdstJ3jgmDJmeH
 6IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gY2lzq3N2Qe2ssVBMXnL/s3SN8sMkBLrkElMWRrbxsA=;
 b=Lhtms5nIH6dxUw4xwYtIUywjIevZHPU9RAfVLvBEcJyIVvE2iAghV9Os4ZQfH8Rrm4
 yBp3EIW7sPyULhkw9kEwaPAYFrNfxTVHRerveZw1duYbQ4DtuofblMUcS3eb/eaAYzJC
 jVi74qylPwdfDkat+QMY0gQXGouXCdTO4bXYXV79glKwwE28MC5KitJb2/6z+Ef/Be7P
 oJ5wm+KC7YtZmnNWsgpkCE+bYR34cG1sz9TzLbjOpPEbUvLmQ8tZg+JcDxN+dO5RBvD7
 Te21B5AT8WHDHy3Ir8NI1UZJAvxzKHnZaIJwRCppg16YMi6iAJJCRlyzCf1hPhXEdfu6
 lHQg==
X-Gm-Message-State: ACrzQf2HplUwH8naWaQVx8VrwLlgyGQgYgNun0HwcJz0VXsUSDDL21Y6
 /Kg3j8TaFoRi5g0pJ/lkLg2gLg==
X-Google-Smtp-Source: AMsMyM4pf0Cx6J3kAlAnrQDlQNIDLladkdySQ9qoP9yZpwNjyJlZIkYXTUAypORtMZkYYohrGTiAkg==
X-Received: by 2002:ac2:4d2b:0:b0:498:fbf0:4f89 with SMTP id
 h11-20020ac24d2b000000b00498fbf04f89mr9327153lfk.500.1663748830232; 
 Wed, 21 Sep 2022 01:27:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c20-20020a056512075400b00492e3c8a986sm325857lfs.264.2022.09.21.01.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 01:27:08 -0700 (PDT)
Message-ID: <df77a1d2-ee85-75d4-7341-6949d5b82ccf@linaro.org>
Date: Wed, 21 Sep 2022 10:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/3] dt-bindings: sound: ti,ts3a227e: add control of
 debounce
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20220921081834.22009-1-astrid.rost@axis.com>
 <20220921081834.22009-3-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921081834.22009-3-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Astrid Rost <astridr@axis.com>
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

On 21/09/2022 10:18, Astrid Rost wrote:
> Add devicetree parameters to control the insertion, release and press
> debounce times.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
