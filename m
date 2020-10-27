Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52B29A952
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 11:16:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4763B1664;
	Tue, 27 Oct 2020 11:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4763B1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603793813;
	bh=S7dXoH9hLEQJHPq0lhO+C08SdVfS95X148VNKt45rfY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMTfPak+8HBBtQmvJVivc7zPwiCEhwiL+Z7YqYj1XlH64CfW6kshPqAxTw5CAzS0m
	 Q+jLE2IcSU5bWG4ZFXbLJx1ZGkWYJUuitvHPpBgmG04ayWUJLum8XCXLJKKU0S23Cb
	 NKsTl5PpA48QNE35KKALq+2PjhjPUEiqa5m3wflM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A14EFF80217;
	Tue, 27 Oct 2020 11:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C250F8020D; Tue, 27 Oct 2020 11:15:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DDCF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DDCF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hF0nkXcK"
Received: by mail-wm1-x341.google.com with SMTP id l15so818289wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gHiAbcgUE6039vCDjb8dA4GzP14VCVY9EpZixtfiLYA=;
 b=hF0nkXcK9hgwePiKRPR8lfCQQ3GDIFiVcGa5WS/JIHKu+QjGTC3ryFPWczqEykk485
 WYecgDpgggPvrf2tFeVcEcFWGYd1YKjRGryFoMiTHv5sQOt0zo69iwdQrc8weHxrT2vh
 JDtgUbngN67y/urWQP9WFl9+J0AH0/QLIgCxGkwbNG5EgMMJ1HeuOhfJLKxUoCcA7Qyh
 DKdfsmva1qSvwD8xqaxA8rIY8lvHQTkbyC0bM6NANACVG+poexLANiE2aRInOLedPK6U
 sG265ZGb7175ocXDJ0RD3PrF8Np4DsBjwmXcbUEKsF2fiB0q3KlIymxEO8TSgev0HXbd
 u5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gHiAbcgUE6039vCDjb8dA4GzP14VCVY9EpZixtfiLYA=;
 b=EbJQZPP3lvJdBv1pmCAH7Rx1KtjeslJj1sUlRDx738dkEWV5bFYN579jorOnRsXBzc
 9zO0PfkSsZ9v+BXaNxAMgpWkV8cSUnTlu2vqjR6Ty4c0rap+uaoqQ7p+tuPbSw7YWcvd
 UeGvr62gWyp93KVtxjOqcIhfio2bVhtdY4SxMPta/QeXuS4XWgrLNChJlPxtQvYyPm4V
 PNDstbzdltZ2XgDhnc9lceNyeUYCFf1EiLXul5VzLeOETeUjB2Po8TK3pHOxFQQjVLXE
 dQ4uDMiBsGUWIgZj7ZOelQ03kpGpbv/WPzEFFkuC7WpxR92D5+ihFO58iSfYs2wUn9ya
 Odlw==
X-Gm-Message-State: AOAM532bEHsdyCAYbsc0gsdnVvrzX3gSapzsJJMtkzCc7D0zThh6OHyw
 QiygmswF+Vc8r/4xz7VBaUT6nQ==
X-Google-Smtp-Source: ABdhPJzOrub0E7lKqKJqaFVDcABkhPY6UcydqrUPMcLUDHdwe+LMUeAB/DCNI1LTayaR+q/l3L1fww==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr1876088wmj.146.1603793713699; 
 Tue, 27 Oct 2020 03:15:13 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g14sm1382122wrx.22.2020.10.27.03.15.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:15:12 -0700 (PDT)
Subject: Re: [PATCH v1 3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets
 and route
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
 <20201026141945.19707-4-srinivas.kandagatla@linaro.org>
 <98d3f89b-8d71-e652-504b-2bb770532a09@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b6ffdcf6-4f3a-f8be-422a-4de2d304fe5f@linaro.org>
Date: Tue, 27 Oct 2020 10:15:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <98d3f89b-8d71-e652-504b-2bb770532a09@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com
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

Thanks Pierre for review on all the patches.

On 26/10/2020 19:58, Pierre-Louis Bossart wrote:
> Run cppcheck on this sort of code:
> 
> cppcheck --platform=unix32 --force --max-configs=1024 --inconclusive
> --enable=all --suppress=variableScope sound/soc/codecs/lpass-wsa-macro.c

I normally do sparse checks before sending patches, which did not catch 
these.

thanks for the suggestion, I will keep add these checks to my future 
patches.

And w.r.t comments, I agree with all the changes and will send v2 with 
those fixed!

thanks,
srini
