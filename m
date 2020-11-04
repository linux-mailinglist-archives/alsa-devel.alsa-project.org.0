Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF22A6F35
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 21:53:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF4516A6;
	Wed,  4 Nov 2020 21:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF4516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604523208;
	bh=q9CJ287MD68sd2dcZmOvl83g0XKK2aDq3hLevx1+Jqo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjHH9nfJjuOm0XftODul+LK+yir59o5NgXhFxMoWCgzRxY72g3gtOfrovxBII/Tzg
	 A53ziHnZFcMSYnmnHSPeAoFqYnMjypmZj7kDD1G3nTZFv6+IhUbYdCfLZXp2jI85C9
	 aDyYaXoKXNFIhLIZecLqilsWl630fLQH6yvYBShQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 917C8F804BD;
	Wed,  4 Nov 2020 21:52:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12864F804BC; Wed,  4 Nov 2020 21:52:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20536F8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 21:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20536F8015A
Received: by mail-ot1-f65.google.com with SMTP id n11so59017ota.2
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 12:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/U1Gon/nx3UwHH1KIYdjeRb3/oFW7g1+ELki1qXEMH8=;
 b=cJTf1GBKTM8hvYVDXD7zj6WXgkxw1zsH7f1nxzLGu+LadM/tVwzfNu85ERnkSM29go
 SLLqGakIKZNkfN07UeuuWb5X1JvCySHfk6RsS2lMuPKfY0qFupVN6/Zzfn0BL7xnzAdX
 +HVzuAAIJlZH7L3FGBo4E0hj19JQyl7f7C/uYkfSXaCmiapgBzYDsg8VlUGourq16C6e
 q2VlJrzzZvJ6ShnOb94pMHz4T2tRAuG3JYt56muZY2Ph1xaEk26zNJj1Tru9mrvdPWoS
 V3Wx9kg6SJnJ/jr4TthOPGoVr7SbeDh7WBcVcUgPjTZEkHGaL4VLonKNoEz78Yr/dfYU
 rVyw==
X-Gm-Message-State: AOAM533Hi4uqvtmS5lipbycxEVSoeQs2QB7Cgt0NB2LO8rB6bYrld/ug
 QpGvYbPs0uObjKy/l1ox1Q==
X-Google-Smtp-Source: ABdhPJzdgIeFcIpTNdvZ/tRYy2pZkEX6hKiUzDj2jmU/UYZwly85q2v0tQDhns1km7rIudhN2CnTwg==
X-Received: by 2002:a05:6830:15d9:: with SMTP id
 j25mr19000703otr.259.1604523130006; 
 Wed, 04 Nov 2020 12:52:10 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l9sm730481otn.53.2020.11.04.12.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:52:09 -0800 (PST)
Received: (nullmailer pid 4106299 invoked by uid 1000);
 Wed, 04 Nov 2020 20:52:08 -0000
Date: Wed, 4 Nov 2020 14:52:08 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: ASoC: renesas,rsnd: Add r8a77961
 support
Message-ID: <20201104205208.GA4106252@bogus>
References: <87zh45d0zp.wl-kuninori.morimoto.gx@renesas.com>
 <87v9etd0y8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9etd0y8.wl-kuninori.morimoto.gx@renesas.com>
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, 29 Oct 2020 15:06:34 +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Document R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
