Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED55BBCB6
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Sep 2022 11:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C3A615DC;
	Sun, 18 Sep 2022 11:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C3A615DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663492586;
	bh=jHf4CK1/6PINKJbpng69MJT7gwBr9Ci49gQdk+oe9zI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eUOkWG/da/o17RlFFDV1HiiDvbQrWqwPy8/BMJOD6WRS0wJV2JTwWT3UKpXix+o5j
	 IwkFceYd4dsg9CD7R0Hb8bCE8ukdlXjXN4zJMQJmP1/TN2MvLWfE5UWoKen/RTq+Iv
	 gMaB2QD4nRTZqIj/71ZytTi06ap2umy5DJNLBQU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C43BF804CA;
	Sun, 18 Sep 2022 11:15:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80AB9F804B3; Sun, 18 Sep 2022 11:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3811F800E5
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 11:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3811F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yWULXnlz"
Received: by mail-lj1-x22c.google.com with SMTP id h3so22172810lja.1
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YAmWSRe5Gq0WUlezroDaVszGCMPa6MPQZqhM455jkZs=;
 b=yWULXnlzzU9J9JFAeAFHcF4ohsKBDJNPio3e5WVpj7TeY7ISuhXGsB1YUVhTFR1kL6
 PA7lrJ+I9T76dxdfG/Qr0jn0xmX5+ELWU4NKDmek9LNGmJI+nEc4g2t3xioT6ZFFA4Xn
 ephNeXdxFl2Ppd5TXOeWykGJeg1WKXBA0l1aMssxavcPQYnBNxfXVts0WqNRVyCtG+M9
 lf3CnmJ6f40dabdeO9YEydoIxvZX7hBgVq6GZaJKdJKq6xKLIqu5FoqhDZ+uK/abu5SP
 1hZVXt1KuZJqH5Sx9IDishvXBFA6U+0HVmqNof7RYbCOmnNLZhJ8acuAySvjyE176M88
 ULvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YAmWSRe5Gq0WUlezroDaVszGCMPa6MPQZqhM455jkZs=;
 b=p2Uqo6VJ24dUtBmMygGBJtsd68yxFnq2NIpQpKhO/Fv0V4VqGmKt3auIbagbZeFZOD
 HRK8wPsKyXC10XXyKORUSJlYf+V2gegU/fufoWkJyipo95heTlhmIwa5NMoh/WdnFDwx
 5cAiAnNO0tLSKskkRt+sEo0snFkgMKl9VaPsfK1eUe6hQx420ypBmVxSleWyw9A9MseZ
 727dqNOU2j1gOuR6r8STPeSjb7b1a/c3MqEb/Nid9Joj1F3S1SCQmD2Stq2H9ZNgt1Ih
 Ky/yqYqgTrXG88HehO5BEprA6ulI7/EJ61vfrQIpTy1BL6e1LKxTAyjBUXvpGrQdf3My
 /0zQ==
X-Gm-Message-State: ACrzQf2Zlk3YCwvz2+J7bPeFc1pGLmmIYHk6rAcLNQrh7bGbIUYiNzHw
 e3d6n7p1gUslkX0BfjdmRX8JmtinSb6/HQ==
X-Google-Smtp-Source: AMsMyM5FhRow4sbIo6dhZeJi0VQSwzplmq2oYHdLZ1viQXHQIF0nIoRivXMABx3g4iq92/PvNdreVA==
X-Received: by 2002:a2e:9ec3:0:b0:261:c893:679c with SMTP id
 h3-20020a2e9ec3000000b00261c893679cmr3516027ljk.378.1663492517667; 
 Sun, 18 Sep 2022 02:15:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v17-20020ac258f1000000b00499b1873d6dsm4486157lfo.269.2022.09.18.02.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:15:17 -0700 (PDT)
Message-ID: <d8950be7-7b8b-6ad0-5825-c090e0c9b04d@linaro.org>
Date: Sun, 18 Sep 2022 10:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/5] ASoC: dt-bindings: qcom: sort compatible strings
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
 <20220916132427.1845-3-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916132427.1845-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

On 16/09/2022 14:24, Srinivas Kandagatla wrote:
> Sort compatible strings for consistency reasons.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
