Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FA1446D0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 23:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9A741;
	Tue, 21 Jan 2020 23:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9A741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579644139;
	bh=D8tu6yWkVoZb2U8T639Qf7IXr4Oqert9ffDOI5mJ9es=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdO5fwGJDMVMYnjMJelIcsTVHq3sjM6spdk6WaTv23SYXsTzEfNiy2GUBoM/Z+E4x
	 EjWXVq9UylK6zSi9Ij5TCyqkDFrOBMAOjPnXORzHyaGQnx9ZczMqjtVij1ZpPn/QB9
	 oPyETqlWVEmctTux2fUyTaaz94EEqPrA3qsJZuQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70727F801ED;
	Tue, 21 Jan 2020 23:00:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D94EF801D9; Tue, 21 Jan 2020 23:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE5FF8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 23:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE5FF8012F
Received: by mail-oi1-f193.google.com with SMTP id c77so4143965oib.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 14:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KLk2O/IKuSbiV0tR8rjrjmOXKw++jN6rlAX6P6oLFbI=;
 b=i4MSUc1Ql7Ex3I4c0h1f0FHTNX9VVtGVCtJBQuwF4E3i5lok+tzfJCmzBdskJiiEn8
 LgEXdlD7VkqlLdkRJejbU4ZtSU4mOhKayA1FkK3cXmvp0pU+BJUS6Pk1zMk/sH3sEdMj
 J/+uBtO+R4rZrKiN4JCVUKGR/fETuNJ+zUGwNugUO/K4JvMBLdd8gEjEYjsh+zsc3lMr
 QeoRmKOcLDuKcsjg/zVUODZtkMXe4o3AksDX7j8RZgeuqfec09mRHbbhQj1Z8BFvzF5+
 DTGoFNuW1oUrlDQ5khWra0G8ZQ78yPFzsZD9YMxX9zAEEibDSpU4FBSAD/qP0EFAVzCh
 bKOQ==
X-Gm-Message-State: APjAAAVXxRVtiIDaRktPNbstGxE1JyyYBnjCOmIDZ/JsBbFgX/EQRZjh
 Mdq4k+pUp2KwhYcw6KTteA==
X-Google-Smtp-Source: APXvYqyrJcCLm65IFp9RrnaNPk0Kj24N9+PbvJbLGG+xddxwNzL2Rmb4y7wEB7BGH5EV0QhX139X+w==
X-Received: by 2002:aca:c74e:: with SMTP id x75mr4769148oif.140.1579644024678; 
 Tue, 21 Jan 2020 14:00:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 69sm13989543oth.17.2020.01.21.14.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:00:23 -0800 (PST)
Received: (nullmailer pid 13395 invoked by uid 1000);
 Tue, 21 Jan 2020 22:00:22 -0000
Date: Tue, 21 Jan 2020 16:00:22 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200121220022.GA12737@bogus>
References: <20200117170352.16040-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117170352.16040-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, alexandre.torgue@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3] ASoC: dt-bindings: stm32: convert
 spdfirx to json-schema
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

On Fri, 17 Jan 2020 18:03:52 +0100, Olivier Moysan wrote:
> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - Add "additionalProperties: false"
> - Also change minItems to 2 for dmas property, as both DMAs are required.
> 
> Changes in v3:
> - Drop minItems/maxItems for dmas property, remove ref to stm32-dma.txt.
> ---
>  .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>  .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
