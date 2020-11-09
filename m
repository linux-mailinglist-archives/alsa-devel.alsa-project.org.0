Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE582AC340
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 19:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395C61686;
	Mon,  9 Nov 2020 19:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395C61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604945356;
	bh=Si18O5nueuWoEncmlUb5Tl5X7iV7azLDzgW0Wj/hXvA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYGWtvtBLW+dfbCR8IHsoM7IKzJSZvTj3gT9c2ydn2gFZwgqVVEuqXzvvFeYd0mP/
	 mnjYe8kv7QlpwgI6Goahwg4agGx8iKSq8W+1sQ6KEGYWidfPZz7u3dqtB4t9v7otn5
	 /Gf1I7NIfrR2iy0q/ABSq/R8u1NiLs2djm+tpK2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E41F80059;
	Mon,  9 Nov 2020 19:07:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6ED3F8020C; Mon,  9 Nov 2020 19:07:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C4DF800EA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 19:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C4DF800EA
Received: by mail-ot1-f68.google.com with SMTP id n15so9832649otl.8
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 10:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LL8NPgXogoNlUMeu3WT4Rthu8q22EfXdmt9F6yjargo=;
 b=YewklcNCVjFXntctf0I7RqJnqcNWBcAyrE3ORZpdJktE2ClsfpBbZ70vYidUyUIptM
 +LmvSJWN88a5vlhpunH9T6eLWLZ+AfLmQO0MnN1JOeNnuw0O15FHyGNDypOj00XRpwjR
 Rt3X8CWk9bEQRuAsGO5dvkPaMDpAeQ88KryTl2t83n1+5K+GaZ0ujjJiwpBAxPn+XsAh
 yLJYT7FZCHstXy9WQbyrX4aa6S6+wOUr9ONJSRhbmN1LHVQuqsanWFSzMuoQ8kSbkqAu
 g++/rSBMYeBdP9XiS6hx1wVEQDhSeeCF3UqsTufkrgtz6HDr6a2J6cd7Pa2VBL5B/u8S
 Txmw==
X-Gm-Message-State: AOAM530AbBDDUe+daBnu0vrWG40VDZlYnXKBtG5+CyXP2iUJoWJ19IiZ
 sXEWufSWqtJh+7sP146Ixg==
X-Google-Smtp-Source: ABdhPJwrY9+pUaXSDLsZ+KQnJn9K+YyIl8Pz8PK1hyBW5haK4eYCy/nZc5Dig59XPwbB3PNwmGdnCw==
X-Received: by 2002:a05:6830:150b:: with SMTP id
 k11mr10733112otp.234.1604945252768; 
 Mon, 09 Nov 2020 10:07:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f18sm2664482otf.55.2020.11.09.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:07:31 -0800 (PST)
Received: (nullmailer pid 1521578 invoked by uid 1000);
 Mon, 09 Nov 2020 18:07:31 -0000
Date: Mon, 9 Nov 2020 12:07:31 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: adau1372: Add bindings
 documentation
Message-ID: <20201109180731.GA1521527@bogus>
References: <20201104201209.907018-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104201209.907018-1-alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

On Wed, 04 Nov 2020 21:12:08 +0100, Alexandre Belloni wrote:
> Add device tree binding documentation for Analog Devices ADAU1372.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> Cc: Rob Herring <robh+dt@kernel.org>
> 
>  .../bindings/sound/adi,adau1372.yaml          | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1372.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
