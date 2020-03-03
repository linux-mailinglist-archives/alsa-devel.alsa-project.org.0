Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD7176DBF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 05:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07CF9167D;
	Tue,  3 Mar 2020 05:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07CF9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583208093;
	bh=W03sJKJKX7wRS9YtHzf0lGPVdQPVb0krnnd5wfViVRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVexUhO7CQiDH/Sq+bPctRO4HSjhKBkEY32DWEAuwxvQ33rridz1JgBNzX2c6K+ek
	 j5HZoh8lfvUvpZsOGx5s5fGPQ3ELkd+a+04VpteZg3iCscAO4UnO1yHf6mVaRbK/fk
	 vtpTa2j6Ly+3Mmj2ocO+n4puUomM+wFzHL1WFX4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1045DF8011C;
	Tue,  3 Mar 2020 04:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF70CF8025F; Tue,  3 Mar 2020 04:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38195F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 04:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38195F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oRT8HZ4B"
Received: by mail-qt1-x844.google.com with SMTP id e20so1838794qto.5
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 19:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvgiEL+QVxL1O0iuln0ifrtO9JeYp774TkUNa+6Pqoo=;
 b=oRT8HZ4B32/7utrig5nxukRcBp2kXL+RB7l6+X9X21Z/lE1ng0lir/2XnCN4MCNCL/
 JCs+4EUTPXdEdohoncGhgZqyiZqG5StxthdVvUsRlip4ttwbFnATHlA+0ivVzJ98ojAQ
 etVMYVwNN7kp/A+P/eYeqexBN4sWYR0yfSxguyzTQG1EhWJdw4iRlCK7sIud2Lthti89
 Zuo/HkGECwJlpBAV4fXexo/XYscKNWFwieSqQ49/DIMqu7XmrjH3AMeI6QVVDMguhKKz
 71NuaFosTdSaKOq6pav7EEC9eGWRitBjA0RGj7UMjPCGezvoauU4Wy4VAvwjAe5K/rs2
 NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvgiEL+QVxL1O0iuln0ifrtO9JeYp774TkUNa+6Pqoo=;
 b=SpbPPteOw8gI+iB6qdne6xdOiFrFYwY9E3c8jvSPLxaRmc+qMU3+cuBff+CTV412hS
 L0GOWsQEAMZyMZ2MRtYuARvwtToESUtPxgGcc7xM1cB2/zFm19ISZ6R7MAFWHEQHbE0L
 aEX/4gyDf0rGEJStLEz3OddaWgoWATyuApdbGq8axV/9gaERBwQxWm+Ft5+eDW/W1HWw
 fUu1nNokoO8QvlZZ6e5NLvxlZ4iIQ7Sl1M8x6CBmnJdkn5RQlUq7YoqDpOvgCQ+CPkCx
 HllF0EQ2EQoXZC3FA5oWRVvIaBY2bDFSGt9+4weMNtinzARoFRkp+9JUkuaOqCM02XH8
 JsOg==
X-Gm-Message-State: ANhLgQ23Hw1N03CXeLrFvmOjloOCgVAtkLCoHrYEJT+07hYeUxa8TnPV
 fuvxgbtc82HRHv4+aH0FWgGrEp7GHdOe5fhQXFg=
X-Google-Smtp-Source: ADFU+vv2FItiQhj89T5uuRfiab6WkfDHcosumKkrglL71peu+YE/jk0AhS8fXeo7PG4qPrc7PTpI+QkNhWhZ/+gdSNI=
X-Received: by 2002:ac8:518a:: with SMTP id c10mr2808979qtn.360.1583207982044; 
 Mon, 02 Mar 2020 19:59:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
In-Reply-To: <20200303014133.GA24596@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Mar 2020 11:59:30 +0800
Message-ID: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
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

Hi

On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Mar 01, 2020 at 01:24:12PM +0800, Shengjiu Wang wrote:
> > asrc_format is more inteligent, which is align with the alsa
> > definition snd_pcm_format_t, we don't need to convert it to
> > format in driver, and it can distinguish S24_LE & S24_3LE.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index cb9a25165503..0cbb86c026d5 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -38,7 +38,9 @@ Required properties:
> >
> >     - fsl,asrc-rate   : Defines a mutual sample rate used by DPCM Back Ends.
> >
> > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > +                       "include/uapi/sound/asound.h"
>
> You can't just change properties. They are an ABI.

I have updated all the things related with this ABI in this patch series.
What else should I do?

Best regards
Wang Shengjiu
