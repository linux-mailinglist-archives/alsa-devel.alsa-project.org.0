Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967148A0CF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 21:17:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8B218E6;
	Mon, 10 Jan 2022 21:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8B218E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641845876;
	bh=T0xQEeMfYAZWWLfQ25O7XnIoPfBpVaJVmwR4FfAbgLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjr1pQRPMw5lWAJ9Zsvhh1/mqnr4wbY/lul1Lz+GJR+wI8dzayhg5k+xoDcYTiAdV
	 elKZWyUKykslCFngo/bGKA2QEGM+j62MvQUS6Cys1nGQ88ZfkRZmmbm/Ca6aYAheAj
	 rM6hdubqs8IpGHLOA49JmkB4/hwtTe/4O9fDKwtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C5CFF80134;
	Mon, 10 Jan 2022 21:16:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D59AF8012E; Mon, 10 Jan 2022 21:16:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBA5EF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 21:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA5EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PTLk8Dmk"
Received: by mail-yb1-xb2c.google.com with SMTP id h14so23840856ybe.12
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0xQEeMfYAZWWLfQ25O7XnIoPfBpVaJVmwR4FfAbgLk=;
 b=PTLk8Dmkr/y6prAl62pFcK4STJOH3jrgkxpECkEj2HXVob0FHdLQ5JOBkL12TSk1oM
 tH2L5pIY+yhSGwwUg7WkgvlEgoTJkrs6ZFG+RVyeXoWNVPk1sufy+eMrhX/T3EPbBMqW
 4VZ0xujB/NY+2glfLjzV7W7iigh3P62QaL0Zzll06XqCfMZYAp8Iq4xgHT8tg0SzbG69
 MN4AIO5+tmaTqLz44tCrGYskywsLteutyI572lVGnPPZ+qZb5nzjmdBcLwAVj3w+P+GK
 bs1hpoXXpR9vA+A5j9GEOYUM0P9+Mx/W3A+I8FpgAmx0ZEFeblf6jP0Y4nTDBRvXfQRD
 EzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0xQEeMfYAZWWLfQ25O7XnIoPfBpVaJVmwR4FfAbgLk=;
 b=UqK/LdhrXK2xm5XcBz02+jO3U3uQiGtcgYyKPbl6nauvCCqzi088NWWlX+2iYdf/Ta
 navpSAJmyrTgDcI2kf/Che/w1pTRtFTGREmtBU3dmVvw6NckD1teLPFGXSsaqLL4HuF0
 qAZUt/vx9ULVcd2k+WhPTWGzrfH707x7mbEkR7dkqsa1tzIOqfJuxWq4e4A+UeZJdZCT
 LOEBh9wCfP3H463KmK6pJ7bHnVjV13v1Fwg+qCiSYXG7oUbcjm5MV0iwWA2EHC590joY
 bdr1X6DpjR6lZXa7lJgeeBIZ8vBwChmuggh38HJq981FtAmCMEqMhTkZLPwTdCvFZGNA
 C7Jw==
X-Gm-Message-State: AOAM530YTuxlnV5JiZa+U5fWUNbnDz4+aMzvYjETHsm3ficyauQ3Pc6I
 k30c5gh4QXBbBrG2Mk2VtXeTyPQptqNx67GXIc8=
X-Google-Smtp-Source: ABdhPJy5SZlMpv1Hol2xQ3klc0XaWlDB9uAoLFo2kw5RT28K2/HIw3OnQtl5+wJXnX8uTL6DGxNY2Mlh7fJ+wMLnC1g=
X-Received: by 2002:a05:6902:4e9:: with SMTP id
 w9mr784708ybs.186.1641845794594; 
 Mon, 10 Jan 2022 12:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220110094711.8574-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2f338a37-f2ca-33e4-284e-5d263f7b93da@intel.com>
 <CA+V-a8vz25B=cw_C4YMBRdDxeq7mi8Zc+noqpdHqfMP8eNHYFg@mail.gmail.com>
 <f69a0650-174f-1b0d-ba29-7fe04c7cf211@intel.com>
In-Reply-To: <f69a0650-174f-1b0d-ba29-7fe04c7cf211@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Jan 2022 20:16:08 +0000
Message-ID: <CA+V-a8vJzSPxpy0Te1XUiT_zkt4wd=NvFJGvwGkgwcNnibjbhQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv()
 recursively
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@denx.de>,
 Takashi Iwai <tiwai@suse.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 LKML <linux-kernel@vger.kernel.org>
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

On Mon, Jan 10, 2022 at 5:48 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2022-01-10 5:03 PM, Lad, Prabhakar wrote:
> > Hi Cezary,
> >
> > Thank you for the review.
> >
>
> ...
>
> >> Recursion and loops are means for doing something repeatedly. Could you
> >> specify _why_ such change was made i.e. the conversion from one method
> >> into the other? I bet the code is not being changed for the sake of
> >> changing it, the reason is simply missing in the commit message.
> >>
> > I had feedback from Pavel "recursion is unwelcome in kernel due to
> > limited stack use." which I did agree with as a result I have come up
> > with this patch. Also to add this driver will later be used on Renesas
> > RZ/A2 SoC's which runs with limited memory.
>
> Adding that reasoning to the commits message will prevent questions
> (such as mine) in the future. Thank you for a quick reply and a
> transparent answer.
>
My bad! I'll update the commit message.

CHeers,
Prabhakar
