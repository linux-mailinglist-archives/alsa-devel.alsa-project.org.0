Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337023D4241
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 23:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1D081754;
	Fri, 23 Jul 2021 23:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1D081754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627076212;
	bh=9fp19cbvnV0/9nUgjdy63a69hNyPIe2vgt6d0Rzv9oY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amz2y7iKNLMlNXYxEhFMUm391kn0rsa6I03C8zFKS6dhM9GAZW3KtAVcgI2voqfR1
	 DLWHYaHguPcg04BnfD4bl4Hr2lXm0k3qINeoREo72pRF8Vm0SPS3ew6tPsFl3IY+s2
	 Cg4FtoA//MdCulmRL/4FUC4OZsSLrF2ofeGmBU8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD76F804AD;
	Fri, 23 Jul 2021 23:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92452F804AC; Fri, 23 Jul 2021 23:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA1FF80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 23:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA1FF80086
Received: by mail-io1-f49.google.com with SMTP id l126so4144683ioa.12
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 14:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XlIq9sgkpH0VLjxnlc9KkJaSod6wixszIJrzFBohWBQ=;
 b=gYGe8uo+w9dGpF456xoOOQ3Yqfgbt9tMcfBXF4XYdZ1Fo6wJpKFH0h+VJ4TkvjKTZg
 QPmZOUzI3I4oettU/H/+W+c9hZsA1jS2SKI6SYFo7zv2hdQDHqoh1uvh9IccukZiv2u7
 2p4wc0DaylaIoFTwiyy0u1zFTFeGEBg4dAweIthsrQJ+7L7soE8FSSYz2WdGUuItf9JC
 bOOMtRsOiKSqj25k9hrxGRD5NU4O/hJ+tQ9OfGH8hk3Tea8Z6vU6ALCfwBElsGYXMMze
 jKA22usypxoHSDvv5ILpt6EAJj6QilLDO/siU4/O+vwO+FfxZsr5wSDxE6q8E8i35fLB
 nywg==
X-Gm-Message-State: AOAM5335ROAj3gIJ8YrfFRhmHtJ38YtGcbPJOLtD1vIoofdr+YLvQrj+
 LQxClsbdY97H8FAhgS0LZw==
X-Google-Smtp-Source: ABdhPJxm3/7JByYULNQVHzHLMkbguEpYVWROlSg6OC5iWccT709JPbbBrofXe/hc2B8/npGbI/nOeg==
X-Received: by 2002:a02:620a:: with SMTP id d10mr5911026jac.22.1627076115287; 
 Fri, 23 Jul 2021 14:35:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z18sm8442819ilh.55.2021.07.23.14.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 14:35:14 -0700 (PDT)
Received: (nullmailer pid 2628990 invoked by uid 1000);
 Fri, 23 Jul 2021 21:35:11 -0000
Date: Fri, 23 Jul 2021 15:35:11 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 03/54] ASoC: dt-bindings: Convert SPDIF Transmitter
 binding to a schema
Message-ID: <20210723213511.GA2628924@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-4-maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, 21 Jul 2021 16:03:33 +0200, Maxime Ripard wrote:
> The SPDIF Transmitter binding is used by Linux with a matching Device
> Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: alsa-devel@alsa-project.org
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/sound/linux,spdif-dit.yaml       | 32 +++++++++++++++++++
>  .../bindings/sound/spdif-transmitter.txt      | 10 ------
>  2 files changed, 32 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/spdif-transmitter.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
