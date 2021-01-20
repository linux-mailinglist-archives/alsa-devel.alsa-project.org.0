Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE62FD486
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 781FE180E;
	Wed, 20 Jan 2021 16:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 781FE180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611157861;
	bh=GxdbjQcTPJytaBVVINw6kNof/kNLAx78MW5YsJSUYDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmi5cGNm5FuW+GdrmMu9XFJ8hzbjVgaACOPQl47jJa82b/zsbxWbSQ364P8n7RidH
	 utxILxYxsje1M1ZKY4p1nP4HgajcU/2POtmMyVdmr0qwSWLKdI8/muMTF0Kx/DdeAr
	 trzaRmvxqqeww/e6eNUbWmK6sfWxrcSMv7H/4HFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14ABBF8019B;
	Wed, 20 Jan 2021 16:49:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA529F8016E; Wed, 20 Jan 2021 16:49:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D908F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D908F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="TlifsGuM"
Received: by mail-pj1-x1031.google.com with SMTP id cq1so2403445pjb.4
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W/v3Q1gR6haXAZwJYzyuelWfC+raxw6fkAKMseYCivY=;
 b=TlifsGuM3b7ZVREww0uhRgA1wb889kOry5EIxYhxpaOk1ajcJQavGVxczaQF6C3wLM
 bHAZv8JrxVozohsNBS1Uk7hbpjtfdCLf4LdRiSm/JIcuQJvlOVs3dkR5HCanHxeWT4jE
 yXUSf8pDsx+sBNePzm9WvJyi3/9ruv9mu8lD6HkRkBEnPv1QRGjH2BwFrXvogVdH+PDS
 XxnTmQE16A8lnplcAhR/yS3A3IpdNmMF34n7gFH1iY73gzmhoxFyVe8J1n+Sz1Jsyxpj
 +lFkN7CqeBzI58JLVJNP53LESg2ItPuVaiLH4Xy7CV6eKa+dBk8xasCpEfdAo/Pzo4r1
 GwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W/v3Q1gR6haXAZwJYzyuelWfC+raxw6fkAKMseYCivY=;
 b=oEY0zilt1/enYduy+f2wrJ3r+7tutagCiOYCigv55QgITbRky7rRQ3z2rDMXqVa3dG
 Q3FRYyct/cbrbMx36+d+YQ4BLptxXI5FuqZnBShEtMDtfB3pfQmoD9mwCRvhjDUCTEGX
 KFgwVNVK0VBuVurT09t1K34GaAZTjQjhi6t01M5UcCXIROT3c+VkGt/DBa/Kx5PH4S2v
 GcNystPHJztHZzOfDJSr80KUPTSYltNTBRJSsRNcp8xHT+K0kx4cGVLR3ReD3KExfaJS
 aVf0YCjsDVdus8J8LIHBG8VS/XfrIgtDHn4+9cST/btHlYR6X6UsxJ69aoOaFoQaVrE5
 WzoQ==
X-Gm-Message-State: AOAM5332Cjm5S6OxTxOTpLG1Jry0+jWliC7sZX56jQ4hOCqSnPzyYe2J
 GE62h8NLYDkfCoFuPUK2Wg5Dp57SgtRWnWR03N/iUg==
X-Google-Smtp-Source: ABdhPJzmMovobGbSomzJhznA7/YaMj3HSwZCsNUkR//BrFcyoT6sKDmhT17DpKWrH74xISIMxxwpCyk0tHVfxae91Rw=
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr6293320pjo.85.1611157756495; 
 Wed, 20 Jan 2021 07:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20201210121438.7718-1-lma@semihalf.com>
 <20201217130439.141943-1-lma@semihalf.com>
 <CAFJ_xbprw7UKREWgRAq3dDAA9oC_3cWoozn5pCY8w9By4dASag@mail.gmail.com>
In-Reply-To: <CAFJ_xbprw7UKREWgRAq3dDAA9oC_3cWoozn5pCY8w9By4dASag@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Wed, 20 Jan 2021 16:49:05 +0100
Message-ID: <CAFJ_xbrvr7jcCB57MPwzXf=oC5OYT5KUBkcqHYyOYH=a5njfSA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@google.com>
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

Hi Pierre,

Is there anything more to do to get the ACK for this patch?

Best regards,
Lukasz

wt., 12 sty 2021 o 12:34 =C5=81ukasz Majczak <lma@semihalf.com> napisa=C5=
=82(a):
>
> Hi,
>
> This is just a kind reminder. Is there anything more required to
> upstream this patch?
>
> Best regards,
> Lukasz
>
>
> czw., 17 gru 2020 o 14:06 Lukasz Majczak <lma@semihalf.com> napisa=C5=82(=
a):
> >
> > There is no check for the kcontrol against NULL and in some cases
> > it causes kernel to crash.
> >
> > Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format conf=
iguration according to information from NHLT")
> > Cc: <stable@vger.kernel.org> # 5.4+
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> > ---
> >  sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >  v1 -> v2: fixed coding style
> >
> > diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/s=
kylake/skl-topology.c
> > index ae466cd592922..8f0bfda7096a9 100644
> > --- a/sound/soc/intel/skylake/skl-topology.c
> > +++ b/sound/soc/intel/skylake/skl-topology.c
> > @@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct snd_soc_co=
mponent *component)
> >         int i;
> >
> >         list_for_each_entry(dobj, &component->dobj_list, list) {
> > -               struct snd_kcontrol *kcontrol =3D dobj->control.kcontro=
l;
> > -               struct soc_enum *se =3D
> > -                       (struct soc_enum *)kcontrol->private_value;
> > -               char **texts =3D dobj->control.dtexts;
> > +               struct snd_kcontrol *kcontrol;
> > +               struct soc_enum *se;
> > +               char **texts;
> >                 char chan_text[4];
> >
> > +               kcontrol =3D dobj->control.kcontrol;
> > +               if (!kcontrol)
> > +                       continue;
> > +
> > +               se =3D (struct soc_enum *)kcontrol->private_value;
> > +               texts =3D dobj->control.dtexts;
> > +
> >                 if (dobj->type !=3D SND_SOC_DOBJ_ENUM ||
> >                     dobj->control.kcontrol->put !=3D
> >                     skl_tplg_multi_config_set_dmic)
> > --
> > 2.25.1
> >
