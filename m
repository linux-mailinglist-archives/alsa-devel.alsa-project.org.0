Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41201638722
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 11:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3BD61728;
	Fri, 25 Nov 2022 11:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3BD61728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669371207;
	bh=c0Z1xzOGBYSqdaAqRRZKFzaOvv62dN6zn5zT7vvIaP8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QglxT0lJobQ0c1zXZ22ivnCTJfLRwoCKVal8K/TFG7iTzCk3mhYH797VEIq/Fk41z
	 iIiBMmCgMbif+/V3rcRtZL3nOCS05hkPJ3V+e9AqdUC/RVc27tPQ5dtM5ah4GkrOc+
	 J1CFRzi3qRHNOfJgaEZu7KZCydXmZLqfBP+czxfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF39F8014E;
	Fri, 25 Nov 2022 11:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564D3F80236; Fri, 25 Nov 2022 11:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF6DF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 11:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF6DF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e16GuGdc"
Received: by mail-lf1-x12d.google.com with SMTP id s8so6139116lfc.8
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 02:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TbWKCCPxLunlxbdneM/JxjgPFo6YmYtt/BvmY61TNsY=;
 b=e16GuGdcTCVD2H2ehZyzzLAqWRpYAEi249hresoJfY08kjiTuKUJwGc+FzuokMnGVv
 OTRPxtwPBbZ3PGjBun8FwkfAhMlOaeOVgkZb5gO7DrGdveTttSiVa0bSKFaXSvX1bjSr
 oRyaBz1CAIG9/Y3Bu9I3u5w+GZ7IX8HDCvb0ZwwIxKgJIBEu0miYeFET6N6C8n7qeJKE
 GtLivVc5NVzqu7ddvoIn9oarzYcllBroQGM8kRQTipuIhteda/DbM6yYKsQlggl6yvuB
 F2Lc0cYsj3TPQjK7kAo+0TzfiZ3g649gxVehdpzdXRSFyPQiq8ll4jgh3Ngq8B56qQmW
 CQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TbWKCCPxLunlxbdneM/JxjgPFo6YmYtt/BvmY61TNsY=;
 b=LnfuoGUMqkq+Fs1Fv3MBDtjmQG/bBD9Ie7FcVYZia8Fc22TwLK+syLlPP9Lz/6fmLd
 cQbRLUV1pKoCjrebWd7YHbk99YHqTqbEuMereuNsghut+3QU3VGtQpbjzMQI2wPz/m0Y
 6ZGxGenrZHfjhFIhBrVMYgmdsRKYmcT6sbp9WKJ+GODzZmhPtIVXdhgOF0ssfNHU9zN+
 Qp0GIpEhPp6KrvuPp+y6H+P8mHOKbSHdk7sH7TLybInQkOq+8d/ngN7Slymfs6sZlXSC
 TToyxBHZkVCFRgJUcStkgWs+TSByHIPlWAf7JMxTALz23eCP/xbLpzRd6SYtbUbSI1Fq
 BqJw==
X-Gm-Message-State: ANoB5plUrA47j+MTyG+RY5GTh0MiZvLbZO09IcnSYv1UpPk1ua1A3xuq
 LnZIQkl+XVX4HzNLBccbF4hadg==
X-Google-Smtp-Source: AA0mqf5cWGzd+0J6yHtbBz4TpxgelNKErELh8DafNvQuSx4vLkjQcfYaorLzdrBVj0fB3tK3BO0LYQ==
X-Received: by 2002:ac2:4ade:0:b0:4a9:f2e3:3cf0 with SMTP id
 m30-20020ac24ade000000b004a9f2e33cf0mr12075510lfp.545.1669371143608; 
 Fri, 25 Nov 2022 02:12:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056512060700b00492e3c8a986sm459839lfe.264.2022.11.25.02.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:12:23 -0800 (PST)
Message-ID: <9cf9170a-bb01-ce61-2295-998fdf3b0909@linaro.org>
Date: Fri, 25 Nov 2022 11:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [patch v5 0/5] ASoC: codecs: Add Awinic AW883XX audio amplifier
 driver
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <20221115022423.6437-2-wangweidong.a@awinic.com>
 <20221125092727.17414-1-wangweidong.a@awinic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125092727.17414-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 25/11/2022 10:27, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The Awinic AW883XX is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.

Do not attach your patchsets to some other patchsets. Each patchset is a
separate email thread. The 5th patch is missing from the set - I don't
know if because some sending/threading/spam problems....

Best regards,
Krzysztof

