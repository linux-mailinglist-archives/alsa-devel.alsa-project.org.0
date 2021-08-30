Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935B3FB62E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 14:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05EB616B8;
	Mon, 30 Aug 2021 14:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05EB616B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630327056;
	bh=VSnG7ci/z6It+oL6KcTBEhuTf8u1sv3TMd5qXRIvpQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keGZ6Y+wZUHLCo1hJt6VYtzO9ZQpvWJ3aUkPjar90n4amGsJJLWKYX9bwrWrvADvO
	 gJn5Dslan+JCWGrPkzXJyo/PhCaxeHzVtEzcW38jncuWS5omFgQ/lxGwt5VMXv4d89
	 sZB/X+03ggFO0lbEelVqa2l5dv4PkkWtL6BtwaYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E00EF80227;
	Mon, 30 Aug 2021 14:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDDAF80218; Mon, 30 Aug 2021 14:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0557F80171
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 14:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0557F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z9VrAPSY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92F946103A
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630326964;
 bh=VSnG7ci/z6It+oL6KcTBEhuTf8u1sv3TMd5qXRIvpQw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z9VrAPSYu3o1kLTK5GooxotaEz5m+jtqVGPk8x4/xsNs4xSvwITYKkramNk5d/Ds0
 Teze/fJvUS5JD3p4PamiFqb8HZjoQyXqOhTqZWPGvRcsAursOrRZnb9c31yWhB6kP1
 z7J2AvmUKIV07RunGf8O9elvEyIotC5c1kW9YeGN8AstPmq2X97tMbSCFduB4B7put
 Gjvg/TCjEPgvqzH+1XqWBuZcnDX3l3ZBslHmIwBQ4ginqBAmsCLQGEUmFYThNrvgKJ
 M0cHM01VOqLFW+6ei0XINX0sckimNyiqcvkXgF7RoCI43TdCyB0U20iL6wW7xeU/LQ
 mw9nffcTzgXBA==
Received: by mail-ed1-f52.google.com with SMTP id q3so21341795edt.5
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 05:36:04 -0700 (PDT)
X-Gm-Message-State: AOAM531nf188NM6jzPjUCiUz28U8wrmL8525yE8Mp/1s48LCnzdypr5y
 0WFymIcjI49xAFwq8dLi0zz23HXxvvBdRw8lLQ==
X-Google-Smtp-Source: ABdhPJzKe9hTkHckfNaR1ucxYim8h6wVK9o1P5JmQEu+WRbO6Yl0Gq0AZ2KqnNnrX8JgVC8B7aRTlLvuFbVruyQ61UA=
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr24307350edx.289.1630326963208; 
 Mon, 30 Aug 2021 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
 <20210819084144.18483-8-trevor.wu@mediatek.com>
In-Reply-To: <20210819084144.18483-8-trevor.wu@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Aug 2021 07:35:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
Message-ID: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: mediatek: mt8195: add audio afe
 document
To: Trevor Wu <trevor.wu@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 bicycle.tsai@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Li-Yu Yu <aaronyu@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Thu, Aug 19, 2021 at 3:43 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> This patch adds mt8195 audio afe document.
>
> In order to support dynamic clock reparenting for ADDA and ETDM, PLL
> and MUX clocks are requested even though they are not consumed by afe
> directly.
>
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> This patch depends on the following series that have not been accepted.
>
> [1] Mediatek MT8195 clock support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
> (dt-bindings/clock/mt8195-clk.h is included)

This dependency is still not applied, so the example fails. One of the
following needs to happen: the dependency needs to be applied, this
patch reverted, or drop the use of the defines in the example.

Rob
