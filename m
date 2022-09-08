Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E785B1EE3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C2B1706;
	Thu,  8 Sep 2022 15:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C2B1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662643675;
	bh=HhdQoAfHQOluHhd/vBHWoTO+kk2u8gwsH0q401BU6lc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QKdFd/4bTUcL6HVNshR1UGP8eCu1Pin+ii8cnCbudyeXB8HMlMktJgfkMBXJhq0sX
	 3DqA72HFOWahVG4AEaFo/ex8g5o7/wvtrTaF7pL1krwzTD/BE+ZQIrOtJaDGTvtHuK
	 lJneuc4JL+k9pKGxVWJ+2fW0DzbVbofr0cUZyPOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E783F8023B;
	Thu,  8 Sep 2022 15:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDF6EF80217; Thu,  8 Sep 2022 15:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A52C3F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A52C3F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r1pmBWIs"
Received: by mail-lf1-x132.google.com with SMTP id p7so27712587lfu.3
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VD+nOMHXMvV5AAmfRp26GJgaJ9o+VfNSHQ2AWOhkGws=;
 b=r1pmBWIsWJq+K0n7rbneEnGiv+dLZbznCNV6ZYPcV2ap2wAZaAlBZT7SHNVpPbq1Fd
 9CLivWMA/ICIU3zszxoDmnwFIKaktgBL+IHLfubNk4NxWU95AdBKKMxwxlZ1kJzOQ7HF
 XmRJdiPATyk35Lpl6RzXk0acE1vNZzAmYw0JfiNdwL+l4D4kewMKFHH8NW3n96hQZh7K
 4e5VvSyNvtnp6vv4e6chQE4tP7I9lGTxw5ELToMQxuXNx541mpDlC3Kc8xKx/7z2xtAQ
 6Cfoq9YZ9030VD8hmlbzWCkvkL5s0818h8uj51xXQV+ltEOHSEdH+1FRWswCPo8IHlWm
 8tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VD+nOMHXMvV5AAmfRp26GJgaJ9o+VfNSHQ2AWOhkGws=;
 b=ie6SUEj+g99It1fKy/fKJTns2H2NJrGnd+SUCZ+kGHb3cfdYxakDAWk4KCvVCOgoOM
 mvKujKi/reTVH2BY3HkjiUna9rq4SoiaI+Z9uTV1T/JxJeIPtKnlsYHcf4bo5Y9sfhBm
 rgGRxnJ76r8qr2kdw/kMxbs2EQ0nDsMyb5XUd5bgilXjAQpAvDhKFFf7n54BtbCLYqcm
 P6txOLdzmya9x3a/OPLlDRd1n/GQBbyMhMYd7M4l9TLjcanaZwDRUuB0UigdwMMsMIwn
 oRL6CrSeUHG5ZYAlbzHDumU0lKTTItciBC8r3HRIpOp+4xa6Bz+oeNgG9fH9CGIworzJ
 kjOg==
X-Gm-Message-State: ACgBeo2DryaBbTb9BP5uklD87ZiN3Tx/mLLAvDz0HiGUugWGd4Ja9l/O
 G/w3kWJmTvsUvcq7zp4pfINhpQ==
X-Google-Smtp-Source: AA6agR4vSnp6D09fIExO0o9Vn/bvoYNuSPdREVzriruoBoo4kb6zOfs59Kz+utiYBTRFQkW6gAsl/Q==
X-Received: by 2002:a05:6512:3f85:b0:492:c17e:d566 with SMTP id
 x5-20020a0565123f8500b00492c17ed566mr2567186lfa.341.1662643601022; 
 Thu, 08 Sep 2022 06:26:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 l4-20020a056512110400b00497aa190523sm875216lfg.248.2022.09.08.06.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:26:40 -0700 (PDT)
Message-ID: <6cc3a526-8ff8-8000-d406-c4d8949c6f68@linaro.org>
Date: Thu, 8 Sep 2022 15:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
 <20220906165508.30801-4-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906165508.30801-4-srinivas.kandagatla@linaro.org>
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

On 06/09/2022 18:55, Srinivas Kandagatla wrote:
> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
> atleast another 2 of them for now (SM8450 and SM8250XP).
> 
> Move some of the common SoundWire stream specific code to common file
> so that other drivers can use it instead of duplicating.
> 
> This patch is to prepare the common driver to be able to add new SoCs support
> with less dupication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
