Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9658878A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 08:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDCEAE8;
	Wed,  3 Aug 2022 08:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDCEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659509069;
	bh=lVrGcLXwITMFn42jTe7hGOmaK75KG+JT54l91ZaHWlk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzJLGOY9P+ErEr0dRbGrgIEDx0x/A9j4NgzxkuEUfjtjZZZjPFnAQyBbFjXXhd6om
	 Ddel/CR+/ixTQ6hQsOYs0VjElbEeF+9vDs7ETYji4q3Rb6w/c8qG3v/Rg6Er9pGWCD
	 MrYhGYXKiq8HgLE9501PaPMi0GP0LhDR9s0tI8VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CFAAF8025E;
	Wed,  3 Aug 2022 08:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36268F8016A; Wed,  3 Aug 2022 08:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92BB3F80083
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 08:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BB3F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rz4fhTJj"
Received: by mail-lf1-x133.google.com with SMTP id y11so25011728lfs.6
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 23:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YPyZ/5jDGoYJjTJ3nEHyxJaux49D3WMMU242glD7bu4=;
 b=rz4fhTJjM1z6+rlJ/vmZDpb7yVg0t/jcOe5ktbgTOhqSV5DzMibRkL3ck9nmU2WrvF
 aR34oeHMnaFyBapPMLX878HW/6TVKBhYqiUYfz+asKZZ6P1V+T7G1YvI05I5EI6MCY5P
 UufW1Tbmt2OT+cCGdrjVYGeYY5VZytRbHq7Tvj9DrexcIIvXX483ppgbLfYyahirKrse
 Is1DqPETNIg7gYKcHheNEAOA9WZkYdet5OuLj3pAx0Xlsm8+qQ716tDp2r/yKv6EIDI5
 h2nSVvZDfpN+vAaZ03jaVtCTLFlgnerDcJRGDJKCbBErufXNBfl4PLJRu//Q8ehrELM1
 1aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YPyZ/5jDGoYJjTJ3nEHyxJaux49D3WMMU242glD7bu4=;
 b=79hIqO4ZVrqKpDgX9NqFLEywvWt/JXIaGoHy1GA3wpO+WSSWW5DEZ3b2XDbXxCfvh9
 iX3/F4uJU/e7G3VIVm7peEwtyH/S2QsAxGFOWTukHn3a0nk+rX+UNv4IV1Y/w/7aFcSS
 wXCNGwN60IL4k3ut/rvy1ds2pT7hb23Oyiml9ohucux3eB46L8yd3fGPSTCFJ4N5UZNy
 DZIfagrBoBPs2vFgzSUVRJg5h40fqaVz5EjHW53XTJjoP0jyYsUN7Optk9sK6cBUzcSA
 0MPNktCFwdzISooPdmsVw4vs9vTq6C0WtsbIpUCQlo2F6MDpeM2Pif+kqyAY1U/jP39d
 GQSA==
X-Gm-Message-State: ACgBeo181jhikQG859RWEagnBaVobp+uZGEr9PaxIlWhDkqqaSqPZyb5
 E6M+/37EKQllGdkZaCXERdCGLg==
X-Google-Smtp-Source: AA6agR65PjRMDWnBtgA7U9my9Sh+AZDKEFZf42vyzdvodCMsYMVa30uCiPRsDvaF1Pn/vDEdOsAFaQ==
X-Received: by 2002:ac2:51ba:0:b0:48b:18ce:5722 with SMTP id
 f26-20020ac251ba000000b0048b18ce5722mr1140768lfk.301.1659508998241; 
 Tue, 02 Aug 2022 23:43:18 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a2ea495000000b0025e505fef30sm886298lji.63.2022.08.02.23.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 23:43:17 -0700 (PDT)
Message-ID: <f7b98f76-521a-55e7-d012-d11ab6c1de89@linaro.org>
Date: Wed, 3 Aug 2022 08:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] ASoC: dt-bindings: fsl,sai: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1659443394-9838-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1659443394-9838-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 02/08/2022 14:29, Shengjiu Wang wrote:
> Convert the NXP SAI binding to DT schema format using json-schema.
> 
> The Synchronous Audio Interface (SAI) provides an interface that
> supports full-duplex serial interfaces with frame synchronization
> formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> 
> Beside conversion, 'fsl,shared-interrupt' and '#sound-dai-cells'
> are added for they are already used by some dts.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
