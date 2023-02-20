Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C669C666
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 09:17:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395ABEB6;
	Mon, 20 Feb 2023 09:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395ABEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676881029;
	bh=EE0gW5pFp5WGQnCNMmRYqm+OfYpKrnh7/+DNoUwy3/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C7aFEkiz17En2azScgf8Vxf/TXMsK19BYLOJmHIlkFoxsFuox9FwOZlyn+K911Byl
	 SIsL6Nmm+Xz/mPK5g3ATwqUgrAFTCBir0Q2IRgsBVQ/kl/HjMbgAZsZGOdlr6pDr3K
	 shUBiiY9HXUGAVrkBGEbuPhMYKcow714vOy5/zxM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88120F8025A;
	Mon, 20 Feb 2023 09:16:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB2DF80266; Mon, 20 Feb 2023 09:16:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC98BF80083
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 09:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC98BF80083
Received: by mail-qt1-f182.google.com with SMTP id d5so96999qtn.13
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Feb 2023 00:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhdeujqRrZ30kHbfp+IOG4sWxnU1RJIBCIHIcK/nUfw=;
        b=NImCW6cqF2UsSnhxigEEytKdpMZgLxVYJE/QUz+X+9EVbaoKW36Pc1QRFWL5Wb9Pv/
         gazwEk9kaB9tb7CNolwon6m+pZwxkNC7122ROWuVQA9DKwinyAQH5jITkmD+4h6G+OTs
         jT9Kmq+spBSEfJpSwgxDaWLeRxkfADlS1r6oy0jNZHQdwogq9Sad0al5tvnQ5jMwIccV
         s00IrqlAo58FsQ8kjmjdPRalr6FyDJIO24VKCBBZ388okqt167/EI6g5JWYCpudekY4/
         cmf8JPg61e3DRY1Ble7vS97IBaMAoqEqx/Wkru62BQKDPC7C0bNU6LhN9XrqzyAC4rIU
         qrng==
X-Gm-Message-State: AO0yUKUcOuk0Lg36HXks/VBEhXOnYlJ60oDnLnh8kVEICUzEgnKw9875
	PMP0IW9ostlpUNPnHnUaIvknj0E0bAoeuw==
X-Google-Smtp-Source: 
 AK7set+oyk5XN5x4mxm5T0cPD0CeHnPpnzGN51ogQdjCypB1Ri3x8yVUmBaQi0JpXiRFx8Zz7EuKaA==
X-Received: by 2002:ac8:5903:0:b0:3b8:6ae9:b107 with SMTP id
 3-20020ac85903000000b003b86ae9b107mr17146713qty.17.1676880961659;
        Mon, 20 Feb 2023 00:16:01 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id
 i129-20020a37b887000000b007068b49b8absm8548447qkf.62.2023.02.20.00.16.01
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 00:16:01 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id e194so298292ybf.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Feb 2023 00:16:01 -0800 (PST)
X-Received: by 2002:a5b:f06:0:b0:95e:613:ca4c with SMTP id
 x6-20020a5b0f06000000b0095e0613ca4cmr125776ybr.12.1676880960980;
 Mon, 20 Feb 2023 00:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Feb 2023 09:15:49 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdVW-rBR43QCuaBDJD407wUUZ4=nJP_+UvXUrJ4+BsXRbA@mail.gmail.com>
Message-ID: 
 <CAMuHMdVW-rBR43QCuaBDJD407wUUZ4=nJP_+UvXUrJ4+BsXRbA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a07g044: Update IRQ numbers
 for SSI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: NAFTGJZVBSSOH6OBNOU25JKGFMNQ3GCG
X-Message-ID-Hash: NAFTGJZVBSSOH6OBNOU25JKGFMNQ3GCG
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAFTGJZVBSSOH6OBNOU25JKGFMNQ3GCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Prabhakar,

On Fri, Feb 17, 2023 at 7:53 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> From R01UH0914EJ0120 Rev.1.20 HW manual the interrupt numbers for SSI
> channels have been updated,
>
> SPI 329 - SSIF0 is now marked as reserved
> SPI 333 - SSIF1 is now marked as reserved
> SPI 335 - SSIF2 is now marked as reserved
> SPI 336 - SSIF2 is now marked as reserved
> SPI 341 - SSIF3 is now marked as reserved
>
> This patch drops the above IRQs from SoC DTSI.
>
> Fixes: 92a341315afc9 ("arm64: dts: renesas: r9a07g044: Add SSI support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Hi Geert,
>
> As this is is a fixes patch and we are still waiting for [0] to be merged
> shall do the same for V2L SoC?

Yes please. Thank you!

> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230131223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
