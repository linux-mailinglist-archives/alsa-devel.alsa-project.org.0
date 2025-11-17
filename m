Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED63C75784
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:51:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E246460225;
	Thu, 20 Nov 2025 17:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E246460225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657456;
	bh=89W40YWNIGyCIyPTBjrk8DXEYQrkSQCsYCIk0NyhL10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qj6S8qgs6JSt8sp8RFkz2PX0G/apPF9EfLIz1eZiQe+38fi6X8ovEWoQf/FUFtEig
	 49l6GrHl0SiXzjwSKMhW0pLczP2PUPwYTkOBL3gvtn/5V6H7CDbUwzPaOoc4c15tST
	 zBq/Rt+hZZnfn4zBHLjbRCWgBFkauIUeVNiilq4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE63DF805EA; Thu, 20 Nov 2025 17:50:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5E6F805F5;
	Thu, 20 Nov 2025 17:50:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FEB6F80551; Mon, 17 Nov 2025 15:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35620F80088
	for <alsa-devel@alsa-project.org>; Mon, 17 Nov 2025 15:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35620F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FrsYf/nz
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so14952575e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Nov 2025 06:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763390539; x=1763995339;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLmecC2+BXFzmwD/LAatR2XJYHtpzNF0QhUUU5gpbSI=;
        b=FrsYf/nzRPfkEpbduog7CPZ7GVxT1reRqQFZwtFD76kz331yTKIX4/wvbnrGCkMOB5
         WyG0UorqtnNvXflqtzwhlgx68YSc0y9H4o7bpPYf2mzBUYC8d/miH1jgFBDtTmpKyjRY
         LYcOa87zwixOvTKqH/aiYqXt9ZV4lAW8FTAwo+CBQdI98A2IvM4QsZ3kVYDaBrjNvCta
         Nmzy9mp6lI5Cce5dtGj7AD6RRrjeUuKABRYPZCugXA2xMY/ZdXVQVaoPL+/zdWGvp5/m
         D4gKVH0YE8ltM+9DCVFL49Se78298SBoAOWtkxlTC1ZE9+mxCR2Slfa0aSDF9Pyqa+XV
         OD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390539; x=1763995339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLmecC2+BXFzmwD/LAatR2XJYHtpzNF0QhUUU5gpbSI=;
        b=DnjR5LLAlSIpA/iNG2XlEWo9s8+fvQ3YNurZBWoBXQSam+2YANpFoCnyq/gAnSKuev
         k8GG6l5X8X5Fdo4ScapTRTuQ48WBX3g7vgBVsCa2/e5Gs3xCvWiyXQ1i6xVbHF/ERtMS
         xcUwKWieYSM8xvl0mjUoyXc6U1UO9rf/35EYRVrCIY2AiGtZ2yfFmt1aKfsTo0f3ReVp
         crHhvm9MV5k6SzpaHIkjiaPYPd+q5ezXaXq2MXJ9hmfspJ1lJZgBDpaPHVpkFCCgncwJ
         C8fGNyJ4BL7EQJ1dt4gYMImDGilNwetN93YkLvk4DLUSM86eMk92FdX4Je0/kp/UE0/8
         xFGA==
X-Gm-Message-State: AOJu0YyKdND4QI0T1PWG+y9+qj5rVm+n1jJShZtycaRuQ+puXLVjwT8X
	PCdgc6NeosqtzsA/SPmHWnpdowpYq0LB4nW5dC6gV/6meycwDU/DycwRi+sISB1GzHE=
X-Gm-Gg: ASbGncuTvxrAItw8H3EtaByenHnSwMqIbVARHG5YVR2ohQoMkRVKctNoVbqIMLzKWEc
	BBwC7eWlWM/i6/1qMCs7NBm4bM6nJEdUMQfComOftCdHgBrkX9iVR3IKCsBiu/mLCcCCW3vOYHM
	bgLthbWdrX1EF6yomHstam8cRbCRiSrguQPsQRicjW8CxwssIZPGcjBBYbzCAQf/285fzepmXE7
	TMCL1e+4pKXRHoldDgZR4Q5nl95KQEBhWZ5dwgQPQa7yvXrT5U70Xz8gNiFHVXu4QlgJrnSg/Di
	j9opiEH5y+EuhXiBDrC7yYodwxpKm8HBh5BM6UB/udy3YLmnWHBmmLuRJ9UJnPOQaXclBCc5zrH
	5imznrME2LJhx3mKKVyGxhcy+3rs5uv/7jL565JKiRiLnfzPjlLKjx212Sxfy68VIezmI+u4/6N
	mzspDr9WA2sE98CY1a
X-Google-Smtp-Source: 
 AGHT+IEopibZwRWUzxXVuBtBJNCpF0FKrGlRVYkQIBPXxPUWNf0AokTtqdf42+oXkDVSZ9y/83Kqjg==
X-Received: by 2002:a05:600c:354d:b0:477:54cd:202f with SMTP id
 5b1f17b1804b1-4778fe5ed04mr111100355e9.3.1763390538722;
        Mon, 17 Nov 2025 06:42:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47787e8e6a1sm301365015e9.11.2025.11.17.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:42:18 -0800 (PST)
Date: Mon, 17 Nov 2025 17:42:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com,
	yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
	v-hampiholi@ti.com, baojun.xu@ti.com
Subject: Re: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-ID: <aRs0RlQLRDZwjlTS@stanley.mountain>
References: <20251110152646.192-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110152646.192-1-niranjan.hy@ti.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BJ5XJTIEKANFF7THSHQLLRXLXRPYE76R
X-Message-ID-Hash: BJ5XJTIEKANFF7THSHQLLRXLXRPYE76R
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:50:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJ5XJTIEKANFF7THSHQLLRXLXRPYE76R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 10, 2025 at 08:56:46PM +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Looks good.

Fixes: 50a479527ef0 ("ASoC: SDCA: Add support for -cn- value properties")

regards,
dan carpenter

