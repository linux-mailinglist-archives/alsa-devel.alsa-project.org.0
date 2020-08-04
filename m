Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF823B264
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 03:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB58166A;
	Tue,  4 Aug 2020 03:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB58166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596505310;
	bh=5P/sROm2YKkZS6wyOH2EBFtvIVjHDXwtP0BKvCG0IZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dql1hW0xaYDJan/JYJl2sytpaNlGN1PxsZ4sWoamUWCxHb6slWiHjE4PbtH7vnTJ/
	 7R2uUcN+c5sxG2T98hn7ecUjyxMOWiNqqOU8SbcOnAupm9qZgc57oMJNHuS7+gTFKy
	 nlVQiuDTiw1J7Ms58u65BG1ws5/2pRwgI/CjPVDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E948F80148;
	Tue,  4 Aug 2020 03:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534D0F80150; Tue,  4 Aug 2020 03:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675CDF80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 03:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675CDF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jAxSNt/v"
Received: by mail-qt1-x843.google.com with SMTP id k18so29784066qtm.10
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIlUlELrgUmFnEMwt6u0RG5w8m9jnPh4zMYQKE4rWn4=;
 b=jAxSNt/vI3knrlvcM/xUyi0d88/12xRP+gOojXUE75gaB2oAtcw88Oc/pkfCQn+Gvg
 HuoJQkx3jwVg+ztcFSoeLLvQR2yynSZZFx0Hj0sj24HmdWUDPpMkqs5ahWh81e6BNPA7
 TpeOGLr7gyNkBcEV9utZTleTYwCk2Eg0WaJtmWMs+K79yKJa61ArrlDO0P2CWnsxc0IS
 H98IKvtV9g+Qk78P5KbIzKFQxhVsGlQdqn9cCJRiFStWfy5H212HvH8brR0nbmmr7oaW
 pYcjLRvxPNwxYj+NnPLCwxT8B8j2hZapYbeKWwC6RC9CsR7yGF9EHi0ejb1o7jN3Y2fi
 RK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIlUlELrgUmFnEMwt6u0RG5w8m9jnPh4zMYQKE4rWn4=;
 b=mvYaYEA6zmK+Z8LvMc6GCgSK9sAUQ6b682aoo+HFFjM4eVdDzqtRK0cnD9m0tbb8n/
 kLOwpGQvq5QRTxWmzAUySQAGmicR6adtZ5D8hICQsqyApjhrX1t9Gl0rw/KpE27NvJOI
 h6RcAwQWUBD7BAO/3b4PDiWi6kD0P5MsaOCct9XjOY+6LZzCsM4K9USxeo9bi+f1MZXa
 avzLIjAZi3BH66Qt6QYUjQCNLPwMxz2b2KlPg9MdaJu4LknFMGcAUrqNRJ5QklO2uS0y
 Sym9A2kFA8dlaocSzH/KLjNjpe1NsxwJX9SrujWtRVLLU6ROWrWGkg3xhjk9oEE3mcE1
 8zaQ==
X-Gm-Message-State: AOAM533ApukSL74VdaqEnkiW3GcdRsTzIBO92US5ilBt+a/cPwhno1cB
 70Z6iyjXMhg1cwMLax2nAtmBFlfVWUXZlgx0p6A=
X-Google-Smtp-Source: ABdhPJyCVJyr/DR+n59uS5oG98ADiiNam8gKyl/6hZZsy3LPTTng/7IrTqLdgbjMsk7CytbooD98U9ki2vUAhABvp8o=
X-Received: by 2002:ac8:564f:: with SMTP id 15mr19448921qtt.54.1596505195017; 
 Mon, 03 Aug 2020 18:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
In-Reply-To: <20200803215735.GA5461@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 09:39:44 +0800
Message-ID: <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
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

On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
>
> > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > is enabled.
> > >
> > > You are correct if there's only RX running without TX joining.
> > > However, that's something we can't guarantee. Then we'd enable
> > > TE after RE is enabled, which is against what RM recommends:
> > >
> > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > # If the receiver bit clock and frame sync are to be used by
> > > # both the transmitter and receiver, it is recommended that
> > > # the receiver is the last enabled and the first disabled.
> > >
> > > I remember I did this "ugly" design by strictly following what
> > > RM says. If hardware team has updated the RM or removed this
> > > limitation, please quote in the commit logs.
> >
> > There is no change in RM and same recommandation.
> >
> > My change does not violate the RM. The direction which generates
> > the clock is still last enabled.
>
> Using Tx syncing with Rx clock for example,
> T1: arecord (non-stop) => set RE
> T2: aplay => set TE then RE (but RE is already set at T1)
>
> Anything that I am missing?

This is a good example.
We have used this change locally for a long time, so I think it is
safe to do this change, a little different with the recommandation.

>
> > > > +             if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> > > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > > > +             } else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> > > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > >
> > > Two identical regmap_update_bits calls -- both on !tx (RX?)
> > The content for regmap_update_bits is the same, but the precondition
> > is different.
> > The first one is for tx=false and enable TCSR.TE. (TX generate clock)
> > The second one is for tx=true and enable RSCR.RE (RX generate clock)
>
> Why not merge them?
>
> +               if ((!sai->synchronous[TX] && sai->synchronous[RX] && !tx) ||
> +                  ((!sai->synchronous[RX] && sai->synchronous[TX] && tx) {

oh, yes, good point!

best regards
wang shengjiu
