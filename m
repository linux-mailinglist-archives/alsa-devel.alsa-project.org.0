Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45023CA2D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 13:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91B85165E;
	Wed,  5 Aug 2020 13:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91B85165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596625915;
	bh=/3pd1Kp5MFosdrrbHET9uCQCExhZz6iKxFhezLJLmBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmBEb9mO5lvCDOBdIC1bonrJ+rIygvOa3D8JXs2pfC4+EsqTPB7HtiZoMY6EpECgh
	 S7I9z8SIDDYAuuL1IsGzhzttUDOpcPxcDKELYpM0MnjKI4R3wFrb6OQoJq5B/qHEkQ
	 YFa/fxkfFrDTMYPXKB68pM1IqrezKOl3BS5zbO7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA435F801F7;
	Wed,  5 Aug 2020 13:10:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 041A1F80290; Wed,  5 Aug 2020 13:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B571EF80259
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 13:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B571EF80259
Received: by mail-ot1-f66.google.com with SMTP id r21so22467792ota.10
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 04:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGe/Je8IarDkuCxG/u56QffSTYctpnR0YPw4MQUjy6A=;
 b=QYEpaXIt53gAZ/oE76+wq8GNvLVRg5SfEWvmVW1yshtfnmA3nwvpw4FKd300PSq6Su
 Ca+Kp8DoMmX80+fE2yp6/mIGp0mfSRjFzYv0SVEn8qT+afrdNRJBceALP3amhnC+zdxp
 blNbxYbOVHl9Fq5OWIQDTFnIWF+IQDNEL5I+iPN0hrBNoesUJkvm+CAb42RiLFZWjQ9t
 /kZLrmjmovvqGJOuCBHlu3BP6rLfaXfo9gOwcE21XMi0sFC33IPLp6e0OZ0kpoAaytLG
 YWhgZzD/raUB5MrKpO7ld/pohmHRQJwHWEap9sYAIxj1xWUG9l/ak3569YhqVv4WnQVD
 lSsQ==
X-Gm-Message-State: AOAM531/HeCnlwmYZy2uwYZvO7lCxPDsGHqilSKeu5Rw6v5N7KyHIzbx
 0U9ho5+qbjYJGRxqRwAiX9o74ol80DQsWL6Erss=
X-Google-Smtp-Source: ABdhPJy6BJnijQ4U9574JZCK6kDHqx7/zV93wpejrM8Eh19/YBjLybIlzjjbGdFEBSswTARB1GJ4M2QmhRRIOA+7jHM=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr2076468otl.145.1596625795521; 
 Wed, 05 Aug 2020 04:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 13:09:43 +0200
Message-ID: <CAMuHMdWhmQS56j4vkZhK94qQVkVhCA1eceZRNW1XipX-Sr6+8A@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: renesas: r8a774e1: Add USB2.0 phy and
 host (EHCI/OHCI) device nodes
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Niklas <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 USB list <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>
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

On Thu, Jul 16, 2020 at 7:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add USB2.0 phy and host (EHCI/OHCI) device nodes on RZ/G2H SoC dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
