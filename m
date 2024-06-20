Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5C91132B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 22:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF928950;
	Thu, 20 Jun 2024 22:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF928950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718915352;
	bh=UkmDyFQy591dYaa7VHDPHpXjKce1/rqccMMiHX2MPEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X4cCjoSubRp0XQSFvthPTfRfl+k+zRJwryLRWAMcBs73LZCq0e6cbk8Wi1oUjqIRP
	 51WwsZ4eYHA7OpbbudKfE4NX3fD+QYMLJU5cgMR7ScrTfsrJNfw8Cdu7bADjpU7drp
	 9fL5rktZaN/uKRCJ+7pMxv9DTV/ONiQx77MHesfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27407F805AE; Thu, 20 Jun 2024 22:28:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B3EF805AC;
	Thu, 20 Jun 2024 22:28:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F2B0F8023A; Thu, 20 Jun 2024 22:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03C95F80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 22:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C95F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TGaMVNYD
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52cc10b5978so1385246e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915310; x=1719520110;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qq7ONicKjWObOBmDaLHMa6+38qMtcLZP9rDKDaS5bI=;
        b=TGaMVNYDeH6YOIZmMv5cf39AGj/c0bAJaspuzqJqqH19M5Nhzf+7lBWMRakNxmDqjR
         hL8zJaAChXI2y7XWySJngozXQsDAFVWdMGvG/+sLjGzkG0D1Ih1urgQN6G1AsdcNXbLQ
         tpXepJ4gtazmSKhfMCBlpypVCAlPU8RggFAu0Lzhg0Fq4JOi0UNZE3KlFdUeNXFJ7Tw+
         +yDgZjr5gPia8YuJf4vzAFOSpTzLYLdC8e5+qreL8t3R7jwa/jUI7Tkt9uWwMZnxgN/7
         SziMdlGfjeujO5AeNus0Sc+6cUx0UlbU4iJkNhjm9D6g5tJqZcUNfzTUK03XR23VUXl7
         GhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915310; x=1719520110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Qq7ONicKjWObOBmDaLHMa6+38qMtcLZP9rDKDaS5bI=;
        b=wP1uIrBAKF/9tTMrzwT5YHmh5r4uHf5Ow81Rm5dtrNooc/hFFbLe+/GCTleO7prboK
         MSQeoTEjAGB//8Q2TjOJ3gYMuIpfAOi7we8hhuo0Ft25GEktv09wRdxsOFaY14VquFt9
         FD/eZrsigWcEx/8lvH31p8EUvq2wKamUzeOi0jPtuG6OqKhlI23htrTGUIBpIiZ8+pKN
         8RQ+AsZlEU/W1WHAgZu26Kao2UGA56PVY+ZJGceKyC4uXjE6YZDC+RaBMoUxsSkIHsaT
         AOzxnIikKxnnZ9atCNtyFhPo62oY2o+kk2ZKyuVywKGPpdBzMd58mwFXsWXkkb1XKMn8
         CwPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1s9M2/sKdHFik3wz4GwlwgBACL0PCKmo+gP6YDxtO8ufAk+Ov4hs1daZrYsCoZRn1w1LXHQvxYfMyGFPEYUSGtF0wMCcn8Rz6lpo=
X-Gm-Message-State: AOJu0YzsOYuWvJBCAo6FGklFB67Oi7nKDu9Rvk4wbhojS5WTupODMK2B
	x+RTciIisJAIINPGBP4Q5KQ73D7Z4xb+IOf67nXLtbYCiRBy8wA6YSPKnOF3gkQ=
X-Google-Smtp-Source: 
 AGHT+IH//vghqAcxQJwYgnR3Ce2y3NWrMIiABGLcHezgJ21sFgCt2msKsgQEX+zkT9WfeQcTRVsKdw==
X-Received: by 2002:a05:6512:3f0d:b0:52b:8365:3630 with SMTP id
 2adb3069b0e04-52ccaa885a1mr4638439e87.51.1718915310420;
        Thu, 20 Jun 2024 13:28:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca88a96bdsm1867368e87.306.2024.06.20.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:28:30 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:28:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
Message-ID: <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
Message-ID-Hash: 3RVUUZECZP7FZ4RPJZIZMUUQDE55TPYK
X-Message-ID-Hash: 3RVUUZECZP7FZ4RPJZIZMUUQDE55TPYK
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RVUUZECZP7FZ4RPJZIZMUUQDE55TPYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> paths eventhough we enable both of them. Fix this bug by adding proper
> checks and rearranging some of the common code to able to allow setting
> both TX0 and TX1 paths

Same question. What is the observed issue? Corrupted audio? Cracking?
Under/overruns?

> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
>  1 file changed, 68 insertions(+), 44 deletions(-)
> 

-- 
With best wishes
Dmitry
