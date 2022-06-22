Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92815554D82
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 16:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC611EF8;
	Wed, 22 Jun 2022 16:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC611EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655908606;
	bh=weJ7vBqxNemuLj4V0Ey7pQPgm6IBFOZNlz6y6numdf8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKO4lQN6k/KoCimZZ1OGhqjkXEkogjOn1qZpzE9yWqKoc4PKaPAmDRyrAYQqZwXwR
	 Uzm+6XE0c1nSpRzta7k8E2ej+huBPYcfyWfN5EWh9Lp3A97MF0UA9UIT57tNfZU37N
	 uOPQscSt8nrIZ+lNdcSsw6LAyOqS3OcT4z67s7DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B650F800CB;
	Wed, 22 Jun 2022 16:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1007BF80482; Wed, 22 Jun 2022 16:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A74F5F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 16:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74F5F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s2FyGDQ8"
Received: by mail-ej1-x631.google.com with SMTP id ay16so15328763ejb.6
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HivjPqY5IPVew4KDh5JXs42EJqg0Zja8oJPdWGPubQI=;
 b=s2FyGDQ8Tc33kJ135PIVk1gNLuVNCjiiGrAW5yin91Xw+BcqIDVA8NdwUuktAlsgws
 RwFI5qSlSO48nC9DshTuVS8YP1nJAzgkSAa3duuL+uXlh/xk24ZTQzRYk+et8wxeaGxx
 18IvazPkkrknb/34Ar6UazzVKdNqU98Qsce7lZNLcqeUlH1PGdxov1I59KOpdt/UpOLv
 rsWNJoKwVwwRcNwAvD/gQqDlKFEeZ6D6SUT71N0lYcpst9onimaHJruIlDCUdGoRj2xs
 G5GG1OiDBYBEqb1YvNgGiQLifzRPfuK5TY1nGNZ14CagV0fv3NBWzTsKOHo04b7gaw3+
 Rfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HivjPqY5IPVew4KDh5JXs42EJqg0Zja8oJPdWGPubQI=;
 b=GYHdHDFYqLdfSyL7SQcLqicCk0kHPajnWaMD7es3qsHhvlBH+AlZJzWvF5MD3SEbwZ
 flzqsfQs6Or9jKfINfN2ZcCOBeTu4UBNZHyI2Hioa4yKdmNuH+FCF5b/dm1eIpbVZPYY
 rSHLyMms7/1OyIFe8x4Wx4Vh0bDD11M51A3nPgM6m7/3Lxy42Kpw+RI+1JXkKm+L0yXc
 Wg39Y66zR0y4l2JDQ3rBb1IkXUJee3RGA3tKu7V7gppdaelHlrcpss22v4sj0AwZ0cFC
 Bbjd9ASscm6hZCYfQHTaaG2HqE1nKa/rsPcrHQD9p/vtQL6TweF1fjlNjZd7Vj5Cn6OE
 zWdg==
X-Gm-Message-State: AJIora8h7bIxSkW8g41tW8MW0lOaXFrXdQUyHJS/JssdOyiDrGxvRf/D
 FHeGH2WlpJmikN/l3gF3ZtjmjQ==
X-Google-Smtp-Source: AGRyM1vpuXS252Vt2TCPoOf5IgGFENHWXoAL4VWnINzySUbFZ5zHejYqKkDpqUdKrVHzY0mavu5dcA==
X-Received: by 2002:a17:906:5d07:b0:722:e1e3:ab6b with SMTP id
 g7-20020a1709065d0700b00722e1e3ab6bmr3322620ejt.674.1655908517379; 
 Wed, 22 Jun 2022 07:35:17 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u23-20020a056402111700b0042dd792b3e8sm15275377edv.50.2022.06.22.07.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:35:16 -0700 (PDT)
Message-ID: <486c2e98-db05-de1e-122e-bda3f844e4ee@linaro.org>
Date: Wed, 22 Jun 2022 16:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] ASoC: wcd9335: Use DT bindings instead of local DAI
 definitions
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
 <20220622064758.40543-3-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622064758.40543-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22/06/2022 08:47, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Get DAI indices from DT bindings and remove the currently used
> local definitions.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
