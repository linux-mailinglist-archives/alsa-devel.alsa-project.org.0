Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF53FD0C3
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 03:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3AD4171E;
	Wed,  1 Sep 2021 03:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3AD4171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630460041;
	bh=WZ55lx+BYmctWSPImfZ0FSMUKKI6DlpEHO69kgL5rIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uH4qbrua1k0qdxMU2epwxOn4QnmSNfEUyVTxGPKuhYaOSEOOUtsnMH0EAMWFBcdHa
	 aihqh8LpZx1egAq1Y2Ubyak6/MY/bSBwvEvyragMI9YjpuxOsDsBIEO6BYe7MtGHdL
	 Z88EFi7UFFnGT3wcbwX5glN5eB2k9Q4/a1DIRPv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E5EF80171;
	Wed,  1 Sep 2021 03:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B0AF80227; Wed,  1 Sep 2021 03:32:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07DE9F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 03:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DE9F80171
Received: by mail-oi1-f182.google.com with SMTP id o185so1675618oih.13
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 18:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FPQW4ZAVGJNxRy/TVDBlUl+1peECfC+I9o8RMPrW6tI=;
 b=ioAt9QKc/XUBa/blRh8sYRAgkAwO5bfz8h7yACeQkjzjREXsYhm003Ki4hbc2kc4IB
 +MhDySp4QVBeeNI716b2nfsnmVcKsPA0UkOeGrKxUTHmrHFyBd1D2BDkA7Y+6eN+ehgA
 MKjyyQ7lBy1CBHv7+PpH0FhxVnSkmCz0ItuR6urwfu4Vy7SAfAP2Y3/7YieDe8dDoirh
 dNUXBhcW21BiF0/2EtVupA89lii/gvtmDg0Sqo6x6GTSVqjcEQT54Uuh6rZmDLyNsvAW
 FCpfOfQ9H+AEHH4+nw2gsRuPvKkH5saTgbYzs8vULLBeePTRFwz+CsYmiyaZTKMg/cDz
 7auw==
X-Gm-Message-State: AOAM532YOIQEgnx65vlhD8I/yMT569CU+CE6OR2ERFRPGGFv5dKm9QHD
 L/lf+sntCcPM76bd0wSruA==
X-Google-Smtp-Source: ABdhPJxtK7AHE7nJVM3FAhLSR8ZOYj32gY3gK1DBdqgnHNU6undyLnsod5UTsebFKeMmecFIbMIOcQ==
X-Received: by 2002:a05:6808:1513:: with SMTP id
 u19mr5661184oiw.109.1630459949772; 
 Tue, 31 Aug 2021 18:32:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o126sm3394119oig.21.2021.08.31.18.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 18:32:29 -0700 (PDT)
Received: (nullmailer pid 1000893 invoked by uid 1000);
 Wed, 01 Sep 2021 01:32:28 -0000
Date: Tue, 31 Aug 2021 20:32:28 -0500
From: Rob Herring <robh@kernel.org>
To: Alejandro Tafalla <atafalla@dnyon.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Message-ID: <YS7YLHWcCXT1WWnk@robh.at.kernel.org>
References: <20210830104426.487246-1-atafalla@dnyon.com>
 <20210830104426.487246-3-atafalla@dnyon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830104426.487246-3-atafalla@dnyon.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
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

On Mon, 30 Aug 2021 12:44:24 +0200, Alejandro Tafalla wrote:
> Add the reset-gpios as an optional property because some devices might
> not need it to work properly.
> 
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> ---
>  Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
