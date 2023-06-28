Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF9741589
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 17:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657F47F1;
	Wed, 28 Jun 2023 17:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657F47F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687967141;
	bh=LvXbiJtpaSRANeAQkBQjkIL9DvaryjtWGcB9/6o5jv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fCUyX+djEpUNvkPWyJUHcSS0ceh1k6wUPL36WPRQt70dM3yrdhH4i8Vzt6DIYZ4hf
	 lNL2VzOayzzUaJMO0JJVhn00Q+GKno86/hVS2fuiRaxBktU3gQxTgsuZjxb6N5VDdT
	 c5v+cSvqSA4D+/sMjKnxCa2ONuBh4jq2ba6/PT0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11FCF80246; Wed, 28 Jun 2023 17:44:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39370F80212;
	Wed, 28 Jun 2023 17:44:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3854DF80246; Wed, 28 Jun 2023 17:44:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9067FF80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 17:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9067FF80093
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3426e9a9c3eso3179025ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 08:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687967080; x=1690559080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8qi2/hGD1+QQV7LjWPANEr9l2yFXdhrRF59lxS51Ek=;
        b=k8X9QYuf+wo0JJ37zAbzSL2S4Of/hXju3VfblH18vhPJRGD7oAy+HOxCafq4Z+awJ4
         YXpvdR9VcyDV905/Hk2xgVXa0SM2De8U8w/H9BwidXGUF5/yNYiVjVsSRR6Ruu2p8pLZ
         yLe+Pmaocm/2l7C41X1cw/C89PFv61T5iunE9iv6CONHEqoga7mD5HB+VuH92vcH3CSz
         Qicl+tzluD6+18Bc13eAL6aTZ2aWEPuRZm1EVPx7z//omwgreRQFGMrylFtcQdlHkSn2
         mzA7dcoY+bd79tDzYWb5jwjBZKPk/AFuG8IhLKBY+sVJgCp8Gwyh74cpcHlpzOn+NOxs
         eUGQ==
X-Gm-Message-State: AC+VfDxdO4l7l3DP6+t80CpmwPphsnlRARLDoNEkOePWst45s1W1TCAV
	ntXN1b0qE6E8T0OzzV0FlA==
X-Google-Smtp-Source: 
 ACHHUZ79mRzg8+qZLbggc6AbavxNQm7x9oE4nROWahp4rP1eUGmg9coMWivmV3bV2fvmgRrNosi1Qw==
X-Received: by 2002:a92:d94d:0:b0:341:24f1:3f74 with SMTP id
 l13-20020a92d94d000000b0034124f13f74mr1285671ilq.14.1687967080305;
        Wed, 28 Jun 2023 08:44:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 b3-20020a92ce03000000b00345c0eca0e7sm950361ilo.85.2023.06.28.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:44:39 -0700 (PDT)
Received: (nullmailer pid 530531 invoked by uid 1000);
	Wed, 28 Jun 2023 15:44:37 -0000
Date: Wed, 28 Jun 2023 09:44:37 -0600
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: linux-kernel@vger.kernel.org, supercraig0719@gmail.com,
 dardar923@gmail.com, broonie@kernel.org, WTLI@nuvoton.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, SJLIN0@nuvoton.com,
 lgirdwood@gmail.com, KCHSU0@nuvoton.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, scott6986@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Message-ID: <168796707718.530473.9600429077455152027.robh@kernel.org>
References: <20230628085009.1130318-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628085009.1130318-1-wtli@nuvoton.com>
Message-ID-Hash: STCAONRRHG6SXT5W5CSV2H56UU2CQESX
X-Message-ID-Hash: STCAONRRHG6SXT5W5CSV2H56UU2CQESX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STCAONRRHG6SXT5W5CSV2H56UU2CQESX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 28 Jun 2023 16:50:09 +0800, Seven Lee wrote:
> Convert the NAU8821 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nau8821.txt     |  55 --------
>  .../bindings/sound/nuvoton,nau8821.yaml       | 125 ++++++++++++++++++
>  2 files changed, 125 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

