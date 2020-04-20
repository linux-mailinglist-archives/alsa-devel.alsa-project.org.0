Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75101B140B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 20:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789D5168C;
	Mon, 20 Apr 2020 20:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789D5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587406244;
	bh=LbiKxNmbI7372BgHRT9t9SxUK+8yYdaShqeF5j2JsL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8xgMe5woeSFfp+tPLIKyXGf6uLZ7maQHODGKB3H/CBzRJMr5TzXdczZJjLBrqqRp
	 bTk1816igLl6SA6hfuE/94M3jW+ybpXdpubbgZWGvwupVCy72Jl3KlU7X6SsfEzZln
	 pEuN2dPxGJ2r21I7fm2dhc5i0YtQgO+1HHsDRcNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B0CF8013E;
	Mon, 20 Apr 2020 20:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46DDEF801D9; Mon, 20 Apr 2020 20:09:01 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 1773CF8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 20:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1773CF8012F
Received: by mail-oi1-f193.google.com with SMTP id q204so9591038oia.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 11:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bc56Dwj1aMPCCpPjifIrG4vj+vUAtSdEB9HyhT4YU10=;
 b=PgMTC8gUyOUxu8d4ECGDFH+xTaA7G2wSH1fhyA6ltpVKgr/xOAv5oP5l1bIO3aH3fo
 hmiWB0HKEiekyU143AyjYHgM7hG9WS5LJ8I6Ij1rojAapGSuwV3vsR/IzTe9nMV3luRA
 1Zi5MkQbvchfqtF5WVbAdwWwwpvMZxlY9ZPtBIJCW9NoEBdztCMC96OWhJr5YGeXIq/P
 9gRslNAY1xZQHfmy/yCz9TwcMg6ZcHDVBWnUD0VAKbIyEBQjfA624/VFmONuBz0Rs4lz
 zAFN1we4EpwqF33rRD7y6Fea23zwA2D+fOct2AtWXONqq91uJ1no3gvOu7DjJ40VJcQY
 PdOw==
X-Gm-Message-State: AGi0PuZH0aJsjJQ67MvDsmy7RMEh6FZtBZXZWxpqPz/0ixLdW36cZaLa
 aeQelJDB/XbloQNoJTVE0Q==
X-Google-Smtp-Source: APiQypJ9IiQdq0jjyzPfhPrpdcpv8xxH38/RsgpZdDA5tEwK8oJrZwbmWnVs9XuPzOSsG6g8XvCCqw==
X-Received: by 2002:aca:3284:: with SMTP id y126mr428503oiy.175.1587406131319; 
 Mon, 20 Apr 2020 11:08:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u9sm87462otq.54.2020.04.20.11.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 11:08:50 -0700 (PDT)
Received: (nullmailer pid 32206 invoked by uid 1000);
 Mon, 20 Apr 2020 18:08:49 -0000
Date: Mon, 20 Apr 2020 13:08:49 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: simple-card: switch to yaml base
 Documentation
Message-ID: <20200420180849.GA32130@bogus>
References: <87sghovzwb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sghovzwb.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On 01 Apr 2020 09:00:04 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v3 -> v4
> 
> 	- don't have "clocks" at definitions
> 	- tidyup comment of "patternProperties"
> 
>  .../devicetree/bindings/sound/simple-card.txt      | 351 ---------------
>  .../devicetree/bindings/sound/simple-card.yaml     | 484 +++++++++++++++++++++
>  2 files changed, 484 insertions(+), 351 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/simple-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/simple-card.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
