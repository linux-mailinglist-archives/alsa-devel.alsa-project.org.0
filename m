Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42598F2F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 11:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32B61686;
	Thu, 22 Aug 2019 11:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32B61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566465653;
	bh=yy7xcGMK2tP9INs4wdlmproCtyalR+WE6a6C/yEUIZc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROe/yn2rIHutnX+4cXnjgFbKGzpi6EiwJ8VX52SXCjTLpNHymFRd2164ZoM2wkMc5
	 eCgB09V1KUgLhBWPXfnLFSLbD6qf3DfZfga9flK88FyLXBzaECqwZPwmwKAdvTpexi
	 PVLfCC2/LUtDSK7L3i/7WSPeyY0jMsa9H99VQOzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8060CF803D5;
	Thu, 22 Aug 2019 11:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFFFF8036E; Thu, 22 Aug 2019 11:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20266F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20266F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TUbZ+XT6"
Received: by mail-wr1-x443.google.com with SMTP id q12so4658977wrj.12
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m9KKLrIqbY97G+YHTsqbk+m53nDW2UqwwOTGF21lRdM=;
 b=TUbZ+XT64zRH29bUvN0i/pkfTQ5oDoq3voysQLVKmlejq8f7t3N8QwT1Uti6bNMT2X
 aNtXyFjHsIv6Nt9FPjZ2mdrXl16cz5U+bkoXSS2aOS2EigmniSZRVAiIIqYfUaF5EEZI
 3XJ7wB6GWL5vslhkX96ikuN6ExYzq36yPaTkWSvErHrrfdXl2LEYueeWsYsvcBP2s75G
 xzcASZGDbE750EU1CXfDMw9+R1E9cpwqy3uo6TdWZ1cG2jpFuGu5uJZmkiN4FrUDjIYc
 y1cN+ZP3qBjDVlUtvbemet0/PoOXjo4WgHdszQcvq1OtjbnJpGdSsG+WLk9nB0iYyP+C
 A3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m9KKLrIqbY97G+YHTsqbk+m53nDW2UqwwOTGF21lRdM=;
 b=q0+JfUwt9DB91coQhy32DbiYXS5QFBlNUo+u1boX2c1EPy1YENWBVq1YZbR+JVfJuY
 BXdAlAjBwa3R+oZuyK3XRLKv9ldFavo+NdkkX9p3WGeBMy9qQlA894gu72hLq9KhhHbo
 xFZj61YLjuBmAkZfZx1AeX1rpHx+aLRbdRC7SIGVK+KbinzuUD44YOrYdIGG9bLUD1I+
 a3ZHnB1GRloDjYA0pwhEXbhaZApLYLS2xPAWx03tF+YUQKVnxcWBwMReKxoqAXAkwMOE
 7CHgJlMmoTMgBMNYJ8IhbCYlUtmCviRqKok2iYrg50jqOUxoLX2lBTFC2CCL8VVWnlFi
 4BcQ==
X-Gm-Message-State: APjAAAVdrQNTVANLsA6YteMViNzhj2GmQDD4f0VU8OjVpXPGi6+gFmVn
 lt1Bkmi0IbEYqZMQ3FnIA7si0Q==
X-Google-Smtp-Source: APXvYqzOVluoLA+MQFTvG9csQYBVPHzlnPIYJG5axOcRqEmbg07SceenPRU1Pq/+XLrKpoCD4FOEzA==
X-Received: by 2002:adf:c7cb:: with SMTP id y11mr39705758wrg.281.1566465541055; 
 Thu, 22 Aug 2019 02:19:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o8sm10141815wma.1.2019.08.22.02.18.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 02:18:59 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190821102705.18382-1-srinivas.kandagatla@linaro.org>
 <s5h4l2a76qz.wl-tiwai@suse.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cd375dcc-f2b8-4953-8099-485f72f426da@linaro.org>
Date: Thu, 22 Aug 2019 10:18:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5h4l2a76qz.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Vidyakumar Athota <vathota@codeaurora.org>, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: add support for 352.8KHz and
 384KHz sample rate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for taking time to review,

On 21/08/2019 18:44, Takashi Iwai wrote:
> On Wed, 21 Aug 2019 12:27:05 +0200,
> Srinivas Kandagatla wrote:
>>
>> From: Vidyakumar Athota <vathota@codeaurora.org>
>>
>> Most of the modern codecs supports 352.8KHz and 384KHz sample rates.
>> Currently HW params fails to set 352.8Kz and 384KHz sample rate
>> as these are not in known rates list.
>> Add these new rates to known list to allow them.
>>
>> This patch also adds defines in pcm.h so that drivers can use it.
>>
>> Signed-off-by: Vidyakumar Athota <vathota@codeaurora.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> As I repeatedly write for this kind of request, please submit always
> with the user of the API, not only the API change itself.
> 
I totally agree with you.

I will respin the patchset with wcd9335 and QDSP6 patches.


thanks,
srini


> 
> thanks,
> 
> Takashi
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
