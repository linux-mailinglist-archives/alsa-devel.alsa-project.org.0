Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE466E6E4
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 20:23:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59B66CDA;
	Tue, 17 Jan 2023 20:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59B66CDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673983406;
	bh=SjNRNiTzikMPpjKkb9wzdKyMfUzA7YFBI3glIrtDNvs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SAVYgJBRu0yfikaSpYXSFKtXQaXFV9rWeUVASJ+pPXDjuChC71BXsgdp96NFZjHd8
	 Tp9wfykO8e2AiQtyvLIy3gtx8l1aKEVwIA9wFixyzcbnLwK9gfWTttudUq1FnMC2ey
	 AXBFJizwZT6JZO9mnn/mXWZywkQ/qD+HUhOQ/jDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF48F8023A;
	Tue, 17 Jan 2023 20:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F338F804DE; Tue, 17 Jan 2023 20:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB274F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 20:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB274F8023A
Received: by mail-ot1-f54.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so18410153oto.6
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 11:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rG3R2V1qqSN44Ku2yfSe1P+2hvGoj34mROM9Vs7AX8=;
 b=uR6+OXX0/Bh43rNXeS0XtF1K/UoJKJSaVdnIIYcZ/II0FnZoMZ92yVdo0JdulmmIxP
 Wb91s1Of4cRWHsvMIwaEmgvRb490vOYXpgdyv7+tjO4o9+SYrzvPMqPcq8EcjDGb9kO9
 ZJ3+dFKeDC4mXL0TqHoDagWA/Fvcz6NPp1Zh805y2eYULHfa5wLm/iajAqqrcE6xAt7u
 d1s35GoPAYgSPqLq4ZoaT1DdOiNZztZefkiUseqacOX5ZTI3PmMxnEeHGDrlPAmv87ue
 ulpcsJ0U7D+qAbCeB/x4Apg3I3m/PkfSrdCzMyYmWVgAju8aCmcfkkLeXv+sJS/PlQIV
 uspA==
X-Gm-Message-State: AFqh2kou4vD48iC0he3bLPqmdym1QcVRfrBDKzy7P7PhvFM7OFHp4Q7t
 0b2eOk5IE7klO51oEuK+xQ==
X-Google-Smtp-Source: AMrXdXvKqegazsLgf2v9G1uLKuVnBCQgYZfnuujKkNC+iUoo7aQUeewPrn0DJQx+IyQAjvv5Q53F/g==
X-Received: by 2002:a9d:2c06:0:b0:684:c8ff:8844 with SMTP id
 f6-20020a9d2c06000000b00684c8ff8844mr1992677otb.12.1673983340756; 
 Tue, 17 Jan 2023 11:22:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w25-20020a056830061900b006863c59f685sm3601880oti.28.2023.01.17.11.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 11:22:20 -0800 (PST)
Received: (nullmailer pid 3489286 invoked by uid 1000);
 Tue, 17 Jan 2023 19:22:19 -0000
Date: Tue, 17 Jan 2023 13:22:19 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,wsa881x: Allow
 sound-name-prefix
Message-ID: <167398333901.3489228.15719942715865032325.robh@kernel.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
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
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 13 Jan 2023 17:22:12 +0100, Krzysztof Kozlowski wrote:
> Reference common DAI properties to fix:
> 
>   sdm845-db845c.dtb: speaker@0,1: 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
