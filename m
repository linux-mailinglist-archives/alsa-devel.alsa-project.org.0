Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAF8CE529
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0197208;
	Fri, 24 May 2024 14:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0197208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553247;
	bh=6Qsfgxn0ZtZxpVvIBFFX1mQlHeNqRm+EvO0tyESQalY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rI4B9XzkAx9YyMItj3PSpFZA41l2WYJBYW+WjBcmTGdTO/K3QzWcAstclRX21NqTX
	 gJROWc0sjY+3o71rKQNVfhlUR2+l72FrA5QPFsDthIcODyPux4QP15lq3262oXPkpR
	 /99tImAynbOxxVCIOAEFOeyR5HVhrkYcunvTiCD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB61F806CD; Fri, 24 May 2024 14:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99538F806CC;
	Fri, 24 May 2024 14:18:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C987DF8026A; Thu, 23 May 2024 06:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 410D8F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 06:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410D8F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N5P+FNzW
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1f333e7a669so7758945ad.3
        for <alsa-devel@alsa-project.org>;
 Wed, 22 May 2024 21:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716437400; x=1717042200;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKSyw6WGP8oc1c5/355QNnMu26FbGL5V8Gm62pHtX8U=;
        b=N5P+FNzWyH3CVNCoYzJ8eCH+8bmjAKGZVkYBlgxMWSjNC9AAK7BY/xkK13OzxPgFs6
         tGC+K9TlYMw7p+dUf5YO27u7qidXoDEB0V01+SjvkJpvQqQjWc9rT3ktiZzNAYJGlFcA
         2lpfB9x5LkA++VmKrLNflhg3i9aYs+a3H7OQMsuJxHnog7isHOcwx8yQAtPPvJdRzDqR
         xRXnye4E3fpZJOyDJrYGxZ+Qp5wS0MWmGOak2b2zsa5IpevVF8HnUYktydBBstWHzqGU
         aYt/BWOx58D5v0z9R7irfaBbDkWxSU7LmJcCOFRBFedUKeoiK7221OHnZO6qhIt2DDGZ
         ++IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716437400; x=1717042200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKSyw6WGP8oc1c5/355QNnMu26FbGL5V8Gm62pHtX8U=;
        b=SHITqUBN5B55o5G16XdNWfWkrJZDGf/hZLbwaeDUB3tP//o7SBD4rvWUWG70bH/oKj
         xR/07TY9miyMI7Yyt4AtewKnFM7fN1JZdGhgqt7IHh6AFej/Yd5v+FN4r+gJAy+taRFU
         NNwosDpFqwIsrn41c+ZBZfURSeqPFWpJ841lUFqkPHfDHVxl9jZjGsWqut7eSUPP97an
         pxZNrI+tQcIapzGx43koIBkX0fj6EGREjS1EyP2BBehNeIqroIbCjbaEJ49GW2RQQxJk
         UQafDPe+pi33TFtsTeqV0VwzRcr9at7RzMskf79/i5tLqP9oadIYqEo/J3Ok0ksvLarc
         qn+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdezymngs0bKiJVWZv28WfDj4FP5Nf+wd7eBaNPWnWsYzzuWGKNmO4dFGa4fBU90HvdyPIVREU7cVXZ4PfVKoQ8sozwpaZoFLMAWk=
X-Gm-Message-State: AOJu0YzuvgWXr9z3tlHRpgQt5y73Iu4TOf9u1D3n3sYUb0W9vm9qZdCv
	PC114SGTxDq+gD7I32tot8w7O1S/LDP7CRWjE23imgNZ+GwrXtZ9
X-Google-Smtp-Source: 
 AGHT+IEQwG0Ah8JNIp+nts9Fmu4aOOHwzYGESz0lsmxX20hoewkxC9gHhtTDM/PwZ/pCJm20EjLhtQ==
X-Received: by 2002:a17:902:d4c3:b0:1f2:fab6:294 with SMTP id
 d9443c01a7336-1f31c9ea3e1mr42062845ad.56.1716437399762;
        Wed, 22 May 2024 21:09:59 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f3356bf498sm8083705ad.191.2024.05.22.21.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 21:09:59 -0700 (PDT)
Message-ID: <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
Date: Thu, 23 May 2024 12:09:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: wuxilin123@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QMFV2TG6CIX5SDYVCR6QVLAV2OBS2JBB
X-Message-ID-Hash: QMFV2TG6CIX5SDYVCR6QVLAV2OBS2JBB
X-Mailman-Approved-At: Fri, 24 May 2024 12:17:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMFV2TG6CIX5SDYVCR6QVLAV2OBS2JBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024/4/22 21:43, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> Thanks,
> Srini
> 
> Changes since v1:
> 	- Fixed unused variable warning.
> 	- fixed warning 'break;' to avoid fall-through
> 
> Srinivas Kandagatla (4):
>    ASoC: qcom: q6dsp: parse Display port tokens
>    ASoC: qcom: common: add Display port Jack function
>    ASoC: qcom: sc8280xp: add Display port Jack
>    ASoC: qcom: sm8250: fix a typo in function name
> 
>   sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
>   sound/soc/qcom/common.h         |  3 +++
>   sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
>   sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
>   sound/soc/qcom/sm8250.c         |  4 ++--
>   5 files changed, 74 insertions(+), 2 deletions(-)
> 

Hi Srini,

I tested this series on SM8550 with tplg in [1] and ucm in [2]. But the 
kernel output errors attached below. Headphone does work properly 
without DisplayPort in the ucm.

What could be the possible cause of this? Is there any significant 
change from sc8280xp to sm8550?

-- 
Thanks,
Xilin Wu

[1] 
https://github.com/edk2-porting/audioreach-topology/blob/sakuramist/QCS8550-AYN-ODIN2.m4
[2] 
https://github.com/strongtz/alsa-ucm-conf/blob/odin2/ucm2/Qualcomm/sm8550/HiFi.conf

[ 1552.313713] qcom-apm gprsvc:service:2:1: Error (1) Processing 
0x01001000 cmd
[ 1552.313730] qcom-apm gprsvc:service:2:1: DSP returned error[1001000] 1
[ 1552.314455] qcom-apm gprsvc:service:2:1: Error (1) Processing 
0x01001006 cmd
[ 1552.314463] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
[ 1552.315496] qcom-apm gprsvc:service:2:1: Error (1) Processing 
0x01001006 cmd
[ 1552.315506] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
[ 1552.316033] qcom-apm gprsvc:service:2:1: Error (1) Processing 
0x01001001 cmd
[ 1552.316042] qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
[ 1552.316045] q6apm-lpass-dais 
30000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare 
Graph -22
[ 1552.316047] q6apm-lpass-dais 
30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at 
snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22

