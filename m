Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35820671A86
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 12:26:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81CC93B65;
	Wed, 18 Jan 2023 12:25:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81CC93B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674041202;
	bh=O60PAixalQT6Q0MZkh8135CsbmiJPW23NVEmLTgbF0U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kl9835uevetwJE6fL9mG4lNmZUBF1Rq8KqZVokz58QvUf/A1AYVzqEOaV9WcWtIlh
	 g1oITnqedzKA4+KBFdArnY4dfkGRpApY0FSYkj0EbDP87D7b3E19nTrJdVHHiiffvm
	 0Eituy90oWchAqml8oULEaEAksl9aLyFn20JFsDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACE5F80083;
	Wed, 18 Jan 2023 12:25:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BD1CF80482; Wed, 18 Jan 2023 12:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B73CF8024D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 12:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B73CF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LQWSOv3Y
Received: by mail-wm1-x334.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so1162070wms.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 03:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9S8ByPT+cY6acXLQiIcdNeZj1HoatdZe/caRBhsxuvQ=;
 b=LQWSOv3YQ2h5aKJS4y8NJjzjDQiY/Fck2pr/3Gu2YJkTEVEKXF9o7PHxgFzW91V3mx
 emFkQVe0kEcO/f5nmTsfo9esCNJ9q8czxRQncOOVxyCogxufPgDTXslRu4zK3iCId6Y/
 HoxATEEYMqK8H2F2picHLhAVqGodKyvfh8k10HICSoNwLfwZO9t2AxAvmJxZR0QSarjO
 HOPxViL9D74ANNY1Xu0CtKMdF5G+UpKb9fAVKpPBXHLaB1vv4MINK/lgKezSU4wnbR6/
 fMDVXsQe/CUEEqbf7Ua5iRiOnFbLoIJgSVJP3t0rAekAYF2lft9mOF4762qSNKClKaPa
 bRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9S8ByPT+cY6acXLQiIcdNeZj1HoatdZe/caRBhsxuvQ=;
 b=Ipg4yvMQujXmOww5uSVEPOsQiFe9pMMdgCrCLTXbPie/BUI0qLx7UUwDvz0OYTPx/x
 rsbdibQnTwhezQXj/pDLkgEH/04Nq0dqiNEFZwaiyjgk41MP0C6UoQndUAMmwDwIaCmd
 Wdn1+rFTy6FvyPDzAXML8f7B9VdavSKVHD5WmN5QDRQSu7vPUIRSnjnLUmHCw6DXq5lc
 3b0ZNot4dE4YPTQAz1zbld60to32+ZElPZnnI7V52KVWk4k58Q0Oljeq+9rERTthXDzB
 0lZrcy1o2DzYxFXkk/blzI3hm13O+989HWbn1C9LAntYvPE1OekqkpwwaArxWxz/9OpQ
 6onw==
X-Gm-Message-State: AFqh2ko/qdJF+g7b5RGiWwbDBhjXkXd3Nt3lKMcYq9rJ3NyMSN8jaxHN
 EizQqDXB+J3gJxGNpeL4uQOtrQ==
X-Google-Smtp-Source: AMrXdXvHoKu8bsx3tz1pLpniDjLrdVUdOpfIyyOb9hCGG1RqYdqx09IsxRagPtPlOw41/A8sDx+tJw==
X-Received: by 2002:a05:600c:19cd:b0:3d9:922b:b148 with SMTP id
 u13-20020a05600c19cd00b003d9922bb148mr6527526wmq.27.1674041138553; 
 Wed, 18 Jan 2023 03:25:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm31460441wrm.6.2023.01.18.03.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 03:25:37 -0800 (PST)
Message-ID: <331eed95-eaf7-5c5a-86c1-0ee7b5591b9a@linaro.org>
Date: Wed, 18 Jan 2023 12:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
To: Rob Herring <robh@kernel.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
 <20230117192724.GA3489389-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117192724.GA3489389-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 17/01/2023 20:27, Rob Herring wrote:
> On Fri, Jan 13, 2023 at 05:22:13PM +0100, Krzysztof Kozlowski wrote:
>> The "slim-ifc-dev" property should not be just "true", because it allows
>> any type.
> 
> Yes, but it is common, so it should be in a common schema. Though 
> there's only one other binding using it (wcd9335.txt).

This is still wcd9335 and wcd934x specific, not really common. Maybe
next Qualcomm codec would also bring it so then we can define common
schema for the codecs. But so far I think it is not really a common
property.

Best regards,
Krzysztof

