Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6740043C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 19:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D7A189B;
	Fri,  3 Sep 2021 19:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D7A189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630690952;
	bh=lTJ9cAWDCMyfdkNwe1yJZP2WMblLne4hzH2MDs0wAhk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAUColC07wwtT9CGyEKAmDB3Xp6uuQ+zR6sv4XoLMFboWhDpCXiXRQf5gVXtBcCId
	 WQsWNPl2Wvl2kcBzy7q+xaS4Rwa7lENHPIy1uFMm1mknGVahoxwpD+NJ2+xyNMXOX7
	 MrEHxvk0UyOH1r+5y+yA/WPdYHVpO7CrbePvjP0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DA6F800B5;
	Fri,  3 Sep 2021 19:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AD05F80254; Fri,  3 Sep 2021 19:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17ED0F800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 19:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17ED0F800B5
Received: by mail-oi1-f181.google.com with SMTP id v2so123563oie.6
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 10:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I5aqBhpR9mUox8VcYbsiI0dM1OA2egSfhrZLllSSLmM=;
 b=V8xSbqWxREwkGraPFfjWcyI+SJdmgjtmJesyqY6bDL9F1MhGdyoTSOxnuF2TKpFih8
 DzSncxj0e2PpEBSvmEjKkYPJjz06BOaWBF4FopJYBmo/d8cX7Sfyb8BEmuAyCPTMIdPp
 58gnjh2V2lcA1rvg9ZVLHZy+SkDytw8o2s8OVt+ZIcX1JjDElNYhvNNJFMsbT2H4swEd
 +NUsQTfr+1QkCWiABleDDBQydpb5cnGa9mYfbhjtPlwDMLYKt2lbhMRLDnN3ABqSKGXL
 YZZMhnKmkrDD6CgHreNeRIEJCufjlwSOW674KEfGLnP9dSbt+CZaAybuAnP/bfmHumUa
 4sog==
X-Gm-Message-State: AOAM530DgcfSY7pcI9KppW4j4gXhZcVuUtLdt2sa20o5QSTSRuNcHcdJ
 VSkZX3zIS9r6Z3JpWmtUAQ==
X-Google-Smtp-Source: ABdhPJzz37ev7x13NbSOO6OMOr70qaGSmIr8sgijivR2rjTcC2e0rQkE2jhNkpGOOSomWhNdmRnIeg==
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr23334oic.92.1630690865918; 
 Fri, 03 Sep 2021 10:41:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z26sm511oih.3.2021.09.03.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:41:05 -0700 (PDT)
Received: (nullmailer pid 3150072 invoked by uid 1000);
 Fri, 03 Sep 2021 17:41:04 -0000
Date: Fri, 3 Sep 2021 12:41:04 -0500
From: Rob Herring <robh@kernel.org>
To: Alejandro <atafalla@dnyon.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Message-ID: <YTJeMGMAeRjmI5Mu@robh.at.kernel.org>
References: <cover.1630632805.git.atafalla@dnyon.com>
 <102ae6df3b5398e8c66b954ac5e13a9d565fab6f.1630632805.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102ae6df3b5398e8c66b954ac5e13a9d565fab6f.1630632805.git.atafalla@dnyon.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Fri, 03 Sep 2021 03:49:51 +0200, Alejandro wrote:
> From: Alejandro Tafalla <atafalla@dnyon.com>
> 
> Add the reset-gpios as an optional property because some devices might
> not need it to work properly.
> 
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> ---
>  Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

