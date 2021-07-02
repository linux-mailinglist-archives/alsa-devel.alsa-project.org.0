Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F33BA502
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 23:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5C416AB;
	Fri,  2 Jul 2021 23:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5C416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625261092;
	bh=yAhQFVf44jvVEKIgKmS7YsNEfX/ea54OOnmo6JElnSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDfymG9CAsA6xia8o+PKUOHycZSdRJXgwyIjzMVx+EeC30PYVy/hAitkay45qJzaL
	 EdVdBUHoHknaBVo6EtYSw/Jv7paLVK3fg2UFctA7zI1qaM1L3EfT8rQmjTfhcubQxf
	 gGvr6O+3hmUmI0zpurWfX48718H+cZr5txkXloHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98136F800F3;
	Fri,  2 Jul 2021 23:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A7FAF80229; Fri,  2 Jul 2021 23:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 075B4F80165
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 23:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075B4F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NX0DW4nd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54BC06140C
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625260993;
 bh=yAhQFVf44jvVEKIgKmS7YsNEfX/ea54OOnmo6JElnSI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NX0DW4ndglFPz7ZC0wCE9ALh9NMbU4mvmVIItzA8+pKgOeUJpjpsOF0njK4EMlNuJ
 cV4blNdSHCh1cjDywGwpPoymNKv8iUVdwnERbdrbez9g/XjaF73vDIytIGS6R8IyKi
 0qHvZ5B8CaZU1M3cHVrLEbLmD9u53awwo0wzcXVLK5dR6dKvxFZw6C24a7QmOARj6Y
 9AixBOAoSQpIqa0w2h9Z5n3rfR+isUPSdKRH9VQ7jvnefXBkzfQjjAvRFjZBSB/oY/
 BL2NByQBPrlGaqMTYyAVqXtwuMhwsfD4OvShgDWYPROL+/CPYJTW6xKr23yMhvA1ru
 ghDS3oJAnBaYw==
Received: by mail-ej1-f41.google.com with SMTP id gb6so1669842ejc.5
 for <alsa-devel@alsa-project.org>; Fri, 02 Jul 2021 14:23:13 -0700 (PDT)
X-Gm-Message-State: AOAM531VLjwp0yA9hvst03x38c45Hr/AM6Qh9rMMRHLUN2rsUZ44mdko
 RwDc7bnl2SsDpmJvdSa6os71dLad1RJ8PVv/2Q==
X-Google-Smtp-Source: ABdhPJyL1BkaDJTaTIzttEw91SPz36BUktrJTaiBX9yCmMzBdceU6QMBM6nm3aeqLlVC4lmvvTW0iFZ3yjt4cFTBRJk=
X-Received: by 2002:a17:907:2cc7:: with SMTP id
 hg7mr1730302ejc.360.1625260991859; 
 Fri, 02 Jul 2021 14:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
 <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 2 Jul 2021 15:23:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
Message-ID: <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: Document RZ/G2L bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
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

On Fri, Jul 2, 2021 at 7:50 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Document RZ/G2L ASoC serial sound interface bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note:-  This patch has dependency on #include <dt-bindings/clock/r9a07g044-cpg.h> file which will be in
> next 5.14-rc1 release

That kind of means you should wait and send this once v5.14-rc1 is
released as it is the merge window currently.

Rob
