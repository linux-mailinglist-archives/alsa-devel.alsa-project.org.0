Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785D1E7BAC
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 13:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A48217B7;
	Fri, 29 May 2020 13:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A48217B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590751483;
	bh=1mbx58tlJnggezK7AN7h7nNNC503N8gBabheX0aExao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvCKggCt/Sb6B8+UvFOG5VmQFbEllKTDlGPRclT3CK2OCjCKGAJ48ovQ3bgiMstS7
	 BbSv9eQShngvFVzPnZbMXGb54B4pRXyzzo84GeTkgRE64SQ8rhDz5QiauClBTjLtrX
	 /jZOwq4WRjJ12QyPfetKdwABrJNHHcrQOTq7gVFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD82F8016F;
	Fri, 29 May 2020 13:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AC61F8014E; Fri, 29 May 2020 13:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5AABF80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 13:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5AABF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GOwvPiiR"
Received: by mail-il1-x143.google.com with SMTP id a14so2092173ilk.2
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUz26vjSD65L7rN0EMN41DDMniwEhIkYrxKCsVJaPWQ=;
 b=GOwvPiiRbY2HA5dCwu8VwnakJLKuRTiwHSxEhSn4bfkxf6clQ/mmYJCGELf36Bynqx
 UFiqy+qXToyoSj7qbN3JgB7IwP32L7BKpjepWT21dV39n+HUyViFpownpjOP5Dk8b3Jq
 AoxC0bUc4Jm7z788Xp+J3aj7bghXACx0pZbroaqTx1inet6fdyIAdFPTHl53DkrRGXTp
 BtUSoRjI4Zj/4fAFit7YsPUG8l82exuxEtRdr8oir3Y1tnhSPFPLTl5RZBvMo4UFJ11I
 Hu/yAnsBSrSJCuytnLFUS38yj7A0kY9qrbPOBo3JSyZg48QVZaL2hqqjUMO5OOzvIS5J
 T30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUz26vjSD65L7rN0EMN41DDMniwEhIkYrxKCsVJaPWQ=;
 b=LbWi7zKwispW0Knm1caeAWudyAM1nJE+jI/5wuqp8rVA6lhqwzfzUO0kzVd89OI5cp
 s1qMOka3EwNLopiGDYgGT1l/WC7SIkzOFLAzBsoMJ6sb+QHrtUTguxWsfhmR1CrUk9Ra
 wnKPTr9jBdNyNhOblZ/NHOtxyn5cLvmpVz/mgYyIi5ufvYNE08V5pmZW7Sp5jb17Seqo
 MeCvgflKBkIL32CM3SD48afYMdGMCHdsNhO9VAureFWvnIxJmAgSqJtzsOTItJmWnI87
 Gf/3JoJHhulYXrJM4lUNesBlP4siYmXfHjWAAZ5isAARrcTObXVI8/kF6Ugc2EdruCZ0
 2f5w==
X-Gm-Message-State: AOAM532HIj6ayjWfHpQOW8ig4tNg++4K0NrtAPfZh+xS/mhv3aChsSBX
 YiPToaTx1jjHXa/KL66YIiNZY4EYwuotFmZJdMog/w==
X-Google-Smtp-Source: ABdhPJwec/2VZU+1E/3GRAXji8VYXzHfBrNsBh8GmHVuKkblNQOV25jI2GiT7eGXCnLm1V2eWPp2ycxf0M5Oq/IRueA=
X-Received: by 2002:a92:b11:: with SMTP id b17mr6846581ilf.257.1590751374596; 
 Fri, 29 May 2020 04:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
In-Reply-To: <20200529110915.GH4610@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 29 May 2020 19:22:43 +0800
Message-ID: <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Fri, May 29, 2020 at 7:09 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 29, 2020 at 07:04:53PM +0800, Jiaxin Yu wrote:
> > Supports DMIC one-wire mode. Adds a mixer control to enable and disable.
>
> What is DMIC one wire mode?  This doesn't sound like something I'd
> expect to vary at runtime.

It means: 1 PDM data wire carries 2 channel data (rising edge for left
and falling edge for right).

The setting shouldn't and won't change at runtime.  Would you suggest
putting it into DTS binding?
