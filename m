Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBE23B33E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 05:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D671669;
	Tue,  4 Aug 2020 05:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D671669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596511517;
	bh=vF+m1Rymu+Y6G0SRXtgCZcpEIH5NA0KAfQOMACPq3RQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adChiEir3q6H3Benj8ceeWXclqDtoX3JxNgvrXoOh52JdtRhIkrtL8LsE0hfd5kQY
	 pCYSjFx5K3zid2s9M3Z1tHZUQ3s16eiIH7fwZtFWFdqCy6XTF+XLgjc8I/s8PWn6iY
	 /OJrzGLMc6Tb4i9KoQe43YOLtvnQzfHfVW6RS6iM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C450F800B7;
	Tue,  4 Aug 2020 05:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2155AF80150; Tue,  4 Aug 2020 05:23:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B8A7F80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 05:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B8A7F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sBAiU3Zc"
Received: by mail-qt1-x844.google.com with SMTP id c12so20916922qtn.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJVhQMYihY+NvN1RkvZ0SjRkXEzhAUPHpJk8gf7XSoA=;
 b=sBAiU3ZcXSjalUW9WrVeJ2OfbjDdEBGSBgTOtZUWwMJCUVV26vPbx2WTiLEtTnrOUT
 shPiIFjVpACXcoivs0KjZmrWiOLNzwML1Ua7WyV2bXsLGbXyFGwl3qz4RuP12Wdb9DOE
 dKiGggDR9kXJm7iUS+MP1QMO9VJDHGsJS41dEwTvyJISNEH4xxIWI9H+HdgyKWV4vIBE
 fHvzhBIS4YyFjhsqig4PoC5pjKEQH55GpIp4IsM95gp4jes59+bnfD9CrHpZyvEMFY54
 sY588EVvT9VAkEUKYZfaVCZhcLNToWXlS1U0fxuFHjQXNiy3eVcIOeTQaARbbo2q6oFJ
 ITxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJVhQMYihY+NvN1RkvZ0SjRkXEzhAUPHpJk8gf7XSoA=;
 b=ZphiQ2WI7MDCT/XSk0GoPB3EHFDfiHPQ0pJwiYdFHguSpBTqhCO0t/aRSPTCB+wTRh
 yt7UK72C9ac9TJy3rcCUjcAC2UlDysHLZ58zw8TOc5Xq/inr4ssMrpfCHCq3i182/eyN
 N2RMX7N72zX4ZmHab4XCl+clE0RCLYEDrv7JnZZpizT2Ys/CS67CEXvuFhu+gG33XCs2
 iJ79pdstyjBsfjuFe/GSS6vc266YGGuhVMQo+MrwL5hRGh18jOXNyw7pO/9vTJmOxobM
 i4LLC0q8VayMy8joQWt0gVId/Uxq3Q3eS7Dxi9iId6qOWp0EmiGQlcZ+9+Q66X/FLA7k
 fKSQ==
X-Gm-Message-State: AOAM533bz6KtRwlyEmyBDYYUIfcQY8ZAQW3AtaW5fAhKIeo0PSBmWu2v
 6PvuP3wei5Duq/lPM/ARDONCneZvpyplLcWvCkE=
X-Google-Smtp-Source: ABdhPJzlDtQ693Xz7R9IlMrE4fi0XcKTYMO+46NJJ0pRzPdLUk0ADOBBGZM2zpDBY1o9xKlUGQ3OoQgvUqPJju9vHJo=
X-Received: by 2002:aed:2946:: with SMTP id s64mr19963873qtd.204.1596511405886; 
 Mon, 03 Aug 2020 20:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
In-Reply-To: <20200804030004.GA27028@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 11:23:14 +0800
Message-ID: <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Aug 4, 2020 at 11:00 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > >
> > > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > > >
> > > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > > is enabled.
> > > > > > >
> > > > > > > You are correct if there's only RX running without TX joining.
> > > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > > >
> > > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > > # the receiver is the last enabled and the first disabled.
> > > > > > >
> > > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > > limitation, please quote in the commit logs.
> > > > > >
> > > > > > There is no change in RM and same recommandation.
> > > > > >
> > > > > > My change does not violate the RM. The direction which generates
> > > > > > the clock is still last enabled.
> > > > >
> > > > > Using Tx syncing with Rx clock for example,
> > > > > T1: arecord (non-stop) => set RE
> > > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > > >
> > > > > Anything that I am missing?
> > > >
> > > > This is a good example.
> > > > We have used this change locally for a long time, so I think it is
> > > > safe to do this change, a little different with the recommandation.
> > >
> > > Any reason for we have to go against the recommendation?
> >
> > Previous code will enable TE and RE  together even for asynchronous
> > mode.
> > And for recommendation, previous code just consider the RX sync with
> > TX, but still violates the recommendation for TX sync with RX case.
> > So at least this new change is some kind of improvement.
>
> Okay. Let's change it then. Please make sure to update/remove
> those old comments in the trigger(). And it's probably better
> to mention that what we do now is a bit different from RM:
>         /*
>          * Enable the opposite direction for synchronous mode
>          * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
>          * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
>          *
>          * RM recommends to enable RE after TE for case 1 and to enable
>          * TE after RE for case 2, but we here may not always guarantee
>          * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
>          * TE after RE, which is against what RM recommends but should
>          * be safe to do, judging by years of testing results.
>          */

Thank you for the agreement.

>
> Btw, do we need similar change for TRIGGER_STOP?

This is a good question. It is better to do change for STOP,
but I am afraid that there is no much test to guarantee the result.

best regards
wang shengjiu
