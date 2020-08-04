Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0423B328
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 05:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3961669;
	Tue,  4 Aug 2020 05:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3961669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596510132;
	bh=D5lAMx7J1cBhP7BsuDoBhHY4PANx5bkrpU9XjqqhpR4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZfZ7xea7gJUt9YPqtlzHUJiF6WqyexMEAbCzJ/LdCJHY0IWtiq4XxBMLJfnajklL
	 WrClCqyAZAi5d48wWkKuzTVHYQ00pqlzZ4YQz3EBJ2XIGXyO0lZYTsDHZPvs0yhhdd
	 epG1xoTyXNuVwFIw8JR3hl6RChF3KBFuKRE3RlQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB4F8F800B7;
	Tue,  4 Aug 2020 05:00:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78DF3F80150; Tue,  4 Aug 2020 05:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935FFF800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 05:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935FFF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E6lz/F0l"
Received: by mail-pj1-x1043.google.com with SMTP id kr4so1212580pjb.2
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I/S5vrlNulwp45H+XxtQvmflrkKxTEGHdqIBJtU71UM=;
 b=E6lz/F0loOMWpzwzL9EL5uI8uRE19tRQP8x66a03pEQA0uuyi7toqSi6AoaweZG9K5
 kdGBp5YQODii2KyuK6QSITM5ArS23MuRPv9wtCeM+iFwogJdPooAtuBAD3kl7rBkul3Z
 R574Ut7X2gu4Fp4ggfuY4Tp19hbBgM/cyON+33LrsuHrhR+DMqGp+4VaFCINEnqz63ZH
 SU+QivAajBxArpmeh+oDTzNtjVD6xiliQbWJhcg1lb1tGoBPXM4m1lMUKH4lk3a7Um20
 bqFef/sVT2SphtvqJRmrZQ/S1K9XhN5acH4havK7QeGCXf7JFUlZS1upKs7BOrgz7HLI
 yqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I/S5vrlNulwp45H+XxtQvmflrkKxTEGHdqIBJtU71UM=;
 b=JwxRopcauvWR8uXEdUMDJoivnRb/TZolIVeff67juPZVcCIlKbAylWEsmMS1f7+pSc
 xWVPHFLhl/v+GokKlzQTObS0nolcaNTUuM5p7nl3ml9gx28gbRHus/U/Pf4kgCzMouKk
 lMbjTV8OIaNh61GeORfBRf6aM5NPqUVCZTf5OK6xgxoJWxxbvu4LdxRe4yqY+9lf+T/H
 /rmxcEnRKtAv1hVy9YxhYgqwiA2XN47pcoFP5lKnFEM2xoXlgTTKOMk2d+Fm6IIlXhvZ
 heiwAQ9lnP7WlxwvIpg8Vlg2PuslwA8IXoqU8xq6VhnMg8nckzYXbvBVpd4WrsTxVGUe
 IXNg==
X-Gm-Message-State: AOAM530XIXnxcrAzTiBLjtZaS7DwVBF3lWJF2xaUnRAzQqRBocL5OTLH
 NqjDlewDRpDNlMeGk8JQxq8=
X-Google-Smtp-Source: ABdhPJx1+9OQ1P10b47ZvUn/LDad5t2VFaOqWhE2dXRFv7b+mWMz8VgTzGFprojAaDIAxuyGHT5M3Q==
X-Received: by 2002:a17:90b:3652:: with SMTP id
 nh18mr2298790pjb.30.1596510017980; 
 Mon, 03 Aug 2020 20:00:17 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id j142sm21055148pfd.100.2020.08.03.20.00.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 20:00:17 -0700 (PDT)
Date: Mon, 3 Aug 2020 20:00:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804030004.GA27028@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > >
> > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > is enabled.
> > > > > >
> > > > > > You are correct if there's only RX running without TX joining.
> > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > >
> > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > # the receiver is the last enabled and the first disabled.
> > > > > >
> > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > limitation, please quote in the commit logs.
> > > > >
> > > > > There is no change in RM and same recommandation.
> > > > >
> > > > > My change does not violate the RM. The direction which generates
> > > > > the clock is still last enabled.
> > > >
> > > > Using Tx syncing with Rx clock for example,
> > > > T1: arecord (non-stop) => set RE
> > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > >
> > > > Anything that I am missing?
> > >
> > > This is a good example.
> > > We have used this change locally for a long time, so I think it is
> > > safe to do this change, a little different with the recommandation.
> >
> > Any reason for we have to go against the recommendation?
> 
> Previous code will enable TE and RE  together even for asynchronous
> mode.
> And for recommendation, previous code just consider the RX sync with
> TX, but still violates the recommendation for TX sync with RX case.
> So at least this new change is some kind of improvement.

Okay. Let's change it then. Please make sure to update/remove
those old comments in the trigger(). And it's probably better
to mention that what we do now is a bit different from RM:
	/*
	 * Enable the opposite direction for synchronous mode
	 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
	 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
	 *
	 * RM recommends to enable RE after TE for case 1 and to enable
	 * TE after RE for case 2, but we here may not always guarantee
	 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
	 * TE after RE, which is against what RM recommends but should
	 * be safe to do, judging by years of testing results.
	 */

Btw, do we need similar change for TRIGGER_STOP?
