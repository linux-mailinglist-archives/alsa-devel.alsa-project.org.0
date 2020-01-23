Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63790146CE2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 16:32:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0634D1697;
	Thu, 23 Jan 2020 16:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0634D1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579793521;
	bh=VLi4nie3t7D3PtffVtIz3I1WtsANm1cLduXCNvZu3k8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xu5HbHBzTwFfp8FoMAWF7Jkm/STG//zEH3JAqrKX/qiEMlO1uQXMHoeNqOFdEwEhy
	 Vj4P0+AQ6pDllUNL4AW7GgvrehqzPoqekeCvjoptdni8uOxPyTRmXeOGS42GkCjxV/
	 oRZyNGndYcFE1zXtznny1Bdqw+MHuRZdZ0PepEwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86442F8015B;
	Thu, 23 Jan 2020 16:30:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3078BF801D9; Thu, 23 Jan 2020 16:30:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC2CF800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 16:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC2CF800BA
Received: by mail-ot1-f65.google.com with SMTP id z9so3095191oth.5
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 07:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YHqBGj/ukTPkl69zvdBgkmcYaLWB1N0Qj6YD43sxU/8=;
 b=uf/fVBlg7+4qbLEDkwJyzyIdS5N+7VqwSXOT9mZahqdy4sgae8bsGZW+1YCWj2iKFA
 QNuUBTijt1U5zKCHNj26JAEn6ZcAcxLpIFqrbgO4gMxSLtYUPJ+0Tp6Th9QZkcuFW7JZ
 I5iaiZ5OQUqk5tEF7Yig4S6wEd8FBlsr3EtWx1UFcGlsnGEwHr+tzt5HsdRpYbH5zSmC
 6bxeC/rR00+GsTIa8HUXRszqy5Kt14j+/hL3XuZHoan95HaKn0TJU4p/gCjz7lIC5I9X
 QYcLBVz253TkbstsSRo4oYqdb36Osvszgvook8Xumzkp/nr+JFLYrOwqRooRvRof0Gmg
 jN1w==
X-Gm-Message-State: APjAAAUMRPXRarFWdTjx8g/diGapg9+B5pKNGatxFMSL+kb6zGDxEhJ0
 c0Z1SfILzgCzi+AWeNVSzw==
X-Google-Smtp-Source: APXvYqxkWG8AeF8EXXnGTWZ4IdGe6xCc6yw9d5YQpXCkxvBsnWb6O8ACMvnxGdINcohg5IvNyDKtDQ==
X-Received: by 2002:a05:6830:4ca:: with SMTP id
 s10mr11737763otd.268.1579793404638; 
 Thu, 23 Jan 2020 07:30:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p24sm891368oth.28.2020.01.23.07.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 07:30:04 -0800 (PST)
Received: (nullmailer pid 12956 invoked by uid 1000);
 Thu, 23 Jan 2020 15:30:02 -0000
Date: Thu, 23 Jan 2020 09:30:02 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200123153002.GA14241@bogus>
References: <20200123083432.21997-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123083432.21997-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, pmeerw@pmeerw.net,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [alsa-devel] [PATCH] dt-bindings: stm32: convert dfsdm to
	json-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 23, 2020 at 09:34:31AM +0100, Olivier Moysan wrote:
> Convert the STM32 DFSDM bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> The DT check still returns some warnings on this bindings:
> dfsdm@4400d000: filter@4: 'st,adc-channels' is a required property
> dfsdm@4400d000: filter@5: 'st,adc-channels' is a required property ...
> 
> These warnings occur because some disabled nodes do not provides the
> required properties. These nodes are included from SoC DT,
> and do not provides by default the properties which are board dependent.

We handle disabled nodes, but not when they are child nodes.

> As workaround in DFSDM yaml bindings, the properties
> (like st,adc-channels) could be defined as required,
> only for the nodes which are in enabled state.

We should handle this in the tooling, not the schemas. I entered an 
issue to track this[1].

> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.txt   | 135 -------
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 332 ++++++++++++++++++
>  2 files changed, 332 insertions(+), 135 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml

Applied.

[1] https://github.com/devicetree-org/dt-schema/issues/32
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
