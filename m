Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D61D0D4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 22:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B522F167F;
	Tue, 14 May 2019 22:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B522F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557866871;
	bh=MnQsnwn03NOAJDgaG6otR/i3xTa0v6RhgDZKa5rTI0w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtIBiwT7J6R2oKjY0zfu3NhUPm3muP/SC5WTwq422mZ3YAWsB8g839zPGjtvZUMNp
	 BOIsZQp5CFVC2hA7yUUknJQtTBV6jTPJzmUanawdVjPR2K+g/8Idbmf4Z1d4ON9g/2
	 6Top6qwZcYkfp0BA3UN+fbimVO0k8OEhwitqufyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE05F896B9;
	Tue, 14 May 2019 22:46:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 169BBF8970B; Tue, 14 May 2019 22:41:32 +0200 (CEST)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 225F4F8072A
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 22:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225F4F8072A
Received: by mail-oi1-f193.google.com with SMTP id y10so119431oia.8
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 13:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uj/aNb3lhudAxuL9yVxzedyisH6/evVA53ck6BzySPY=;
 b=Q4mjIxK9w9uC2BZuCbs/cdDdv1VW5SYr8+HZj1hTTiAK2dToApjtR0StVOEisTBhTX
 VF7psW6wbEQJSWrQRbET7qMOZkozL0jUCemE7OyUpTyshltKIPcFEK+RA9q92ng/dnja
 RBF9MjwBHUky7ZdCWGYfrNJYep4N3ass+dcsFS0XSVyoz4rnSZlFbroHY4gtFcCARTqI
 xrdevQlXovqeWfBaNHdAeooyNvrc0wF3JpSt1VcVErPFNsxbC/JkP2idJ628ezOQvQu/
 e7r1HBrDhn6UKpJxVhxP4C74n01u+7Ds5woBEIydfBpS2D4rNRsOXECPVV0B3AZWL1b3
 tY9Q==
X-Gm-Message-State: APjAAAWAFJGPPPtTiOvwr52+n2nGV0jDiveRkBXxk8L9xSOJTuxJJnHV
 uqtVxMX0NPoaBCW6rMCzsg==
X-Google-Smtp-Source: APXvYqzdjUlWTvBq+1madUv/8ZYMJ50qHKkthS9BLDmfCh7nxydKkUzHB56DapylG98G+Oz/KHde/A==
X-Received: by 2002:aca:5041:: with SMTP id e62mr4403410oib.60.1557865878559; 
 Tue, 14 May 2019 13:31:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m8sm6538868otl.40.2019.05.14.13.31.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:31:17 -0700 (PDT)
Date: Tue, 14 May 2019 15:31:17 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Message-ID: <20190514203117.GA26954@bogus>
References: <20190502121041.8045-1-fparent@baylibre.com>
 <20190502121041.8045-3-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502121041.8045-3-fparent@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, kaichieh.chuang@mediatek.com
Subject: Re: [alsa-devel] [PATCH 2/5] dt-bindings: sound: Add MT8516 AFE PCM
	bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu,  2 May 2019 14:10:38 +0200, Fabien Parent wrote:
> Add documentation for the bindings of the MT8516 AFE PCM driver.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/sound/mt8516-afe-pcm.txt         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
