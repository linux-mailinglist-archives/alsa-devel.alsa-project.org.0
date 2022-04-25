Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57150E11E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3113F173E;
	Mon, 25 Apr 2022 15:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3113F173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650891886;
	bh=m3P8t4KULN9GCFto4kpw31q6BB0eIyXeZ0mVOrRm69s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kV4oWD4sjmy+cRcL+sf1j0mQPUaZ1o0ZkYgrTQSMk3PcLALPoJ4i2gVbzHX0jHlsu
	 LmDwaNENU0aAO7F4CYsKoLPZyFrx0sN49eGtwJzT6/Xnk/fNbheqQIxgonnat1ibRZ
	 ic+GBKHAXK8t7WWR39xFkzRHvxRQcHmvHl8xYfvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 920D0F800CB;
	Mon, 25 Apr 2022 15:03:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF90F800FA; Mon, 25 Apr 2022 15:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0976F800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0976F800FA
Received: by mail-qv1-f44.google.com with SMTP id e17so11678742qvj.11
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 06:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V42KY/X6UtUq3VKEQTjRcqbsGKczMX2aAqWtF3TJ0g4=;
 b=0qMySlIs9XjQL1ruin4c+jiGnUkQ2gVj0G069dKPDrEtfMnQ4DWEMYezfhn3fHrYmF
 r7CkG0i3GIul1GJxy96YGqdVv5JIgVjnE1DPaph+Gc1X7a0UIn5P3V5XT5vE3uVhLIEY
 b+WVErV135i6bE6ezqtNxMFZYc5NEyfGuxpXU5zL1YJ3D190pz9jLkQx/MTlEMpTpkeB
 zxhN+w7dkAJUim8mVOLPL08x49VaqtFgVhJISyT2eJfxkvlVs8eWR4u7yZt+Cawg5gtp
 myXTfl/2RIlK/3PPhaZyiMi3Bb78ZnC2JuL6HJ3eArdAOIEzvBiZ3A8DU1AgPqaPNK0+
 sG7w==
X-Gm-Message-State: AOAM5316zUgK/Sjp5iAzXqsg3ujc5ymL36CnCGbsljjsKArzyKTjoo25
 VyPGegHBWb0V3S9lnn/MeRaxcYxcvykjYw==
X-Google-Smtp-Source: ABdhPJy7uZi1+EAzR2LKMpMhS72VrjOIZu9YnrsPj4Yci3GFN5WfgKGDd2fkIoFZxYLuUrhqvqgnVg==
X-Received: by 2002:a0c:eb8d:0:b0:456:3256:7ae0 with SMTP id
 x13-20020a0ceb8d000000b0045632567ae0mr5140689qvo.95.1650891817960; 
 Mon, 25 Apr 2022 06:03:37 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 g81-20020a379d54000000b0069e9f9f740esm4934048qke.100.2022.04.25.06.03.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 06:03:37 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f7c424c66cso55448087b3.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 06:03:37 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr16929039ywc.512.1650891816817; Mon, 25
 Apr 2022 06:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 15:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2_2z=z=y-NGsYCQr4CsJB3z=GbBw4OL8=v8pqe1m+CA@mail.gmail.com>
Message-ID: <CAMuHMdW2_2z=z=y-NGsYCQr4CsJB3z=GbBw4OL8=v8pqe1m+CA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Sat, Apr 23, 2022 at 3:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
>
> While at it add a '.' at the end of dmas description for the first cell.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
