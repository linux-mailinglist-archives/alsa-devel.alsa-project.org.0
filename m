Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAA6E6977
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69604E7F;
	Tue, 18 Apr 2023 18:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69604E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681835228;
	bh=QZ4JzFP7rUGbI9Qp4WnBpRWdImLCng/fQeboSL5NIl0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tK9rhm2WDHtD4CR68V8nENY6ooL/u0GjyUulrMuFHsgRUGSZ4LN5Gdum2b5GiZ4xe
	 udBOvQTwgP0fl8SclsUx+Ktks8s0s3hgzQDwIvBEUBftCBUjNZTA6//5Pzz1ctFAgB
	 5r5Zu1zZftVDIzClmtAYOV2wL7rEjQT1VhemPI00=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A3DF80149;
	Tue, 18 Apr 2023 18:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FAC1F80155; Tue, 18 Apr 2023 18:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF073F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF073F800F8
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-541af0d27d8so304198eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 09:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681835159; x=1684427159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GALPTZ5rs1mIduJF7Jl53u7XfsfluO0jc0nwk+zxYao=;
        b=l1JLFFl2+hq7OqTIhH5h7DHzvmDUe+fAOX8wZfgqtinJfk4W4sqqkHabW8njQu8H7x
         kPPcqa6lkAKg3Dou8My2UrjvKTfsMdXsxfZekIQ1iGDCukQvlsOYco2+CvylYRBjO33n
         T928kxQUePbwrSmtNFNbTx+FuojqzWBhrWmiivDsXgoHU+/rAUFRu22Xl1elUzuzEwZc
         iJlRHsSTYyZKzWUXd+//YsfwVX6LJEUU8WBKPW0S9bAFEHpE8YUxaXlH+fqRYnXt+Nd1
         ORgBIkArajkgs4l+i4tILqPl3r8eZaDLwUUVEZor87nmqceaizNHQpulWEPe99623p2r
         h/Ng==
X-Gm-Message-State: AAQBX9e0fnhvAphtb/LSHmwbh40SgQbwK7NCXkOGeaxaocu5eXCKn4h1
	weUWHQayrJXxS63GrhLinA==
X-Google-Smtp-Source: 
 AKy350aqiwGvkm3PEtoK/oiOYt0ohBeRtozgRcDrXi5U4KbApLSinkvRa0UgAiJEnhzYkN4LUDI3oQ==
X-Received: by 2002:a05:6871:149:b0:169:dcba:1ec9 with SMTP id
 z9-20020a056871014900b00169dcba1ec9mr1623622oab.41.1681835158903;
        Tue, 18 Apr 2023 09:25:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 r204-20020a4a37d5000000b00541fbbbcd31sm1737771oor.5.2023.04.18.09.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 09:25:58 -0700 (PDT)
Received: (nullmailer pid 1808654 invoked by uid 1000);
	Tue, 18 Apr 2023 16:25:57 -0000
Date: Tue, 18 Apr 2023 11:25:57 -0500
From: Rob Herring <robh@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: Use of_property_read_bool() for boolean properties
Message-ID: <20230418162557.GD1764573-robh@kernel.org>
References: <20230310144734.1546587-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144734.1546587-1-robh@kernel.org>
Message-ID-Hash: 3XP7WFSENMOD2KHHKCZ4XY5E2FNHYOMU
X-Message-ID-Hash: 3XP7WFSENMOD2KHHKCZ4XY5E2FNHYOMU
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XP7WFSENMOD2KHHKCZ4XY5E2FNHYOMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 10, 2023 at 08:47:33AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  sound/ppc/tumbler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ping!

> 
> diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
> index 6c882873b344..12f1e10db1c4 100644
> --- a/sound/ppc/tumbler.c
> +++ b/sound/ppc/tumbler.c
> @@ -1361,7 +1361,7 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
>  
>  	for_each_child_of_node(chip->node, np) {
>  		if (of_node_name_eq(np, "sound")) {
> -			if (of_get_property(np, "has-anded-reset", NULL))
> +			if (of_property_read_bool(np, "has-anded-reset"))
>  				mix->anded_reset = 1;
>  			if (of_property_present(np, "layout-id"))
>  				mix->reset_on_sleep = 0;
> -- 
> 2.39.2
> 
