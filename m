Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45D5AE5E9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 12:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7BD822;
	Tue,  6 Sep 2022 12:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7BD822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662461497;
	bh=fq2KyoIGKa4e72Vbhhhy1irUpE7aXAsqdinH0gnIzwA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vvIhTBgh6zcRV/gi4d3b94ll5mr5jOEa7LSmbUQpv3v/LCMzMgHYBKd5d5R+xzE2T
	 76bK62QPE1CFOIslgUxY8cX0wlBTmNrA87p6O/3lhU9yqDdan1GYqEHwY5tR5eTlp4
	 oxCS4VSjyjALUg3XmoEj8ptMJN6VSOP89qBjCxNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB3FF800E9;
	Tue,  6 Sep 2022 12:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D64DF80249; Tue,  6 Sep 2022 12:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83B74F800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 12:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B74F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KLzYWgzL"
Received: by mail-lj1-x236.google.com with SMTP id z20so11846838ljq.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/OsXzUKuq1cC2zAcl0nrr1kHva2xFCkM0jP3L63CyEc=;
 b=KLzYWgzLxJ0kzxoY9Y+KTb/4Cmky+PM+vyhq17QxHJuDERk4PkA3tUm1nBYMllUwwg
 36pjGufYrzS3bK+heDXUxmf71peRbNVtnWuKLzXIUU2zvZWFuQGnvmJYira9OQ4YM5tB
 lbqWu+UACrbDgtJ+4MFnzl1shIVltZfL6H2JIS8LLWFPVhzbgTCTruFylqmtylse0TB4
 EDnmIHhDK+j/IpFFZzaLVr8jVA8XGZqqKO21ba8SMmPeox5o2F+QzOawvNJafa/EXwfn
 F1tA67pN8tJebmRtOUZoAQRdh1bFelAHuVzfjCxUnpa8xN4vAOTaQg6+CNg3zvZp+QOy
 zNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/OsXzUKuq1cC2zAcl0nrr1kHva2xFCkM0jP3L63CyEc=;
 b=tKACtACARxUJojziQzZZM9C3CzohvkbVL3i8X4ZUCS04K/NHxH+dxD+AtxLRo2jAW2
 y/dd61CRbuBoYhmVMQ+4zYmQm8ozsBASTJhIs4QPwTGigej/98gWhD10BTenl8ehiBjA
 jzCLi9os3AU/aDJo5vwLb5kRY2TxGZ4/ZDipUgujlIYkKBtO/NWCL2EU3NquXOA4GvB1
 BuhAiqk4FJwOICFk5+XCZdU04uZ+mu0QE/jmDvE22PazYsRvb/VHvciZ2LXr7f1zlBVU
 h4Oi7T9u6bPO/0boQyBG2pZgZe2GBxgwghq4Tgowuo2E202Ng/rrA/SLPuVIkI1CDnts
 RTaA==
X-Gm-Message-State: ACgBeo0ohFS/fphECARVztCWx5adUb4BVLU3pnxbSgxAFNXGWPrYNiFa
 +zgG0l42nYwg6SI2t3kEDiCsJyfVkiLuL/Ws1GE=
X-Google-Smtp-Source: AA6agR73x2co/hxB1kNHeG+9A0jIaZGzPM1ptVAglIj0+20rFor1kXVIRg5AeAe+d88614KXCREEWTzqzFNYm3ULofo=
X-Received: by 2002:a2e:b747:0:b0:268:f837:27b9 with SMTP id
 k7-20020a2eb747000000b00268f83727b9mr5166064ljo.129.1662461431379; Tue, 06
 Sep 2022 03:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
 <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
In-Reply-To: <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 18:50:19 +0800
Message-ID: <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Sep 6, 2022 at 5:50 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Sep 5, 2022 at 6:54 PM Shengjiu Wang <shengjiu.wang@gmail.com>
> wrote:
>
> >> > +       /* Wait for status of initialization for every enabled pairs
> */
> >> > +       do {
> >> > +               udelay(5);
> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7))
> && --retry);
> >> > +
> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
> >> > +       if (!retry)
> >> > +               dev_warn(dev, "initialization isn't finished\n");
> >>
> >> Any reason why not just dev_err?
> >
> > Just hesitate to use dev_err. if use dev_err, then should return an
> error.
> > May one of the pairs is finished, it still can continue.
>
> Makes sense. In that case, why "FIXME" :)
>

Just want to have a record/note here, need to care about this warning.

Best regards
Wang shengjiu
