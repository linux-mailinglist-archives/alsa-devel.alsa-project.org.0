Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD0527A6B7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097081B08;
	Mon, 28 Sep 2020 07:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097081B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601269417;
	bh=98fPA5hAP6rCEl3IEufuD9Lb3X1TaFuj1wbjNl6NBDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUExxZilJV/F80RtgwbSr32YsR8FUx6kFvczXKrhMvg5BAZkbCRQk5fE0h7YRcEoh
	 Gn2FxHG/vxKZDGgexsmGsI51ccs7Ktjt+681IOSv9jzgt8pEpxc4fTAblmoFiR8fOJ
	 QVuHFEU3g+rpn64gX71WPf0wzjlBbRk7AtBLZRxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83858F80247;
	Mon, 28 Sep 2020 07:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DE1DF80247; Mon, 28 Sep 2020 07:02:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA37AF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA37AF800DF
Received: by mail-lj1-f194.google.com with SMTP id k25so7183296ljg.9
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=98fPA5hAP6rCEl3IEufuD9Lb3X1TaFuj1wbjNl6NBDM=;
 b=NLJRPe7IhjuT1HAlIhODRN29JrCrV52791oUeNenDpKm+j4a41C2fWkpqQ45PFDwgw
 ynOCNm2Tu8YgUALFZnVeazGEQry6ZP1OngWLtbHWcvS7dt/ePzfivLRUIfNjFFgt5IfJ
 aLv57uL+B9RkMCG6Q2KuqLVQ7KYu4Wu4KYdf2TDdJQs1GnrBbq+xitsSy6pOF4CxHpCL
 eA5fJKnytysy67b2oHw9ksCkPcKrlnaRxPtwdKHMXH1Pzc5Eub/BFes8gc5ZvmlCcMbB
 47TBFSb/FPZEiCZDqASLNnR4KBC1s0UKF2EQxsR/BFQOzvBZkOB1SBxORsMymJgxUjpQ
 MTWg==
X-Gm-Message-State: AOAM532N6wu/O4OzyYFNDqs5B2hTeW19e6SJ8l/zBz454GPJtD9bTwiQ
 8bbDVXxG+lQ90GaGBK0wsmVRJoeBbXPVEg==
X-Google-Smtp-Source: ABdhPJyytXLkOGMl7dGKxHhR8xEfHfEiLy1QjpPEwk4jdThzJEtoKELRuSxyGsnsxr8t0y4i7CLSBA==
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr4001059ljc.212.1601269344499; 
 Sun, 27 Sep 2020 22:02:24 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id t2sm2685023lff.157.2020.09.27.22.02.24
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 22:02:24 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id m5so9555621lfp.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:02:24 -0700 (PDT)
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr2894029lff.348.1601269343999; 
 Sun, 27 Sep 2020 22:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-4-peron.clem@gmail.com>
 <CAGb2v67gFTrGVs3pw5ospdSoogaA15cbuWjPQK=-Z2f4nMd9Rw@mail.gmail.com>
In-Reply-To: <CAGb2v67gFTrGVs3pw5ospdSoogaA15cbuWjPQK=-Z2f4nMd9Rw@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 13:02:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65c2NzjxN4FSksvzQKOvZz0e9ccsKT9OuLpmUVr_WNtzQ@mail.gmail.com>
Message-ID: <CAGb2v65c2NzjxN4FSksvzQKOvZz0e9ccsKT9OuLpmUVr_WNtzQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 03/20] ASoC: sun4i-i2s: Change get_sr()
 and get_wss() to be more explicit
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 28, 2020 at 12:37 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > We are actually using a complex formula to just return a bunch of
> > simple values. Also this formula is wrong for sun4i when calling

BTW, it is entirely possible that the compiler optimizes your switch-case
back into the original complex formula you replaced. :)

> > get_wss() the function return 4 instead of 3.
> >
> > Replace this with a simpler switch case.
> >
> > Also drop the i2s params which is unused and return a simple int as
> > returning an error code could be out of range for an s8 and there is
> > no optim to return a s8 here.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Fixes: 619c15f7fac9 ("ASoC: sun4i-i2s: Change SR and WSS computation")
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
