Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905514001A7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:02:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A2D1675;
	Fri,  3 Sep 2021 17:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A2D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630681353;
	bh=+okT5F4igvpxfCjPMcosNgIu7vgmM1JOvpV/1cBQSL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=paoNhuKP5EQQB0mVqDSIEs1mA8VVopbJ8BUTfYVzOGwGOOdfSgtEd4o0Noosj4fG/
	 9mH+A/g89b5OK6UCQIYyBCwBe5CqEl5sdkwdf4kMKa7q1RUDDrIvhPY/Dlgo27JyQO
	 nk2dUbLHFWKAmO0kp7A2cROz3M0cHotcbd9tgGSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F8F3F8020D;
	Fri,  3 Sep 2021 17:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 888EDF80254; Fri,  3 Sep 2021 17:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78747F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78747F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CiW/wStB"
Received: by mail-wm1-x335.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3980796wms.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PsMI7gL+pJyK2Fy7ieNnAa0j9CEtX/Te/MusU7XnP0Q=;
 b=CiW/wStBwAnSfwQ3ZzUS1mhcZpGMg2thecIfQZlaoPvhHzyjrQIhl8KBB2QkqovtDZ
 zd+OG2GHHe5MguX6ynAFz0FCWViy8wE6lhD94vWV71raepi1/EdUY6vSRy9vS2Jjt52s
 F/FXFbR2GoazR8IDoILVuqq1qjyK6MCv/AjJkBeNSKmn5gbF99ujfxm94syvkUHhPGWX
 FBLhjML7QnPedn3YPY6OQEDjhEKieA5AdMLOQnIKbCzoErlFkFtT5eAng52GmDe5h4WX
 rZP55hufBNlPlFuDfGm6uyJTWrp+xAqL4rutd6rm4wzDIpMahCMo12rRErtPK3DP3d+b
 BX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PsMI7gL+pJyK2Fy7ieNnAa0j9CEtX/Te/MusU7XnP0Q=;
 b=FeNDsTmFXW1Th7XdAUzuzLRyIo5B0UozcrAaDgdqH1OpjtoqlQp5FQpFFLbjo6/HHw
 5qjAIcmu95WAWr0PIR/Ulm6wDsDhZuiSvBSix4xXVPUB1MDnIEkvwbx9IXxL4WW24an+
 maG2Z8PMosVliEVeDrLN5j5WTlTjVxs09wdXgKPHFmL1/0JOriBp+OYvx3yz4Hi0RhKb
 hURcqjojXNQb0n9eBwDJKlhyz0HcwWMBScFnvf/vyx9JS6JO0ZY172iZXWBVnn9Yjlo/
 brdgSLZyVTcPfadDCl+LUfXiYUErjuL2/kCMqM5HFNfKJUyh7d20AvRvYPSNSnJ31/qD
 ZavA==
X-Gm-Message-State: AOAM533vgnO7cSckP2RoOfgebQGSzkugFTjE+OjLZTHkU0zpfPaNV0u1
 PiI8N0PQdIWZJpguUP+A7uBmX6POCnHoLpDrHLM=
X-Google-Smtp-Source: ABdhPJwq5LxbGRRTDY59rAzLY7dbuYJkXpaAFBEQt834jskgt6cC4b6dM02XFgqniOOGBkFe7PAeL2EnXkAGcbiSx64=
X-Received: by 2002:a1c:3b05:: with SMTP id i5mr873059wma.136.1630681263727;
 Fri, 03 Sep 2021 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
 <20210902123216.787025-2-daniel.baluta@oss.nxp.com>
 <896baddd-5bd7-8f85-91c3-0a4498694d77@linux.intel.com>
In-Reply-To: <896baddd-5bd7-8f85-91c3-0a4498694d77@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 3 Sep 2021 18:00:51 +0300
Message-ID: <CAEnQRZDExjuj1eL4dRKXk-uyeKo3Mo24=CdmTnDz5EeAkYFDVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add code to manage DSP related clocks
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s-anna@ti.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
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

On Thu, Sep 2, 2021 at 11:02 PM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
> Hi Daniel,
>
> On 02/09/2021 15:32, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > There are two types of clocks:
> >       * DSP IP clocks
> >       * DAI clocks
> >
> > This clocks are necessary in order to power up DSP and DAIs.
> >
> > We choose to enable DAI clocks here because of the way i.MX8/i.MX8X
> > design handles resources (including clocks).
> >
> > All clocks are managed by a separate core (named SCU) which communicate=
s
> > with Linux managed ARM core via a well known API.
> >
> > We parse and enable the clocks in probe function and disable them in
> > remove function.
> >
> > Future patches will introduce Power Management support so that we
> > disable clocks while DSP is not used or system enters power save.
>
> Unfortunately this patch does not apply to next.

Yes, because my patch is based on SOF topic/sof-dev branch and this small p=
atch

https://github.com/thesofproject/linux/commit/b56c58b5938a626fb08fcf1d5e38d=
687b520ab89

is not in linux-next.

I plan to stay on SOF branch and get the review tags so we can merge
it in SOF tree.
>
> I might be a bit too cautius, but I would also add "&& COMMON_CLK" for
> the COMPILE_TEST in Kconfig or select it from where it is appropriate?

Maybe add a depends on COMMON_CLK for IMX hardware support? Altough,
if CLK support
is not selected clk API transforms itself into dummy wrappers.
>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >   sound/soc/sof/imx/imx-common.c | 77 +++++++++++++++++++++++++++++++++=
+
> >   sound/soc/sof/imx/imx-common.h | 16 +++++++
> >   sound/soc/sof/imx/imx8.c       | 32 ++++++++++++++
> >   sound/soc/sof/imx/imx8m.c      | 33 +++++++++++++++
> >   4 files changed, 158 insertions(+)
> >
> > diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> > index 30624fafc632..482c25ab15ce 100644
> > --- a/sound/soc/sof/imx/imx8m.c
> > +++ b/sound/soc/sof/imx/imx8m.c
> > @@ -23,6 +23,20 @@
> >   #define MBOX_OFFSET 0x800000
> >   #define MBOX_SIZE   0x1000
> >
> > +#define IMX8M_DSP_CLK_NUM    3
> > +static const char *imx8m_dsp_clks_names[IMX8M_DSP_CLK_NUM] =3D {
>
> static const char *imx8m_dsp_clks_names[]
>
> + ARRAY_SIZE(imx8m_dsp_clks_names) instead IMX8M_DSP_CLK_NUM ?

Yes, this is a good idea. Already fixed in v2 I sent eariler.
