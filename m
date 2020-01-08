Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D221347F8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 17:29:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEE3174A;
	Wed,  8 Jan 2020 17:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEE3174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578500961;
	bh=UnfQHgw8Qpsxdm9ItdZ0tbA+qelQSG5MdLrX+i/mRtg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBUqXV/WqsfZpOSN0o28hXJb6Jv6BmixewJIrpuJUXLDKqmkM7N+d5JFz0tHZ6UDN
	 Jg5U1MtFrp+/5+9hfkB+TljbX/clsJMslCzIoqZ5Hrp5jc7+LqM9M0Oym+lHYsEze0
	 Y37wK02b9yG5ww23ScrZEA1CY5pF7tp7Ws3zOBwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DAEF80161;
	Wed,  8 Jan 2020 17:27:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60767F80116; Wed,  8 Jan 2020 17:27:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84331F80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 17:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84331F80116
Received: by mail-oi1-f195.google.com with SMTP id z64so3147539oia.4
 for <alsa-devel@alsa-project.org>; Wed, 08 Jan 2020 08:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hlPj6SA9VOkT0SEDoGb32WMgkDWrYAi1UZe0L9iyH6k=;
 b=covkn7bKi4yDHkZfetXicxEJugEdjQOuZIknHv0mbh2M1Lcx2/yXoitiwApaII337G
 nZWQ0ekmfxt06k4pkbl5jwmmFhXSoFPFDgWoPKyai0B0zezXiu13L10dz2O8hPawDHfE
 yc0L2ft2wPiI0xAJxWPyPnA5qEM52dVYdI8e4QyNSDt2aZn6M7TalNhKumSYocZWw4ZB
 wpHfI+wHTjzUBmNQkRvumllA7bT8XG7iE24Y+hRDvvr0D0Hln3jSIrJS7/O4y/RfgVzg
 zUKxfCsBO91gpFkdyiKD9Ms5s7hm8+L4Nss6fzdCyA7SS4lch0Z7yhBQGtuA7VIzoFlu
 6TFg==
X-Gm-Message-State: APjAAAUO5JwlC2OD4SDITnjqf4g2ZizxyuYE7SacI+AZSOrVaBTL/QX8
 apYdxtqFKeK3aX+8k0zwLhnoaCk=
X-Google-Smtp-Source: APXvYqzpwUQqAYnj36SR6Bq8nFY6JrTNRmQ5Nqzoly58zw90m+0TNGJrnPeQp+UdhA41rh2rDtUj/A==
X-Received: by 2002:aca:1c0d:: with SMTP id c13mr3585776oic.44.1578500851673; 
 Wed, 08 Jan 2020 08:27:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m185sm1227650oia.26.2020.01.08.08.27.29
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 08:27:30 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220adc
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 10:27:29 -0600
Date: Wed, 8 Jan 2020 10:27:29 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20200108162729.GA26720@bogus>
References: <20191224002708.1207884-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224002708.1207884-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Convert
	jz47*-codec doc to YAML
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

On Tue, 24 Dec 2019 01:27:07 +0100, Paul Cercueil wrote:
> Convert ingenic,jz4740-codec.txt and ingenic,jz4725b-codec.txt to one
> single ingenic,codec.yaml file, since they share the same binding.
> 
> Add the ingenic,jz4770-codec compatible string in the process.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/sound/ingenic,codec.yaml         | 55 +++++++++++++++++++
>  .../bindings/sound/ingenic,jz4725b-codec.txt  | 20 -------
>  .../bindings/sound/ingenic,jz4740-codec.txt   | 20 -------
>  3 files changed, 55 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/ingenic,codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
