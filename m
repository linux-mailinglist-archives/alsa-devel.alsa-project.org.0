Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC307F5CE3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC56AE10;
	Thu, 23 Nov 2023 11:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC56AE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700736660;
	bh=2TNr5suhlug4FJwWgjhyZ4SkmH9fv8zhO2pg01u5KTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M41loOF4+6i5xNQSuGKBWyR/0okCv/0D8jHoj1Xk1NZfkPAuODbKyulh+AmjjdIKR
	 +p/aNd9HrMo9IXChWFX4j3GpfNf/vlthIAb1bVAX0nZq9ahqCYtCWBfAqUt0LUjF0G
	 AysIL/vrFQo2a2Y3OUPRJAeoo5YHHNKa2ofB9V7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D293EF80580; Thu, 23 Nov 2023 11:50:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22171F80558;
	Thu, 23 Nov 2023 11:50:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C54C1F802E8; Thu, 23 Nov 2023 11:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA5B4F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5B4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jWZqCEzY
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so915704e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700736618; x=1701341418;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWkmW4NrpVSDSfoG84SGLgZ1/3hG8w7uFZangWvkPCQ=;
        b=jWZqCEzYoRKw+arKx5GF2OzDs0YMnRWJpsgJXy4cGJ51ktXN10242KmhzJ+JBkZW6A
         qSZrukwNcMLyQGkgSyCMVCXXWHuPWy4wp/5igWxNplgKyFOZofERHSjmuErrqq1xpUwz
         qpOdRRc0HXp/wS1ZtXOVNRQTuO2xl8xdLajzUNnvQ/perYdwSBoijTG6XP31uwh5m4vR
         weKwgnSKlnR+cQVCRgdigUc61EeRB4JwaejG9FZ/pLE9qmXCbmyrYnKHSORRCupPWm0c
         atH+0+V3PvLdylEaaDwNN3/nl1zapHGYlafrBxRgR/phGIGdl9kWdKM8jRizIoFZw9WU
         E3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736618; x=1701341418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWkmW4NrpVSDSfoG84SGLgZ1/3hG8w7uFZangWvkPCQ=;
        b=j6ea68DoktGefb+Dj2YE3eBwdiZKZObsSnK7ivOM/Qv0gI4o65gwrlvGUtfDUW8/ic
         1VH+ahc8CxbywNYX3Fnnk5xDRbfzkufy29VQeuddHVcavtk230hJ2da2YD7mF234f86f
         jj6wwm6Fk9d42dqmo1ZrO1TWKn2x6qzZc9q+YBPvn8c5ovoFQ+/jpWZ3p6mS4DSVMdJ7
         h9DMRNU/rYXpJhbOCD3LC2BnTgyH3tdwSF9pBW7McvXsS2c5bIOCmhz9QxV7nhLdcFd+
         Zzqz1F4i5y0iVIE5yiotZfQYRQnoP4oSU5Nep17DFgi5DBxSaa4T3MGSyOAZfeSAHq+K
         9Yjg==
X-Gm-Message-State: AOJu0YxCqwmXdoEtPiusTelkANoH8KeVZk1nv7rp9L3z0hEMyTcyNO1N
	x3gmDfddjHR+FiQaTE+EndA32w==
X-Google-Smtp-Source: 
 AGHT+IHs5fP4IJLm3ak/VIWnkrN0Owt9/emtxBJyhldyhhI3EgXhn0P5nCSx7knmRJy61a6y/XgPFA==
X-Received: by 2002:a19:3814:0:b0:509:8e81:1aa4 with SMTP id
 f20-20020a193814000000b005098e811aa4mr2882944lfa.39.1700736617662;
        Thu, 23 Nov 2023 02:50:17 -0800 (PST)
Received: from [192.168.86.103] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 j27-20020a170906255b00b009e5db336137sm619208ejb.196.2023.11.23.02.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 02:50:17 -0800 (PST)
Message-ID: <9c5b1503-4dba-4ac1-8fef-9b28fb8bd4b5@linaro.org>
Date: Thu, 23 Nov 2023 10:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] soundwire: introduce controller ID
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, vkoul@kernel.org,
 gregkh@linuxfoundation.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AIYT7M3ZJ4XD7NWFJVKAYMIHLZZE5TE3
X-Message-ID-Hash: AIYT7M3ZJ4XD7NWFJVKAYMIHLZZE5TE3
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIYT7M3ZJ4XD7NWFJVKAYMIHLZZE5TE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 17/10/2023 17:09, Pierre-Louis Bossart wrote:
> This patchset is an alternate proposal to the solution suggested in
> [1], which breaks Intel machine drivers.
> 
> The only difference is to use a known controller ID instead of an IDA,
> which wouldn't work with the hard-coded device name.
> 
> This patchset was tested on Intel and AMD platforms, testing on
> Qualcomm platforms is required - hence the RFC status.
> 
> [1] https://lore.kernel.org/alsa-devel/20231004130243.493617-1-krzysztof.kozlowski@linaro.org/

Tested on X13s.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> 
> Krzysztof Kozlowski (1):
>    soundwire: fix initializing sysfs for same devices on different buses
> 
> Pierre-Louis Bossart (1):
>    soundwire: bus: introduce controller_id
> 
>   drivers/soundwire/amd_manager.c     |  8 ++++++++
>   drivers/soundwire/bus.c             |  4 ++++
>   drivers/soundwire/debugfs.c         |  2 +-
>   drivers/soundwire/intel_auxdevice.c |  3 +++
>   drivers/soundwire/master.c          |  2 +-
>   drivers/soundwire/qcom.c            |  3 +++
>   drivers/soundwire/slave.c           | 12 ++++++------
>   include/linux/soundwire/sdw.h       |  4 +++-
>   sound/soc/intel/boards/sof_sdw.c    |  4 ++--
>   9 files changed, 31 insertions(+), 11 deletions(-)
> 
