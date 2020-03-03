Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEF7177037
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 08:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B84E950;
	Tue,  3 Mar 2020 08:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B84E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583221202;
	bh=5KYrFqtkh8TtO5bmkxAiCehre2Cbb5TUSyAGoNNKB/c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lixD0qgTD/W1H19dF2Ugp9sh8i8mqTxK2pPjLIgkKXxqudB0G5RD2HcqRncQf3/nv
	 XeZPmkhjHRUpElZUtl/TVsn31Nc2eEoiyWLt1FRs4I5GlEhxWXUEPzPAZdvkJ4SuV0
	 WGS18E+gIW1a69/mmtCwGaVH3NeCMyVpF+TbkKI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11534F80245;
	Tue,  3 Mar 2020 08:38:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0144F8025F; Tue,  3 Mar 2020 08:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A979F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 08:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A979F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N2hhA1DH"
Received: by mail-pf1-x443.google.com with SMTP id f5so1024152pfk.9
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 23:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lp++SjSydgt9rFdJFF3CB/lDlkmkywlwzPGaMF0zRlA=;
 b=N2hhA1DHJRr48b03MdRwK7wZT+y/IIbu0elhvz7gKyVzfWBwfAl0mdXhHechKW3w5h
 wBxpbplnqcGuRCe2aCyqhLZ2wpo+o2zcRsqCG1KdGYHdSJxY32PohGGlo4aMczuoJHna
 CMWMl9Exwvu57I8hyLPt/3Q4RBQTH5w67lBRMPCFvGriXxlrcvaH322RGt4kpMoBHUxh
 3E4JEzdChP8g3QMeRMTmn351CirQyx390iw1AbTyvsytm9dZSNigQYXyPmQAa74sAYIC
 Pj+UjOdxqIfBRBpzjWssycX5jwrJViK8MAIoJf3vZquhGT10/uKK0BZsNZxEY15fRJdw
 35Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lp++SjSydgt9rFdJFF3CB/lDlkmkywlwzPGaMF0zRlA=;
 b=r1n4vXcpmlcdEvmuopX0DkrUYV2273Lx6bDvPgnLGZNQneYReG6LAVP7q3sSdCEqmK
 fgSd5bR6K0HisCzAaDzHNP7I3hFrIE8An/2LwP95pxvI4fzk+snuX/cJGi30D1NvQbIs
 QW8lFVzNqOLPhZDCcmU1YZ+5bYucMPVB0HZjV9roc3eCRbvbXiaXIT0RxQGpMzy7N8FX
 B20jepX1TzvHgpzCkLwOeDs5SX7huV4iii0rxyc3J71SHtOmK/F7W6LXgWZoktwJuWMD
 f/+VDOYAw81BQYMxAqQIuAaKXCEyzCz/1QQQiDwQWHrIp9OVC96y69qWblPSbiRS4iKl
 XF+w==
X-Gm-Message-State: ANhLgQ2meBbI9Y1f34eo7r88MRIgR6zO1kNew0IsTFSOqB+YHD1WBkC/
 ThVW0oYoL0kJT0/LuI4v+vo=
X-Google-Smtp-Source: ADFU+vvzwWp+30x2055lNCAa+QhYWY8R2yyZZoSUjWYJZln5Koehw7RijTiQ1fkyuH3SDxsLzC7qTQ==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr2820931pfn.89.1583221088207;
 Mon, 02 Mar 2020 23:38:08 -0800 (PST)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 p94sm1516093pjp.15.2020.03.02.23.38.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 23:38:07 -0800 (PST)
Date: Mon, 2 Mar 2020 23:37:46 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
Message-ID: <20200303073745.GA2868@Asurada>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
 <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
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

On Tue, Mar 03, 2020 at 11:59:30AM +0800, Shengjiu Wang wrote:
> Hi
> 
> On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Mar 01, 2020 at 01:24:12PM +0800, Shengjiu Wang wrote:
> > > asrc_format is more inteligent, which is align with the alsa
> > > definition snd_pcm_format_t, we don't need to convert it to
> > > format in driver, and it can distinguish S24_LE & S24_3LE.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > index cb9a25165503..0cbb86c026d5 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > @@ -38,7 +38,9 @@ Required properties:
> > >
> > >     - fsl,asrc-rate   : Defines a mutual sample rate used by DPCM Back Ends.
> > >
> > > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > > +                       "include/uapi/sound/asound.h"
> >
> > You can't just change properties. They are an ABI.
> 
> I have updated all the things related with this ABI in this patch series.
> What else should I do?

You probably should add one beside the old one. And all
the existing drivers would have to continue to support
"fsl,asrc-width", even if they start to support the new
"fsl,asrc-format". The ground rule here is that a newer
kernel should be able to work with an old DTB, IIRC.

One more concern here is about the format value. Though
I don't think those values, defined in asound.h, would
be changed, yet I am not sure if it's legit to align DT
bindings to a subsystem header file -- I only know that
usually we keep shared macros under include/dt-bindings
folder. I won't have any problem, if either Rob or Mark
has no objection.
