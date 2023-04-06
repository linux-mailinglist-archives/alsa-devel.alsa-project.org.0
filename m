Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA526D9CE4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 18:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE1AF2E;
	Thu,  6 Apr 2023 17:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE1AF2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796801;
	bh=UWFtxa6m4WNuTI53AUUpM+w5kcog4JgOSVDfqIw980k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ud6ToSpZMaeZVpmvAXkuHQ7T6zO6ZjzYEgcwjAYGkkF8kdAEvd/7pO9r6hqkjekG1
	 R/87vt2HGuQFWCiLwoQqQW7iN5mJZ/1dY6gxncMZ0sUp5+CTPYpZgdauQXe6z8p5YT
	 4U7vAaDSYD7qczNH+3Yp7XH/ItjbQTiV7nmvVM/o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C29DF80171;
	Thu,  6 Apr 2023 17:59:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A4DEF80246; Thu,  6 Apr 2023 17:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A30CF80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A30CF80149
Received: by mail-oi1-f177.google.com with SMTP id bm2so29417906oib.4
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 08:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796743; x=1683388743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh7h3jMxLokPLKNPs7kQpXzC9xXuYjOjp2sgIXgC2jU=;
        b=OpF6+CAwDuOsHxda23Pjj/TRxIXeivc0mrQwKhUWD0+Vjpi8gpi41tNEJIgHCpWbBl
         0OrJmzaUzwKs+Fsa6wuOchpPZp8WlEGD4hWP0RktZejgJ2FebIXs+2D1cmX6TyxakZQ9
         DOegP+4VwsneQXWGWVUDlD1B1fJ9XOrmK5YYjrlAw1ro346gEX86FKqpbW1IAW9L+q5G
         cu/mHvANKeTFmskIpVsYqMIFR6EoIXh34XVHFCx2p8qAQ0cGNAn5/GB/xPQra1UD6Dgs
         xis8TysmMwAbKSv+tFuLz49YuUJH9xP8d/5rGwGCXsNBB6TX3tPZHhKbkePPWePFeiEZ
         M2Ow==
X-Gm-Message-State: AAQBX9dU2u42YD2QXALvbMV5PgtzzlhmqhnY3/FZ7K4FMyOPmMRdc8Gv
	8tUE6kpR3UFEWTpC33NQ+A==
X-Google-Smtp-Source: 
 AKy350arKIELgvEJntEgvZm0kaiU+d+z/2nRm9Qv5wpmftvqcCoU9kxkvuhMhE6BIYSSc7apiG4Jew==
X-Received: by 2002:a05:6808:5:b0:383:e1f3:fef6 with SMTP id
 u5-20020a056808000500b00383e1f3fef6mr2910633oic.18.1680796743189;
        Thu, 06 Apr 2023 08:59:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 z7-20020aca6707000000b0038755008179sm780181oix.26.2023.04.06.08.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:59:02 -0700 (PDT)
Received: (nullmailer pid 3159384 invoked by uid 1000);
	Thu, 06 Apr 2023 15:59:02 -0000
Date: Thu, 6 Apr 2023 10:59:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Message-ID: <168079674130.3159330.8680786687198930722.robh@kernel.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: HK4SS3YFZFRACCXLBKS3I3Z377TBOLXS
X-Message-ID-Hash: HK4SS3YFZFRACCXLBKS3I3Z377TBOLXS
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>, Patrick Lai <quic_plai@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HK4SS3YFZFRACCXLBKS3I3Z377TBOLXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 03 Apr 2023 15:24:58 +0200, Krzysztof Kozlowski wrote:
> The port sample interval was always 16-bit, split into low and high
> bytes.  This split was unnecessary, although harmless for older devices
> because all of them used only lower byte (so values < 0xff).  With
> support for Soundwire controller on Qualcomm SM8550 and its devices,
> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
> to allow 16-bit sample intervals.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

