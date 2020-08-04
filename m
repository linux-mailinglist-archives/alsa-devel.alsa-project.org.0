Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4823B2C3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 04:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC4F166A;
	Tue,  4 Aug 2020 04:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC4F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596508633;
	bh=5k0asxm8g357FKQuxt+q2C4BMdkwkrIAVlsxFF7Dvm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZfaLrMnYtAnuPdHgd259Jhy+JSsgnER/WT1TOFu5jnPBqu4fvRwxjLY7BtzyotDJ
	 M5rlj7x4tovfrWDdp/TtVI5F0LNgd3h41lFkvgLqSie8IfVJAOGy/NPHeQ+m3ZP3Qj
	 Zvx+Zxw7TlTSCa+8HGeUG8eI/kvsFnBzdMUUN35k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68DF8F800B7;
	Tue,  4 Aug 2020 04:35:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5D6F80150; Tue,  4 Aug 2020 04:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DC5F80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 04:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DC5F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LONJ8+kD"
Received: by mail-qk1-x741.google.com with SMTP id l23so37208556qkk.0
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 19:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmrOBPbvqH0tUwujk7SVsTyO/ZlaXtcKlCwky7dKn9o=;
 b=LONJ8+kDG0Db9G9T5+29RjtHqahyZ2pcP1Y5qqhDhaLBoNDQPe9wciDe9twj3K35Z7
 mb10Ul7loDbQiIEXxvDd8zgtS4yqZcyovXHGp3m9Ln95AJD0m0UfEJqTKYsB5xQDoli/
 azoAYhW1JbOFIn33KbNEYR9lA9nK6X4lThzpomRRocTm3kar1J5PxiQAoqJHcN+WF80E
 0+09+einulhyH1hBSFH31MHi3ftXyE4A0qbdyMbOmkIpKZiRcuRr6V+72E6LZ+JNMcMq
 0TEPIWd/6zEwOFZA9UTgpXmXCFAT4RskpALMGbIa+BOoGGdiokhzgMgfOxT2/F5gYowk
 ntGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmrOBPbvqH0tUwujk7SVsTyO/ZlaXtcKlCwky7dKn9o=;
 b=MGJwUos66pHWxreS4RHINqzVQKEok0SzNHz0qdICHo7hFwvzRi46pta97yZcYS1yK3
 PQWHa7rkoxhwY1WrKG0Qai1WCzB6JXw6yp5IX212BjLk3zOsCySPkPQOyhfdNvLc4X0i
 /OiG//a5Opt/Iess+ySwsTZHH3lu8xV1MUBxj0LUKNZ7c04ELPFrOAf++C/m7FjJpivk
 l5ur70IddYcZqB6wptIhkkidP9WjS47Ph6Cj2vv0TfOhfQ5i2j6DX+a9Ibr7VTx67SH6
 mUXDpWLj/FwVzHagoMgLS6vPS82HMvq7FssEsPJF9Vv+1z5cJjWw7X/B6rkJo4oQuKAF
 fC6Q==
X-Gm-Message-State: AOAM530zIOuZS3MA9aGQaa0Rinyf4JkFwsDz67r3iBOh2bGcqWJ5mLJS
 T2IpUM5ftJR8kK8fuCTh8Zf+y861ZofwvJm++gE=
X-Google-Smtp-Source: ABdhPJx1F4Rp5o4LA8Gjn0KDh/r5IB4SF374BJSkFakd8/t+goX1ZwnWeeLNi2DN07CDXxi4Cu81LFxCplyDjnUtX4s=
X-Received: by 2002:a05:620a:628:: with SMTP id
 8mr20046814qkv.103.1596508523476; 
 Mon, 03 Aug 2020 19:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
In-Reply-To: <20200804021114.GA15390@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 10:35:12 +0800
Message-ID: <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
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

On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > >
> > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > is enabled.
> > > > >
> > > > > You are correct if there's only RX running without TX joining.
> > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > TE after RE is enabled, which is against what RM recommends:
> > > > >
> > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > # both the transmitter and receiver, it is recommended that
> > > > > # the receiver is the last enabled and the first disabled.
> > > > >
> > > > > I remember I did this "ugly" design by strictly following what
> > > > > RM says. If hardware team has updated the RM or removed this
> > > > > limitation, please quote in the commit logs.
> > > >
> > > > There is no change in RM and same recommandation.
> > > >
> > > > My change does not violate the RM. The direction which generates
> > > > the clock is still last enabled.
> > >
> > > Using Tx syncing with Rx clock for example,
> > > T1: arecord (non-stop) => set RE
> > > T2: aplay => set TE then RE (but RE is already set at T1)
> > >
> > > Anything that I am missing?
> >
> > This is a good example.
> > We have used this change locally for a long time, so I think it is
> > safe to do this change, a little different with the recommandation.
>
> Any reason for we have to go against the recommendation?

Previous code will enable TE and RE  together even for asynchronous
mode.
And for recommendation, previous code just consider the RX sync with
TX, but still violates the recommendation for TX sync with RX case.
So at least this new change is some kind of improvement.

best regards
wang shengjiu
