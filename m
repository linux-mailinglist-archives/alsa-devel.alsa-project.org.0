Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B94942F81ED
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 18:17:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C9D71835;
	Fri, 15 Jan 2021 18:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C9D71835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610731053;
	bh=M0OpjfipidPeJSw4GU3ptiI9ejH/g6igSl7m+FaPmQo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJxghQLy3tEMFcN1v2x0F1eg2hpRWTmyj+zEALDcOkXIkUkCkAoroqQoTwwOW1QwA
	 5h4QQgWkYtyvaRWpibudwsUdJIRkIxxldDexlrJn8//S2rEVtmDqAB7GlfHuxVghIP
	 4Fi0QyHEhtm4twdlJ8k17SyYFBrhREW7862R+ACg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6A5FF80113;
	Fri, 15 Jan 2021 18:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A44F801ED; Fri, 15 Jan 2021 18:15:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8866AF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 18:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8866AF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ybXuFlg5"
Received: by mail-wr1-x432.google.com with SMTP id v15so6371409wrx.4
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 09:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9cCon940OgqH9BwLEYIXgCLMcaubAFed3K6utIi7sn4=;
 b=ybXuFlg5xOJA8Qyj/EPdVjUngATyknIqqS8x+xKRz61tH6pcWzcWgJhjjdqkIEiPab
 EqJAxiekZhgDu1J2wFMwwPwfhvnnIzD+7nknMP2t5L+1lojyH+/a/0LjeDsxeQcXjrzo
 HSm5u/7mtlXQAowOFibGa4cXGoDB99nRMHbQevbscJQuRxFhoIWy+qpbbLlPiCDcBbGO
 HPW5VoErpvzmaf9r6A+7kA0hOZveTU+n6w390Yg1DiLC5ua+sgU8eNe3N9uevRhkGdXv
 32QxXwdwSVOne+omtdxahiss4wkKsS9nsyJn2U3uPhraz4fVcJ4IDDdImpA2wdtQWpV6
 /Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9cCon940OgqH9BwLEYIXgCLMcaubAFed3K6utIi7sn4=;
 b=k3twyepShhNA5K0h+6dNiFj4Qwu9BtSzznc7xZdsv9d5JVtUdRaa2qsOvff0F66BAk
 4Cq3ExHEAkTVQaQ1kudzTBUDrtbKenPIPOfJ9EkdAkMEdlcK1h0I9xr1GJJjM6HGQSMx
 d/03ixdfq5YkJLMIH6bolV8ePXYB13Zv7njtdBpe9Z9jyB2oA3+Ctwad2czJfUQ8U5jk
 +VqiHRF41Ii7UFvA/s3KWmzWCpV4UOR2sYiIxkOfxFhKeZ+ExKpUx2mQ9S+BHM0Ui20e
 f/F1bpeXScUFB0aXj1XJhBS0PwNFb0wN5a4vvUMbs+BGcN/s5Soxv9bwjk+M8bwTB1J7
 H1QA==
X-Gm-Message-State: AOAM533kbaIJqx6R3zGlws3R5NGXAEa5eEef/n8flKSnhhBnIAPmLHA/
 XxHjvyNCmRFC2GlxwUTz6J6XRQ==
X-Google-Smtp-Source: ABdhPJxcQ1mE4zyYA5LEJeEViavgyfugxgIA9umC5TsMUOcOMv+byLRfOiRNcedKDu4aLvjpKVnzAA==
X-Received: by 2002:adf:cc8f:: with SMTP id p15mr14312838wrj.199.1610730955351; 
 Fri, 15 Jan 2021 09:15:55 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f9sm17379246wrw.81.2021.01.15.09.15.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 09:15:54 -0800 (PST)
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass: Fix hardcoded SC7810 DAI IDs
To: Stephan Gerhold <stephan@gerhold.net>
References: <20210114094615.58191-1-stephan@gerhold.net>
 <68691a9f-f65d-da1a-a413-b624567ccc5f@linaro.org>
 <YAHHtup8hgfdf1qm@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9349c21b-7cd3-3c7b-91a9-9bbf0d5c4f15@linaro.org>
Date: Fri, 15 Jan 2021 17:15:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YAHHtup8hgfdf1qm@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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



On 15/01/2021 16:49, Stephan Gerhold wrote:
> Right now it declares just a single DAI, but multiple "ports":
> 
> enum lpaif_i2s_ports {
> 	IPQ806X_LPAIF_I2S_PORT_CODEC_SPK,
> 	IPQ806X_LPAIF_I2S_PORT_CODEC_MIC,
> 	IPQ806X_LPAIF_I2S_PORT_SEC_SPK,
> 	IPQ806X_LPAIF_I2S_PORT_SEC_MIC,
> 	IPQ806X_LPAIF_I2S_PORT_MI2S,
> };
> 
> static struct snd_soc_dai_driver ipq806x_lpass_cpu_dai_driver = {
> 	.id	= IPQ806X_LPAIF_I2S_PORT_MI2S,
> 	/* ... */
> };
> 
> I suppose we could just declare this as MI2S_PRIMARY but not sure if
> that is accurate. Do you have more information about this platform?

Looking at the specs it does show that it has 0-4 total 5 I2S 
interfaces, however Am unable to find a  proper name similar to other MI2S.
This one is the last one (4)!


--srini
