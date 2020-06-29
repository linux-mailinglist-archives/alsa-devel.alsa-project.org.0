Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F122920D093
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 20:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84121165E;
	Mon, 29 Jun 2020 20:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84121165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593454907;
	bh=WuulLTEl1QL6M/ultkkSS/PK5svXkSPFXfhmDqHyw18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRlbYef+R3fpFGJazlKeW7bQOVX/TuAXS09cDObQdGNs2cPFrpK1bzeQYM5K5nA6J
	 /vBWH74UeIjfgSVNNfvwmKKc+eg5F4wqdR/RugWKfCbKALk/uhgeJyuUQ6w1dXE0ex
	 Dz/T0monTFi3Svajs0j6j5q7r1nlYG4I6fN8qBxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E1EF80217;
	Mon, 29 Jun 2020 20:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E82F8021D; Mon, 29 Jun 2020 20:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C161DF80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 20:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C161DF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="KTaItmVP"
Received: by mail-qk1-x743.google.com with SMTP id c139so16114788qkg.12
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nz1mLb/HdxeeFzjt/WhHL5+3D6vBhDXixYCmk24G57Y=;
 b=KTaItmVPIOJ4TKndqPFZNnDxN6e1bHP33oFGPpxCzsjP0+kj6JLp95d9LrUKkoUfnu
 8EcigUPbANiKCquB6BteEY6R50rhIZtQquKKKJPUvsCG4ZigLjc8cDRCVobGsoSJYkiT
 yrp45btBd/a9pXqBT3DhrEuWhUf1Sevu5vxGSpTNSJF98GrXcCAhw79k+uj5nbhAjG2o
 asXKOi4FvF5nV/L/Y5yZs9aL2Ti5/ZrVxA+Np8BbwY7aL5vj7w1XoesRA7MJwpfOXdGA
 GNGVCCoSk/e3eCjSDwpDNxp16ontCAIPfDzCM4LspFtf85ZafYfnOaTursDxfNsAjpGx
 LjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nz1mLb/HdxeeFzjt/WhHL5+3D6vBhDXixYCmk24G57Y=;
 b=CzG8O3t+f6I27/Dw5JYpChAEbnWFHTPRKMDATzSNgihg7iRI+cevVaJiHEmzCRmyVj
 wlBSdSXgqCTe6v1R/clGK6Mj4giL1ubDa9rk8lAGoXM/EEFB9MiaY+QYKkcqj5Mv6kcN
 CN69v2ekG+FbFInD3GO6vwpgZJVL/uT+VxlWv5Vk5JSm6gvBbccrRAy7Y9RxWJA5hrr+
 udikuASYNVsjA6qWSk+S8uIrisVTjHedG7a7CWEV2KNAmzrDZBa9s8l6l+cZY3EanDhb
 b1f3OaXbjhYObGxeu1OZ3fdvU1Q3kIlAu286Nvc2tm2Zmb0T8xj8yzi1h7pRkW3C2IkW
 yB1w==
X-Gm-Message-State: AOAM533dg5hPLE5Fwx5D6LBriPP8jsXNVrX20YuY9yewrfNtjA4FepFF
 2TaRXC8YuoBvNfcDcYYCt3ZSrolz96UkDxk4ZwTcpA==
X-Google-Smtp-Source: ABdhPJw0kKfy29PMxzVdPuyCXAvvVUbrEXcnOevNI79vzRZfnh0YXlM6Z5sp+V92ur7bHOUZ7/Zsr9+aZFGRkK7EXO8=
X-Received: by 2002:a37:2781:: with SMTP id
 n123mr16407496qkn.106.1593454789227; 
 Mon, 29 Jun 2020 11:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Mon, 29 Jun 2020 20:19:38 +0200
Message-ID: <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: "N, Harshapriya" <harshapriya.n@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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

Hi Harsha,

I've put the reason for this change in the commit message.
I had to split be_hw_params_fixup function for different codecs
because current approach (made for kernel 4.4) used in kernel 5.4,
leads to crash while trying to get snd_soc_dpcm with container_of()
macro in kabylake_ssp_fixup().
The crash call path looks as below:
soc_pcm_hw_params()
snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
rtd->dai_link->be_hw_params_fixup(rtd, params)
kabylake_ssp_fixup()
In this case, codec_params is just a copy of an internal structure and is
not embedded into struct snd_soc_dpcm thus we cannot use
container_of() on it.

Best regards,
Lukasz

pon., 29 cze 2020 o 18:51 N, Harshapriya <harshapriya.n@intel.com> napisa=
=C5=82(a):
>
> > -----Original Message-----
> > From: =C5=81ukasz Majczak <lma@semihalf.com>
> > Sent: Monday, June 29, 2020 4:11 AM
> > To: N, Harshapriya <harshapriya.n@intel.com>
> > Cc: alsa-devel@alsa-project.org; Pierre-Louis Bossart <pierre-
> > louis.bossart@linux.intel.com>; Jie Yang <yang.jie@linux.intel.com>; Ra=
doslaw
> > Biernacki <rad@semihalf.com>; Ross Zwisler <zwisler@google.com>; linux-
> > kernel@vger.kernel.org; Liam Girdwood <liam.r.girdwood@linux.intel.com>=
;
> > Bob Brandt <brndt@google.com>; Marcin Wojtas <mw@semihalf.com>; Alex
> > Levin <levinale@chromium.org>
> > Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
> > be_hw_params_fixup function
> >
> > Hi Harsha,
> >
> > We would like to continue the work on this, could you please suggest th=
e
> > correct approach.
> >
> > Best regards,
> > Lukasz
> >
> > czw., 21 maj 2020 o 20:10 Pierre-Louis Bossart <pierre-
> > louis.bossart@linux.intel.com> napisa=C5=82(a):
> > >
> > >
> > >
> > > On 5/21/20 12:30 PM, =C5=81ukasz Majczak wrote:
> > > > Hi Pierre
> > > >
> > > > If you will take a look at the original kabylake_ssp_fixup() you
> > > > will see that it is checking whether the related FE is "Kbl Audio
> > > > Port", "Kbl Audio Headset Playback", "Kbl Audio Capture Port" or
> > > > "Kbl Audio DMIC cap" - then for the first 3 cases it sets min/max
> > > > channels to 2 while for the "Kbl DMIC cap" it can be 2 or 4, that's
> > > > is why I'm trying to split this, but maybe I'm missing here somethi=
ng.
> > >
> > > I don't understand this code either.
> > >
> > > I believe the intent is that for all SSP1-RT5663 usages, we should us=
e
> > >
> > >                 rate->min =3D rate->max =3D 48000;
> > >                 chan->min =3D chan->max =3D 2;
> > >                 snd_mask_none(fmt);
> > >                 snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> > >
> > > That is pretty easy to move to a dedicated ssp1 fixup.
> > >
> > > for SSP0, we have RT5514 for capture and max98927 for playback, but
> > > the existing code does not explicitly deal with rate/channels/format
> > > for all cases, so it's not clear what should happen.
> > >
> > > Harsha, can you help here?
> Apologies for missing the email I had to respond to.
>
> SSP0 - has the speakers
> SSP1 - has headset and dmic
> For speakers and headsets its 48Khz, 2 ch and 24 bit and this setting is =
done based on the front-end dai
> For speakers, however support only 16 bit, so we set it back to 16 bit
> If the front end dai is dmic, then the channel is set to either 2 or 4 dm=
ic_constraints. No other formats need to be set.
>
> All the SSP1 usages do not have the same parameters (as dmic is on SSP1 a=
nd its different as given above)
> Most parameters are same for speakers and headset which are on different =
SSP. This is the reason we had a single fixup function.
>
> Is there a reason why the fixup function needs to be split?
>
> > >
> > > >
> > > > Best regards,
> > > > Lukasz
> > > >
> > > > czw., 21 maj 2020 o 19:17 Pierre-Louis Bossart
> > > > <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> > > >>
> > > >>
> > > >>
> > > >> On 5/21/20 12:08 PM, =C5=81ukasz Majczak wrote:
> > > >>>>
> > > >>>> don't add a new dailink, this is not right.
> > > >>>>
> > > >>> Can you advise a better solution how to assign different fixup
> > > >>> functions to mic and to speakers? I was looking at "dmic01"
> > > >>> dailink in skl_nau88l25_max98357a.c as an example.
> > > >>
> > > >> I am not sure I follow. the DMICs are handled on a shared SSP, so
> > > >> how would one set a different fixup? The word length have to be th=
e same.
