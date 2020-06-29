Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFEA20CE18
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 13:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203A91655;
	Mon, 29 Jun 2020 13:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203A91655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593429198;
	bh=NYUvJhBblJZrME67onDv+j5/YkRR/3C2+AkGUG9P8Oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gnssLhUQeEYhXvdrIbR6+GzRYAQ4Qm7gH7vg2YU8qfFy/canDOuwwlf62DttIyxLp
	 aPUX8HV+KaOl5PrVrGIEEdjcv6IqD1AKG+IzSJKVq5czIoSC+lLTcTAmnTV1/DxcaE
	 qmQwkVrfv57odrf4/gwlfctSDOzPHs2yO0hCWZrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 138F8F8021D;
	Mon, 29 Jun 2020 13:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27753F80096; Mon, 29 Jun 2020 13:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C19CFF80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C19CFF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="Qlh/C2Si"
Received: by mail-qt1-x834.google.com with SMTP id q22so5957741qtl.2
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tfv7vMX8zqf+KfHaA8JVxdjImJiQttmClnXwjby4rK4=;
 b=Qlh/C2Si9KuqV8DlShjWN9r1U/ujzT7mJ0nPxB8gzmTL4bhYkHXavuQkfF24tWFJmu
 FiT4upWYrEjC51EgP6FDrfvijHlSw8249drYY8WoGCVarzqLsdvDUmczgxaI3cN9v99C
 46k9AKijYQpLkJxOF4HZWlPmOuYEIasBD96nLDDTAOhk72yZS7HqZ/E3ehGsKahZhy44
 H/K8RFCDW3lGgmL0899QJ40bautJESc9na0MWjfncH3Irp6P7RHcAVT1f+OgwQE8jg6N
 KSiYN3ep1hRPcDOLbzd6ackRDiAgvFHFKFWwzzhvhomoZeeHkuz16bCxtI06AUgQor18
 yvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tfv7vMX8zqf+KfHaA8JVxdjImJiQttmClnXwjby4rK4=;
 b=shJOds2qN6s0v21FiERmI7I0fq3h9d9O9g/lqT+6FmZ24/wRz3Htw7wPp4/W0sAfdV
 UKBZjBJBlOOonrHll5hf0PoxYnDi1tj/cpLOTTS5al35WMSR/g1v2VDJnOFNIPQirUWv
 VXC3cdfUHIYcntTfl7GOaLO9smY/oqaYz3/MWHq1636S5OFLrc/8nChE3Oj9H+8j9pYJ
 kbZ5+BY4jl1G9YALWszizxgwk7eg8vCM7b65DXHiFqzkS2w8IuqGJb1r8n51TyT51DOm
 SvjPShELb0tZbtKYJk8GK3roFRPkMD2tF6aWd5NEQI6r2akjZB6PRFkmGS+yLvZSLAvo
 t6rQ==
X-Gm-Message-State: AOAM530qGiFy4W1oG/+Jkdi3RHSEWimjRetxGhA8wc8REWDkT6MGwpE/
 4F/bdPwoderAprZSXsBk0srdDqtTGEV1GFxszWlfPA==
X-Google-Smtp-Source: ABdhPJwJlC3jb4FspekGZ2zZFbumeGe86bJU/RzU6zbSwvDGQ8M7H0EEjtLRjMJhl17j4fcbTxPiBr5Aq/KlXdtcz/Q=
X-Received: by 2002:ac8:1871:: with SMTP id n46mr14159717qtk.252.1593429086671; 
 Mon, 29 Jun 2020 04:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
In-Reply-To: <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Mon, 29 Jun 2020 13:11:15 +0200
Message-ID: <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Harsha Priya <harshapriya.n@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>
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

We would like to continue the work on this, could you please suggest
the correct approach.

Best regards,
Lukasz

czw., 21 maj 2020 o 20:10 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
>
>
> On 5/21/20 12:30 PM, =C5=81ukasz Majczak wrote:
> > Hi Pierre
> >
> > If you will take a look at the original kabylake_ssp_fixup() you will
> > see that it is checking whether the related FE is "Kbl Audio Port",
> > "Kbl Audio Headset Playback", "Kbl Audio Capture Port" or "Kbl Audio
> > DMIC cap" - then for the first 3 cases it sets min/max channels to 2
> > while for the "Kbl DMIC cap" it can be 2 or 4, that's is why I'm
> > trying to split this, but maybe I'm missing here something.
>
> I don't understand this code either.
>
> I believe the intent is that for all SSP1-RT5663 usages, we should use
>
>                 rate->min =3D rate->max =3D 48000;
>                 chan->min =3D chan->max =3D 2;
>                 snd_mask_none(fmt);
>                 snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
>
> That is pretty easy to move to a dedicated ssp1 fixup.
>
> for SSP0, we have RT5514 for capture and max98927 for playback, but the
> existing code does not explicitly deal with rate/channels/format for all
> cases, so it's not clear what should happen.
>
> Harsha, can you help here?
>
> >
> > Best regards,
> > Lukasz
> >
> > czw., 21 maj 2020 o 19:17 Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> >>
> >>
> >>
> >> On 5/21/20 12:08 PM, =C5=81ukasz Majczak wrote:
> >>>>
> >>>> don't add a new dailink, this is not right.
> >>>>
> >>> Can you advise a better solution how to assign different fixup
> >>> functions to mic and to speakers? I was looking at "dmic01" dailink i=
n
> >>> skl_nau88l25_max98357a.c as an example.
> >>
> >> I am not sure I follow. the DMICs are handled on a shared SSP, so how
> >> would one set a different fixup? The word length have to be the same.
