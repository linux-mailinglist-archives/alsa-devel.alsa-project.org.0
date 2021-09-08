Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AA40395F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 14:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45ACF16A3;
	Wed,  8 Sep 2021 14:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45ACF16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631102467;
	bh=EucDs045bpM90Ue4vuYW/OnMzFfxwabUdpjlHq/GeMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZxUJixlql1s8cQ0GXDnRlPSQ6MtGaMCffCFDgcN8fA2vLKbaMFxadBpQUvWkzuYG
	 QzQorsr1z3GvdWt5+x97Vut0tCnD1zu1YHkilDKv0C8CEgi4SH5NpYHymx07BM9ieZ
	 mLqsZSZJU7bhlCh7lsB0ppfS2ZSYIvPUHJnIJFLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311D4F804C1;
	Wed,  8 Sep 2021 13:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B446F804B3; Wed,  8 Sep 2021 13:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3550EF804A9
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 13:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3550EF804A9
Received: by mail-ot1-f41.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so2531588otq.7
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 04:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T4PU4tWJUcseqPugoo0HufAKZOsFvcQVYr/eQZCWYQY=;
 b=sMONyh3RH06LJscEfP/I5N+CcAECiXuP/G/CigWOmgmw1cWG+z8OPMGJckivONnwKW
 zKyyEW4YXptEwPhwqDMAp+8orcHvFq3WP0kP8ZKgshUzZnVv6aTXjtpdLxZCFfDVI6fx
 TlY+vbNQgTIhra7Ksn81Wyf0c29pampNfcEIjI+f+eXfj7PUFbVCfs9XHFRaNtM70X2w
 RYgjN30IMk63k3q3ABkBIppcXiBWpzmg1Xs93frDycwOVTTWf344WxiVEiPWFSohjSyi
 B9rQ2kXDNzmGw19PhGRNP6eDSa7rbbI7eYQr4Gm9JP4B2vH647lVkw7d6kuc8JsWtrMG
 e44Q==
X-Gm-Message-State: AOAM532Lltp7nswXVlUVBHrDxRcaBEAo1bNe2LOfdQdDRhdhNfNtJlz/
 HWQeNQA80ogH+sEtctcHSA==
X-Google-Smtp-Source: ABdhPJxuHJ6yMrpw2gpAVb4IKjHUL2sPKiA67QNtUQ82sqhj9xVUipj26dRMHxVd/lFHOhcAXuahNQ==
X-Received: by 2002:a05:6830:2b0d:: with SMTP id
 l13mr2655859otv.39.1631102387599; 
 Wed, 08 Sep 2021 04:59:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m2sm373098ooa.42.2021.09.08.04.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 04:59:46 -0700 (PDT)
Received: (nullmailer pid 1852019 invoked by uid 1000);
 Wed, 08 Sep 2021 11:59:45 -0000
Date: Wed, 8 Sep 2021 06:59:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 3/3] ASoC: Remove name-prefix.txt
Message-ID: <YTilsXG9j0UMz5BZ@robh.at.kernel.org>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630686919-19495-4-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jbrunet@baylibre.com
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

On Fri, 03 Sep 2021 22:05:19 +0530, Sameer Pujar wrote:
> Since schema name-prefix.yaml is available and references are updated,
> remove txt based doc.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/sound/name-prefix.txt      | 24 ----------------------
>  1 file changed, 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
