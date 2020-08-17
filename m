Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD9245DE6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 09:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94DB167E;
	Mon, 17 Aug 2020 09:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94DB167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597649522;
	bh=AVkus5sFf1+Sd2hIUx7zuq0/87UVNZSAufB5pPGeaKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0Lx1S5l365enhI5ddwTpMAPJGTYQFcplEp/f4jWK3ux8WfCjrnhRpqC8bgQFmtbm
	 G40Yf6yjz4dE2GrrIdqB/FAJDTeOOxPd6PI/gROR/7/3x+/o8ATNlOEt10BhwDi8RZ
	 TKR4bnQuD0mJANZKIlEEXnyEeZGqI9QvV/1loXI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2CEF80255;
	Mon, 17 Aug 2020 09:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D187AF80218; Mon, 17 Aug 2020 09:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2159BF800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 09:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2159BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vKwc0hm9"
Received: by mail-io1-xd44.google.com with SMTP id z6so16672785iow.6
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njImXme8DvFmBmmBNjNQkbOdGSjHzwAWepRldmmnkFM=;
 b=vKwc0hm9KMhrs8R9lVS1+IPdDcR9wpOy8T7gFNt5q2QV3lOt6h/3fdoj6kEeqgp8aN
 58J0ceAUIVAOo+etWCr23cZzpX2S1j9MNwnY2cgfEKSU1kQgW1rb8mNawPAJL4/yX8ZI
 A5l3InaUTt8Trss2ZBvCyyKe76g9Y+vpkC+ac9yxPdy1RJID9vGjFt1o4WVpv4/HgNRz
 v+y4X8vu2FtjiwjaZ6h6atRbrGngkkDptjZXg2LM6devwJofRgz9k/zfdmL3Zb/cUQ1p
 dJzOX7GPWZLtp6FaHawv72tIIjSDJC/DtTRUeuECn9u3bcdSoOORu29S0KVlBclwYQUy
 tRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njImXme8DvFmBmmBNjNQkbOdGSjHzwAWepRldmmnkFM=;
 b=HsW72iM7WknOGh0RlGNEARsOyBKlQxce7WPvf1eT6ugnegx99yzmrCLpVIWZQ1U9XD
 Xbx0WZLGsRr/PTRNs6BtziL6/QnmYv8hYyyJeWTVkYSeCTAsD0gBuOW0vf8636xNTyGc
 RXAt6qTrgUcrjG6ACx5pzheEOEsH+/l6jQND91yOVNc1+CLI4gYr+W0TpIafslF9KgAE
 j8TMyCvJCZnjtrsS0nzQeyHNl/1EEXH7yTvGrDs2r3h0VaVC9PI834WehNVy+e6H0TCE
 /3MDVGKwvpRB1kDccfR0i4PFTWmSgiyY/JUoGzrthn8+Jqij2eGRkfCAeUS1LIK3Ay5Q
 rzfg==
X-Gm-Message-State: AOAM530dgdDzAiSBD0AEMp3rJ3lOKY/fb0JfkXoaDitfum9cM29jbK5H
 DUFl5OdSdYfdroWwL2fHKOYeQiuneIVRDFsVny8kyg==
X-Google-Smtp-Source: ABdhPJwCa0E+vAfxwNpCUTPIUSspheXu7A+kHNdN+DzANKgmK0a/mh8mC9JzSsxmyLAcqGudRpVCGbTB72ZlRdctp5Y=
X-Received: by 2002:a05:6638:2515:: with SMTP id
 v21mr13267320jat.109.1597649408741; 
 Mon, 17 Aug 2020 00:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 15:29:57 +0800
Message-ID: <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
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

On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> +properties:
> +  compatible:
> +    const: mediatek,mt6359-sound

The compatible string has been removed since v3.

> +required:
> +  - compatible

The same here.

> +examples:
> +  - |
> +    mt6359codec: mt6359codec {
> +      compatible = "mediatek,mt6359-sound";

And the same here.
