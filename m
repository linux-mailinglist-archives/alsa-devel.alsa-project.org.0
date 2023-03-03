Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14186A9939
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 15:16:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BF593A;
	Fri,  3 Mar 2023 15:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BF593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677852986;
	bh=AcWFgd9JK7thzoZX8PZEg3gNCzH68S35w8b4prSSCqE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gDWZermIqdRWFHnD69slOH4QN2Th9Q5+qxmC/bQcTImTK/OSwZt8zmm3WfcZ4Tpce
	 GhObM6zYCQG/52bhiQo/MKKw73Xp3ssnXN5KvSt1hohLTDHjAk4t6/d02Pb3NDJGch
	 xV+x7IO/whU+DHcFuuxCoK8xwvbf+v1R0pITRkzA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52BA7F8025A;
	Fri,  3 Mar 2023 15:15:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14912F80266; Fri,  3 Mar 2023 15:15:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B052EF800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 15:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B052EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yIXZrzjP
Received: by mail-wm1-x334.google.com with SMTP id p16so1665571wmq.5
        for <alsa-devel@alsa-project.org>;
 Fri, 03 Mar 2023 06:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677852926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg6dj3Q6N5MYQn5C9fBk1Ggl0n/80gp3aauAx9F7jug=;
        b=yIXZrzjPqd7cp1fL8HoYWGw1R9f4Qv017OtTqnh+Sja/P5TGRZIGASc+OAty828lw8
         9HzgR8YxJWL/YTuk4RFCxoRYbzfmGs6SLuRkMwqP80FYgjG73SfJXz5n+ykYEI7asvTM
         gm/J2n/TJiQhN4+TCJPHJ1vMCFIH0mYshaRtOcCd6PGhuFlp1O2cuFwOiS4YeOEHTmBP
         rht0D+/ks38b+v6jsM9YLJ80XUBZ/lboVzjNBrp+n9dtUEVMUgeL66sCkor37AiJB0rR
         RrYEnq+VdFhDLoMqmJWuew014ttgl52BQrMNtPBZBd968SlvDl6tfx+UL2i2Y0B0DvCY
         JHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677852926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg6dj3Q6N5MYQn5C9fBk1Ggl0n/80gp3aauAx9F7jug=;
        b=VabIZyckVYdoep1T8omg+YT1MT7zDEN8AFHwoPz7UoZ6I6XroHEjXls/645zdg2hQU
         Pntv3TA332WcmFVo0R+W2E02oHKDTGMQFLA09/TrKmcjox1hLQU/6qT5FFOWO/SHn04B
         xTcqwBrmfuIymmXVCGZiQSngET70O9FFhP5dBsB1Jcm2PGBib5TXUDxwYHwTmP22FPGM
         m3d0paAMa0XdWbZWkdfuxUuUZ8XGyxg1l1H00Bt60Hfzr96Sm1UtA6DtTBKAKSlXNokZ
         Qt9gLYqj2T4M5pzkwCxqOeOO5rfG9StJ8sAtFntzr7T1+YTfnnyhh1hVpXGfUessQIdu
         WE+Q==
X-Gm-Message-State: AO0yUKX2Xu9G7o2I+05wnb/Do4s71lGV5GR2WPM8mYAlMWsu+UFFEnMR
	lUEBCa9LB5NwImOF0TpZ+7gMig==
X-Google-Smtp-Source: 
 AK7set+CvFYlMNwMVTmScXAECqtz9G/93stRCPw3xDHTesSY2cacrpOgFze7WDdOxXDQgcCRdFJi3w==
X-Received: by 2002:a05:600c:35d6:b0:3ea:ed4d:38eb with SMTP id
 r22-20020a05600c35d600b003eaed4d38ebmr1849295wmq.24.1677852925791;
        Fri, 03 Mar 2023 06:15:25 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm12526269wmp.0.2023.03.03.06.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 06:15:25 -0800 (PST)
Message-ID: <73ea5ba2-18c8-abd8-3896-eb9656201f53@linaro.org>
Date: Fri, 3 Mar 2023 14:15:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
Content-Language: en-US
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
References: <20230303125717.29196-1-quic_visr@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230303125717.29196-1-quic_visr@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L5QKXACULTMMRFIVQCKXVED4OXJEAT2S
X-Message-ID-Hash: L5QKXACULTMMRFIVQCKXVED4OXJEAT2S
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5QKXACULTMMRFIVQCKXVED4OXJEAT2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/03/2023 12:57, Ravulapati Vishnu Vardhan Rao wrote:
> @@ -1064,9 +1064,10 @@ static int tx_macro_hw_params(struct snd_pcm_substream *substream,
>   			      struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_component *component = dai->component;
> -	u32 decimator, sample_rate;
> +	u32 sample_rate;
>   	int tx_fs_rate;
>   	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
> +	u8 decimator = 0;
Minor nit, any reason why decimator is intialized as part of this change.

--srini
