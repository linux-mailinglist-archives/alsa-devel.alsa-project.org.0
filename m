Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A05AEAEA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 15:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CED1E0;
	Tue,  6 Sep 2022 15:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CED1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662472598;
	bh=lITYO0Yru2HUooVj42T+NHovpxuJjUSH/YAABTqsRlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZv4fj+E5iLbv/FStKyCo91aYHDO/tNcSVn79P++kF7VEauxxO1dbcfuKljEKs1S0
	 fulzxWMYH84qoyQ29HeCw7s8VAF32Js8G6fuf03nq2Ml69maeaZwVtMzCVfrFUaz2A
	 UbqEaUf9SBVGFxEDR6DGRsq7kUPemG1jgS8w8qQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E492F800E9;
	Tue,  6 Sep 2022 15:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC84F80249; Tue,  6 Sep 2022 15:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E48BDF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 15:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48BDF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="khPzVTI6"
Received: by mail-lf1-x130.google.com with SMTP id q7so17516751lfu.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9/i7m1vSaW1LQaPczLwKSI2TpE8iLJQt7sa+CqIM8FY=;
 b=khPzVTI69w+JT9PVk+B9mYe6u+7wAQh+/khwSEvFBhYwOw05w2i3NC9672i6KYNNDQ
 mFDxvghmc0dFzilBfcwJsYdW8TXbRTbIhr18bAfAgupS1aaID9uHVpymp1cloD76a/2Q
 n5Oyd56npVznVy0U3nB+oka8sPEH4wZ8Xmucv+aac34g58da2zDm1nFiAbtGD/rzD6MZ
 KoWa5Mz4AXVIuzFjGA4GOcXWvYgaozm/92zYbHcbNW7eCJ2qpVGJRC4ffKgOUB4XrGJ3
 MdnFmmTnKq7N/n9P67u19KaFRJt+BqaV0NCZEaB4bWq2nK8WRghWhQcnTkrWF21+LqgR
 Dtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9/i7m1vSaW1LQaPczLwKSI2TpE8iLJQt7sa+CqIM8FY=;
 b=pUlYcLBmwFYnmBcgNZ9E4MLg6TcVvONTGiFsMm+uUo4IPySUtOwjADkPEZXMOj1uY1
 KifnD7GJwhnUd6msZ4TpmSC6D+sfZVchWSXKp9lou6a0NNIUxlOG2JmdMgI3d6yNFDSv
 dRqZA6b+t3aCFl2jShGRthdq8YthqNFRqDB10t9sgaM0batbjUaGTLk3IvRoHLp6zJ2s
 m9FkvlbGPGnzTaGAbn08lKxSimFT2rp9ulEGrMB7gVklfmp5txcDFU/W157ojwr98Tof
 Ijrie88ua15KbLJ6KVCoOrJF2xPo0qFx1MewtfpDn+qUWVis/rKvwy4XcSrYwcFkZGyA
 dQig==
X-Gm-Message-State: ACgBeo38d2HmAcaeeKYibqCmiclRcKnAPM9dDN3/CyZFQ1QRZMDCd4PS
 3k48iIw/zjDqUHT01c7otYODn7DMXcwp0j4IPDg=
X-Google-Smtp-Source: AA6agR7fXY6JLLMiGgiL+UZI+kW9OWzrlIqGs89l0h0PB2WzxGmc1MSJuLS8cf1dRYrCY1GG460oNXb7qw/dZd4LgiU=
X-Received: by 2002:a05:6512:33cb:b0:494:69e3:5421 with SMTP id
 d11-20020a05651233cb00b0049469e35421mr12981941lfg.283.1662472531096; Tue, 06
 Sep 2022 06:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
 <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
 <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
 <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
In-Reply-To: <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 21:55:19 +0800
Message-ID: <CAA+D8ANu11Y5m1jJLEm8==45x5-z7C468JS-u6oMmmsYs1okbg@mail.gmail.com>
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

On Tue, Sep 6, 2022 at 7:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Tue, Sep 6, 2022 at 3:50 AM Shengjiu Wang <shengjiu.wang@gmail.com>
> wrote:
> >> >> > +       /* Wait for status of initialization for every enabled
> pairs */
> >> >> > +       do {
> >> >> > +               udelay(5);
> >> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> >> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> >> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) &
> 0x7)) && --retry);
> >> >> > +
> >> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
> >> >> > +       if (!retry)
> >> >> > +               dev_warn(dev, "initialization isn't finished\n");
> >> >>
> >> >> Any reason why not just dev_err?
> >> >
> >> > Just hesitate to use dev_err. if use dev_err, then should return an
> error.
> >> > May one of the pairs is finished, it still can continue.
> >>
> >> Makes sense. In that case, why "FIXME" :)
>
> > Just want to have a record/note here, need to care about this warning.
>
> "FIXME" feels like something is wrong and literally means that it is
> waiting for a fix/solution. In your case, it's not waiting for a fix
> at all, but just an annotation? So, shouldn't it be just "Note:"?
>

ok, let me update it.

best regards
wang shengjiu
