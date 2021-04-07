Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F15356CB6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 14:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017A8167B;
	Wed,  7 Apr 2021 14:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017A8167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617800039;
	bh=c6MOoIBYaq1FB2jWSG59PiLmzCCOZs346eUtfJNgae4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qofVTk9eT2W7hKS0aALlV/GelD/6vLzZawZWrCWJFPQT7fMQxecMDMO/64lcOL92b
	 +EhrrAQrYgDFvihF8uxWtrZl4hh65ljFrpdaaW1rw/lQGaJxsNRvoUo12DT95GGrQf
	 onOJwPtJlYNgx+GZCnt9LnTxxTm9bqznrRSyRJ0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968FDF800BD;
	Wed,  7 Apr 2021 14:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAFF0F80245; Wed,  7 Apr 2021 14:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2A0AF8016A
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 14:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A0AF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jO5TJkcV"
Received: by mail-lj1-x229.google.com with SMTP id 184so20520060ljf.9
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6MOoIBYaq1FB2jWSG59PiLmzCCOZs346eUtfJNgae4=;
 b=jO5TJkcVxVu3tzmZF75IY8ZZut5WsUpOx6Ar889EYfG66YONWiO1Tiv99+vCw2lDTJ
 rwx67c4UfEo8v/dX6vqo8D5nfdO0cfqCEnTeqLSaAtay+pBpaMAmLCEjo2RsrH2Tons2
 xKoIACfEiINUHYkrBO3Jhkgt06QXn8IDAT3681aGfb8XAcfttlHjeGObqu6dYPLLUvzL
 GZoA7dehKZjM6vncDr7/h7MnRq2evMxhDEVO5lBbST1zJ0rr24SAOGn7CjODoY4qQIVN
 iQn9dULPR8fJ2/T4DGW7gzMRz4haqcWbPJQSY1WxEGiFp2Jc8opyeXOa9A09V76AMCMD
 BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6MOoIBYaq1FB2jWSG59PiLmzCCOZs346eUtfJNgae4=;
 b=MDgxZvIHJq2s7lbQgBkwzWr0PyQp3rejgG8syPX/QldxiKWk3RQ/8kraBn4tz3P5Zu
 ws0jRHlrZJzdisIpekP4iMsRXF/HiqN93gYGfDSsqD7iWRcIPC+LRNEWg6kquWTTiuT0
 UMBf6RED7uP+CejgtXsd+6gxuHtj3ljkWccyvnKORK+JVI/f6dLOYSqeAvW8puc8uUKG
 o13RIYsEBguj7bkx2CUAmFGu1XDDqM1RWQab/oH+w+mRaMnPGRfhk5qkltgXERssTE5Y
 LDqMIpQo53ncyFtlzNTMcHpY5Skb7gsCn2zGs35RBvSmyE6mIJ3m+gVxvH5o9+TLyEpC
 +kjg==
X-Gm-Message-State: AOAM530kTMTwRhbfb35Hxi2Z32O4vVcWx5Jpn0l0P4mFTgmWzM1flmq2
 laOyIFyaDEwBnrSQ5KgHvAvWIeW/PYA42kRPHGASQw==
X-Google-Smtp-Source: ABdhPJxV7n/Kf8dNdBmeRaU9S6qNbt86uhvn/5D6xRYMV9bk3xv7vbh2O6AjGS8LhNmz8YBjqoKqs4CoaUamjLKjtqk=
X-Received: by 2002:a05:651c:103a:: with SMTP id
 w26mr2032872ljm.273.1617799950344; 
 Wed, 07 Apr 2021 05:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
In-Reply-To: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Apr 2021 14:52:19 +0200
Message-ID: <CACRpkdaw3Eh=gYPAw+zZM3OCteXDyXzgqOkKsT9q_h0cQZ6GAg@mail.gmail.com>
Subject: Re: [PATCH 32/32] pinctrl: update pin-control.rst references
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jonathan Corbet <corbet@lwn.net>, Drew Fustini <drew@beagleboard.org>,
 patches@opensource.cirrus.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>
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

On Thu, Apr 1, 2021 at 2:17 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
>
> Update the cross-references accordingly.
>
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume you will apply this Mauro?

Yours,
Linus Walleij
