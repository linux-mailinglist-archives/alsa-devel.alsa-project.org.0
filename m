Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82C69842E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 20:10:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C5A886;
	Wed, 15 Feb 2023 20:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C5A886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676488217;
	bh=GKuJLFH3ph2lVEpbaDgsf4Gtcy0OwvZt1trkhIqsrNc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Po6Rvdl82KyrvnfJTHFz1SRuRGsFLiISSLHc2nZHFzAJvbhMFxqby3sLWhKmZ+Nod
	 IDu/Pv+tyOYZfv98759eh2QfTIl/BMQKweOc0RwIFtp6RRrtPGT8wFlEC3q2SvU6wv
	 u+i1df6WJqpIIbLxRWZ9/N0gvgPfQ4rAOaYKmfqo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82FD8F800E3;
	Wed, 15 Feb 2023 20:09:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A55CF800E4; Wed, 15 Feb 2023 20:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C4F3F80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 20:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4F3F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DzrftypQ
Received: by mail-wm1-x32d.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2844447wmp.1
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 11:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+RZTmWd7u5WQWkzFMPa+KxElUM1QLR/4kOd49BVhns=;
        b=DzrftypQWqJ2I+cM5brMYDser82T47lkagxcYKjVPWCk0LihiDvTBh+Ar7MK2rYnA5
         LHhWe1zpICsnmKJaxuDDnIiANxsn+RGaTL9N86IL6gmmYL6LYe/PlT+XsuxxGCHau3e2
         jSCrrGv/gUqNBMpdSZ/8haX4ib5iPRDima3Ue7lXfEE/5QL9tz3YdsCDBxsGRVN/Ctrj
         UOn5ex6fIyPBy7jXhRrSMRYRulHOhKk6saiMVLrNxuVL9YobbA+jdC3CJsm8cCaJvJMB
         8zAEX7E0nxz56vnsRpZsSSA87NXq1oVVGJwQYJKf4flB+Ptdnvcx1ghuK6nzVKBKhQBL
         1qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+RZTmWd7u5WQWkzFMPa+KxElUM1QLR/4kOd49BVhns=;
        b=srTMPAZYwwTa0mBNp1j52NwDuaZOM9PRyY6NfKv1lADiDy9frkxGo3IDlJQfD8NAWo
         D5Y/zu5eFS1UaKdxGffWQWAik/JHjHLgHK3u327G+aHEnjKe5HnRSeyBbQnODT7uCowg
         thopwdtHBU6qmJ5KqVS3+xegCc3xcgHJrVaMSL3g6eL/WVlziZ263mHtyaQewPMiWDP8
         KbajpLPF8ZsP1Iil9Dy1V0WuPb4hjCkNnV6MNUYRk5K7biTZRoFoFjydFz/roDO5sM9J
         +kwF/2mZkQRQELsyf3SL60DVXSDkfdEgA311k5sBcA430OQb86PtDHxdskDXuaaffu3W
         XAFQ==
X-Gm-Message-State: AO0yUKX26dUETwzaNgVawLvc+vkes9CvEAMqZfGD4yNj9jW9nIKhPI4W
	D+MTC5Jwp2033u+C+pJuOA7SjA==
X-Google-Smtp-Source: 
 AK7set8WrxhjECCiJgFeFpXFwJhkNfXLtyqWxPp7ZXxzdG2j+FL4rPxH4J8jcXdyPzCVUYsxIZTSBQ==
X-Received: by 2002:a05:600c:4747:b0:3dc:4042:5c21 with SMTP id
 w7-20020a05600c474700b003dc40425c21mr2909301wmo.6.1676488153377;
        Wed, 15 Feb 2023 11:09:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b003e00c9888besm3286963wmo.30.2023.02.15.11.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:09:12 -0800 (PST)
Message-ID: <af2ee77b-a16d-d8f0-a5d5-814e1882f7db@linaro.org>
Date: Wed, 15 Feb 2023 20:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM
 G-Link node with bindings
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <167639581474.996065.4144950480631659648.b4-ty@kernel.org>
 <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZJPI3NVEKPBEZW7MTUN2HGYT5VTS4QTJ
X-Message-ID-Hash: ZJPI3NVEKPBEZW7MTUN2HGYT5VTS4QTJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJPI3NVEKPBEZW7MTUN2HGYT5VTS4QTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/02/2023 15:10, Rob Herring wrote:
> On Tue, Feb 14, 2023 at 11:28 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>
>> On Wed, 8 Feb 2023 11:15:39 +0100, Krzysztof Kozlowski wrote:
>>> Bindings expect (and most of DTS use) the RPM G-Link node name to be
>>> "rpm-requests".
>>>
>>>
>>
>> Applied, thanks!
>>
>> [6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert to DT schema
>>       commit: fdafdddf7b2f5cab8d233ef97f1fad8ec7d2e7a0
>> [7/7] dt-bindings: remoteproc: qcom,glink-edge: correct label description
>>       commit: 6f9c2f19a8743c880903a031c7f3f3c534d4b813
> 
> You need to apply patch 4 too. There's a warning in linux-next now without it.

Bjorn, can you grab patch 4 as well?

Best regards,
Krzysztof

