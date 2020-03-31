Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60CC199FBA
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 22:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8199283D;
	Tue, 31 Mar 2020 22:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8199283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585685003;
	bh=c3ae9kn65pDkOCfHTKewNDcf0QCCjBeMT8l+odqiohw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGp8ImZnKtGN0NRcpEqH0M4fZCZkAs+f9mlqEMyCJZ5M2c92/wxrx3uaXBkAMpgkC
	 L80IB6G3Xo9FhSOtdbKx0+Le1cq2FvBt+hM2a8poaa7WanRe9dMHUtEWH6kKKp+gco
	 yToswC3BW4pds5QS8mg8OU+l9/jqkEzRhGV99Ohg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D55F8010D;
	Tue, 31 Mar 2020 22:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D5BF80255; Tue, 31 Mar 2020 22:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B40F9F80157
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 22:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B40F9F80157
Received: by mail-il1-f194.google.com with SMTP id r5so20727260ilq.6
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=inn69R6pXVv7tn5IiOj3WCmHSXEzB0bu6RYjdj4+w9I=;
 b=Jaw56tn3KgVwrJjrCBkwC1ScQnD7CJQL+ZYy/uL9O9cJyvlaUoif96tpHlW9Z6rsb2
 xLW8Fj0GnOqdWTlBSqLY+1L8aP/J9z/B8jqe8J9eib6epr2WrcGL9Pu1hDvytS+dhXyW
 Qbc/6hov6vnm1esXp37SjCqFLQHjRQ3OIc+Q8m+rCDBAFm/9dtuOHztSViTuGeUOlJLx
 OU3onKa63CvFvUJDbdtc2H8lU2LXU7IFsMVwHn/2VgMosJXxEH1AczvQ79O5A2UYG7k4
 1gIFTnqBwRfflHded2llJDtJ0raHj0DTTTAKgy4lVAGp6zUwQCw85J4p/9H97K2ZrdF7
 q+Gw==
X-Gm-Message-State: ANhLgQ1GG5ug4C9PaC+lGdlEuY/aTrZ4s56sCWnkGLBV4mBbZjazQxLU
 i0ecWeWCXATw9z/6YlDWJg==
X-Google-Smtp-Source: ADFU+vsICc4DhBvaBEO5MjNBpVjmJPABPfazkSQ87pqZhrYedeNGTExxSKz2gZT+RvOxqRGZ9E7szA==
X-Received: by 2002:a92:9c54:: with SMTP id h81mr18455056ili.109.1585684919454; 
 Tue, 31 Mar 2020 13:01:59 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id r29sm6263789ilk.76.2020.03.31.13.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 13:01:58 -0700 (PDT)
Received: (nullmailer pid 7245 invoked by uid 1000);
 Tue, 31 Mar 2020 20:01:56 -0000
Date: Tue, 31 Mar 2020 14:01:56 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: sound: rockchip-spdif: add
 power-domains property
Message-ID: <20200331200156.GA7186@bogus>
References: <20200324123155.11858-1-jbx6244@gmail.com>
 <20200324123155.11858-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123155.11858-3-jbx6244@gmail.com>
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

On Tue, 24 Mar 2020 13:31:55 +0100, Johan Jonker wrote:
> In the old txt situation we add/describe only properties that are used
> by the driver/hardware itself. With yaml it also filters things in a
> node that are used by other drivers like 'power-domains' for rk3399,
> so add it to 'rockchip-spdif.yaml'.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
