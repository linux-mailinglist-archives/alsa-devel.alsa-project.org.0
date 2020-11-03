Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AE2A453F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 13:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3C6C17BB;
	Tue,  3 Nov 2020 13:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3C6C17BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604406782;
	bh=3NlZ+D5h8ISc01PsnTF/TsVIkHN/rnwXNmz1thoJdIw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V39Rqx1DOppqYVtqacq0/EdyNw6k/6/ODY2Qp1RDxU6Inf5U3SitaBy8ZYgyp/9J1
	 h0sI6Rk64l9AWu9QBKphhWRYrOubfsx3B38m+Fz01Sy5ElPTlcuKFNRk+VgPAJ44a7
	 o/WozOJfenSJKkdOcsCYnFUzszBi02ikSdU0wG7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 394ECF802A9;
	Tue,  3 Nov 2020 13:31:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5035F8028D; Tue,  3 Nov 2020 13:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C02F80272
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 13:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C02F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iXLvMN+X"
Received: by mail-wr1-x442.google.com with SMTP id w14so18332305wrs.9
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 04:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E4q0UVRWHDw6iml+4AQxHUz2AjltU3NCXpBdYF0ga1k=;
 b=iXLvMN+XhQHAMsuAXuGCRdjjvoIuaaf1quA0mO+SCktQa3VzZIwYhBGiEhUfIbP1Q3
 mmTixznUa42MmG+ZO/uU5/onQ3JZNEW/zS0hoyMY/YGm7rPRLvxNwjB5yFChPpPut2Os
 9MKiYQ0N/ABae2iLkt01R6FnSqz7GBKF4HpaF6Kg/lX2ZUnLCbi0UosL/E8x1NnJ+0jt
 p4lRKsZitZXJTGUfMkTcExJyTGKdCNL0SWqeuqHKxovSvFyp2bf3topBR9ep1SPtajEW
 z29dYz1i+YeY/TpWuDSmrehaUkhQPFGAsitqiT6TxBa76I0QeFTY8aVUP5VioCyhNldM
 pQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E4q0UVRWHDw6iml+4AQxHUz2AjltU3NCXpBdYF0ga1k=;
 b=pva0DOsLMShSZikOYEyPsnhjghUMpcVr49mjdgla37zSBs0SLY8Pj2ZHPe6BkeD44y
 ZHzGmO5mCyCuOMbN9vPJVcWPHnVBUngeUXTiHdRsxg2ZerCzCUivS9MXEyLtu2Ohwi5o
 9tmV4WEgYK6noQP08GWbu7fYQP9JOm8p+zdvikszdieF21hhQ9keHx/R8+QTZKo5/3Xb
 DVhCbMXfThtWzvsdlUQAqs9ulKcrbg+dXfPQIn6xxj45N5ocFzfhnIJ3w2V00usnrWLR
 Iv1k+OuGWaQc96mZVmTq7uuBKRzQcHM5+xh4KfkdImZqNs8lrEjeBCY4QI0gHHlLvc/K
 R7Dw==
X-Gm-Message-State: AOAM533W+BvHd8XJHiwRe0XG8nlCegKueexK3R90JlRZWuIgO7+xMcge
 MCw47hyKV5V6VGyl123tM//NXw==
X-Google-Smtp-Source: ABdhPJzSPSDGa9kUi5UYxDLAC5pDt5KhWo2oU1jT26ssFfWZvBuXgFCXhFfMDz2Aox0CzBUWSkVFSw==
X-Received: by 2002:a5d:5548:: with SMTP id g8mr25866831wrw.364.1604406691783; 
 Tue, 03 Nov 2020 04:31:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z5sm26202673wrw.87.2020.11.03.04.31.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 04:31:31 -0800 (PST)
Subject: Re: [PATCH v2 5/6] ASoC: codecs: lpass-va-macro: Add support to VA
 Macro
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-6-srinivas.kandagatla@linaro.org>
 <8f33aac3-7a41-1482-ae8b-e24d13ba8f13@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <da9658c1-8ebb-9501-0226-613d18a3efa6@linaro.org>
Date: Tue, 3 Nov 2020 12:31:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f33aac3-7a41-1482-ae8b-e24d13ba8f13@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Thanks Pierre for review,

On 29/10/2020 15:56, Pierre-Louis Bossart wrote:
> 
>> diff --git a/sound/soc/codecs/lpass-va-macro.c 
>> b/sound/soc/codecs/lpass-va-macro.c
>> new file mode 100644
>> index 000000000000..8cb23c32631d
>> --- /dev/null
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -0,0 +1,882 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
> 
> Missing copyright information?
> 

I will recheck this on all files and fix it before sending next version!

--srini
> [...]
> 
>> +module_platform_driver(va_macro_driver);
>> +MODULE_DESCRIPTION("VA macro driver");
>> +MODULE_LICENSE("GPL v2");
> 
> "GPL" ? The v2 adds no information.
> 
> https://www.kernel.org/doc/html/latest/process/license-rules.html
> 
> “GPL”    Module is licensed under GPL version 2. This does not express 
> any distinction between GPL-2.0-only or GPL-2.0-or-later. The exact 
> license information can only be determined via the license information 
> in the corresponding source files.
> 
> “GPL v2”    Same as “GPL”. It exists for historic reasons.
