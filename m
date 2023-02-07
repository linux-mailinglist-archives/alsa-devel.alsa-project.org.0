Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082368E450
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:17:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3EDFA;
	Wed,  8 Feb 2023 00:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3EDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811865;
	bh=Q9XFuDCHUIToibZa2MkJgz0EX5b+KAw6KFN83e+1hBA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwV/M/oS43a6QkM0+jzkKbeU6AsGYg53lg1JvDnKJogxIdIP120sWoT+096w/v9lO
	 COTOa/a59Bcq4OZWz3q27iVTUmQbxWmkAE3wNkmPspz4C2POVE9CN664oGeZi9y23t
	 3HD6xjZeFZsEQI5LLWcZw8z02HGT2dTJyZTdKrls=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ACD3F8010B;
	Wed,  8 Feb 2023 00:16:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2880F8012B; Wed,  8 Feb 2023 00:16:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7057F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7057F80095
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-4c24993965eso214573127b3.12
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioxj3ZTtyZyoRXID9W54q51E/7+JLsaD1JUQ4RjMd/U=;
        b=uyRUsUyWoIcQczyIjpG2G2aVfiX/5TguyO5NKemepWj+vd2mN4ROD0fCEvuG3R7SCH
         LqHPK5Ax5MkPyoc7VJFbmLaj1QoXN3BgCL+bj7mPrb/DQKrkFOgQQ2eYdtli08LA6/VC
         p5iFDVKZ6wMgMyibFQl5CRbzWpBKqyiez+rpN7uAV+DRt7wwZds/3iKWJ1TWttFku6FI
         y9KY5t09n894jEsV033JbsAk+3ygKUIHo/fIAYOjKecEttkHkwTF9mpdEbft9w0M2df9
         NquEby61KbQy4+EUyptpfJY9jZl3I8BPQ+5ny8SZRLDGGoOBHaDO2v4WCqkHqZHLTlSZ
         VD8A==
X-Gm-Message-State: AO0yUKXYWltA4hj1YS0i5EZVf18BZlQb0UCuVf/nWjylCTfcfn4MDdus
	cUrq2hJWP4Cd8hHpnovWNTewxiP5ZQ==
X-Google-Smtp-Source: 
 AK7set/LXJZ14Lnt/7wSTjfoNuOWNVvBD7iTVO2U5b0BQCZrCvX39bOZL6VMHpnGCzvpZ12XEM91UQ==
X-Received: by 2002:aca:1316:0:b0:378:528:d83b with SMTP id
 e22-20020aca1316000000b003780528d83bmr2044736oii.55.1675804582113;
        Tue, 07 Feb 2023 13:16:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 bk30-20020a0568081a1e00b0037880fdb1f6sm6120330oib.24.2023.02.07.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:16:21 -0800 (PST)
Received: (nullmailer pid 4167457 invoked by uid 1000);
	Tue, 07 Feb 2023 21:16:21 -0000
Date: Tue, 7 Feb 2023 15:16:21 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH RFC 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: tidyup
 reg/reg-name
Message-ID: <20230207211621.GA4158591-robh@kernel.org>
References: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
 <87pmamuvlh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmamuvlh.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: MRIMZF2Z5B72KJYEWWNVD3DRHVH64ZAS
X-Message-ID-Hash: MRIMZF2Z5B72KJYEWWNVD3DRHVH64ZAS
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRIMZF2Z5B72KJYEWWNVD3DRHVH64ZAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 07, 2023 at 01:12:42AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current reg/reg-name is using "maxItems", but the convention is to
> use "minItems".

Yes, but that's not really true in if/then schemas. If that's your 
reason, then the changes are wrong.

> And the core DT schemas already have a constraint that
> requires reg-names to have the same number of elements as reg.

Actually, no it doesn't.

> 
> This patch switch to use "minItems" on reg, and remove it from
> reg-names.
> 
> Link: https://lore.kernel.org/r/46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index d106de00c6b2..223f4859780f 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -298,9 +298,8 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 3
> +          minItems: 3

This was probably correct before if the base 'reg' entry says more than 
3 entries are allowed and in this case 3 is most you can have.

>          reg-names:
> -          maxItems: 3
>            items:
>              enum:
>                - scu
> @@ -309,9 +308,8 @@ allOf:
>      else:
>        properties:
>          reg:
> -          maxItems: 5
> +          minItems: 5

This might be correct...

>          reg-names:
> -          maxItems: 5
>            items:
>              enum:
>                - scu
> -- 
> 2.25.1
> 
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
