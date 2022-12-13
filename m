Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C705F64BC32
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 19:38:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19B8184D;
	Tue, 13 Dec 2022 19:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19B8184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670956733;
	bh=D1CofjcUsIPcXJT6fY4rSM1BnQcKyqAtHG5KaTJuTrg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iuotERWO8/X3HcwpM7LDcFv8O9qnEoxJ1TFyoFayYaNF3l+mgJcLYj6zl9a8+8UbG
	 tLuOKdsIQosmscyBscwNY3w5qbP1Y+irsoHivFbYdMHLxXCH6Ywwy9XutUNw4pm5qW
	 d4l7FB+xKrG0qpPWcnfzLliWepSKWee71zx1+BGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66AD6F8047D;
	Tue, 13 Dec 2022 19:38:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D93DBF804D6; Tue, 13 Dec 2022 19:38:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC5C7F804D6
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 19:37:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5C7F804D6
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=XrBbWdcr
Received: by mail-io1-xd2d.google.com with SMTP id h6so2174494iof.9
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 10:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zVw/Ub8n925hTRnFdUzvOTA/UBWQnS0OdDCK00ziL7s=;
 b=XrBbWdcrYPzuedqF0FgemXWCGtU7UrqvPAsmrbFXqGYJ28FAp6XGTo5oEn8x273sqU
 1n/9Yzgl1P7zdafD9gaHuWhGonKRYglyMefa//+e41c5/9SaL5CtXhV701foySxdl0f5
 yRDHeGzCpWk0jJ3+phN5yr8QuFGKRgubk9o+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVw/Ub8n925hTRnFdUzvOTA/UBWQnS0OdDCK00ziL7s=;
 b=Pl6O14Ek0xv4yqwjJnWL0R6RVXf1ea2ilAKaAdzSAvNDNPZI/Pm/TDL7Y1VGlWrK7w
 Yu6PJc3h//xNHLsJxe0dkV5cnvxWcCDe3Tl+rC9tYssWLCu6XB1U5T09gehGX/KMFODq
 oxMyynfMqpcijVrOkITN9x5SdXG0Z/qDrsKKU5as1MVXQzNdwwvso+0Kf9sv7PPvCsNl
 eFdZ7rOMdaqwryJPupllglXr+gv0/gjAhOIb6YX5yvioHywHkf6OHXkMcO7sbwRtNO+K
 DzIixYm303szpekc+slenvdUhNuZL1k4K1W/l5KUqr7whIh+FMQ+0SbvI+qNAIxmAbs0
 IWNg==
X-Gm-Message-State: ANoB5pmjbIp1B3+wI4GPXhcyNG8qkkP2ZDI/QXSl66f2XTZRquHum67Z
 2CU+1L6mmQ5mR4+C/gube0+m0g==
X-Google-Smtp-Source: AA0mqf7aJOMAxmp4CXqLPZfMIko49C01+d4Mm/IeX3PQ/xS4thygg7ozqQaxaFm0a2G0H35SvgIdew==
X-Received: by 2002:a6b:500e:0:b0:6e2:d3f7:3b60 with SMTP id
 e14-20020a6b500e000000b006e2d3f73b60mr2036775iob.2.1670956677330; 
 Tue, 13 Dec 2022 10:37:57 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 q18-20020a0566022f1200b006e2f42a30c2sm3596261iow.35.2022.12.13.10.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 10:37:56 -0800 (PST)
Message-ID: <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
Date: Tue, 13 Dec 2022 11:37:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] kselftest/alsa: Increase kselftest timeout
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221213183242.1908249-1-nfraprado@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221213183242.1908249-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 Shuah Khan <shuah@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/13/22 11:32, Nícolas F. R. A. Prado wrote:
> The default timeout for kselftests is 45 seconds, but pcm-test can take
> longer than that to run depending on the number of PCMs present on a
> device.
> 
> As a data point, running pcm-test on mt8192-asurada-spherion takes about
> 1m15s.
> 
> Set the timeout to 10 minutes, which should give enough slack to run the
> test even on devices with many PCMs.
> 

10 minutes is way too long.

> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   tools/testing/selftests/alsa/settings | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 tools/testing/selftests/alsa/settings
> 
> diff --git a/tools/testing/selftests/alsa/settings b/tools/testing/selftests/alsa/settings
> new file mode 100644
> index 000000000000..a62d2fa1275c
> --- /dev/null
> +++ b/tools/testing/selftests/alsa/settings
> @@ -0,0 +1 @@
> +timeout=600

Adding timeouts like this especially 10 minutes will increase the time
it takes to run tests. We run the risk of people not wanting to run tests
anymore.

thanks,
-- Shuah


