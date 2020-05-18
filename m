Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2B1D73E3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 11:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 004B616C7;
	Mon, 18 May 2020 11:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 004B616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589793883;
	bh=0GBsdS5YUbVYXBvFVGLUIL516riyjxRyS00K8WTSsAo=;
	h=Subject:To:References:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Z+Wdg9KTKWzmatmi/c5lmCzmJ56nfS3KgZVGkHs+Qridavuu2FZGN5kOZAXwK0Az4
	 I9299Ak7cBbtaVji9wglzbx6VtsWigTjcBjY7YN/KVdEqykrEzkhwyuPOmchVmaXZ6
	 +Zt1lpSYt7tBjQUcfdkV0RhyDApQ6qG9EtZndxWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13EB0F801F9;
	Mon, 18 May 2020 11:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD26F801DA; Mon, 18 May 2020 11:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E955F80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E955F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="drv2mSAu"
Received: by mail-wm1-x341.google.com with SMTP id n5so9495413wmd.0
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Z3XlctpSAnbYdb2+5Z7TFNZPigSvZMxY4yX670//TBU=;
 b=drv2mSAuvezl8uk9ZvXfGTMENTCqHqLeB5OLJuBjylbY9VEyWGnJcxSWFwJQdlPu/F
 MI0sf0aLcYB3VSz8CAh7zmlYeci5h117eeqYjrXYOCC+4FZogJ+cfjXmN/uxIvzq9fol
 cFdzZiynTzFtdgY8iDZ6t1CIO4hPrPc3bmZcC9ULjdAW1X/nOAWsI+Yfsh4inCax8R6+
 ZRcB3gZly/uFkn57tKqXLWK3t3WVpmcdf23zUg1kdMP3INamQ3kTEj4REZR1te4YaMYm
 sXICAkHLFkf1OhzgL2/WBxfPrH9iJGAAg8735Xtf4myhO321CZ1v7azvSTBhhkrADJZw
 gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=Z3XlctpSAnbYdb2+5Z7TFNZPigSvZMxY4yX670//TBU=;
 b=jiQG44QTnxKMaYmoA7gKUU88w5/WbYBUYP7FjjvVdnN+tFmv8ED8Pva0t5cEL8xE9O
 b1lWuWklDIrLOvvinx4GwUdqF5csy/yJ6mWOJ6t3Utp5vxk7+RzNXd6l9r2tJi5LT3yi
 39ijIy6JSBSphJlHwNLnZYeszmXoLlqG7kDAeh7Cyu93nshWa03p4NJmdwXjGak4IAHh
 3q4pKbpdeqc4S/GcvyC1sqFV2iN/M8rTb1DhhQIeSRxIp9709r3GSeWNsvQa32M+0rS9
 XELeqouzaj2y9Sjm4rdQghciyKDoHvqQ7iUAw5FTG3iVBWqwmuiXUaBMizrrZ1Gsayo9
 9PYQ==
X-Gm-Message-State: AOAM532i+4QGkVAOzuUvwZpicSgChG9bhmq1kKlXpi3NMW8xSi8jz/OD
 8t8vaT5lsgaEFJmrulpSO0bJs9n5leQ=
X-Google-Smtp-Source: ABdhPJy8I8LDsz/5SOI07W1BDAQYcizOum1eE7aOvMk3UKlv2qSI1RLiOS6YkMJ6LmH6Vrszb+qMJg==
X-Received: by 2002:a05:600c:14c6:: with SMTP id
 i6mr18126796wmh.58.1589793772297; 
 Mon, 18 May 2020 02:22:52 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 h133sm16392525wmf.25.2020.05.18.02.22.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 02:22:51 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
To: Ajit Pandey <ajitp@codeaurora.org>, broonie@kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=1d=3e_=3c1589474298-29437-1-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e_=3c1589474298-29437-6-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e?=
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e8859fcf-fc00-01fc-b64e-dba086c8155b@linaro.org>
Date: Mon, 18 May 2020 10:22:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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



On 14/05/2020 17:38, Ajit Pandey wrote:
> Add header defining dai-id and mclk id for SC7180 lpass soc.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   include/dt-bindings/sound/sc7180-lpass.h | 10 ++++++++++

Why not reuse or rename include/dt-bindings/sound/apq8016-lpass.h to 
include/dt-bindings/sound/lpass.h and reuse across all the LPASS variants?

--srini

>   1 file changed, 10 insertions(+)
>   create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
> 
> diff --git a/include/dt-bindings/sound/sc7180-lpass.h b/include/dt-bindings/sound/sc7180-lpass.h
> new file mode 100644
> index 0000000..7d988f6
> --- /dev/null
> +++ b/include/dt-bindings/sound/sc7180-lpass.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DT_SC7180_LPASS_H
> +#define __DT_SC7180_LPASS_H
> +
> +#define MI2S_PRIMARY	0
> +#define MI2S_SECONDARY	1
> +
> +#define LPASS_MCLK0	0
> +
> +#endif /* __DT_APQ8016_LPASS_H */
> 
