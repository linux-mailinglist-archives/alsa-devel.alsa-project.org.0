Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83E2F2E05
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 12:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5075216EC;
	Tue, 12 Jan 2021 12:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5075216EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610451374;
	bh=0sJXwNUoqcpknyWiQ9C2dUNLQTO275ISStcVz1Fyf6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtRce4i/boki8xV5mumY/orMGqVc5RCwipnk8OopkaCDuIKHa+D0k8N1tpfQCyLkU
	 1PQD9QzFKH+yMklR1V/o9QMSkaFQw2TBm76c1ulfVTt0odtVmWhf1SPZn9hpPAxJr5
	 +J4EZOFLoFl/MZHZL1RQPcGCGiUfGPgh0llqB1gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E3BF80113;
	Tue, 12 Jan 2021 12:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B2A9F8025E; Tue, 12 Jan 2021 12:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B18F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B18F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="zi6iaFuV"
Received: by mail-qk1-x72c.google.com with SMTP id 22so1513824qkf.9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BAPb6vexy0PxRtXiUa5L0zEXfbkLceHCVsv7ebs5b1k=;
 b=zi6iaFuVYuUiKP2K8cPgOTQZ7OFwrTgmdC5T6KZgeikQEjRkOhtCbM4wKpyailZafU
 riOSqnVptS+vJJKV1UrBRFX66IHFMZCkFU+hZri2g/EljddrUUIY410Eh4RgOPCB026f
 GUsbErOQkL5zBFFSss88s0ovOkkP8UJaNmzBgSFOJavm0et8cuKqH1t0yru2F6ZestrN
 rf9umHxtU7XCCh0sSm2Yy5fFARZXc0GgZrcCScLWV8LxNmXSFFv/keQgz5HYIcDN1E5O
 8Mgy2FHcY1e6THAiPpzNw+NPLg953O+yN4SAXNUiXw6J9qaxC1lRk3bjEpiBaX25G/oH
 uUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BAPb6vexy0PxRtXiUa5L0zEXfbkLceHCVsv7ebs5b1k=;
 b=oRLSMf1iuvDMmpX6bcgti9TlG372kxRgT90b7PviNKoytbpWvTFqhMnoU2B2po6yFg
 9TZc/SW+KNtrRvmgUq36Da293AbUEeJt0PHE2+eRWdg5I/MtVzRnA/IrY11N/NViEhc8
 vxloWbcu7pfUv//gOaOU0IWLuCaWdL7SM2rzCTBftz1B63qKTKIkwIQgP3RReiHwBlKG
 YTx/kz5l0mkbOFA1pwsDHSHv9h+6HNLsESE+3/ioB5ultLdWbIKLWtgaPe1J65KY8PWU
 SZnc8fPJFB/I0aTOvhUd5JSSACtyYPluLmQwSQDoyufdm++o64KAGJBb0Px8/v0lWkae
 lE9w==
X-Gm-Message-State: AOAM531EZvAIRg4tr8Ri9QpriTKPbjeypQDgyCCzEpFYk/Zj26e1VyL3
 kU098x0T2vqT7929BsQXp9oK2+R/ugRm5f/T8DvksQ==
X-Google-Smtp-Source: ABdhPJyUSpCuEwwARgenIRd/aDCwRCB3v4+OhxHyhOyFHJY4qH28gQ1A/X5bMFhsiXYHkxCQfo4LCWZm/BDzP5iw6/M=
X-Received: by 2002:a37:418d:: with SMTP id o135mr4180829qka.426.1610451266538; 
 Tue, 12 Jan 2021 03:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20201210121438.7718-1-lma@semihalf.com>
 <20201217130439.141943-1-lma@semihalf.com>
In-Reply-To: <20201217130439.141943-1-lma@semihalf.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Tue, 12 Jan 2021 12:34:15 +0100
Message-ID: <CAFJ_xbprw7UKREWgRAq3dDAA9oC_3cWoozn5pCY8w9By4dASag@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@google.com>
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

Hi,

This is just a kind reminder. Is there anything more required to
upstream this patch?

Best regards,
Lukasz


czw., 17 gru 2020 o 14:06 Lukasz Majczak <lma@semihalf.com> napisa=C5=82(a)=
:
>
> There is no check for the kcontrol against NULL and in some cases
> it causes kernel to crash.
>
> Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format config=
uration according to information from NHLT")
> Cc: <stable@vger.kernel.org> # 5.4+
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> ---
>  sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>  v1 -> v2: fixed coding style
>
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/sky=
lake/skl-topology.c
> index ae466cd592922..8f0bfda7096a9 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct snd_soc_comp=
onent *component)
>         int i;
>
>         list_for_each_entry(dobj, &component->dobj_list, list) {
> -               struct snd_kcontrol *kcontrol =3D dobj->control.kcontrol;
> -               struct soc_enum *se =3D
> -                       (struct soc_enum *)kcontrol->private_value;
> -               char **texts =3D dobj->control.dtexts;
> +               struct snd_kcontrol *kcontrol;
> +               struct soc_enum *se;
> +               char **texts;
>                 char chan_text[4];
>
> +               kcontrol =3D dobj->control.kcontrol;
> +               if (!kcontrol)
> +                       continue;
> +
> +               se =3D (struct soc_enum *)kcontrol->private_value;
> +               texts =3D dobj->control.dtexts;
> +
>                 if (dobj->type !=3D SND_SOC_DOBJ_ENUM ||
>                     dobj->control.kcontrol->put !=3D
>                     skl_tplg_multi_config_set_dmic)
> --
> 2.25.1
>
