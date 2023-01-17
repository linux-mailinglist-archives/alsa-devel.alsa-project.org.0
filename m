Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033966E709
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 20:34:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C2E66D2D;
	Tue, 17 Jan 2023 20:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C2E66D2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673984059;
	bh=mtjTovEPjxvYGK1uAME9HAj0lhPuRk9rZFb8FXi/J/o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G8YEw+WJ/mEclRTZrfQVSBuLW0CFwcgH+qQqjOe0/0rwFd1wIWh2CPbcLtoMPnMqE
	 KCzqGEK/CSikJ0u3LOC/xJhiGLj24XHYFNmJs4RXH8+WJsQYQ9OwQWJrIR7nBnuJTW
	 cXURj0Nato6GOVquTcBmjNGv0moBw9pwV9oy9yVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F0F0F80083;
	Tue, 17 Jan 2023 20:33:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C497F8047B; Tue, 17 Jan 2023 20:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2BF7F80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 20:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BF7F80083
Received: by mail-oi1-f175.google.com with SMTP id p185so5717184oif.2
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 11:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/5VHDfuP60dlqe33FBmFK6FgItob/cxxKnvyTavuYE=;
 b=JivdlGItus3L/m9/x69flIkJ+df51UuxstjdPyEK/w6kj0eCL1wMDbtmWVfsAH2Tta
 24VVaOSDG5mXjjDCGhTR6svhMCWgCCooL5/7QxAJ8qM7DRaNvPjccnEo1iWzVjzmjstw
 9jP8xQ0V8f5acqe8AdjT8DvzcNxhxFJtF6RRt5rTZzyKtkImI89A7Pi3Rfl4CUHYHnUC
 K10bGdadMnkOL+fGKBDaBRj2VNQ408ikYY4dHstMq3YRnCOmVP6DYNRGwJvQzoaf7Ync
 gSoGsHTHd3mVE2zdfyJ4TQDjTuN8Vr4YME/ufcFBuT8yCut4R41vFbKGem8f2SRs0KKa
 wKeQ==
X-Gm-Message-State: AFqh2krfbcyxfJOpjSor0W2l7iNpYyPXJeUsMNS0wXVIRGTDHQ3uYfOy
 7wqN2IgyTQa6XZpsk5G5jQ==
X-Google-Smtp-Source: AMrXdXvSKOggm/yjSQrSk84DQlXTfHz0baeJwd3/p31H4zN6IQISF1PzfbOm3NU2JN6ca56PgFDj1g==
X-Received: by 2002:aca:6706:0:b0:367:30b:ef76 with SMTP id
 z6-20020aca6706000000b00367030bef76mr1947484oix.46.1673983996953; 
 Tue, 17 Jan 2023 11:33:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v25-20020a05683011d900b00683e4084740sm16785861otq.10.2023.01.17.11.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 11:33:16 -0800 (PST)
Received: (nullmailer pid 3504196 invoked by uid 1000);
 Tue, 17 Jan 2023 19:33:15 -0000
Date: Tue, 17 Jan 2023 13:33:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: qcom,wcd934x: Allow usage as IFD
 device
Message-ID: <167398399522.3504122.3368632808087174176.robh@kernel.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113162214.117261-3-krzysztof.kozlowski@linaro.org>
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
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 13 Jan 2023 17:22:14 +0100, Krzysztof Kozlowski wrote:
> The WCD9340 audio codec appears on Slimbus twice: as IFD device without
> properties and the actual audio-codec referencing the former via
> wcd9340_ifd.  Allow in the binding both versions to fix several warnings
> like:
> 
>   sdm850-samsung-w737.dtb: ifd@0,0: 'reset-gpios' is a required property
>   sdm850-samsung-w737.dtb: ifd@0,0: 'slim-ifc-dev' is a required property
>   sdm850-samsung-w737.dtb: ifd@0,0: 'interrupt-controller' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> oneOf: interrupts-extended|interrupts is needed to avoid dtschema
> limitation.
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 58 ++++++++++++++-----
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
