Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E210F0D24
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 04:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188E416E2;
	Wed,  6 Nov 2019 04:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188E416E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573011611;
	bh=ouye7zJ/NSbZ9b1StWRpwlvndgZOsFBZDQVaKXOsQI4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PrdyvD+D/Hph3eQIDqMn469RXWkHMjfv0W+DnNMn24GPQhH1fJj6rRUd4g//H0VHL
	 cUitAxAIds8JDSqgARj1rEESmDwg1vgW3qJMmXYrRnhvxABfZVU6NszEeOcyGgOPVE
	 BX8K43frVDxmr60k+33b/8RdgqsmrkmnYpfFJUKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B783F80321;
	Wed,  6 Nov 2019 04:38:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0E7F803D0; Wed,  6 Nov 2019 04:38:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 434D5F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 04:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434D5F8015B
Received: by mail-oi1-f193.google.com with SMTP id j7so19736130oib.3
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 19:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zYoJtXViZUkrmaEjzeRuN7ipxhnFw6iV8oL8qz3KPME=;
 b=SfBmNk8loWIhwVylJnY1M0Bg41IZ4pD0Ec0Me/ot8jRoBBHD21/Fc6yiGjeO2n7/Lh
 uSVCLlMUyyOuYZ8LgJPVDB+u2ZRc8209mqEnseGaDS2zZwsg7TuVHsJ5tL09WSx4CsKV
 XX4YaQAJQdpw75G3j74TR+brxVjQDvaSn55cigAbpcAeMOz0gOq5i59IiWkh/G+fnDWQ
 Lz2uCepRXb7i6z/EwHLYUwa2jOmN95t2a6bC+yufo/BgAMqBNwm3F3Dt/5LOhtGNb6Ro
 hywJevNhz+DDJwQW4EdSNKiSF7utbveTfAp7+V0SH34sPFyaufckfll4ki334chM476l
 yTOQ==
X-Gm-Message-State: APjAAAXL8R0o1ukFjDs2iQID6Pa2Anr7zB//znLtT1ERIlqasGQIZYpS
 qT1FBtrPrwT648duyFypKg==
X-Google-Smtp-Source: APXvYqxEujDFblVonVJq+omcN2s8+na+HgO9Kbj1fM7xCNkKHEaFSDDc151GZOAvsomjXgf08bEb7A==
X-Received: by 2002:a05:6808:1cf:: with SMTP id
 x15mr316386oic.147.1573011497988; 
 Tue, 05 Nov 2019 19:38:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q28sm6752977otc.77.2019.11.05.19.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:38:17 -0800 (PST)
Date: Tue, 5 Nov 2019 21:38:16 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191106033816.GA6124@bogus>
References: <878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsi: switch to yaml base
	Documentation
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

On 29 Oct 2019 16:01:41 +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document for FSI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/renesas,fsi.txt      | 31 ---------
>  .../devicetree/bindings/sound/renesas,fsi.yaml     | 76 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
