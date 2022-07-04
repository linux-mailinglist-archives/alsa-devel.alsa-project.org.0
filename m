Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4175659E5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00EE170C;
	Mon,  4 Jul 2022 17:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00EE170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656948748;
	bh=FvkEbetfT4jdtj6ZuN6qH4lChFTTrylF+4rYmbulcGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uoeaBj80azWtcYAVV7G0tQNGZR4lU0oe5FwEgMq1Ry4kespAfhFhhJTvCoDSYtW8I
	 hqIzSFopDD1Zkz9XvafWmfY16ET5D+ymupIhnLNLVPiGFIRvV8g3biTlmw1OhXCvjG
	 asTQHPEDiwsKYhM63ZruA8ccUMdwff5yU1JJX7CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E14F800ED;
	Mon,  4 Jul 2022 17:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5039DF80139; Mon,  4 Jul 2022 17:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9F8BF800ED
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9F8BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fh3le5Kr"
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31c9b70c382so22871597b3.6
 for <alsa-devel@alsa-project.org>; Mon, 04 Jul 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZp0fTSBviO8sZXMgvxBW5EvrUyZFIdfTYigWhAWP2Q=;
 b=Fh3le5KrkwCDTcCx2UG80LSVLUXzP+c9Ez6uSsLdhx4K2bk5LNahjVqrsH5dwYh2cp
 FIL0vcQ5odqvLmmcoA4d2q79rl1XYsf4vJuCLYlJmi19FCMk75qbnyQMu61V5MGcULGh
 cK/+PHY0erJyo8sLdHTLRDD0jmZkSfL05/bfjmVkjaVf393UqgPy0eLIIdqQPvmwdPkx
 1Ql6Z+Zjlbpiuv0NIs9br913KhmDs3H0CX0CWmbgLyg4vgNzGzlCT1zTSC17FL3SbVKa
 1FeSi1hePyMQF7Kgxg/jBrZzUhHT29t1nMJ94G0Fbc+095rxQMLlhrn8KalyqrAX8Ruy
 qrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZp0fTSBviO8sZXMgvxBW5EvrUyZFIdfTYigWhAWP2Q=;
 b=DKYVRMKoT1enTsPr4a4o63aSgg/ntAeRpr1woHp2TAr4Xa73Ln8I5E0dQEMAqBJsvi
 6WoNhwmgl8HTAyzG2GzvyZ2GlkAIqP/Mhy+ZsY2JLmwNrQz17sw8lLfNTZFg1IJvEkKQ
 9wdNHtooUntZX0iCf10eYqkm58sqIZ0zasniwc+qK9URGVWLX+m6E2zWdu0xMP2Kurdp
 szRm2+6gIFawSm/ns3uNP1fZJ7hVGRIN8ZvJzrJpYy7GrD/z3z2HRi50KqgsKsdwAxGj
 WUYRIFVx0p8MBE+KTJ+mdYYsfIq4Mh6f776pGT8TLP0LwcTNFl2NwlKruoB+NgrxPoDg
 7XHg==
X-Gm-Message-State: AJIora9+XGJOs6BHXXcH8n5oJJ36DlCAbAiHf+cIjDK1dB9paqL/kpr0
 w+tY9HWQVm9NsYPHar5rSnaX4pzcZeH8yBMuMo8=
X-Google-Smtp-Source: AGRyM1sO+c4a2WrNPrEqCFBa0DXLYQJQgDYky4gEMSV88n3xvnXo3ooAaGqre5Rfrx7klRQI6IRHPHFwT3M/sJIFfrU=
X-Received: by 2002:a81:5d88:0:b0:318:31c1:56f3 with SMTP id
 r130-20020a815d88000000b0031831c156f3mr34140330ywb.18.1656948678372; Mon, 04
 Jul 2022 08:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
 <YsG3kKwmoqF2MxU2@smile.fi.intel.com> <YsLCwQM0gbhFhSke@sirena.org.uk>
In-Reply-To: <YsLCwQM0gbhFhSke@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 17:30:41 +0200
Message-ID: <CAHp75VeCTEE4-O1LLYNunf_ZU164i8rnqeRf9dvp=R=_eEC=ig@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Mon, Jul 4, 2022 at 12:45 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Jul 03, 2022 at 06:36:48PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 06, 2022 at 10:29:59AM +0100, Richard Fitzgerald wrote:
> > > On 03/06/2022 18:07, Andy Shevchenko wrote:
>
> > > > When kernel.h is used in the headers it adds a lot into dependency hell,
> > > > especially when there are circular dependencies are involved.
>
> > > > Replace kernel.h inclusion with the list of what is really being used.
>
> > > Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>
> > Thanks!
>
> > It's a month passed without any other news about this patch.
> > Is this a problem in the MAINTAINERS database?
>
> > Who should take this?
>
> > +Cc: Liam, Mark
>
> If you needed to add me to the CC I've not seen the patch...
> for review.  People get busy, go on holiday, attend conferences and so

The question here is about MAINTAINERS. That's why you are in Cc list.
Do we have an issue in MAINTAINERS that causes you being not see the
patch?

-- 
With Best Regards,
Andy Shevchenko
