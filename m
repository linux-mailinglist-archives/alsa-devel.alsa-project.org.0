Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C934F7FDBD4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 16:46:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08FA0DE5;
	Wed, 29 Nov 2023 16:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08FA0DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701272809;
	bh=xUYYYEmBSXhImlVIW4C43XXNMTyeIO7EA57oEmOiMbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pHkhABlnErNtDHgjtD3I59X6ikOzmG+smYKsgaf0dhSoeyUNNla08pUhhYMVZrXep
	 VDLOa3z9sDOJe1jcdtMH1xfn55UuapM0Vyi+mge/u+eRCijNpUCCxOPngvf8yftzkQ
	 5DZENCajHVJ4xVr6HBLgCFIFIjOSSNER1rZi3uG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A365FF8057A; Wed, 29 Nov 2023 16:46:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D56CAF80571;
	Wed, 29 Nov 2023 16:46:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC359F8016E; Wed, 29 Nov 2023 16:46:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6713BF800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 16:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6713BF800F5
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6d7e6df999fso4160220a34.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 07:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272763; x=1701877563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX6FM92SzLMJeCUeRB2dg8tFHhzxvahPIFNJy6PUioE=;
        b=Y5H+6YMcyE9N4j1qquCO2bxlqv1joiKTM9yyXc4LBh1jL9wBEyp9dvpnLbCQ2VE8IA
         KgTBGUjYP5qclFLaocCIpQvc7KOVjdYZhk6EpI2J4sA0oWZ8bwCJmbqVJB/WAp7HU+dl
         Dc/hrBKU4mO5jXFhFd0s5lqcZBdSOsHHeVnkIqrFjKaOtFnFXwXEXGespWdbqiYlUGNZ
         v6mEM6hVYE3h61zet5GK8HFA1q+52nPl9ga49+by74vwFxUsZYQfgZ7fX8+6jhN17xmv
         HJ7DBLFzspzcuVHJuNklgy2yYZE/MHLgoReGxHdrQVDFUU9mZ+xhn8PE9dEqnVJkFDm/
         e0Iw==
X-Gm-Message-State: AOJu0YzhFRJhYOGjPtMDRYGamJXQoUvfkJW0O2/sY1nUye/Rs7S7iBPB
	FA9Qap96WaAQoh+nWgSW/w==
X-Google-Smtp-Source: 
 AGHT+IFe/c2yEjmho9fO5Ng0eyX8TfjC8a7UEywCU9SJ9uswigu1VI/ra5Lv1itLA8JDaUdHSpMlJg==
X-Received: by 2002:a05:6830:1450:b0:6d8:53a5:7033 with SMTP id
 w16-20020a056830145000b006d853a57033mr1459616otp.0.1701272763215;
        Wed, 29 Nov 2023 07:46:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a0568302b0e00b006ce33ba6474sm2019660otv.4.2023.11.29.07.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:46:02 -0800 (PST)
Received: (nullmailer pid 2540896 invoked by uid 1000);
	Wed, 29 Nov 2023 15:46:01 -0000
Date: Wed, 29 Nov 2023 09:46:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650
 LPASS RX
Message-ID: <170127276101.2540836.14444552479968015113.robh@kernel.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: BCOXVSUH5NNHN2FE2CA2VNJWVF53JU62
X-Message-ID-Hash: BCOXVSUH5NNHN2FE2CA2VNJWVF53JU62
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCOXVSUH5NNHN2FE2CA2VNJWVF53JU62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 29 Nov 2023 12:30:11 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
> macro codec, which looks like compatible with earlier SM8550.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

