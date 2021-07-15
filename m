Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4D3C9CCA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE21E169E;
	Thu, 15 Jul 2021 12:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE21E169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345309;
	bh=QJciId2qTXla+N7NeCfkM9rR9mGDEERC8jjDx5/29yc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUsC5sX7dy1vjuuoPXdXXWnVDVcjzuJY5Mk/SCDhELKjGY1ceL/AtasXLhheyBEL2
	 36J7cYY1KArvdCGYKAcMWXhyrLOrBioCZUU9ve1MD3XHaN2qrpvyKQWuegljchzn2Y
	 iaJrJeKjJfQZ56mRIEWnRUUX4icMkN3/cxDHV1OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E3AF804F3;
	Thu, 15 Jul 2021 12:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C62BF804F2; Thu, 15 Jul 2021 12:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E10B0F804E0
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E10B0F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wIkAKP4/"
Received: by mail-wr1-x433.google.com with SMTP id i94so7102655wri.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gsV66XE0EGcG7u2wmOs4QFlA/ant67YwT3lAEx/PPF4=;
 b=wIkAKP4/H87UVy9+HYifgqffQYx1gkM/H7YB35NOf1+wZqfqPl2CQZaaA0WzIULntf
 2b8QS9GaXQe1+ZRPYGAK667GQv3VOahDiFPceqU72tBooi5//iUK5GQH2GfOvinBM/Oc
 4ZcKgePDycMWsVfjGYF8ql+vaQsxokOJtuQu5EO5D5p+RNjcfvdd0JhVKLlYA3qAB9NG
 nc8LM4g2EwRMpD+QSHKSeYoD8+Z0XKZ8pXpERuPc3VnDRsulTuu9lzepsCKAnkjogK0+
 4mXKMlkGpKSBy4qe1byqMF0C72mBXof5dTQTw50C7uA747tO6XvysXLtB+Tu9mSgroVZ
 6fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gsV66XE0EGcG7u2wmOs4QFlA/ant67YwT3lAEx/PPF4=;
 b=K+4+IRW/7lFMPcQeYj/3v5L18NmFYBEjCx2iaI18PebpSyjUQLcNT236bqbWM0rbqV
 Q+zsz/rjdHYuXQhUQuOFRB1BSnJFivSmYcT/mCvgD3HYyfEYJ3qN7Q9svPQC/kxM7qoB
 wEq4um3a/709aHWSKO7jdzaDDLwBs0eLb2Wina5lYhGp8PsCoFeF4xJvAkhPpR9k+oTV
 xhZDhqfVBfBd1KBtxMhr4qG9dDsBegib0sv+jNDUbYF60blzS2kqVLkzsAzbY2o4vVme
 bHDihzXdpYEz4XnPV43X4xViC6v5alnhbrrRnHdT7FwAntEr53uo7p5eofZi08ABMhO2
 4Hiw==
X-Gm-Message-State: AOAM5330aW9MKVRfCzc7h8AHzfG1VGTueiakhYumzzSqfRbQvkFj1kwq
 Q5AffOLxYvuLSrJR+qFWqFQeiA==
X-Google-Smtp-Source: ABdhPJxD8Iw7gZcKuTN5IAoaPBQmG7KeAJdm6gsWH8Icp8kvCAmMon/G5b+fpC4BZY28Mlrn/Lx3pg==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr4609978wrv.155.1626345131549; 
 Thu, 15 Jul 2021 03:32:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o3sm6086193wrm.5.2021.07.15.03.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:32:11 -0700 (PDT)
Subject: Re: [PATCH v2 10/16] ASoC: qcom: audioreach: add bedai support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-11-srinivas.kandagatla@linaro.org>
 <cb2636b9-e88f-76c3-129a-5cbb2cd017b2@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cb3a2cd6-b8f2-bdf0-91fc-c19e3e98c053@linaro.org>
Date: Thu, 15 Jul 2021 11:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cb2636b9-e88f-76c3-129a-5cbb2cd017b2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
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



On 14/07/2021 18:03, Pierre-Louis Bossart wrote:
>> +	rc = q6apm_graph_media_format_pcm(dai_data->graph[dai->id],
>> +					  substream->stream, cfg->sample_rate,
>> +					  cfg->num_channels, NULL, cfg->bit_width);
>> +
>> +	rc = q6apm_graph_prepare(dai_data->graph[dai->id]);
> any good static analyzer would tell you you didn't test rc before overriding it..

yes you are correct, I did forgot to do cppcheck after make W=1 C=1

These are now fixed in new version.

--srini
