Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F8962955A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:10:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E292C1685;
	Tue, 15 Nov 2022 11:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E292C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668507022;
	bh=/VJEx2zPXl/FssLB+pGa8al5fEzaxThgltFKeYG6mNw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7O3WedoMEB0+figLh+39ssNc5LP+ySHiTt0tuocctiZmMMRmz+0HhfBk5e1JojJ+
	 xcycMlggEDxr78wkqClfBhh+BXONq8kyJn1Lb7DEO6E4YbV3bJUcDpP6Ge4C8SP/MV
	 UVl5YCu2C9OaId2tnP5ypMMaOL57Ty6gc29wtzPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D254F804C2;
	Tue, 15 Nov 2022 11:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF09F804DA; Tue, 15 Nov 2022 11:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F06F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F06F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y12R0eV2"
Received: by mail-lf1-x130.google.com with SMTP id bp15so23593419lfb.13
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AOUmTuH1DxovIPPSrXrXbTo/jLpr0nBEd6A0U8nmyck=;
 b=Y12R0eV24FDubB0shhJOzf8oE1zYR78Pb8VYghlgl7LzKoggeFyluzPHLohhbwuGzZ
 Md0oOHbWDVAtqZMygryQ5sR2HcOQ7bUOQ36rip154K0aVS2Wrw0aDtxgWVVheSeUqA07
 3pTDibaY88eCcOstBDJzXMG8SP2FZvmSlCbUMILcyfwaCafEGSpogf191EuweXURDquH
 jugf04XK0I+XBml8JiXx5pOrhUPBjlpZXkdTeFWbWgcMD0+f3enXeCZEabB2cP+2/NYG
 WRIPalNA/McLrFA8ERI7e1MRV9E0/w5W4czSfiY7d6Ba+/extkaWs7N/WQC3T74is3rx
 VCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AOUmTuH1DxovIPPSrXrXbTo/jLpr0nBEd6A0U8nmyck=;
 b=IyumD+UP+mbM5rNr6ataI+QiYm8B1WfFDSbenavIP7drl+2YmGBalFMikr45pEqB2W
 pIOxFbgcCMdMTb9pt7Ncbnk+ZbcEtQgvSXulQatPOznWeNQ6Go5EKPzCoM8q3HjutO9Q
 IdejA32BJZrUEinaB2J4tvQDWtB0JTQ39Heh2l8AKad0Y/4LQ8V+vDyxlLokqsVXd/yA
 ElxxiXURqZ1/B9k4kmuTHtHfYKMdArVIRSY9Qs9620KdxLmwygZrhjmKnQrqTJ++PGlJ
 jgM4Lc1veNFT2N/wi7EGLoLHGPPz/612mpn5FxQLORvVRzteEn9i+DdGC9FYko+mEOu2
 r2ZA==
X-Gm-Message-State: ANoB5pk6eLh8b+XrAyJpPla6QEd8TyO95SQSohagzSsqykj/7KEyTfdr
 4Cvef+S88wbYuNls4Mim//iUUTl0fZZlloFO
X-Google-Smtp-Source: AA0mqf49YdxgiQrRwadGJmJszXS52sSrW691JJpUEYEizzwtY1Ia1XfAJCWE1xTOfmwu/eiInytDzg==
X-Received: by 2002:ac2:51ad:0:b0:4a2:6e2e:2d17 with SMTP id
 f13-20020ac251ad000000b004a26e2e2d17mr5134730lfk.339.1668506961272; 
 Tue, 15 Nov 2022 02:09:21 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05651203ae00b004b497035243sm1238995lfp.184.2022.11.15.02.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 02:09:20 -0800 (PST)
Message-ID: <3da67702-ec1e-7112-bf33-8e04ee4369cb@linaro.org>
Date: Tue, 15 Nov 2022 11:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 6/6] ASoC:codecs:aw883xx corresponds to the modified
 Makefile and Kconfig
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
 <20221115022423.6437-1-wangweidong.a@awinic.com>
 <20221115022423.6437-7-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115022423.6437-7-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 15/11/2022 03:24, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Modified the Makefile and Kconfig to compile aw883xx
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  sound/soc/codecs/Kconfig  | 10 ++++++++++
>  sound/soc/codecs/Makefile |  7 +++++++
>  2 files changed, 17 insertions(+)

1. Where is patch 5?
2. Subject: missing spaces.
3. This should be squashed with previous. There is no point to have
commits adding dead code, therefore this one as a separate commit does
not make sense.

Best regards,
Krzysztof

