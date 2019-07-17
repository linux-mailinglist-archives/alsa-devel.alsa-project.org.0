Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A96BECB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 17:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69A51693;
	Wed, 17 Jul 2019 17:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69A51693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563376083;
	bh=IZiyn9ZcCQVW+5ALeqdrMR0Q8lokFlc+x3wuOVd+Ohs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeGSUt9N2PRZPmNRdsFa5whdLHGHJiRtv9PZvVxvF/9Djz1ioo8EmjWINP5ubMiGy
	 4pvi4etwcyZS5VEvDMdSFnVja645/v+vjxcoIZzfNFgKHLCtlBI3l+RlH/n5QM+Yuv
	 ur+VNzKiJmwfvAl8mb6F5iH36oLA/hmcqdi7SNkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8B6F80228;
	Wed, 17 Jul 2019 17:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E737F80363; Wed, 17 Jul 2019 17:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A78F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 17:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A78F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a+jp4EXK"
Received: by mail-wm1-x342.google.com with SMTP id v19so22547859wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16OzsF+rw6kqlnK3p/mBeXPrsngm3ql0fSjvoDv1bgA=;
 b=a+jp4EXKBMWB/i8nIMbnebCkDLgFrDP1qMgNR8LkleKJehN3ie3W52Xh6JxZqtHXav
 V9tOLdcqPOP4HNpeiOXQkNgWwQHaz9Lsi0ARgRcKt1IbJGfT5Du4iLLc8uy3kg576TSI
 N0QKiKxMxgweYkNqH6baZ+hH8tRVhHZFfK0Nmh9ig+b0X8Y+brPatjq5JdVPe1ms4c87
 LG9/+mJuXxfnbXZm04HH5rtMPqs81cR6EGdwMhbsLVccK5fujnA/4eWk3h+DGKMcsXsr
 DpuSltmDOwux6CavFRM9YTH9nief45bQvtEeUmeb4ygkwSUjpgXHe0YO8RivLEjQDsaY
 BDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16OzsF+rw6kqlnK3p/mBeXPrsngm3ql0fSjvoDv1bgA=;
 b=q1xHt/0sePJqQJ+8zYc06fdUDQnGn+01ofIMbHFS1M0j4Qb6bvkbxL6iJzcu3OjTbL
 U1Tfj/h31eh/Cu4w6awK7lk7lwmKTgrtcL67eix7slc5aE+/ZdurlgssYKmfv29A40eY
 xuazdMTYfNm5pawAPhPjvCs9sowHiRV3OsiihIjquVud/JwILolxmyTRoT0A+YzH31r2
 E6lxKnMem7C11OHWLDUXdqynRHofopOvjvyuUaWYFP+dX6+MPGDpDpyL4tbsHoM/fndK
 6X0AR8ORGTZ426gkOrhA//YaBmgOcLSSVthmlkXdwVdXEduGHlmFsdWp8GmugsnOYPf+
 Oqfg==
X-Gm-Message-State: APjAAAV8Senlavm/2pwl7GBgj4GmVRWUuiH8Dl0XEGzczAAV7eTzIie/
 2wTFtgh3FUal9B0p2T6r9FTDppQ9ZEmzeo/0cKM=
X-Google-Smtp-Source: APXvYqxyOS8nCUSTcO3MIs7hfPjxOdWjZtK0xWjo5FULNXOm/qMwid+oLvn93uIlvoo592xrZ7Ek1Te80PXk78gCMkg=
X-Received: by 2002:a7b:c051:: with SMTP id u17mr36313618wmc.25.1563375973460; 
 Wed, 17 Jul 2019 08:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <CAEnQRZCCTwMJKQnvP2mSQPcKNwtoAaMdXmQt_H+CGro=zVLsNA@mail.gmail.com>
 <1563374027.2676.18.camel@pengutronix.de>
In-Reply-To: <1563374027.2676.18.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Jul 2019 18:06:01 +0300
Message-ID: <CAEnQRZB96Q4stM4JsJskMhdH-7ktbc-QxPeibNOLHEXghtS-1w@mail.gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 17, 2019 at 5:33 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Daniel,
>
> Am Mittwoch, den 17.07.2019, 17:16 +0300 schrieb Daniel Baluta:
> > > On Wed, Jul 17, 2019 at 1:59 PM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > The SAI block on the i.MX8M moved the register layout, as 2 version
> > > registers were added at the start of the register map. We deal with
> > > this by moving the start of the regmap, so both register layouts
> > > look the same to accesses going through the regmap.
> > >
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >
> > This is a little bit tricky. We need the verid register in order
> > to differentiate IPs which can support 1:1 ratio for bclk:mclk
>
> And this patch doesn't prevent this usage. If needed we can just read
> the verid via a plain readl on the base mapping in the probe function
> and cache it in struct fsl_sai. This seems way less intrusive than
> carrying a register offset through all of the regmap accessors and
> validation functions. I simply haven't implemented it in this patch, as
> I had no need for it right now.

I must admit this is a very clever idea! Anyhow, I'm having some concerns
because unfortunately not all registers were shifted by 8 bytes.

See: imx6sx [1] (page 3575)  and imx8X [2] (page 5512) RMs.

We have something like this:

i.mx6 SX:

00: TCSR
04: TCR1
08: TCR2
0C: TCR3
....
60: TMR
80: RCSR

i.mx 8X

00: VERID
04: PARAM
08: TCSR
0C: TCR1
...
60: TMR
88: RCSR

[1] https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX6SXRM.pdf?__gda__=1563382650_d60ad6189b2431a35a0757ffc87cfb3f&fileExt=.pdf
[2] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
