Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5020815
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 15:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B6C16DE;
	Thu, 16 May 2019 15:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B6C16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558013203;
	bh=TzSXOZkcAqM9EykUP3uokIU7fOz4HO/WYc1H8OX9YcY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gt7tpSJ73gC3jYZwRm95vvJUumrGj6u7OMJIlDZIzRWx1H1JFOof66Tp7AQj+BbXi
	 VejcCO9f4fiBWswmxXenmZx7ahehtLXa+UDsEHkNHNes0TvU9cSnyXok7qd+QNMTyt
	 eDL6PhDzCOs0Rqd7uJ4sC0tzl8V72iMBMt4SFZig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F452F896E0;
	Thu, 16 May 2019 15:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9345EF896B9; Thu, 16 May 2019 15:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_26,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E1EF80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 15:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E1EF80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wzEn6pbN"
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33F1020881
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558013109;
 bh=WNuqEHpbsjF3V2nlPtAGov/5DMwCSoLWptkVucGbyVY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wzEn6pbNaiEqoysDMjMLeEIiedjNG5ImjbiQPwVntaXLoLda3QCC2w+i9LI9k4DOU
 C2KElw9E0Kd99Rgn7PTOmiHSCy3SyWGlaHFfGjSasUgzJNHT3Ig8RL0D/M3qXSEGI0
 OxgBaxmQiI15Yl7Fp9DYiiFOFoQsdYhVuV+fsFNg=
Received: by mail-qk1-f170.google.com with SMTP id z6so2194158qkl.10
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 06:25:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVFFu5QLmM9fwtJBmhkhmf317hJGst1wyoH5cLKrjdX2+n42/9P
 4pZVIj98NwLZz4Q97rShssvC0TeaRcgIb7dLLQ==
X-Google-Smtp-Source: APXvYqzhI3LC1U9lpGnWZZm7DhGgRFFQYomJQssdXmHE06C6cfyvv1SGkWtW749ihce0y9GQ66xFIrA1wtO+q2ZhKuQ=
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr37652270qkd.65.1558013108453; 
 Thu, 16 May 2019 06:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <706cb97ae45cc9edc49c8709b2189ed786d2c7db.1557993523.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <706cb97ae45cc9edc49c8709b2189ed786d2c7db.1557993523.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 May 2019 08:24:57 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+4+LD+x-bd9iCwA4bGtRUjdqo7=g4HgGzcYTsZG17KLw@mail.gmail.com>
Message-ID: <CAL_Jsq+4+LD+x-bd9iCwA4bGtRUjdqo7=g4HgGzcYTsZG17KLw@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] dt-bindings: sound: Convert
 Allwinner SPDIF binding to YAML
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

On Thu, May 16, 2019 at 2:59 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Allwinner SoCs feature an SPDIF controller across multiple SoC
> generations.
>
> However, earlier generations were a bit simpler than the subsequent ones,
> and for example would always have RX and TX capabilities, and no reset
> lines.
>
> In order to express this, let's create two YAML schemas instead of the free
> form text we had before.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Add comments
>
> Changes from v1:
>   - Merged the two schemas together and used the draft-7 conditionals
> ---
>  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt          |  42 +------------------------------
>  2 files changed, 101 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
