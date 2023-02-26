Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE06A33AC
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 20:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7BD81DE;
	Sun, 26 Feb 2023 20:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7BD81DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677440182;
	bh=stZeq9/pjXKKbH26XR5BK+qfDDIp6q4xXmHdGI4zs2o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fISc0Mp2PV/UP0nVBhRups7j4wcn5j9K7wQRF9gpj0T9Uxp5q7Opa8wc7+LbyE6G1
	 N8O5HeLRm0nfOZVnxHd4N91Gx0MJcVS3UhH5I1/6ZwSi9CYFENtYL/dGubUIpw8xF7
	 cE/lCDyohqJsFeiC1h8exEiLj/Y+ZIcGf0BmpUR8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB48AF802BE;
	Sun, 26 Feb 2023 20:35:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B39C6F8049C; Sun, 26 Feb 2023 20:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52D1BF80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 20:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D1BF80236
Received: by mail-il1-f179.google.com with SMTP id i12so2902946ila.5
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Feb 2023 11:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66rKgYfZ0JLlcjc08pOa7T5lBmt7OeLV5Mls9m6P4To=;
        b=ImIaNPoXcdCMlVi0mbPPCAuLqUuBG1cIwlP13uDentmNQA8njcWwuAn2OGuRnf7K86
         HyShD89MT/IPnC48BwTy6+1SASSp/leCTmhJPJVTetCco67NqAexf8w7QGRHkcJRsis3
         3+nhCdCkQOXGUiHJpuh89SuufgdJfee/LCf6VMNkTymWN11xHuB6/k7F7RlMSrADj8KD
         hv/ZLO4qqNN5bB098P8fLyzKG/MSgi60X0azXmyCs6xWKoC2l7kDNpSyPjds9VJcvq0T
         1awMQv9MAY3h1P1Yxw8Q8j1xV7o+oij3dhLFcPzwRv9dgRlfR+jibTe+kaOarA2e8juk
         CDmw==
X-Gm-Message-State: AO0yUKUquQdEgNlA7IsL6IOqmR4LIHuWC2bK+oM++1kIHqsjAWwZ729J
	YXFq/k00TBUxh952hNMIWQ==
X-Google-Smtp-Source: 
 AK7set8Bj7b1HrLAuEwFy1Z07OGWlcmrCj32SezzjBkYQCTEExRPs577ubZoQrkIYamfFRL3si5Dxw==
X-Received: by 2002:a05:6e02:1a6f:b0:315:3d25:231b with SMTP id
 w15-20020a056e021a6f00b003153d25231bmr22091467ilv.9.1677440123270;
        Sun, 26 Feb 2023 11:35:23 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id
 z12-20020a92cecc000000b003154f7c11f7sm1417544ilq.39.2023.02.26.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:35:22 -0800 (PST)
Received: (nullmailer pid 187425 invoked by uid 1000);
	Sun, 26 Feb 2023 19:35:19 -0000
Date: Sun, 26 Feb 2023 13:35:19 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: sound: nvidia,tegra-audio-common:
 add new property
Message-ID: <167744011865.187365.15488649749142004179.robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-2-clamor95@gmail.com>
Message-ID-Hash: XUOM5UWMILSGLZKCI6MK7RR567QDTZ4D
X-Message-ID-Hash: XUOM5UWMILSGLZKCI6MK7RR567QDTZ4D
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-staging@lists.linux.dev, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUOM5UWMILSGLZKCI6MK7RR567QDTZ4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 21 Feb 2023 20:32:02 +0200, Svyatoslav Ryhel wrote:
> Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
> if HP GPIO is in active state.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

