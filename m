Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE278221799
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 00:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D64D1662;
	Thu, 16 Jul 2020 00:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D64D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594851313;
	bh=Zbhdl6sALo2atgdM5W15dn+y8u3p2HS1qQ+EUdFgpig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgUQXtE8P4l9sbRfYE6rTFW1hx1VMar6Ahf9ZouQ5TCit2dSGaLo2ux/3a49h8FI3
	 6A1i57LJcgOdIxg+AP/cWvpiTnVbRiQ09RzZaeeae0cICBCqoAILMOq+ay0O9xmlIH
	 cQb0BDybwvq5kjBwXqY4i1rjR7jYqvU/SDqI1Dfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BFEFF800E8;
	Thu, 16 Jul 2020 00:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0A5F8021D; Thu, 16 Jul 2020 00:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0618F800E8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 00:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0618F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hz1JhZJq"
Received: by mail-lj1-x22c.google.com with SMTP id x9so4534703ljc.5
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EIwOcx3xakAQl+aytp6k21WdPOXiW4LKLnvT4rMht3U=;
 b=Hz1JhZJqRnK8pNhlac4KJKaAOrt6GLsozrPP7iGcRXSoePoz+4/oCVBbTuj3gKxy+F
 Iqupe7BXDyuvqUJFq7ux48yxZUXet2l6lCejiDEF5ECWlwRcMN4qBAfk7OUG/2xnGMtY
 ZH/nT62WZGA1pzdItKBop2AoEWnQHrTPncCft30e1/nh6uxRAgqcZODIGUaYQ0g744Uz
 r3G/6+naA1rtni+RG0gW7XB/jVGfSrm+e3VZFviXPRLv6VoBXrRiGq48YKSWTFfLzt8N
 NWUyzV3raOPM5tpvDRk2I4F5RbZS3kii+NhiJuQb8mYBHsHWwYp/6fk1byezdGCJCvn5
 FTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EIwOcx3xakAQl+aytp6k21WdPOXiW4LKLnvT4rMht3U=;
 b=TwupHUqu4guqDNlktPgZ6vBIA1LNKF4t7p5LbvC69YPdtwB+9h3hU0LLqcz5D913sR
 5dDCcYAkJbv4NfWfyl/42DgoUiXxxceOvRgv6RYJ2ioaCV4GFsfZEwONHwxrYGkU5wvN
 3xJUWBtUC2AuanAuBqpXlsyogk1MOsKLpyK3Kta5BRZ5cA6WLff5qbVA7g2gCKo9MdTG
 DTh/kj0uhgAToQwrPutfPCw0MoELYzbOBukSHwsjYUOqr+nmPydrCPtT477RK9HnUisr
 f7Il15L2bJ5c5A5Llxjr4qYrhuv/h349yPoHG21b5WxYbgjCQnRzO4dTYhSk2yh/lET3
 I8XQ==
X-Gm-Message-State: AOAM532bTYL1wFFkdNE3a1DPDDxC8mETBtWsGIfqxSUg7JtcHfntw/d7
 Ccxenh4dSoL2t5bZReX36YJQgAfLtg1VnuScyfc=
X-Google-Smtp-Source: ABdhPJwbsLNfkUD4HdIJ6IkkHbrTn5XQ0hwtojNOkp3i+xmDVdQLvJF2Xzpt34dORXBPkeyQoU9vlFrz+IAunQMkhA8=
X-Received: by 2002:a05:651c:544:: with SMTP id
 q4mr596756ljp.310.1594851203157; 
 Wed, 15 Jul 2020 15:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Jul 2020 19:13:11 -0300
Message-ID: <CAOMZO5BYV_3GhcWsaGXnyxT_d86wQ+3wguW3AU+kVfx7bnZUkg@mail.gmail.com>
Subject: Re: [PATCH][resend] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Kuninori,

On Mon, Jul 6, 2020 at 8:35 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ak4613: ak4613@10 {

node names should be generic, so:

ak4613: codec@10 {
