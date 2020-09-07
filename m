Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BD25FB86
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 15:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B661787;
	Mon,  7 Sep 2020 15:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B661787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599485959;
	bh=w7zLgJJci31u8czghGSsl5fLZ4qoiwsq8QnKcq80zDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y10S7uxcOSemGOl04biBDbMhrw0DwsvvHo1orgZ28hU/q0IlYyzZ0+1Uh/nwenLZH
	 1nGQB21uprxgg7i9jSERYNlnh7pW/XamGA/KOZ1AviTH4l0Z1SbuTI1jlmEi4Zh4KB
	 7AG0QK+cH2i9h0iEV0/yb1+pmSmD5A87Ap5QcUek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E887F800D3;
	Mon,  7 Sep 2020 15:37:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3651BF80227; Mon,  7 Sep 2020 15:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36CB2F800D3
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 15:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CB2F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="hEXKQqhJ"
Received: by mail-il1-x144.google.com with SMTP id a8so6804301ilk.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Sep 2020 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZpEmEr02MkgLosT7vPqFBX5vy+59cEEz8jZk2wlsPE=;
 b=hEXKQqhJ9NmSx4YCpKMr1NwW45bcnwzOkhMBL8DjeyYLJm78qmx6PfgWclUzVWmb2h
 fxaV6Sz2P9KxPrZSNITJVINtrvSAgSVSURAAgX1ASuRkdCqb7E91FrXanXeSPkc3ujAX
 +FFNNl0haD5QGCZw+GF/SsD6+N2HO6LCjCJF+VFuY1mxeUJW36pdkCIztgxwx60mVlQc
 yje66pdfUrcr4zkkHKkQoPkqLGdiP14j1niS7UWlfzNhCz3KJsftBXf8hOEiYD7uSXY9
 mrAxej+Mmxa5Rq3IupJGnTLeDACHso2O2gLPL+GCXy5RjeQSrH+CAHW5xCBbD046Gi6G
 Fe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZpEmEr02MkgLosT7vPqFBX5vy+59cEEz8jZk2wlsPE=;
 b=d82Fs4L/83mgoxiqgbALSwS4ydRt9nTxL3kHuLqv1o41AVvtBGcTHMeEK9A2Nh9Ou6
 YpQfsq6JM7Omc5Huw5fIwHx8EQ+6OOIODQ7aYK+/I1VdfoyT2GnHM+iLG8Rb/nmcx6vi
 fvsztUALUNcrVn3H9Nx9Ka3aZGfsEQD74+sCxybRAo7wORPmPwvFnKyqpryr+paN6c1b
 57L7BheiF1JQGiIY+7p9IUk2vxxHOkhNf9Ep502EmzEGODTGNAtBZuxPr2zDqLjfhM4L
 0eO1BIywv+19M2l4hbr6+tRmDGnrP2S6U3NRwsU3JlcIdZNgYeW+CWUSfDeKjzfdVM0t
 iLyA==
X-Gm-Message-State: AOAM532zTIyP3uP2XBpRKkMaymi5rEny8C1ewZYQ5J0wNYsk/xGWFrDR
 HK3Tjci4I0XrEG4B4fvHbJxUYNHiB2hNUdwqmgt9Fw==
X-Google-Smtp-Source: ABdhPJyBenIIH2d8wv7qBpX9DpeJamhA8s78sQ62WqhL82+W2hjTg5gPuJzXToQlghF4RNr5s/7pUi3tIrgzsCAuZGI=
X-Received: by 2002:a05:6e02:c26:: with SMTP id
 q6mr19152124ilg.235.1599485843333; 
 Mon, 07 Sep 2020 06:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
 <20200819194005.GC38371@sirena.org.uk>
In-Reply-To: <20200819194005.GC38371@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 7 Sep 2020 21:37:12 +0800
Message-ID: <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
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

On Thu, Aug 20, 2020 at 3:40 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 19, 2020 at 11:42:27PM +0800, Tzung-Bi Shih wrote:
>
> > But I found struct mfd_cell also contains member .of_compatible.  What
> > is the difference if we use compatible string (as is) for this device
> > instead of falling back to use device name to match?
>
> That's for binding the MFD subdevice to an OF node, you don't need to do
> that for a device like this - you can just use the of_node of the parent
> to get at the properties.

There is an issue we overlooked.  In sound/soc/codecs/mt6359.c,
mt6359_parse_dt() cannot read the DT properties
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/mt6359.c?h=for-next#n2640).

The original DTS is as following:
pmic {
  compatible = "mediatek,mt6359";

  mt6359codec: mt6359codec {
    compatible = "mediatek,mt6359-sound";  (1)
    mediatek,dmic-mode = <1>;
    mediatek,mic-type-0 = <2>;
  }
}
After removing the line at (1), mt6359_parse_dt() cannot read the DT properties.

The PMIC drivers/mfd/mt6397-core.c:
- "mediatek,mt6359"
- has the struct mfd_cell of mt6359-sound
- adds all mfd_cells via devm_mfd_add_devices().

The audio codec sound/soc/codecs/mt6359.c:
- "mediatek,mt6359-sound"


Here are a few options we can come out with.
1. adds back the compatible string in the DTS
2. gets of_node of parent in mt6359.c, and iterates all children nodes
to get the desired properties
3. parses all children nodes in the PMIC driver, and put them into
either platform_data or device properties
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/include/linux/mfd/core.h?h=for-next#n77)
- The PMIC is common for several sub-devices.  It makes less sense to
handle subdevice specific logic in the common code.
4. others

Could you share with us what would you suggest for fixing the issue?
