Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C311541A5EC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 05:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF7016AA;
	Tue, 28 Sep 2021 05:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF7016AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632798772;
	bh=XuGbdg+gsHbV7O5CNejxioP978DSZm31BG3mqStkBKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfIu93Rn9P8LC/BEjIiRAbdVP0fz9CJJxrP1vUGXe6Ab3ViWcLHdjdndX5Zj8U7cS
	 z3jlVZxjhCsJz5KZ7myRpBkd/1Yxp7CizASHEZO8plIpAwfg/kxITH3tX5UcNPhMEI
	 Moa3I5TEoKdvDlurP5BLRfq8/son5ySJETeEndUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0D0F804BC;
	Tue, 28 Sep 2021 05:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3C0FF804AD; Tue, 28 Sep 2021 05:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6975DF80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 05:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6975DF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="glOYWIb+"
Received: by mail-io1-xd2b.google.com with SMTP id b78so20190327iof.2
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XuGbdg+gsHbV7O5CNejxioP978DSZm31BG3mqStkBKU=;
 b=glOYWIb+kPr6poS9nJDxJ7OEs9a4B1m9r04FTq3frBJawoX6sMYOh7YdAuu4iAho7g
 1i0q+oux8Jrim5JKr2do1o97ehP8ojORYNlGzcyYthV7MfigkiDkpBqAZOZf0LAUUq8A
 DOkGdMBN/NSh8iPG8aJEDAxn4ile5uC0nyIM2faWYt3msvOyMl3FmhboSn0JQb6dnpay
 saDeij1VcMV9h7GAdti16G/gVSdSdQdJ8DvihatsO++TuksP+W5E06Qe43uBR5XPaJL6
 mIvo5R6M1/URbD8eTGIhVIHBwp1IEdlIY8/qZVk4X7WnJhvCNYxsItR8dLjqGR476suf
 9tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XuGbdg+gsHbV7O5CNejxioP978DSZm31BG3mqStkBKU=;
 b=uAlM7N7ekcPDoEStl4lMskI/OLuhdSA3Gs5zHhPVdJ+jQsBhYJJ8rGoOMlBCCmqmU6
 e9y6dFlE4hQdk3sqfWlxeJnCkvK5+pSkSfGBVEIrHoPv4FToNcDxG/EEArT+5mTUR4Cq
 IqHUg5KXtVuJlIvsptKCsGXJVsSjA7XywPmiwI2/A4xM/V8cLrNzRdK2R/V0ZO4b/YXV
 wIIdb9/m+2mLFZ1Xi1seW9g/vkc1b55lMDJ890O39bDEVunaVkRYHNRXgvO5u/J9+z6c
 rxst7RN+N8y1sFmfxTxFuPaCkWNKxOa4uYE4MFA2hCEcaLhtzltAMDPwtZdUIyojWGqx
 4W6w==
X-Gm-Message-State: AOAM533xnS/8wzdy+YyZWNkNY6SqVaMYKHiRCVSb1LXe1MeLnb31/e4y
 oPLP7tKrguPmDgrwNDxIPXskMVXfVLKz4Cg7Rcaoog==
X-Google-Smtp-Source: ABdhPJztbIdBK74nPlWGOLzoJIo0XlHNyUzjluIXtP+os7Nwv4kU+yxTO9uusIiA6j0jpGe4WJXNmRIoz8RFa4X6Y3M=
X-Received: by 2002:a5e:c74c:: with SMTP id g12mr2283939iop.41.1632798683207; 
 Mon, 27 Sep 2021 20:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210928030343.2200141-1-tzungbi@google.com>
In-Reply-To: <20210928030343.2200141-1-tzungbi@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 28 Sep 2021 11:11:12 +0800
Message-ID: <CA+Px+wUgG5im=Ds=rb64EFUYPWy0hfSWUiELk_1j_wFyCVk=-w@mail.gmail.com>
Subject: Re: [RESEND PATCH v4] ASoC: dt-bindings: mediatek: mt8192: re-add
 audio afe document
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>
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

On Tue, Sep 28, 2021 at 11:03 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> The document was merged as commit 1afc60e00de3 ("dt-bindings:
> mediatek: mt8192: add audio afe document").
>
> However, [1] revealed that the commit 1afc60e00de3 breaks
> dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
> exist.
>
> As a temporary fix, commit 7d94ca3c8acd ("ASoC: mt8192: revert
> add audio afe document") reverted commit 1afc60e00de3.
>
> dt-bindings/clock/mt8192-clk.h is in mainline per commit
> f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks").
> Re-adds the document back.
>
> [1]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Oops, forgot to include the changelogs to the patch.

Here are the changelogs:

Changes from v3
(https://mailman.alsa-project.org/pipermail/alsa-devel/2021-September/189705.html):
- Fix the indent errors.

Changes from v2
(https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189058.html):
- Simplify the commit message.

Changes from v1
(https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189048.html):
- Add more context to the commit message.
