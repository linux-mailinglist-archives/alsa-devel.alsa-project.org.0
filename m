Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC04EA3C9
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 01:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D00F187D;
	Tue, 29 Mar 2022 01:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D00F187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648511022;
	bh=+hpBlv5p65QH6iI5ZDna2GOFWHuDkqV8cSnd/g3cI0Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2YatkxNZ50X6YdjAczoVqWLBq9Vr55RNZ36XdDYd40kE8dMSE5q8yukBSXt+wm+B
	 /5Z78MXFexO6cl4kKdMs/GtB76UfPpFXN6O6LdpQ/EbOw3H5aloOK6iaST3klSY4SX
	 oaXPWODNrp7sS7TJE2VUzoyubiSiuELoGWqkhldg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC6FF804CF;
	Tue, 29 Mar 2022 01:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0DBCF80271; Tue, 29 Mar 2022 01:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A097FF800FA
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 01:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A097FF800FA
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso16964178fac.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 16:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/bMD5XJK9ZeZ9JMXaFrOnemeInZdC+WRoQ/+0h/V9wY=;
 b=mdhKMzi+dM7kG+H/nwYsAZGM31QbiKUQjjL7V+sR6h+bKdaiD6jp+BzWNZlbGtjwO7
 iPCZ1lOgyr5ov/xzZ1l4n5Q8uj9V53pbwuvO5hx2pNnein2/bFPFYnDVAiDCkzVjEMrS
 NQ3STDZVrnNgrb7wVBpsBSnJmPzmCTS8+ODehHSzVeh7uAjFZFdU/BXRLNggIVkn0uuN
 YPOHDSrHQFcGKVQ9VIlGLhYxpUd2rddIMH+pGil1AnDSg3Li+8DCzgZR5arbJBfNsAM5
 IBj13yz4fPql5pU7UTfbJhTjg/eCZdFi9LecfMYbUaAUzGTCG3TR5LygVIMAR5Aaa6D+
 DNRg==
X-Gm-Message-State: AOAM531QbOj+jYmcAslUPwdA6wQOWUMfjhyOkAe5pESF+9ik+Bj+w97U
 AXiWYG3CiXOUySirJ9EVnw==
X-Google-Smtp-Source: ABdhPJzw+lAN1qKaN0d03io7vTQ2/YLq7E4IIiFYE2pFuJh6CZ1aVJn0WUpuqZjVOxM8u1TOPM2Mig==
X-Received: by 2002:a05:6871:694:b0:dd:a43e:fca4 with SMTP id
 l20-20020a056871069400b000dda43efca4mr842188oao.77.1648510958312; 
 Mon, 28 Mar 2022 16:42:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y143-20020aca4b95000000b002d9b530a96esm7922037oia.44.2022.03.28.16.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 16:42:38 -0700 (PDT)
Received: (nullmailer pid 3269333 invoked by uid 1000);
 Mon, 28 Mar 2022 23:42:37 -0000
Date: Mon, 28 Mar 2022 18:42:37 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: wcd938x: Add mic bias supply
 property
Message-ID: <YkJH7eRooyZ6aulW@robh.at.kernel.org>
References: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
 <1647852981-27895-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647852981-27895-3-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dianders@chromium.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 krzysztof.kozlowski@canonical.com, linux-arm-msm@vger.kernel.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 swboyd@chromium.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, bjorn.andersson@linaro.org, judyhsiao@chromium.org
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

On Mon, 21 Mar 2022 14:26:20 +0530, Srinivasa Rao Mandadapu wrote:
> Add vdd mic bias supply, which is required to provide bias
> for wcd938x codec.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
