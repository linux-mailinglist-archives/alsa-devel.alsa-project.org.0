Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F472FF1AB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:20:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DCE118F9;
	Thu, 21 Jan 2021 18:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DCE118F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611249647;
	bh=P1kN+CFYtLNTP9p/ADHFQqeavYmtRLjsyCCGS801Gb0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=syTPAeRjMuLjtQQZj5fC4/umZGes2cTvdTUOFA76D9IeZRgy9jKl4353PkYyhzWVE
	 uWQpnfOiSIhf3NFzrcUCcrcJGgNcTCy2wjtpW+8l2mcm1vZoskyWlQ7YvqWTfk3GCo
	 rgcKdhIDTAfekiWlYXir47LQSHKlu0x7QEUPcA94=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EA3F80125;
	Thu, 21 Jan 2021 18:19:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53E1BF80257; Thu, 21 Jan 2021 18:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5E6F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5E6F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eTIl8xYG"
Received: by mail-io1-xd29.google.com with SMTP id e22so5502148iog.6
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3S5/DXeaDQ8qpjJtyiUfgqJbVPCCQbbQmxHzoiqKbfw=;
 b=eTIl8xYGkfIvNkn7JUsAULTn7yxxSb7ObKhbaSAxe6brnlC2bWZO64DeYv/ErJ5mMt
 U23KiOWt3QUHQ1pgEgUSvj0hZQM4vUL6fmcDhh/uNfDx8b5aVxO+fnDC8m+0lCIiBCJS
 AmOlGhOjNWoe56S3vdMhEDTKlb3Pxl5xdwVMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3S5/DXeaDQ8qpjJtyiUfgqJbVPCCQbbQmxHzoiqKbfw=;
 b=mqRpDdXr6Lfz3Jt3qVeFocVbmi/qHTzUMZS2OihIXiK8y32sl50/2d+nReAO6JMZZY
 6WZHPxRAKC9Qu3tD+i2yUCWgpFAPeskXHnZgcDfOCrx/7mWElYURKfswY+bB0emVrawc
 gKa2oYKJYGrlZVLiizUfBcpIOvztfLK+JnNxId+tWUVEfYZbCFas6m1by0XKeKRNSBrO
 gmVVJ9N3XULf8dEup/VA1klHJ+mhT3U71uqZCJOCarn+JIasJzahbu04Smfnv7xipAN0
 kUJHoXfgBwfGHhAD3Jz+hwpzmTY6UT0LvPC+rjdFjTHhvCJ64fu9ueWjVQam8jB0kQ8+
 7gtg==
X-Gm-Message-State: AOAM532NET5Wv0KNDMaYws053ZOPyOXFeKuhqVpQvuYVgdVijiVCjzZD
 dS5JuRyw1RKCP993O3twFUnBHyTM7Fcdeg==
X-Google-Smtp-Source: ABdhPJxeNzw1tvzYPVqe/43pT5Gj5+pV0jBL+VI40EHTqVYwP8HDPdNVbVUEh9xltsafqtm6s17k7g==
X-Received: by 2002:a02:c043:: with SMTP id u3mr125617jam.137.1611249537669;
 Thu, 21 Jan 2021 09:18:57 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id h9sm3245124ili.43.2021.01.21.09.18.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 09:18:57 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id p72so5436064iod.12
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:18:56 -0800 (PST)
X-Received: by 2002:a05:6638:a1b:: with SMTP id
 27mr157986jan.144.1611249536281; 
 Thu, 21 Jan 2021 09:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20210121171644.131059-1-ribalda@chromium.org>
In-Reply-To: <20210121171644.131059-1-ribalda@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 21 Jan 2021 18:18:45 +0100
X-Gmail-Original-Message-ID: <CANiDSCuaB+7YwRG1uLMJjkOao7rsF6EB8rScDDiY8ynzQThFsw@mail.gmail.com>
Message-ID: <CANiDSCuaB+7YwRG1uLMJjkOao7rsF6EB8rScDDiY8ynzQThFsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Mateusz Gorski <mateusz.gorski@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lukasz Majczak <lma@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
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

This is just a v2 from my patch from December with the ={}: in a second patch.


Best regards!

On Thu, Jan 21, 2021 at 6:16 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:
>
> [   26.553358] BUG: kernel NULL pointer dereference, address:
> 0000000000000078
> [   26.561151] #PF: supervisor read access in kernel mode
> [   26.566897] #PF: error_code(0x0000) - not-present page
> [   26.572642] PGD 0 P4D 0
> [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> 5.4.81 #4
> [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.106.0 12/03/2019
> [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]
>
> Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  sound/soc/intel/skylake/skl-topology.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index ae466cd59292..1ef30ca45410 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3619,15 +3619,16 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>
>         list_for_each_entry(dobj, &component->dobj_list, list) {
>                 struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> -               struct soc_enum *se =
> -                       (struct soc_enum *)kcontrol->private_value;
> -               char **texts = dobj->control.dtexts;
> +               struct soc_enum *se;
> +               char **texts;
>                 char chan_text[4];
>
> -               if (dobj->type != SND_SOC_DOBJ_ENUM ||
> -                   dobj->control.kcontrol->put !=
> -                   skl_tplg_multi_config_set_dmic)
> +               if (dobj->type != SND_SOC_DOBJ_ENUM || !kcontrol ||
> +                   kcontrol->put != skl_tplg_multi_config_set_dmic)
>                         continue;
> +
> +               se = (struct soc_enum *)kcontrol->private_value;
> +               texts = dobj->control.dtexts;
>                 sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
>
>                 for (i = 0; i < se->items; i++) {
> --
> 2.30.0.296.g2bfb1c46d8-goog
>


-- 
Ricardo Ribalda
