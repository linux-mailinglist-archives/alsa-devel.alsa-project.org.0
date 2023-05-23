Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4370F63A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1461FA;
	Wed, 24 May 2023 14:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1461FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931008;
	bh=NNcFQ3jHoV3sXFmNPHXyYfOigeTz3CI6SdPXTKFzdYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mJazhz1SVmeVUFzxP0aWrQ6elDNF2J55Vjt4S7oDm3JRryzkNH1i+AyChSOtJjsXT
	 d2WKtcI0kN8Gz0qkLicITF24bIo1lHkD63h62qljxVxnKeZullY0ccFEjnfSBeKP3e
	 3jxMUkWcCZ0b9o1XmEExbUWYgk8BWsZuir60na7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E99BF80086; Wed, 24 May 2023 14:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C80DF80086;
	Wed, 24 May 2023 14:22:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E35BF8024E; Tue, 23 May 2023 18:26:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E85CF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E85CF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=mYu0SEk+
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f60dfc6028so432625e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684859169;
 x=1687451169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hWDKOTssM4FQyfGCYtsz+cR6mie3Z18WQlIfyIGgK4=;
        b=mYu0SEk+RZXENY1xtpNmWBrgNsZdpZ9O4tniZ/Wkwa+8dCOI8W1i2GmjzsBImvf2OQ
         /+0iD2cM8wt7vw7Z1a9jbaHadU1iIPqQ+lAaExnbAISEjZ6PCHUEpy3M+fVk3gzuUz0P
         j71SEkbgQu3MPnS5Cd7/uCdBfthCcWCXn3ZW2U37PSQAQQskcFiAL506vrhnYsinXa7S
         ZIwAKdhOixG1Yf0s3lGwng3Olx2HfN+e/WYGEDBAAQGd9SsnaVnw9c5a0YRZOpJ2SiqM
         gYFiTjkYtzop1yt1Lws4oD6AmMb4rB/5f/w7gz2OKk7yIDmOvByd3ZqDv7fNav2iirnd
         iISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684859169; x=1687451169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hWDKOTssM4FQyfGCYtsz+cR6mie3Z18WQlIfyIGgK4=;
        b=N7tk2AYSkR4nu9FeB0SeWkRVUqkzibg+vANo8scjT3YOwvZ7x51YZpTpaWK02CGaq0
         btiCZcX7LQaAVE80DGTH7/aAbKp4YHCdLhXRv+SuAwSxHR+CiQBjFBCNUp1W1atgsUOJ
         cfQeeS2J2kEnxwunLn5aZ9eFB2dzyfRr3Je2ukd4Ms5GhOQJG8DCMMJED9i0H2q5Zd4E
         qH+vu6LH+QTXsnd0KQ/eA1roQ5W0nFuB324Jq6y8DeY7I6ItQrRJjC6XAExjHiavdAFB
         ilFgtaqKBZMbesspUuAlgSZVvEkOnt0Em8M2MQB4ltQsnaLFcoS1dcM4JyGeRsrO8J7m
         NZqQ==
X-Gm-Message-State: AC+VfDyQ0+2FRBlxgofD/LWWrd0/our+XcqQ8GDMzXbx5kYbWRZ3ntBe
	y/qwNPoE6g114DcLPop0ZluOzQ==
X-Google-Smtp-Source: 
 ACHHUZ7wvkNksRRlhJ5pqhiWSVhwW+UQHRyyp9zUBWS/rshrEORKyWRTxRCw2le4JdEfLngvcdm3lg==
X-Received: by 2002:a7b:c4ce:0:b0:3f5:b4e:944b with SMTP id
 g14-20020a7bc4ce000000b003f50b4e944bmr9335119wmk.18.1684859169598;
        Tue, 23 May 2023 09:26:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c205800b003f6041f5a6csm7729571wmg.12.2023.05.23.09.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 09:26:08 -0700 (PDT)
Message-ID: <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
Date: Tue, 23 May 2023 18:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2X6GBY5P4V4WSWSWOC6R7FBUAGMMKIUD
X-Message-ID-Hash: 2X6GBY5P4V4WSWSWOC6R7FBUAGMMKIUD
X-Mailman-Approved-At: Wed, 24 May 2023 12:22:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2X6GBY5P4V4WSWSWOC6R7FBUAGMMKIUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
> ADDA_BE is used to connect to mt6359. For machine mt8188-mt6359, codec
> for ADDA_BE must be mt6359 which are configured on the machine driver.
> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and DL_SRC_BE.
> As a result, remove ADDA_BE from items of link-name.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are done.
Why these dais don't replace "ADDA_BE" in this binding ?

Regards,
Alexandre

