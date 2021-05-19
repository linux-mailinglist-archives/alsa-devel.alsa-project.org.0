Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E940388D6D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 14:03:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860E5168F;
	Wed, 19 May 2021 14:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860E5168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621425783;
	bh=5TYJLePB9w7vwUnnwlWdEs6SAS/qkRk4BvHe1+6ytRg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aD/uhNotI46ETBHF15e6iOJ4UomGyzSH5Qe/jkoeYv6t80mR6zlpJNakVTVu1UG97
	 IS99kdnZziulR6ntERR6t727/shjAQLL10NCjtBN+n7pWW6yUboAbJxX3T/mjVszFs
	 e45l7VpqdSCo9E4SK/IeSHhufA8+saVwOVuuHzjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E9CF80259;
	Wed, 19 May 2021 14:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16057F80258; Wed, 19 May 2021 14:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B35EDF8016E
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 14:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35EDF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PNDLiEP3"
Received: by mail-wr1-x42a.google.com with SMTP id r12so13753479wrp.1
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DTl0F3yp42r8Hj6JjZeWk7rdRBuq5rsdsLvB4gVnalA=;
 b=PNDLiEP3mR0Zdz9Tvm97CMbIjSWSVT2j2gI+KaqNxAfI9OVufIdc69haoYSTswemXG
 IwfZSqiL1ytBvX548Td3QL1KkFx/rPVXVS3gNKRPjDqPAB8tPMHePzGASZAzKVlLSo9N
 FnKI0qr3y2EUYg46bQNzWVK8tm+XUCfVafq6XHHM9ULoxqb2ABLj0pnlyLdIkzmtMQK0
 nA4N7/RzWdFuN7+iX6FXUD8QTbwFFnLSDiKo/o5vnDyWpC09Lv3vl56T8YPcM8rfOaRC
 y0MqFjYqCMn7gumguRN5t6OWvfY2SbJI83MsS+h5DRjyEjxgAqNCA9KNguIyqZgu96Os
 4ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DTl0F3yp42r8Hj6JjZeWk7rdRBuq5rsdsLvB4gVnalA=;
 b=NPdzaOY5xOXtmZk8QnCaYV5hnkXjDLjIU+HEcsNkn8gDIFiSQHJuWXbzQFVZ+HUVOs
 GHErlyZJu84wAJPqhxARnz6g8Z0BW+1kROcPXkSqY/Mhba33tSXmLrEkds7cJN67aOyh
 HXTGIfAIQ4wrN0VWWsEPCnN/WAASMKm5QRww+bEtIoBOENdjtqEQop0y4naXU9IQ1wo9
 Z1C3wTlV8Z1pC07z2FiErAUHmbzePp1Qg9cUpjxfO0NI03t4tc04EhEUqmvIljr+6+9X
 iKF1nRHcJpAnpSE1XBHkL+e1j7x2Q3KNuaI0cCY3GzbanjFS605E2M/DtW3VoqcIrTlV
 a68w==
X-Gm-Message-State: AOAM531xLakEjlLYDiSSCMtMklWibEdii6Ji7G2R3g6sbyc+4Dtnznvy
 AqpmGRavHWjdaYI/SHdWW2DBKA==
X-Google-Smtp-Source: ABdhPJw3phIJj3ZJW7j3BDfv0U37nRSkdLSUimbXSjhW9l+GHM3Xs/G57Z9R43uvGvB0XxQ0EEKZzA==
X-Received: by 2002:adf:d20a:: with SMTP id j10mr7729779wrh.188.1621425680724; 
 Wed, 19 May 2021 05:01:20 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id y14sm25819485wrr.82.2021.05.19.05.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:01:20 -0700 (PDT)
Date: Wed, 19 May 2021 13:01:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] mfd: wcd934x: add additional interrupts required for
 MBHC support
Message-ID: <20210519120118.GG2403908@dell>
References: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
 <20210510091239.2442-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510091239.2442-3-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 10 May 2021, Srinivas Kandagatla wrote:

> WCD934x supports Multi Button Headset control which enable headset detection
> along with headset button detection.
> 
> This patch adds interrupts required for MBHC functionality.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/mfd/wcd934x.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
