Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B824A36B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 17:44:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A008C186D;
	Wed, 19 Aug 2020 17:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A008C186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597851871;
	bh=iyLDMze120Dap9xfbK+vtIun0eQHgAdF9GHOiGij++g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLumYoCSTd+lhQDVPEAIx0epxgLuvdzqGRq1YDOKKOqshbl0cWFyxqm5Kxp4GgSWP
	 /eLoE5piuH/RYwPiuSETzV9ojYSMl/FzFCnruFp5y61YTelrIerinTWFlG9TIukDiR
	 7zXhKL/KxyE4kVja5zsb5+McBhU/DwQ8gp4NfFco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC736F80255;
	Wed, 19 Aug 2020 17:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8753CF80218; Wed, 19 Aug 2020 17:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CC02F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 17:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CC02F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vyFC/q8s"
Received: by mail-io1-xd42.google.com with SMTP id u126so25064909iod.12
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ueFYm1qfrvuVokkg4cIykC1xT41ucWkogT7CDyG2LEU=;
 b=vyFC/q8s7Zxi5luvZu57+hMwrLU8LK8+zh8k/3QGJnwNPklGHQVFn2JSh/YLamJcLL
 dVyeG61lKntoHmN6060nH0IO4HWaUJX0LqqBgWtxW8WyLrtmgssiU5sjKlg4yhOX/q1t
 fdGs7fiCQ+sU2oEF/hOCkMLAqsZwGnmJHj4OpaUMI9oUOu7iL/SI8A5yu3wC5+GerAdd
 pl3GHIdx7erT7nBPzRnndZ08iGPoyojlCOo4MiTJ7ZXnz6wULYITEeIaKSor5wagiy/M
 mgDddCeDdC1Kn1z3f/ICNgJ4KaVFxiCrb1r/cqyLXk1krv+su7Z571TImb/kFrQFwsY7
 OjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ueFYm1qfrvuVokkg4cIykC1xT41ucWkogT7CDyG2LEU=;
 b=rtVS8yKq/GjXERdel4JYr26dcfYtZS4szLKRfUzj6uB2QtiT+voqZtOZ1q0ijqyTlc
 YCGjT6MI/jAS3bg5cgtp48GT5AKWcanZuCWXhS0krKC3Vb7iXXWCuQrxaY7GVilNjQNW
 pJmuyJHvJEkuI5ML5uaT7gN+wzbvepTL8CeU2VhLudLJgKqPVUgvWDkSk7nhPMenxEqq
 3Zrmv3A4Zr8oy0+4EX0xji9yMFlo1OvK5WhkHPJQ3/nNTHO6fRGYKbPd+ypDoaSiGDOS
 F+T0eWbv6yBXbDqqI/CYWtsunsp6B0gdilH3wfrZxr6H9xV2wJE9jICH9rqczl81QE/Y
 VGoA==
X-Gm-Message-State: AOAM530f6CT3UVjHaH2dLXIQBfUW3b4SWnrXs+7iKzlcRELUIa7exDM8
 noqJgiWrlq+DjDjnoeO19+8VGKefAVdw+i8Blq2lkA==
X-Google-Smtp-Source: ABdhPJwRnmRf3OMplQbhMziRPhYyjn2uBddwGEzf/xhJv6+J11j8DMc8iwUkJYiK9rDVOAjuTBdAroFLZAE/nvkCCKE=
X-Received: by 2002:a02:a584:: with SMTP id b4mr23503993jam.68.1597851758905; 
 Wed, 19 Aug 2020 08:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
In-Reply-To: <20200819103730.GB5441@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 19 Aug 2020 23:42:27 +0800
Message-ID: <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Aug 19, 2020 at 6:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Aug 17, 2020 at 04:11:03PM +0800, Tzung-Bi Shih wrote:
> > I misunderstood.  It still needs the compatible string to match the
> > corresponding driver.
>
> No, it doesn't.  The MFD should be registering the platform device.

I guess I see.  It lists the mfd_cell when calling
devm_mfd_add_devices() in drivers/mfd/mt6397-core.c.  It falls back to
use driver name and device name to match.  As long as the name
provided in mfd_cell matches the platform driver name, it works.

But I found struct mfd_cell also contains member .of_compatible.  What
is the difference if we use compatible string (as is) for this device
instead of falling back to use device name to match?
