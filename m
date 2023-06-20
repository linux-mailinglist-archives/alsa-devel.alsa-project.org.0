Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFA737230
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 18:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38B0D74C;
	Tue, 20 Jun 2023 18:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38B0D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687280300;
	bh=Tk4kCbWswQxPJuBn9T1w5NqgHjftHvngbIqoMjZincw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rSwdFHtmNcRNLAE2q3mpxa2B9Scn4otyXAhMJAThpM7FScDoyQaMtVErcLIw2pAbA
	 mAU5tKJ1B/fvZdqhGkJ/v56eP1cP4rfIXqp1tXePlIAXsuqoTp1t8jp1zlmBbbgsV8
	 eIgVc04o/yNr2A3cSmWSv8dxoO2j/qxROp9aTR9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 967E0F80169; Tue, 20 Jun 2023 18:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65DB7F80132;
	Tue, 20 Jun 2023 18:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7E23F80141; Tue, 20 Jun 2023 18:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7210BF80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 18:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7210BF80130
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3422aacdcceso16740305ab.2
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Jun 2023 09:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687280242; x=1689872242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC5LTzrdW72AjRfXsobL8u3UH+veW/fbZ9ZJyUEUeyc=;
        b=CBFsM+ZMj+h8QeLplk9Vq6xMCOtNi55F6wenEfy4iD+i/3OuPsmioavUZ3veC1httg
         935Zkv1YXD8r/t9Km4uM3XkSK2IyIG0tWmAaSv6jdJvs2CGbshP8uriVn4Pw+SlS/krR
         z4Gft9fMcLzqoXDO6MuSgbqB0TlNT4btJWsAWtFmukUwuTDdfXp5JRt4KXAIigFnMk8v
         7YC4pWCE14dDIAoCzbo5r60AQEIS1n6qSlDk01CUQstImwH5uMFn4oYtGIn2+4R68Wj6
         8vsineHz429Ac5cNt9y1He9PynD5Y0nlPI5NX88fnJwpvUxEjuVXEjP3T/+llEvYkM/9
         GPIQ==
X-Gm-Message-State: AC+VfDxqTqaZLLYbGasjpYgWrfYMiNecpureGj2OZre4//IyZVZAKlqf
	txE2T8WO6d3HLZh+j7TNvw==
X-Google-Smtp-Source: 
 ACHHUZ6Wepi8qaaAa7+QyMTVgGI7G32JZdMVMM6o+c/Yvv5Tqm/Ued6aJXSw2qrtLL6F4MGXPFOwjQ==
X-Received: by 2002:a92:c806:0:b0:341:c484:1c36 with SMTP id
 v6-20020a92c806000000b00341c4841c36mr11987996iln.8.1687280240930;
        Tue, 20 Jun 2023 09:57:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 p17-20020a92d491000000b0034248a56432sm703724ilg.32.2023.06.20.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:57:20 -0700 (PDT)
Received: (nullmailer pid 3815844 invoked by uid 1000);
	Tue, 20 Jun 2023 16:57:18 -0000
Date: Tue, 20 Jun 2023 10:57:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, devicetree@vger.kernel.org,
 Patrick Lai <quic_plai@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x
 family of speakers
Message-ID: <168728023784.3815805.7354509685855772862.robh@kernel.org>
References: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: UPQZH4OKNLG5SI4QLTVGAAK5IB33S2GV
X-Message-ID-Hash: UPQZH4OKNLG5SI4QLTVGAAK5IB33S2GV
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPQZH4OKNLG5SI4QLTVGAAK5IB33S2GV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 16 Jun 2023 13:57:50 +0200, Krzysztof Kozlowski wrote:
> Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
> in Qualcomm QRD8550 board with SM8550 SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. None.
> 
> Changes in v3:
> 1. None.
> 
> Changes in v2:
> 1. Correct compatible (sdw version 1 -> 2).
> 
> Cc: Patrick Lai <quic_plai@quicinc.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa8840.yaml          | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

