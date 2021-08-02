Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4673DD5B1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 14:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F52D1797;
	Mon,  2 Aug 2021 14:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F52D1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627907660;
	bh=MnsUjuzLxB7QZzBsP7Kd5oaOAB8TdAfEyyhD1aKyPYA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQoQXRhEh08ymlmq+qdJal7RR5RKOSWE0lHcMb4uWmXgAFfLUYmvm9lKCvg11hcgn
	 4YyEms63ohtOxP3c+ctQLDKIDyQ1unGpfyMedVS8WGijwKFAgYE34W16OfYyHqGXmA
	 U4hDuUVvF6z9/JLXm+4Rs8caZPFzsubVcwLUzNps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B0BF80268;
	Mon,  2 Aug 2021 14:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5484DF8025F; Mon,  2 Aug 2021 14:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA6C1F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 14:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA6C1F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I37Cg2Jt"
Received: by mail-yb1-xb29.google.com with SMTP id a201so11798436ybg.12
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9r/J0qDitRnnnvyc1YlEihczgpfr2U6tS1pQrgSWycE=;
 b=I37Cg2Jt0CLI8eUjCuZ9N2sFNuW39exMcGy0vxhSSxUQ3itPbiVK4lDs1L8d/+2nUp
 jrODwFFGBE0dGsxLKhq9CicKERyOXWP4ysFX+qzhjrs88QQcloryjdTZjga37EBeuq3b
 5OSagep4P6qil+aViBB7mhiNlUOIpwHBuCWAn/Pu+HrLafgzblRQVNufikKNf1ZJES3A
 eaK9c8St2kkjKKkyQdCn48XqJTUKPRbpjxHi7Z0sgk9rJ3bviXKcJf+rvBX4w87dXSBG
 6uoIu5BgpHcUQsbtWDYq6a7M6a41GBJLyxqtk663nke3qmPG6fuBhRrs5sRFMfSuneyB
 q17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9r/J0qDitRnnnvyc1YlEihczgpfr2U6tS1pQrgSWycE=;
 b=pdj6ja4A/hMHMdr/jhhw0moZBZKnIkzF18/TUSorclrJfgqHc6Vv9gkK5VTy//xXqS
 rf7UM0q9KqyQmJQ1uQsVuNxRYvoKA+ID24qSlb287uP/OP5OlNhoUvBIAI+9x0lQRnTl
 l1e9Z4Gu+cCvkPq49NN4IAOesGHGIBJIq0M31BkWCP0WqmuoRXEcuEg1S7XrNdshOLZt
 gKYfFpYLfeG7jAUkKib0uHQMQ635QpBh4WDm08MxMemOXL0KCSlDy1Iv6Qi60/wJFfkS
 1nyHDRLX8aihA7T0XFT0qD9w53cPeGVhSiLmyu9NHDvnMx4YkNIV08sxkqb3flZ/Tkuz
 dx9w==
X-Gm-Message-State: AOAM530gtIbb/vCUDEat68KLE3TN09JysIyW88rhRRg3bsox4xcak9vb
 /WkT2biuZV0eXyVOPzzt87g++Srlh1WgNv8QNeE=
X-Google-Smtp-Source: ABdhPJwAeCFwF0NIFfLC1lv4Ut4jLybCd3m63a7aSX4vUiWBZ5QMeBapCkD8T25TM2eY/Eo3X+tIvCybyMfHAZIIgmE=
X-Received: by 2002:a25:ba44:: with SMTP id z4mr20100744ybj.476.1627907564218; 
 Mon, 02 Aug 2021 05:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
 <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <20210802121639.GE4668@sirena.org.uk>
In-Reply-To: <20210802121639.GE4668@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Aug 2021 13:32:18 +0100
Message-ID: <CA+V-a8trGqzB6eFvsub=f-e3cM-1469kqvaOw76yfS2E97GY6A@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
To: Mark Brown <broonie@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Biju Das <biju.das@bp.renesas.com>
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

Hi Mark,

On Mon, Aug 2, 2021 at 1:17 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 30, 2021 at 07:13:24PM +0000, Prabhakar Mahadev Lad wrote:
>
> > There is a updated version of the patch [1] which was posted yesterday
> > due to change in handling DMA slave channel configuration [2]. Both
> > the queued patches need to dropped.
>
> Can you send a revert or incremental patch for this explaining the issue
> please?
>
Sure, Biju will send an incremental patch explaining the issue.

> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.
>
Sorry for the inconvenience, I have fixed it now.

Cheers,
Prabhakar
