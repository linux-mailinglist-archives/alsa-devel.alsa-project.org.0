Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B76729DE7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124976C1;
	Fri,  9 Jun 2023 17:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124976C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323491;
	bh=eEqStlTmIEIfDsM3fA4nOy1wwU06Sj6iel1itAdRpW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aXftLyUcSMC96KB51O4z0cj9+vPNtSGC70yQ1p5sHymwDSxqDysjMJXxQYPmi0Rwo
	 4zdH2SWfV4LpEx1hgVGhkW6EUjKK/A98HM9Vd44npe2Bp5LisRMWx75UhUyfY8lRcN
	 Co/hWQPs2rp2X+pmMJeYID1pWjmF2jtOGjUb3UjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64320F80290; Fri,  9 Jun 2023 17:10:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A3D0F800C8;
	Fri,  9 Jun 2023 17:10:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97362F80199; Fri,  9 Jun 2023 17:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1BA2F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1BA2F800ED
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33e53672aa6so7997565ab.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323428; x=1688915428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgEA1Mw1A/5s3GKiOUjS2OVmsqKcYspaLT+4TG/YkK4=;
        b=J1+5kja0/jYCbdT/3/dlagJUam/rSc17s1dIaKAltXKwDJ3enItMD2SEy2exofdZEM
         vnjSD+E8uvUMM0Sa+wP+eEk3P0DzqgGdqV6Kuuc8mvzJK64cHi443cb65/MZWxPoiUqR
         3IhdOP8G+JA49hJK2QA3Sj7G1DfdK9/W0A6BLHd8zmXVa2YNApOK4LFxg6gnzwumg1y7
         ZCAYmxihLsfrf+TD//+uSa3RQG/YmlA/dOpbiC9P1bGK02u4m0xpczZAgAIzOfNlYJ5X
         ryR9UDbl9n8vDLacTURWFh/Fm/zj/Wc6Ghlvr6wzVSoD0CxzmArdoPFk4ifs3VhfzUkv
         cpjA==
X-Gm-Message-State: AC+VfDzIKjIY4+fW/S+aH5XesHsai+dHYkzxJ9aAT1cFIw4XZ5BPiL57
	Lp1AFUlQaHXi6oXIVQ7PKw==
X-Google-Smtp-Source: 
 ACHHUZ6GLJF9xmiCznvrkvDAHStb1dFZWwEwBO0JSyNuKSB2A4EFN0t4aWuWCLrZCT/E+UeHUSc/ew==
X-Received: by 2002:a92:ce11:0:b0:33a:56d6:d9a4 with SMTP id
 b17-20020a92ce11000000b0033a56d6d9a4mr2155501ilo.10.1686323428407;
        Fri, 09 Jun 2023 08:10:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 l5-20020a92d8c5000000b00338a1272ce1sm1147336ilo.52.2023.06.09.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:10:27 -0700 (PDT)
Received: (nullmailer pid 986311 invoked by uid 1000);
	Fri, 09 Jun 2023 15:10:25 -0000
Date: Fri, 9 Jun 2023 09:10:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-watchdog@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>, linux-spi@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dipen Patel <dipenp@nvidia.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-rtc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, timestamp@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: phy: intel,combo-phy: restrict node
 name suffixes
Message-ID: <168632342399.985906.12431431892707276555.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: BFDTX5UX6W22ZLF6EHO7DQI4BLQDF6W2
X-Message-ID-Hash: BFDTX5UX6W22ZLF6EHO7DQI4BLQDF6W2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFDTX5UX6W22ZLF6EHO7DQI4BLQDF6W2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:45 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to:
> 1. Only one unit address or one -N suffix,
> 2. -N suffixes to decimal numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/phy/intel,combo-phy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

