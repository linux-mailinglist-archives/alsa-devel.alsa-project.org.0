Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F340EB47
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 22:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A921865;
	Thu, 16 Sep 2021 22:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A921865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631822686;
	bh=hcAYqnVKA5c1zAiqzJi7fcfE+fS5njoM2nTNMBxDP4k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dy1CMmOz5wfVpJX0ry3cyLAtVcFRyRpT8rIYxYKHk8+LXCkTEu32A4ixTGDrj9gFw
	 k7PDjzYGaJqIdOFpq6+2zpR6yxB4G2jYcjpBSSMlc6wKCa/BCKeHNnIf1TLEuc/WnE
	 FwlarvSnCRljqujw9TaCnwdJnKUDuIfzYHsNQEc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA8EF800D3;
	Thu, 16 Sep 2021 22:03:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF7F1F8025E; Thu, 16 Sep 2021 22:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6C8F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 22:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6C8F800D3
Received: by mail-oi1-f181.google.com with SMTP id w19so10658830oik.10
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F9aqKzvhNX0EX8ftMf6SpEqFqIZooGHY07obCdZTdhc=;
 b=AypNKwhlXkEAi8jHnBxHwj6YXcthpJF/lIQi8Si+iCRI1l4GU9exPWdLIIPuimtzbp
 lUf+wvBbIc3uadVZd6d5rtpbsknsoRmc/HhSzGd0COZBSzwMe6uxCaRjt/ZzqUmVeWbR
 9o1WCVjrfPV8sgKrD9JzGcujyrNeyuhqHzyOgtlnNdm105PLQUrHCZIsw6//bjsa7p84
 8njygTPlDUgXGdJ2ofD2VGIPJuAdH3IWVjsCIQLU1BwwnZoXZo5p74ETAOXKFKIF61Xt
 QEi7NM4Yqa/dV6/iqcQvCaq7p+xKK5wq2uCXo+t33N6adKE5vc1HyR+nKwPu4N6CpG9h
 cJlA==
X-Gm-Message-State: AOAM531bnKFDj4Ad4Kab+FXqY33QjGYWERzE9lyXowp8SbLhbb3cfsUW
 WhpDOSWIChWx8ClmGqr7Lg==
X-Google-Smtp-Source: ABdhPJwawxpuhoBPkHwwpYdA3wu77B3bH5gmA+8u4zAyLVaIU7keKA6j0hp+Ag7fD1WIhZux6lM+4w==
X-Received: by 2002:a05:6808:1151:: with SMTP id
 u17mr1234811oiu.175.1631822599419; 
 Thu, 16 Sep 2021 13:03:19 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id 33sm915066otx.19.2021.09.16.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 13:03:17 -0700 (PDT)
Received: (nullmailer pid 1401613 invoked by uid 1000);
 Thu, 16 Sep 2021 20:03:15 -0000
Date: Thu, 16 Sep 2021 15:03:15 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 04/22] soc: dt-bindings: qcom: add gpr bindings
Message-ID: <YUOjA9b/njqs6Kgp@robh.at.kernel.org>
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915131333.19047-5-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 15 Sep 2021 14:13:15 +0100, Srinivas Kandagatla wrote:
> Qualcomm Generic Packet router aka GPR is the IPC mechanism found
> in AudioReach next generation signal processing framework to perform
> command and response messages between various processors.
> 
> GPR has concepts of static and dynamic port, all static services like
> APM (Audio Processing Manager), PRM (Proxy resource manager) have
> fixed port numbers where as dynamic services like graphs have dynamic
> port numbers which are allocated at runtime. All GPR packet messages
> will have source and destination domain and port along with opcode
> and payload.
> 
> This support is added using existing APR driver to reuse most of
> the code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 41 +++++++++++++++----
>  include/dt-bindings/soc/qcom,gpr.h            | 19 +++++++++
>  2 files changed, 53 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/soc/qcom,gpr.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
