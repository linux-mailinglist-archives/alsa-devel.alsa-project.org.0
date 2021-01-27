Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1507B3058E8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 11:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C80B1739;
	Wed, 27 Jan 2021 11:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C80B1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611745029;
	bh=4fQU5iO9lle6b7JcQic/ht0mGeuTa1EeYcopFTMz6dE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRCrdjnWvyuDR3DbWoQzDNHkDJ1Bc4EDKRY68EBV8y3j8/h/gtFDO5cuV2r/KzfGG
	 Bto1RYP/lbnQ4uORytBQN07+1MV+V/F/mjbHV5BzCWMCTHWKUjmXCckI0nrsmGjm0U
	 QPgFXKDZHiG+Npfg2TgAXi8erUFw5eG2G7WpClko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CE3F80269;
	Wed, 27 Jan 2021 11:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1746F80269; Wed, 27 Jan 2021 11:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82777F80259
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 11:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82777F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pNrZuakh"
Received: by mail-wm1-x332.google.com with SMTP id c128so1227997wme.2
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5ZypdbGue2nFWiMnP3sDxiiEiuMQbxRDc+4h+Q/e794=;
 b=pNrZuakhy4nMglczzFTxUJnnX/9b0g7MGkGsWCJ84IeQcC8u2mhBI+a4Wcw/p1b4yH
 4JCC3dw6bgLAiAQljagvI4VsBiR+Usw6qrCYpm+VaPyUh+L60ix3fmTqRQwsrll6ZwHQ
 AcOKpudZCn6/StlgzEnqWKLmuEG9Pv+bCqc1iX5lfrj5KUT6LSnH3d4xFpojxm+eqzh7
 fCJ9vFjx4V5ka9riCsTNExqUB4jP4x0qNDUMkisfVsLICGXn4TWmw3GPDzhNH7F39iYX
 Nv5SRtpENSirwyBD+YR7NcFCr8zp8EE+jG7PyuxlHKDbLA9+jti28l6gOwRhYVZyH7ZR
 kwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ZypdbGue2nFWiMnP3sDxiiEiuMQbxRDc+4h+Q/e794=;
 b=fPZ+mWvrUqoiLxVjeAaHKGOUJBwCO16NMon9XmrvZY6kILfcIgBkpGqbXsWc66pNYs
 vk9J7MuW/x9assuirQmT18V4qvnyPxkC8Px/Ja0ht9yMVpaKLN7PolET2k5CbTIP9gH+
 yiwt6NatsJLB8oc96JL4qY2bgwU9I3PgQoKxLGCpbdR8Hsqv+jHNc3TGvnSzfOVt2l6m
 a0msYJDGaCbcI+79GWYPtaiYIduEPnpDCntITl0J5qEnk7/4wC2RMDsn3Nc9A6PSbjgH
 xOLTYO2160YSIjSC5yW8GuRFvzBGgFWYZMFFmQw0Gx9JlU36X1/ZiDVpcg3mtdQJn9Lc
 PdSg==
X-Gm-Message-State: AOAM531Bn1A7HSay6le6olG+oucPFbxdtI5qLAflsYoswq9yeVNpbw8y
 7wneGeO+j//rv854cBKYg3L93Q==
X-Google-Smtp-Source: ABdhPJze1zv39dN3foB3pelQvWpQEDLYXG7Q4xIRAOPF4Qy58C+fieDmIVrY+Znepr5x1AX+M8whVw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr3651337wmp.156.1611744966607; 
 Wed, 27 Jan 2021 02:56:06 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l11sm2375202wrt.23.2021.01.27.02.56.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 02:56:05 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Remove bit clock state check
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210127063038.1399-1-srivasam@codeaurora.org>
 <16199fa8-7a87-6e7f-9db6-1d5cd8493d4c@linaro.org>
 <d33fd359-9dbf-b03c-ccd1-d93c7d207ccf@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0bdf2a43-799b-1c89-940d-8dd0f54ab24e@linaro.org>
Date: Wed, 27 Jan 2021 10:56:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d33fd359-9dbf-b03c-ccd1-d93c7d207ccf@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 27/01/2021 10:54, Srinivasa Rao Mandadapu wrote:
>>
> Actually this is MI2S OSR clock disable on failure of bit clock enable.
> 
> Do You think it's redundant?
My Bad!! Just ignore my comment on removing this!

--srini
