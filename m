Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77D47C2B0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 16:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34F31716;
	Tue, 21 Dec 2021 16:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34F31716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640100062;
	bh=HxMxFZULku/XnIrcjmnkbbK2nYBLRkszhZytkHOOg/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNTaQTUJ57a0EsTCKOVMDAqsBz7XzIqXFfecuVRzHcJW29KHXAuuElJKUP0MVtB/4
	 TggC11YuexB0ZSIdTAbNQ0td2w2i5T2/qWS+uszzdLG1SmLm7Fp68t3DUzJDnr7ZrT
	 x7wRGcipsKi7J2VATuSj7BZ0BM1xxAH44nEgEVkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B60F800B5;
	Tue, 21 Dec 2021 16:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA20F80118; Tue, 21 Dec 2021 16:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 126ADF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 16:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 126ADF800E3
Received: by mail-qt1-f176.google.com with SMTP id m25so13085969qtq.13
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 07:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jhn6L+LBMMGihOUvIcsbiibaFmeCSn1ijpCpfQZUYKo=;
 b=t+wXIffJ7fnlvwh35ewpZUEi5Okjn5bMp8lRA2mnF+D6vLmGuZpMbjyn5DdRZUygNF
 ZyP95S9D8g1nWXA9zhRBVdu8dN1NQ6fAU336FqCog5AwX84MfprC1d6j+xqiYRFalVzc
 BuVqEz5L1TZlDr65zHf9kzZ+PEd+9ITSsWahmxzqbbgj2TIFk/r/lEmTqhZ33ve3/ZQ4
 VE+AQDeBWXek6V5hVVd7NWt4t7ZxHr85sRYCm29aW/HFR7U44M05DgQq0PM+KB8HmzyB
 RqAy+6Si5o/vfEbujd466gYHPflYKu+EgHhfN5lHLx4CglhnITDsIeLXrdJtxxUv/CNK
 U3hQ==
X-Gm-Message-State: AOAM530doF+/DJoi6PgGPVYLtAXxK9ZP36EqXHgxBAJa6qvjYssc7z14
 bnff0LjU7LzCfoA0hUwNgw==
X-Google-Smtp-Source: ABdhPJy1YHPtDITAx99YSSbS+ZUmgpGbyenEdctyF6U5/LZg3Ybkqx4YHOsFy1ktK+IAsUpYwi8LaA==
X-Received: by 2002:ac8:7589:: with SMTP id s9mr2602203qtq.314.1640099988563; 
 Tue, 21 Dec 2021 07:19:48 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id d1sm1096220qtn.56.2021.12.21.07.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 07:19:47 -0800 (PST)
Received: (nullmailer pid 1436571 invoked by uid 1000);
 Tue, 21 Dec 2021 15:19:46 -0000
Date: Tue, 21 Dec 2021 11:19:46 -0400
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: sound: tegra-audio-rt5677: Correct example
Message-ID: <YcHwksy2hKFZj43h@robh.at.kernel.org>
References: <20211216160229.17049-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216160229.17049-1-digetx@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org
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

On Thu, 16 Dec 2021 19:02:29 +0300, Dmitry Osipenko wrote:
> Remove non-existent properties from the example of the binding. These
> properties were borrower from the old txt binding, but they were never
> used in practice and aren't documented in the new binding. They aren't
> reported by the binding checker because dtschema needs extra patch that
> hasn't been upstreamed yet to make unevaluatedProperties work properly.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml   | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
