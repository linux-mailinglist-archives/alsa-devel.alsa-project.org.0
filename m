Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B77199FB8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 22:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EC8166E;
	Tue, 31 Mar 2020 22:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EC8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585684986;
	bh=o4swV1vDj7xy+g2oomhyj2u5Kn0oFiLjBvW+QPxd+hw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUllm/q00BKRbLXJvk77J+6lNTtCfpeVa8rLGyk9Idb134Y4LZDB6H0Obmdeus8x2
	 51K7sOhz7q065zyvDL7uCtm5J9LRwk2mT8hjCo6a9xYmXDJvQkEbEoF3gcMiNu0ULK
	 7FMa+b5+hx1QdM5mIkhGLngKNjVYB9gOMbdcjAG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA145F801F2;
	Tue, 31 Mar 2020 22:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00AA4F80157; Tue, 31 Mar 2020 22:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D982F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 22:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D982F800AA
Received: by mail-io1-f67.google.com with SMTP id h131so23115994iof.1
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vkxxip8s1ZW0GnbenbnFeoJyggUhdVdybES6+NRkTls=;
 b=BWe2rwd8nNgD4f8cMGQ5OWCyRZLrFc1YokxyBP2gyTUQohLYG473lnRVtTWt3Qu2dp
 6Zo5OQq//af0EgZjAUxBoZf3WxOPszQ+W2ZDRivnXDzdoXUaFvVVyBGkk9vijTjyXATK
 y/6Z/2a4kL/mpIlRZ1RPx1oZj0AsBXiWL7wHi7YpD0J4jEdW1e3WJiu72yxI6lB7LOdz
 6UZTqTiX8gJKbHgI0X6ZSYBxOX3ns+NT9WDWx6//qItV59LKsH6PuhzTbHB5M0z5kVpA
 L6ywBkCRYsZ9TO1wNEJ7+FKYKmUwvAfstGtUBV2s5X6FWWcpHFicJI04/n5NqV3Z83VU
 yN/g==
X-Gm-Message-State: ANhLgQ33SPFpp77S6Ao9In7jnhgqjnJ6xQdmqOdLcjuCxaCWVwy2VbsO
 tRfSXwtGIyuI7voOVbyaFQ==
X-Google-Smtp-Source: ADFU+vvBejlhKFx9aVEK9Es2UC6IoLSf1k2SdAYxRxDFr5MBW3pEn/d1O633AZt6lRcbhYJICsvimw==
X-Received: by 2002:a02:2505:: with SMTP id g5mr15167286jag.114.1585684891883; 
 Tue, 31 Mar 2020 13:01:31 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h29sm6197193ili.19.2020.03.31.13.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 13:01:30 -0700 (PDT)
Received: (nullmailer pid 6517 invoked by uid 1000);
 Tue, 31 Mar 2020 20:01:29 -0000
Date: Tue, 31 Mar 2020 14:01:29 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: rockchip-spdif: add
 #sound-dai-cells property
Message-ID: <20200331200129.GA6458@bogus>
References: <20200324123155.11858-1-jbx6244@gmail.com>
 <20200324123155.11858-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123155.11858-2-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 24 Mar 2020 13:31:54 +0100, Johan Jonker wrote:
> '#sound-dai-cells' is required to properly interpret
> the list of DAI specified in the 'sound-dai' property,
> so add them to 'rockchip-spdif.yaml'
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
