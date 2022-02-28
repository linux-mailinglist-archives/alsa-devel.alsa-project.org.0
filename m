Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634D4C6615
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 10:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5F616DC;
	Mon, 28 Feb 2022 10:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5F616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646041790;
	bh=qdXpdANQOV1fWynD++bG7Tv7PFwLBorQhQgG54URKUo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqYsGh5GlkCrkB6rGuCjQ2093TiPbBLiQ5Ek7eNt/7WJVFhtDrBpngXJZARgRG1Z1
	 r57BcY98lTVYPL39efX+63VX8ji1quiHboq0XBwxcAaPe7QcpeCgu9u2+2NB+3IZmZ
	 VfnoFFoFvM8j4GQBnJ+/axtKCODfnpoE94TB9fVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8C1F80154;
	Mon, 28 Feb 2022 10:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08265F8013C; Mon, 28 Feb 2022 10:48:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4631F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 10:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4631F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="i/P1KEDJ"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F6103F170
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646041713;
 bh=lhADqiiCNl+v4LvWzSVnM4zA8m7wbEVtsgLwiPo5Dak=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=i/P1KEDJ965HUZsvBYtEznOmNfh61Mt2N5Pq8vyKj+u3vzemfDTjIseE7GfCJvMWc
 iN5W6ZcOV7AdVk/DwgV2F3EITw5Dk72ChXtsajYu9efBwbg5goSfwW05fKgnVljphC
 gAl6klp+oODY3ztHiJFcvb/gHh/OnW1RrpICRC9zj4u2skRAJs0fH1ST6V8v6y1MOr
 vNH1JNKXt8gVzoKkQ0ccbzpqFlP1oS+JKoAe2w7cbBkRvaeEUsYf+0fPRKlrUpGWfp
 1t1Lda3F1lX1CAvnQBqUyr9LjEOQB62wvK1Gn9Y8AqN6O6q7ULDEsbVpuLb8kZHg/n
 X4rhUz9I/gvUA==
Received: by mail-wm1-f70.google.com with SMTP id
 p35-20020a05600c1da300b0038151176781so2665031wms.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 01:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lhADqiiCNl+v4LvWzSVnM4zA8m7wbEVtsgLwiPo5Dak=;
 b=NqLLDwl5yLdR3e3FdYQ/OCyDQ8fnZ6kSi1f/MUqQI3h7741+iyA0guXXIQVjT1AKqe
 5tUDKQ/w9uiJSI4GG2KznfaKMvMuwEpmETi4oPbirBfH/QwGTPy3ZnxdkKGAodmMzxG1
 DPsYni6p5Xw04mU3UeO6LRw6KEJKA4BCEaPgmC2f2uylZTUeI9rbSuAytY/lZCgT6CKx
 noOiMjzCN1Krqd6h+uWIovzlQcAr4Bnc2Tj63b5ODVs8lyFmz4grRcBBL79sEpCOvpqi
 Cnn6MBLfJHJReuCQ0+14GSs0O13tR4TPMEa7TFw48MxnX1LPECAIAdlLK0ZnWgVeUnQs
 cL7w==
X-Gm-Message-State: AOAM5323RueYAVABaFdhaiOff+C3CGrMmFr8X9CM+rAMk7X5J+JOv/oH
 fjZZ+M0AZ4PgsPE5nAFc61g7DSogTwoBseSULdCownjTC+CyB7FgkI+2hmEnWWLmF9sH+xYYWD6
 ytbtVb3lLvt/olvPd+6712nuHwSHblh/gNlK089Kp
X-Received: by 2002:a05:600c:3007:b0:381:271:49a1 with SMTP id
 j7-20020a05600c300700b00381027149a1mr12333371wmh.79.1646041713360; 
 Mon, 28 Feb 2022 01:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTbCVneuqj/uDRq1eBco71uCyPYVBYE803Kec/okcfd4SBAVH6yz/3e368hmSg5gul/1nKMQ==
X-Received: by 2002:a05:600c:3007:b0:381:271:49a1 with SMTP id
 j7-20020a05600c300700b00381027149a1mr12333353wmh.79.1646041713220; 
 Mon, 28 Feb 2022 01:48:33 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm9894594wrs.23.2022.02.28.01.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 01:48:32 -0800 (PST)
Message-ID: <93cc64a8-327c-379a-4af7-c8faa1191c39@canonical.com>
Date: Mon, 28 Feb 2022 10:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/V2L SoC
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
References: <20220227225633.28829-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220227225633.28829-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On 27/02/2022 23:56, Lad Prabhakar wrote:
> Document RZ/V2L SSI bindings. RZ/V2L SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20220227203744.18355-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
