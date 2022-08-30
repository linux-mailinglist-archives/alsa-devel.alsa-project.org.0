Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD795A6AE9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 19:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DADFA1687;
	Tue, 30 Aug 2022 19:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DADFA1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661880982;
	bh=6MjfTfaZ4QLLNQjDtcLgGu373t2zKk6/koDJeuFCOck=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B63DzykV/+Zmznxa1CeWdMO/wUdsFpov4aVbnu4R91RZxYw/nrp9SN2g4JASvj30r
	 SHmCBVaqQV+KCeFGpJpf41688//8bJQ5k8gZ7oTsx526xYkfZkcBXkItwS7koi/joK
	 Y9rBDDjJGTptjXOiKzxjBAsDWDnogbNHYM/QzWMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F2C7F8032B;
	Tue, 30 Aug 2022 19:35:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2B9F8023A; Tue, 30 Aug 2022 19:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B8FEF800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8FEF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K8NWIl4e"
Received: by mail-lf1-x12f.google.com with SMTP id bt10so16529434lfb.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gNZdcqkFwpNa2I0ZP3eEeP6iX1q8vNso/HI+NR+Wx8E=;
 b=K8NWIl4eTtxKMgxcHr0MIzPzdVgYSCUCp81ghSu7meddtK3chMXIKr+qwyWbPJGzmG
 8W3xXxN/B51i//ogBN8MeRMD1mToPV2S7fIdmrWGHthGbGQQVaE+LvCi9YmHAnelefy/
 TmfXzAeyUnlChV7q9cYDO5sL8XsU6HiMfyNLN7Vo0YHxcj6trabCeHTss65VulL76M9b
 X1p+mVUnZBCMN6lTnUa7SR14LqISxxeEJmj7dw0rlWcmMdHUNK0fp4q8qHoSTtokjWOV
 8WLvrLA3MTAMEb/eFPgmmQfnlWXo1Z9B//6B2lGFbGKsX96lem68ssvamyYoeJNlBmZs
 uQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gNZdcqkFwpNa2I0ZP3eEeP6iX1q8vNso/HI+NR+Wx8E=;
 b=eJlGtB367frcQZLDoD8mtcQP5dvZoUXmeB6QuQxT+phQ4WUhJvrMwv1137SfZlna3u
 JS8JKwXuu0w9IKWybalhG43qOwQLuuvTFo/t9EIzP5sVhfKrwz7QYHAQjAqeuABmbRDi
 UQV/GcL9IZNgAFtj6GStSQIiLsRk4JkBC0APNdGptlR0XQTBO6J7oz+RWqI6AIweEPmy
 pzqlxVxfwmz5wRZFHwSppUzXkKP2QOg/f9o2FG4b8pzdY7qnQQr4CQ5bESyU8F9loYDF
 mMRaXiKTdbbnHapQNLPFynjUAYsSACj7QhTYDJ7e/tch+PExGvnr4FRgHNJea2GwGRBL
 N+Hw==
X-Gm-Message-State: ACgBeo3GbKpGdXkJWF4XWHnO7CqAtJT0O3jgFph+ttLCphVpwYqIOnCC
 K/H+InN8XpM7z6Vw4f3NeHyiJQ==
X-Google-Smtp-Source: AA6agR6TqO5OOu79KvMsRgImLRyvGwihNJE/dbXQVJ4Zf+PE3vnSCPfDI1eQNKvWu0egoLgfX/vldA==
X-Received: by 2002:a05:6512:1686:b0:491:3199:d407 with SMTP id
 bu6-20020a056512168600b004913199d407mr8192887lfb.476.1661880911305; 
 Tue, 30 Aug 2022 10:35:11 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b0048b12c4c7e6sm636622lfg.12.2022.08.30.10.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 10:35:10 -0700 (PDT)
Message-ID: <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
Date: Tue, 30 Aug 2022 20:35:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 alsa-devel@alsa-project.org
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On 30/08/2022 18:07, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.

Thank you for your patch. There is something to discuss/improve.

> 

>  .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> new file mode 100644
> index 0000000..0cfc07f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H6 DMIC Device Tree Bindings

s/Device Tree Bindings//

> +
> +maintainers:
> +  - Ban Tao <fengzheng923@gmail.com>
> +
> +properties:
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    const: allwinner,sun50i-h6-dmic

Put compatible first in the list of properties (also in required:).

Rest is ok, so keep the Rb-tags you already got.

Best regards,
Krzysztof
