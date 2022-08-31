Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F85A79DA
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 11:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4BE16BF;
	Wed, 31 Aug 2022 11:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4BE16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661937253;
	bh=6oklvVd+a2txk3PflBB6WfZB5PPFr4ecadY3ED0OBWA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGWDPAlIkodJM8qqAaCtbRRCCTruLNwRlUVxnatFMvNOwQfQPExqah/Z19pAbVfTi
	 8QXU+ylFR2J2+0mbFmoqz6OX4ygE0H/uUc68LhR/vdggz8IIAiT5tE6sOyfBUb80Fu
	 5SVm8HN4e3NFIj4cMYqehFQaH/CkCRhXlzLBlhBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9433DF80448;
	Wed, 31 Aug 2022 11:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 779CDF8042F; Wed, 31 Aug 2022 11:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E293EF800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 11:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E293EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ROtwCweI"
Received: by mail-wr1-x433.google.com with SMTP id az27so17383006wrb.6
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=f2v5wnUzlFw+ZpCjocjtmhUbEHEChafEgOfgj/yM2oA=;
 b=ROtwCweIXDZJ3VmlCBhJ4Iq+wLvqrZhbK+rPGKnuip2Lq5URIot/G52HWlVEOKksaj
 fuA33npDQ1NYBIyWo3He+08zCl5ll3mDZJ77pFQwyPe1WEi4jNf0uBIUTCUpmKSbivvT
 kHHADPpVy+N2SjXWQDzFuCU4XKCam4rpYCdC5hslLvF75OkOfO6+n0TQBp2QOJFoCkkz
 z7J7QFA95J0rV1VxHsJe71UxWNMvSBjE6iF989kXMXrBQBcGaOFL0rz4eepf0y8hESdv
 EhNJB/+kf3qdwLQszZz4wMiAZKT8eTeajacUPVgT5+qpN18UPy8Rt9rzqF8YLl20JeI3
 xKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=f2v5wnUzlFw+ZpCjocjtmhUbEHEChafEgOfgj/yM2oA=;
 b=5dIeBLQ/voMHivhBKQiSNRNAfEKuSVwyxiIPrMQpVx5H7F7Rb3XFbT/qT8e8diGsUR
 bUGLaAN84snF7d5mfDXkpWZRKMRa3k3uaNIOiQTpXL8Xcy0rszB3GroPbEu3h/8vFscu
 ovKAQZNjoIaMGA3tfvIZM3gaPw+d6Ys3UWlpIq60TCUDPayNRffamUbUgnmnY3863F7q
 KTHY53NFVKeIa81dDynkVdPMkwlfktNlcOMyu/XKpFC+Hnmeb2AbgrHuByAZoP1h5xk9
 XsA4CrD+cbWil2ReXJocAgt55q9OPejOFGwoWVD7tTQkXwLFZIEwfwXyLHtJP2aizqHp
 Ttxg==
X-Gm-Message-State: ACgBeo2PD1Yvj1aO1OPVTfGC+XiRfOYuEbpjGKE0UXC1Fd3GqYaKnxGt
 VEJVZP/2henxDIdx0IR85/VTokkLshvpOQ==
X-Google-Smtp-Source: AA6agR4ZTrmaB0FuE/OJ12vVcZ843QapxOfCMEEVKeMwgs176P7BPzEF02U7iQFlRcedt0l23og91g==
X-Received: by 2002:a5d:6c6e:0:b0:225:5a20:1bd1 with SMTP id
 r14-20020a5d6c6e000000b002255a201bd1mr11217058wrz.717.1661937185312; 
 Wed, 31 Aug 2022 02:13:05 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020adfdd4e000000b0021f131de6aesm11661830wrm.34.2022.08.31.02.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 02:13:04 -0700 (PDT)
Message-ID: <eeea8a27-eed9-6ebc-dfa5-73a10e711c04@linaro.org>
Date: Wed, 31 Aug 2022 10:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
 <20220818135817.10142-3-srinivas.kandagatla@linaro.org>
 <Yv9rIGE+GNEzzizz@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Yv9rIGE+GNEzzizz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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



On 19/08/2022 11:51, Mark Brown wrote:
> On Thu, Aug 18, 2022 at 02:58:16PM +0100, Srinivas Kandagatla wrote:
> 
>> +	}
>> +	*stream_prepared  = true;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(qcom_snd_sdw_prepare);
> 
> The ASoC framework is all EXPORT_SYMBOL_GPL(), things that depend
> directly on it should be too.
thanks, I agree, there are already 3 symbols that are exported without 
_GPL, I will fix them too  in next spin.

thanks,
srini


