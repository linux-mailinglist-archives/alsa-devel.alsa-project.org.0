Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1B66181F
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 19:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEBEBAC2;
	Sun,  8 Jan 2023 19:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEBEBAC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673202579;
	bh=VMOr2HSxI0hWy7/31h3cSnWRfa3TcnZCDtnFVzPdAQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AyQ478AiaF1ySRdEsuLMu/y5U6dZYIOFSFWUZyRapcd02sXKqL5LMFje2O8b8+qRN
	 C7BQbEiqd6vqdj0mXIdWAZ4oaiNHPJTq1M5kSxm2d9xRfs1pSXXO7ZF66JMvrTe3xd
	 5CE8vrcpnpuKtKuphCINWii7m9Lb6zCaeHLqHLNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A46EF803DC;
	Sun,  8 Jan 2023 19:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD6ACF804C1; Sun,  8 Jan 2023 19:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A634FF803DC
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 19:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A634FF803DC
Received: by mail-io1-f41.google.com with SMTP id r72so3517697iod.5
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 10:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDTfuGXRrRs45CKYiBK7pYopbB+jZOfhP8Ir8+UtX+s=;
 b=Z2Jz5vRQxlxRYnAep34yDKDjoMNjLNNIKuhIG478r8NQQ4SUuXlt3U7/nlLaPFXbda
 q7uwjR2zTwa3W6F4aQ31iTkQlHkiQBS40SSqHDXgS0CNbbQoECzL5/F12Ljr1lDJvFWS
 tBPDg1osa/4moXaanfr81xrimAR8wLxq/XmKZNd8rJrKksYREViIykJtPztuTg/+JEMi
 5S3eZvS3DAW+RvHJe68xPngkjY61fT5BXTWbGnAlpJ6mqciHt3/wr7rQJtVgQhFN63Lz
 tsZBeKYPqZOc+Y2086Mp0McNmDjJ5UXCV5L2RUSj9tWyUXMq6Avh/3tcmm54UIVZsEmb
 CLVw==
X-Gm-Message-State: AFqh2kraBqoYQWCbm6TH5nqJ8WUrfJ9atpiqK6eWzElrfFnVFSXkBdNB
 Q051W1wg9v3CxfBqpsAmIg==
X-Google-Smtp-Source: AMrXdXvTNr0zvIMMDNWfmE8Eibz0/mh4lS8pJSYzM6aFWdBK1gmLZFdKN9xM7rNtD+B4CSYPoFbagw==
X-Received: by 2002:a5e:9e0d:0:b0:6df:dc79:a1f2 with SMTP id
 i13-20020a5e9e0d000000b006dfdc79a1f2mr39431061ioq.11.1673202518597; 
 Sun, 08 Jan 2023 10:28:38 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a6b7504000000b006e2f2369d3csm2429398ioh.50.2023.01.08.10.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:28:38 -0800 (PST)
Received: (nullmailer pid 174714 invoked by uid 1000);
 Sun, 08 Jan 2023 18:28:35 -0000
Date: Sun, 8 Jan 2023 12:28:35 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,lpass-cpu: Document
 required-opps
Message-ID: <167320251438.174645.13068817278012260437.robh@kernel.org>
References: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
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
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Rohit kumar <rohitkr@codeaurora.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 27 Dec 2022 17:31:33 +0100, Krzysztof Kozlowski wrote:
> SC7280 LPASS CPU device node comes with required-opps:
> 
>   sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('required-opps' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
