Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DE93CEEFE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 00:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620AD1662;
	Tue, 20 Jul 2021 00:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620AD1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626733086;
	bh=4+fOZBCqZGmz0pYEAPV+QnSIueUt+roUrdnMZ5PdQkA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClI9toXqpCnJn9mayzq5iHDT/3jWsBZEEZp2pgX2LKaEYU/m18D4l1kFC1enBU6Nu
	 4iFPNy75Z/x9UKGVkF9AvqcnKm4mhK5W1rx2k7RBa1KOb3a96HfEw5gmmfHYPGxcR2
	 SCj2hvzczOc1wkaeKCWWkN44Bo/mK6pjNgDCqeCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C205DF80256;
	Tue, 20 Jul 2021 00:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E268CF80227; Tue, 20 Jul 2021 00:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8ABF800C5
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 00:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8ABF800C5
Received: by mail-il1-f182.google.com with SMTP id a7so17442725iln.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 15:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=874ZtwewxQXPmAbbhVDeMiVd05ey4l+/IKy2ovtuitI=;
 b=KSnZf0Qfeyjvgy1Wlj76+w1wf0uzV4wP9gmx4NpJYFHP2vE/jPw8/vX+Ssv8avRBwY
 K4i2el4+CcniXDGppahU5kiunUSx+IGS9tM2PM6DyBuiuwZTk1q1tEs4pf+trzYJB8bd
 jpjCS4G9kZNR2RSr3wzB7c8qp72y/l/KhOrGq2Fvwh8t8DPchD7aH0jcF9VvgzMr5cgl
 K2K0ZV1Wz8VhPTiqpUByyTRi1vFpZZ0E+hXPIG7OFPKiJDdqHdLfjuuO9K/WvBpIZxw8
 BDCfBPrBcoK4kZHtINmpu+za3jw3NfSJ/L74GdlB+Ws1zXtcczcmbqawOtjm/g8ftZTl
 u+xg==
X-Gm-Message-State: AOAM5306z0WFI/umyAtvrRr+qrDZpixGv7Py/5DHUanTE2FFs0SkZtjx
 hkb4SSTf4giymIWk6TKHeg==
X-Google-Smtp-Source: ABdhPJy0wIMrRJZvaZ8C3U3+0ufoLOCgddvaLLTczqOg1l4VABQ3B1O61gghWf9BfbPEH4Ip5Qcqeg==
X-Received: by 2002:a92:c005:: with SMTP id q5mr16040538ild.117.1626732985753; 
 Mon, 19 Jul 2021 15:16:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w14sm7444837ilj.76.2021.07.19.15.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 15:16:25 -0700 (PDT)
Received: (nullmailer pid 2698560 invoked by uid 1000);
 Mon, 19 Jul 2021 22:16:22 -0000
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Date: Mon, 19 Jul 2021 16:16:22 -0600
Message-Id: <1626732982.918933.2698559.nullmailer@robh.at.kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das@bp.renesas.com>
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

On Mon, 19 Jul 2021 14:40:33 +0100, Biju Das wrote:
> Document RZ/G2L ASoC serial sound interface bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Rebased to latest mainline rc branch.
> ---
>  .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/renesas,rz-ssi.example.dts:31.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/renesas,rz-ssi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1507078

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

