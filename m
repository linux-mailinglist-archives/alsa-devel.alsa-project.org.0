Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54255C0100
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 793E2163D;
	Wed, 21 Sep 2022 17:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 793E2163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663773633;
	bh=MAzukN2wzqcqKaTdS1lmkMJW3iRd3T1CLmBGzaJIo7s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ah0W23/2ARQgX3PX3NTmOH2rvR75OoKJ6gpEd9hiVTvt0p/IF3XJJfOPwY6wb3pa3
	 QMqVT3TAfUm6u48Gyv5ENkvNAQ1Y6YFfTWKHRlOo9O+eAsq9TZXFBO0k8sny7S5ePT
	 frHbmklJyEj1Uxe6PZxu9znza5uhRGSsLyaaUQP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E376EF80425;
	Wed, 21 Sep 2022 17:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F4EF80256; Wed, 21 Sep 2022 17:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C76F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C76F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="URPgkLc1"
Received: by mail-lf1-x135.google.com with SMTP id a2so9782975lfb.6
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0OQNwidXfglALVVRMIJX0eA8njvh8tvja1lgxaI+Bb8=;
 b=URPgkLc1/gEOLl+n4W6SG44A8sW0ivmUThd6wN1YUN4N6g3JnC2/j/1QYSftU7xaaz
 2a+TEBvw2H3iWYXTihvWlTi4WbCu0Vx0ykuJev8WVHbHOupHTP1OpyE7hsGIraPkOlzE
 VL/eSNVkW8icU54So/jIoYxDwNz3+ICSus9RWWpHKwAbNdbDH4f+4A5KZx24rWjM2cfe
 DC43cw4b0n7Jc7ymx+0uemUcdX+w2/LCn/uF/sKKhaOD0DhlUjHfOEvxQcnjglcQSp+l
 wtLLoC6MS7jOht05JoAdVj4CwHafjJHlKGcXfrpHPgggnfD4HBk9MZSlVf6TRuYVkLme
 efaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0OQNwidXfglALVVRMIJX0eA8njvh8tvja1lgxaI+Bb8=;
 b=yocrLR+BmvJ4hWMMeb+/qu3LjTkAMrQL/dn+zjfq4r5mPnXz6TSbxfw+QPVC/TumMM
 9CSvb0CMq2l4SgmhVlHlb3fplDYc2OSMx+EWB9+p8xVeFK0X8q4ah58rLyk+HBPRVs5d
 8U2Wt+8JwcRJxEeu1jcT9dICMMq8OzDznqHMuu07GmAPS7WKHcZncwvbr//8JZ2UMlnz
 L9zj3Wxu9UVKBceOu4qyrW62H8B0nB6g3r84Yp6evfVsaDWmdiasqpkoRxTQTVbQFtEK
 O/RrJJcVc7/MBVnRg8AK3TutlwHHnpwEKCnofYn5Y/GZ8LnL6T/gqw2pnsNSIPbENFvc
 y3cA==
X-Gm-Message-State: ACrzQf29NAyYPh1IyQtTrZtDVSCoCEwb685SDH9m765YPETKPWZkq4ja
 XGClKMbk7ZfjL5eiftMeeFMhLw==
X-Google-Smtp-Source: AMsMyM5W8d7QEhX0GyaMcafFqQFoeDrLIcJcGcKbJeXZ90zLpEd3zhpdII+hyLJ5GGWSp/H+vapy2Q==
X-Received: by 2002:a05:6512:3b8e:b0:49a:d2f4:6b7d with SMTP id
 g14-20020a0565123b8e00b0049ad2f46b7dmr9680650lfv.627.1663773567480; 
 Wed, 21 Sep 2022 08:19:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004896ed8dce3sm485158lfg.2.2022.09.21.08.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:19:27 -0700 (PDT)
Message-ID: <5e34eadc-ef6a-abeb-6bce-347593c275b7@linaro.org>
Date: Wed, 21 Sep 2022 17:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
 <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
 <9a210b04-2ff2-df98-ad1a-89e9d8b0f686@linaro.org>
 <fd74e77c-f3d3-1f09-2e5a-0a94e2a3eeea@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fd74e77c-f3d3-1f09-2e5a-0a94e2a3eeea@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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

On 21/09/2022 17:11, Pierre-Louis Bossart wrote:
>>>> /**
>>>>  * slim_stream_unprepare() - Un-prepare a SLIMbus Stream
>>>>  *
>>>>  * @stream: instance of slim stream runtime to unprepare
>>>>  *
>>>>  * This API will un allocate all the ports and channels associated with
>>>>  * SLIMbus stream
>>>
>>> You mean this piece of doc? Indeed looks inaccurate. I'll update it.
>>
>> Wait, no, this is correct. Please point to what is wrong in kernel doc.
>> I don't see it. :(
> 
> the TRIGGER_STOP and TRIGGER_PAUSE_PUSH do the same thing. There is no
> specific mapping of disable() to TRIGGER_STOP and unprepare() to
> TRIGGER_PAUSE_PUSH as the documentation hints at.

Which TRIGGER_STOP and TRIGGER_PAUSE_PUSH? In one specific codec driver?
If yes, I don't think Slimbus documentation should care how actual users
implement it (e.g. coalesce states).

Best regards,
Krzysztof

