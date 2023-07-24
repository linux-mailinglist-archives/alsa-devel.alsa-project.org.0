Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCD75EC78
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 09:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B70207;
	Mon, 24 Jul 2023 09:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B70207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690183572;
	bh=TrQp1nMY82Bv2CjInG+EcmCoASx8N7ozBRd3u5Nd3oY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KpeikedCxOAs+saqbv+7FfAoEDCqCl+eEkxjVtXvTuQQF2ajiAcjUEYnixEBce+Mx
	 lMkQJQnbeoZX0/RT39mFZH9JBsBBdwQnZ4dqbYuikz3PLbNibfo/3VqSRXclp0tJfB
	 Iu+g4d+CeF65CUQrra7o0ttDDZL5RJYfN8mraEN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA876F80153; Mon, 24 Jul 2023 09:25:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AD32F80163;
	Mon, 24 Jul 2023 09:25:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 008DBF8019B; Mon, 24 Jul 2023 09:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D375FF80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 09:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D375FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I0ybHvy1
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso5849807e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jul 2023 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183507; x=1690788307;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6To1AmJfKZALXGlXmCdcpZQBhgwdO8DUFybmC0BfNuI=;
        b=I0ybHvy1YLSUttFE8O1Qh6SjnmxzSFnmFPbj/00XHoyRTeHaQiLC6TZ6ZFlHQzVzWW
         Xv8slB0FYNivzUusyeUO7ItxNy/ydzn0hVu9dRvkgmFUIFCaA7fDjv1/FOUadboyKaky
         bmwaUp/gQoVCLxIlWWsSGXbTT+zapkwh7JZRaGA1AiF7fXvCVHvrNz9rIsPwZ2BbCUc3
         55nDdbJFyfK6jGOUN+h1BkkuEeDs6Cp0PLocKbZ1UaLl6UebMz6B2yQmvFi8CuV+ugi3
         UM6Ggq16DU8nO6K03iMt9pdlowN4a3IAXpVb3oggruIEH8ieOncYGw4L4x8+2OMYos/D
         KJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183507; x=1690788307;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6To1AmJfKZALXGlXmCdcpZQBhgwdO8DUFybmC0BfNuI=;
        b=XgvBK6sPl6LTyBQLcine0yHTZ04b01C+pKQadvPnMzip1QqWGaKx84cDvRauQ+y5QH
         gwNWlCF7ynX5HlgO7qhcT8IhGjbcyhPyWyI74xUpRPOc6KbvDGOYpQuzhd7aUG4p5Rht
         OP6HhELbLi4bsjaAK8Pb3InhlDaDEFhM0OsraTxgS9E30p1Josn6Oxp4HBry8JerYizL
         9FQYPlNXJm3NAWFlAT/vIfrYivyc3dViwuuWeRgnZN3M56x6TNHCatxkxdIiSkZFsTS1
         2ACDdP0bhzQgm32Mk9XwLA6C3sGHo9qHo/MjtntzeNuXSG6oMoNrhmlyRoq+fnsou+S/
         EFpA==
X-Gm-Message-State: ABy/qLZDL2tQQm9r5xtCWVrFO+TiVWlmm9QKpgaQMCnTF1piftzmK6KK
	DXhRdOrKvJiaq4WEh66Xtt55GA==
X-Google-Smtp-Source: 
 APBJJlF4c3ReKDhvLfkhVwoWeOuz74evpUCZ2CgKvSJySQdVz2fjNjGVbLZ0rhlEWgW66p+rwRWCxQ==
X-Received: by 2002:a19:7508:0:b0:4ed:cc6d:61fe with SMTP id
 y8-20020a197508000000b004edcc6d61femr4842985lfe.24.1690183507175;
        Mon, 24 Jul 2023 00:25:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 t8-20020a056402020800b0052239012c65sm303432edv.82.2023.07.24.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:25:06 -0700 (PDT)
Message-ID: <ae570cbb-08ad-5a7c-8dc9-4ad9f41d6e7f@linaro.org>
Date: Mon, 24 Jul 2023 09:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/7] ASoC: mediatek: Add support for MT7986 SoC
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "renzhijie2@huawei.com" <renzhijie2@huawei.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?=
 <Jiaxin.Yu@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <04a1a53ebd9df265da780c644a0db86952cde8db.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04a1a53ebd9df265da780c644a0db86952cde8db.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZU6RVBTAC3ZKUTYAOGV4XKVNL53QZBI
X-Message-ID-Hash: CZU6RVBTAC3ZKUTYAOGV4XKVNL53QZBI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZU6RVBTAC3ZKUTYAOGV4XKVNL53QZBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/07/2023 08:17, Maso Huang (黃加竹) wrote:
> Gentle ping :)
> 
> Hi Rob and Angelo,
> 
> Can you help to check this latest series and share your thoughts if
> any?

You got comments to fix! Implement what you were asked to do.

Best regards,
Krzysztof

