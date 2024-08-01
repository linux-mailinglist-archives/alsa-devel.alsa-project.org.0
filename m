Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE0944708
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:50:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920DD3755;
	Thu,  1 Aug 2024 10:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920DD3755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502241;
	bh=Lj5WaqXJuWUxej3bN+cB67l8CzP+0YvJ2jfDGim+ar0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rLYEeOgKPxt4G9ruswyxKrB2byBOGAvpguhq9NqamOC4WzsW5Za/g0gCzpnP7funu
	 2sdycDIPp/zVrTAqnvu7u1px0KQelDcxKWbgq0kyN7o5UMzb4syoV9PeHV0Te6lN8L
	 7DP3nq8asjmMAbUHxbPw2YF5hHzn+nIO81AG8IoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16306F805AB; Thu,  1 Aug 2024 10:49:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7A3F80687;
	Thu,  1 Aug 2024 10:49:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB7CF8026A; Thu,  1 Aug 2024 10:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9496F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9496F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nfeRhAHR
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so9851813e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500528; x=1723105328;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ic688ABnHK9dnIqd8IRXkp3C2Ibaz6wM4ecnZGzWKWI=;
        b=nfeRhAHRcQNRYhhxS4u1kFaBGJGO6Pnuk1UCDwRQHOQna5ItCssQxLJbw0c2mCbmiF
         kkRV84cXMdOiO/2kz2k/VPxjyVQQeCu/FpQe90q0jcbZkazK2MDSHI3AgiAuS1/KhGJp
         KLCdbvzQAom6FfhStwIGnF9stSwW3ahDFxSRET5ehnX8PFc9ndem5anau/bSwgby4U7i
         tXzWnP/X2uhxprcS9UunjhAtXFs4V3ONRMdciJMD2BCC7pW7lBOkZwo/MVanucgvVz4r
         igISAyrYp6wjPQzYFsr8HwMyXMousY2Ftv8/yW6eEpwv8wDrd2yqFCCCS/80oia/L+Oh
         jtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500528; x=1723105328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ic688ABnHK9dnIqd8IRXkp3C2Ibaz6wM4ecnZGzWKWI=;
        b=TxhMfIUX+hA3Uwsww1IuQfaPSf54HI31RUe9YGR31Fj6EsOownlCpaBV168zghCobe
         HLWptgyhv8Yi+YWbiw4n6J9TKj9N/dFgOnqvf5MRqxF1TTRJ/RC6U0a0fX8Or2q8ZgPm
         gMVZX98FwYxA+jWWMBvUunnzSgtW+a0dGZvhzmghWJRqQcc466yuPEAg11vwkgtRKgPz
         VKoIKQHZf7OCOeBztLlEWhC0WNqSIl76RwpLZ5DD7U8db4Yg3gDm5/2+PRjZiF05TCAD
         8ml/xkpiTd6dFCUmfmD1PJwd1xIGuwPmGfMtu/xwqDXiSh5Mw83QDuklJIpLdMeU7QJq
         YtGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWim5AL6v+ltqGkokJiJOuF8yEx0FVHTYvo0I7bR7dhPGUh7ROeuTPJfE4yvjAXL7LZC6d6r/nPhzJrGpbJlpPC44FJCgW0Zscv91U=
X-Gm-Message-State: AOJu0YwXbQ8nGCMoahkjG8mJaaQBqDyKeX0aAeTDfCJG/j9xk+TnLcg8
	T2zni1UmxeBrk8BPPNMHbYlubSy7K9pJ5vWw+xjNxWqZ9kGhpO8TI4o8sILqCFk=
X-Google-Smtp-Source: 
 AGHT+IEU2gTkSFpjUy+X02aBFyJl+k2zkHtPytqIxDlmqXYA2ry04XeQb52Cb9OMoFr+jb7GRVU9rg==
X-Received: by 2002:ac2:554d:0:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-530b61f7cc3mr844180e87.51.1722500528283;
        Thu, 01 Aug 2024 01:22:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c08ec2sm2528097e87.127.2024.08.01.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:22:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 4/8] ASoC: msm8916-wcd-analog: add pm8953 codec
Message-ID: <yhkpd35ovohca4gsd5hqxdxskoepwtkxdbdtkwafxnercxploh@4sffdl6mh3kj>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com>
Message-ID-Hash: YKSXSXTDNKEIZ2S6KSQJIW3AKINPRCII
X-Message-ID-Hash: YKSXSXTDNKEIZ2S6KSQJIW3AKINPRCII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKSXSXTDNKEIZ2S6KSQJIW3AKINPRCII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:28PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add regs overrides for PM8953 codec.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename codec]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
