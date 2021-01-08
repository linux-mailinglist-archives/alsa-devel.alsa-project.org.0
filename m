Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A202EF273
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 13:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCD716E4;
	Fri,  8 Jan 2021 13:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCD716E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610108507;
	bh=XzXF1jyL3g3Kop4wKgITIcayL7dXcAwxy0YR4AFsH3s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enHgbLT5/1SIGBUcghhJEmHnjpRPS+nPjJadUn/vxDEZvjQAge6Y3bXlGkEKmHXB0
	 jV7lBW/c+upwQeRbRKiJSSSzeECqZuFXF9K7bqRchLh1Vuq4dGxz9UulYgGq/wg+sS
	 GvDiaOUinfEwdn139Vlu02qw+t2LYG1TYfO/GYtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148B0F800FD;
	Fri,  8 Jan 2021 13:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0561F80167; Fri,  8 Jan 2021 13:20:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF14FF800EE
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 13:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF14FF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n1nr2iFJ"
Received: by mail-ej1-x62a.google.com with SMTP id t16so14149898ejf.13
 for <alsa-devel@alsa-project.org>; Fri, 08 Jan 2021 04:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMT5dGsMHSLpkqrgbCQ5MwkgGYzbIuBCTAWpR0U9n6c=;
 b=n1nr2iFJPn1w+0Ja3QZrUJnxHYlJys9dJUs5U992Myoh7A1dKmrBZA6HbJpCptHX1e
 VefhqYhXjgQBI5QQKz/SbHw61wAa4br6gd0Q+9YnCZis7j0El4asyOn7eKH2Wh8DMuj1
 KFP6gdpZdi7xclj9b91TOyTFIGIlMPcSPXqpjm5bGD1DgxEjJGJU8eZThibDT6iQSJpj
 wwMik0mpgBr6g2d5CgbuRswdQXOJ1ycnEk6GJ7pPPYlqW/4tMWWi68WqIFFp1BfuXkuw
 3z9lnUTQJSwlaO3jGdlOR9wbYvDedQFzb8MtxJoYo+5ESpo/UWWN2NWq9g6F3QVSWr6z
 c1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMT5dGsMHSLpkqrgbCQ5MwkgGYzbIuBCTAWpR0U9n6c=;
 b=pYXyP+2bHqQPgrUNblVJ0dbZK9ZHsmeMDufo34q87Vy2FU1WUepaScAGj16DpLbMVF
 1H7PWbny34tNU1yMymhv9NtDjAMVynWf3D2DWm8N3YMRXzoT4BuUWpoXUBJdwmadJQUQ
 omPwvbaADvTPcBrjP/VQK7ydd3uiPsUGTkL9wulO458/yJkieCCy+gsuWWXeZqD3IROQ
 mAHp3gC5s/xBsVM8KtJkK2ZfBTIEnOquYmFkz642UBrpvBgV5sB4xcal8Oq5FIySgoqa
 MSoV8aOVF5y8cQfKlIYE1D0u0BDqtBBon81mD13yZg99A8YoXzlQ4/1yv7GKfq3oNQ7e
 qq9w==
X-Gm-Message-State: AOAM533Hj/eFHSn6M7IX4hNNZVmLXVCJhEtlNUL1dJzjYNGYfNai5/R1
 pqZ1cdXrcNX001GxriXClVbnskSFkuObjEVucz8=
X-Google-Smtp-Source: ABdhPJzRAJo80XQXhGAdeCbnNuTvVN6JmbxywmfM4xmGGorpYrDXJWue8z/2SCkfVT5smUpa5bvm3IdZrPo7A9ce8AU=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr2390315ejb.382.1610108399899; 
 Fri, 08 Jan 2021 04:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20201225012025.507803-1-pgwipeout@gmail.com>
 <20201225012025.507803-3-pgwipeout@gmail.com>
 <0c3665b2-bac6-546a-bdd4-0ab7a90adf7c@nvidia.com>
 <CAMdYzYraT5AXzyscN3Pa+0FWZwHFsD-4ZwbA80kNxgtn7Y1PXw@mail.gmail.com>
 <b3a3ede2-22d5-b13d-f245-7c3b40ea411a@nvidia.com>
 <a2c5c1d4-500b-6dad-d4ab-339154624c43@nvidia.com>
 <18f44f67-ba81-98d6-67d9-c6ddbb3c9302@nvidia.com>
In-Reply-To: <18f44f67-ba81-98d6-67d9-c6ddbb3c9302@nvidia.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Fri, 8 Jan 2021 07:19:48 -0500
Message-ID: <CAMdYzYqwL32_=b3fFKFiOoXkDxZYyHsU68LxxzPSRbgPCeh+Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
To: Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
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

On Fri, Jan 8, 2021 at 6:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 08/01/2021 10:54, Jon Hunter wrote:
> >
> > On 08/01/2021 08:00, Sameer Pujar wrote:
> >
> > ...
> >
> >>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> >>>>> Tested-by: Ion Agorria <ion@agorria.com>
> >>>>> ---
> >>>>>    sound/pci/hda/hda_tegra.c | 3 +--
> >>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> >>>>> index 70164d1428d4..f8d61e677a09 100644
> >>>>> --- a/sound/pci/hda/hda_tegra.c
> >>>>> +++ b/sound/pci/hda/hda_tegra.c
> >>>>> @@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx
> >>>>> *chip, struct platform_device *pdev)
> >>>>>            * in powers of 2, next available ratio is 16 which can be
> >>>>>            * used as a limiting factor here.
> >>>>>            */
> >>>>> -       if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
> >>>>> -               chip->bus.core.sdo_limit = 16;
> >>>>> +       chip->bus.core.sdo_limit = 16;
> >>>> Future Tegra chips address this problem and hence cannot be enforced by
> >>>> default. May be we can have like below:
> >>>>
> >>>> if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
> >>>> chip->bus.core.sdo_limit = 16;
> >>>>
> >>> It will need to be a bit more complicated than that, since the
> >>> tegra186 and tegra210 device trees have "nvidia,tegra30-hda" as a
> >>> fallback.
> >>> Looking at the generation map, tegra30-hda can be the fallback for the
> >>> broken implementation and tegra210-hda can be the fallback for the
> >>> working implementation.
> >>> Does that work for you?
> >>
> >> As per above explanation, it is fine to apply the workaround for
> >> Tegra210/186 as well. So it simplifies things for all existing chips.
> >
> >
> > FYI ... we now have minimal support for Tegra234 in upstream that should
> > not require this. Given that the Tegra234 device-tree does not include
> > support for HDA yet, I think it is fine to apply this as-is. However,
> > once we do add support for Tegra234 HDA, then we should ensure that this
> > is not applied. So that said ...
> >
> > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>
>
> Sorry I was chatting with Sameer offline and we think if we just switch
> the test to the following then this will take care of Tegra234 when we
> add it ...
>
>     if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>
> Peter, would you be able to send a V2 with this?
>
> Thanks!
> Jon
>
> --
> nvpublic

Certainly, thank you all!
