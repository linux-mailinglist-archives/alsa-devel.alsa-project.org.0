Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4BA2FE994
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 13:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8A518D2;
	Thu, 21 Jan 2021 13:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8A518D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611230732;
	bh=GwniMszQglKYUpcfa2aoGjvzB7XuUWi6RXaHC1wpryg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZWs0rTw6YcxdKBZxFMv5EBWiVeF5K/nQNdiXBS7HvQ6i8orc64NdXU+Pf+O9tlRh
	 lF36cgYXAeaKM/ZEKbfJDAAmzWee1TaB9kyRwagwFkAq2YpvIuOF7iFTs/pOVb1oPJ
	 1Dty663SnkrPJ35ccLNpjUJPK+UiMv0xl62+4GlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40766F80164;
	Thu, 21 Jan 2021 13:04:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF869F80257; Thu, 21 Jan 2021 13:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD6BF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 13:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD6BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zEXssm+f"
Received: by mail-wm1-x32e.google.com with SMTP id c124so1226045wma.5
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 04:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vuLJ7p5ilfIWpz7PW8WlQI72IXUVIdtMvIHeFbz24w4=;
 b=zEXssm+figj+fIPe8hEn2JG7m79MYv83+6paGQx2LUIHT8guPQSBUNuQc3+xKbL2Ss
 rxTRjElqWHDgex07G7TvnzUskB+a0tz0cvG3GnmYQjjBS7FeygrjR/H3bpLh+oulYD4J
 kZUxB0hvpmq2D3vmV17wjSBIe6VyWYlr0EA2FjkdYwouyNLoe1GH++aBdFX0Xnq/MzPs
 cbXQP5iAbUZD6v/jDWkciFxlPqK9KsQnRTncv8vAATMrsG/SU1YkyQ1TiQeUXx2PwL+M
 HaYevWr3WWDIlUBjQOC7TEanYxGtS+70GSBdYOR0ZcxLyQjIaLwIH33A+XvOAjfohU/l
 a5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vuLJ7p5ilfIWpz7PW8WlQI72IXUVIdtMvIHeFbz24w4=;
 b=P461vZ/2LgWvd9rshbxqyMpenCcwL7ZrB4/29YqKljxyU99FDmb7+r868AJ4/1Z/Ix
 aNR/4o2m5XAjKIni9xFfdSkAPb5x0HZXhXfP/5TSw4kkZFgy4Pm8sxOaFXi+KAx4z65p
 20++gQhxyxqLQ8S1xPB2mZoEUWjAxRson8Ax26NehQYnkw8EcaPEhDmioYa/zCvCOZM2
 sIAAxt5iIszUYA5ECOORyBOCGikYUgAtwFa+yG2bHe7+JkWBX4xSWMNPP1p9bRlXH4j7
 wgRLnpzW3IhYX5xkMffY68RBuLfEv75voEZj/HY2GzVhmNkEfFcqYtCdVqFZE5n/dXpq
 mMWg==
X-Gm-Message-State: AOAM530UFiJVkaoiVLTTyt82u5v4h5Duoaab4vP+jR3xFZoq5Q5+hsdi
 V3XK2jB6ZiQ4MBM6GKeM+PGpbg==
X-Google-Smtp-Source: ABdhPJyxqriq44Jy62yZDNpVCqIweGCa+fd8anF6p7WTiBOksuCirEJkV8YRgzzex/wi6ldb9flfsA==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr5969108wmg.90.1611230635237;
 Thu, 21 Jan 2021 04:03:55 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id x81sm3288060wmg.40.2021.01.21.04.03.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 04:03:54 -0800 (PST)
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
Date: Thu, 21 Jan 2021 12:03:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 19/01/2021 19:09, Pierre-Louis Bossart wrote:
> 
>> currently we have
>> /sys/kernel/debug/soundwire/master-*
>>
>> Are you suggesting that we have something like this:
>>
>> /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??
> 
> Yes this is what I was thinking about.

Vinod/Pierre,

One Question here,

Why is link_id part of "struct sdw_bus", should it not be part of 
"struct sdw_master_device " ?

Given that "There is one Link per each Master"

--srini



