Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27487567290
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 17:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A9516FB;
	Tue,  5 Jul 2022 17:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A9516FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657034849;
	bh=HeP/HDPyLxalaQdB5sqDWAnPqUZL8913tiA+NzyzkPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTD+0McebYPUYdcUMPZPnthuVzEivTYaa1kov9VdAKzmmGaLeDMuvFmU/U56+lTRL
	 +FaplpnxxyXlfHjn6p6GsJ6tyvzd1306e36xcfAvihKryji4jsEP2U11aZljUb57jQ
	 L/APiMnQcfTPoQHn1lRLNjtIBmbg2mu58Ta3v4P8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E68AAF80104;
	Tue,  5 Jul 2022 17:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5C4F8015B; Tue,  5 Jul 2022 17:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB08AF800CB;
 Tue,  5 Jul 2022 17:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB08AF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GsAVWt2R"
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31cb2c649f7so38065367b3.11; 
 Tue, 05 Jul 2022 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wk5Y25/dUa+IXHDUL10teFIgK8kNUBO1oeMMo3Ill7A=;
 b=GsAVWt2RcePWEhCXpNuMhOCPB/Hj0hjOSc8fcr//l2a2j40bz/A12CPiM8+rQ2cPjK
 FE5x28RU7A1yUurjYhLkASsz48TuNZEr964a++b3qUwT0Dd+P2X5uC26c9NdiCWrj+kn
 caXUKSdiChQxkH5FlcxBpqu4F6jMfJsOKcOg2iC/om/w2HLcyM7dJvZegTcorWJCHyAm
 qxBmfiiWhnPwTHDdJf6wDI2hTxM/+hfs+I7+rIFVjP896vjIND+LDdG1DCSBHGgiIARa
 qPBhKXlPitQ3IKIZ0WQ4v7vL89DzX8YO5/crQ8+8uQAfT9uynVOAtYYUSU/cS08mijcM
 uBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wk5Y25/dUa+IXHDUL10teFIgK8kNUBO1oeMMo3Ill7A=;
 b=j1L42pAhM150xXeKkEkJkIfIkCKEQRvaXL/qsAW050m7k3B2mmFmd7BI6X57VWimrR
 ZW7cVT/V/a+l78x3Onu/IruVzpzjK9iCoZwtmzC6Cd8HXazfG9es40PjU83/rVa3mepB
 rF23Mb9TUeAtH6sDO6mcG+zHHw6lN0tDKYijLwrfLRu5maOAEKLbldPDAiDbQ7g68mwm
 oSWLiA+z3Qi9YpyCoHakp7warGFEEaAd/jRxzXyg7ruV6F0iPs7XH+E+siIbmouNX2ew
 C/FxzuKX3S+XmHA0e7zUIos1FuO+Fx9fFMvxLPuZXwMSeoyNogsyeMGeDPpisX0ui4lV
 mABg==
X-Gm-Message-State: AJIora9SOSl6ILb+9zeJWzwppU+/jg6G8S1z2aXjGaeCSt6CZjFgfldn
 GvmHvVrx+n3Jbe8HOEv0tu/j0wFyD2VWSiFhYNc=
X-Google-Smtp-Source: AGRyM1sbWvK8fkwIV+Pfzeg/eyU/uTFVrTo9rOPot9tVLZJPz+6AT+wWjBp66RmVgXIojzx5ysR5XQTYtqIqakTkrA4=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr15794516ywf.486.1657034775878; Tue, 05
 Jul 2022 08:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
 <91f156ba-5d93-63d6-5fa0-86614bc370d3@linux.intel.com>
 <YsMTHTcOWX4Q3W7f@smile.fi.intel.com>
 <21522ae3-96a3-ce07-6466-89cbf6c67a9f@linux.intel.com>
In-Reply-To: <21522ae3-96a3-ce07-6466-89cbf6c67a9f@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Jul 2022 17:25:39 +0200
Message-ID: <CAHp75VfcbeMt=OUamfyoheqxX1gcCoov+976ewPUerfH=wSxRg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Tue, Jul 5, 2022 at 3:19 PM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
> On 04/07/2022 19:19, Andy Shevchenko wrote:
> > On Mon, Jul 04, 2022 at 10:31:48AM +0300, P=C3=A9ter Ujfalusi wrote:
> >> On 03/07/2022 17:35, Andy Shevchenko wrote:

...

> >> +    return sof_acpi_probe(pdev, (const struct sof_dev_desc *)id->driv=
er_data);
> >>  }
> >
> >> We don't use the desc in sof_broadwell_probe(), so we can just pass th=
e id->driver_data
> >
> > I prefer not to cast inside the function parameters when it's not about=
 POD.
>
> Fair enough.
>
> How about assigning desc before it is used?

As answered in the other email, I'm fine to modify the change accordingly.

--=20
With Best Regards,
Andy Shevchenko
