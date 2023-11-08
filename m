Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AAB7E5CE5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 19:10:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15D2827;
	Wed,  8 Nov 2023 19:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15D2827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699467016;
	bh=MNZnjdiFHtxb1YzS47vmLXTgQjfcxH+TJrPZZF6J8vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YzlonR1xLG9nrjHMmasjxRa1wWOjKCJxaSNBM0pzxw8g6o4j3ajqryvMvrO+4zWj6
	 qm6VVxuHDiIqe0mXbgmVG7zTXkwus13tAd4q8/ZnsB7V1weBB5vDkzQqCjJXwB+Xik
	 eKdjlzxqp18ozTsUxtxS7y8iffvSff2xvHm7boBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59755F80169; Wed,  8 Nov 2023 19:09:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF793F80169;
	Wed,  8 Nov 2023 19:09:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB3DF8016D; Wed,  8 Nov 2023 19:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16450F800ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 19:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16450F800ED
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6cf65093780so4403408a34.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 10:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466957; x=1700071757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnGahxah7u3QgZVPvtUjb4k93efx3g5ON8mE+tawIB0=;
        b=OpBDvlbIsF7BSuJr4EQqKBGjJ6qpV7h+Dxi2/QJDMkdwqebO4iS3fMZuU6CstlQajO
         P5VEIgj2mx7aPazGAMd+wUVvzKJElSx0y6sfZmi6PmWmvU3piGFE0UP2+zEKRzvekOkZ
         V9JP4ykEkXvKNRnp1EraHz/uSnb/TdlVgwUYOFIycL20O2E+h8RF1t6q6k92i0PY1QDN
         MATlImn+hGtA48+t+YXNfkT71Ah24EDSHQ80PRHpKQNRhmJMPlJIj7NXYZ+Kmj59KOj2
         Smwpnbn/D5KizWnQCXwXuN1r4/XCPFpZFL4D1CBITF6IKjMD4AThcyxU3KRu8HDWDWwr
         mWUw==
X-Gm-Message-State: AOJu0Yw3QorXeH3pxlq1qIW/OkScmTlEaxdGbLvb29vAiiyMUkjAaqzr
	vzXcVPBQzEHeLItNIz5u7w==
X-Google-Smtp-Source: 
 AGHT+IH80TXU8x2dEy8NfsISE5Tz1j4RmhZpTxSuBSFCD6Fp9P0/NzEpZSn7wSjNfk+2BtrLisoGKg==
X-Received: by 2002:a9d:69d9:0:b0:6bf:3f4:3edc with SMTP id
 v25-20020a9d69d9000000b006bf03f43edcmr2665760oto.22.1699466957554;
        Wed, 08 Nov 2023 10:09:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 v15-20020a4aad8f000000b005737ca61829sm950379oom.13.2023.11.08.10.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:09:16 -0800 (PST)
Received: (nullmailer pid 2647761 invoked by uid 1000);
	Wed, 08 Nov 2023 18:09:15 -0000
Date: Wed, 8 Nov 2023 12:09:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Message-ID: <169946695488.2647474.4328961977911017338.robh@kernel.org>
References: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: TOE4RGNYCZM33G4IAHK7IC7GSIB3XEMU
X-Message-ID-Hash: TOE4RGNYCZM33G4IAHK7IC7GSIB3XEMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOE4RGNYCZM33G4IAHK7IC7GSIB3XEMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 06 Nov 2023 19:04:22 +0100, Krzysztof Kozlowski wrote:
> Add sound card for SM8550, which as of now looks fully compatible with
> SM8450.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

