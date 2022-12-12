Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6164A8D0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA195189A;
	Mon, 12 Dec 2022 21:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA195189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670877635;
	bh=GT3TRbu0wS+gAJnt8cskMJqmf6egF8+87gHJhFIjC/g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JkTMVXU3XPW1bAZN5U2YfZ2q2w3E+PoISBJ3XWLrbKBtQTU6vYznNRUQa76GVO7Rq
	 qTrDklCt4ECRylibpyW/zQw6EOHQZu2Y/BkEVrEjzQ5LvZRFCIRMDZccd1IQhUeJcE
	 MOABaVtuCkXuCAwkuK3lRIDMHP2Wc6CYKXvjO0XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B72F804B4;
	Mon, 12 Dec 2022 21:39:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECACBF8042F; Mon, 12 Dec 2022 21:39:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3965F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3965F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=UUPEiTNo
Received: by mail-pl1-x633.google.com with SMTP id jn7so13310482plb.13
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 12:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1V6YZCuixXBtnljSmmkzf84F5+TnkqQmaqOCfTK0GNo=;
 b=UUPEiTNoA7jf6/LnVKjpw+tgF63l1h+wqULLj0FrwYVmkDYhVmM4BTbzWE4h10XCbw
 gMbaKnhOpdt2IYlZBwxgufcPpWx75KZJGkpBSD1+jeKi0mEd4CwN5y1Kbjv6NPCMszRt
 bBwEaEDBAKuiUpW8Lg39GC9fIbolf2ZchWRC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V6YZCuixXBtnljSmmkzf84F5+TnkqQmaqOCfTK0GNo=;
 b=1741dwvorCI/Ep1g9HeVlYXYhXYtWcR7fogY9xflj3UkBNZ68cljCDvgaC01s/uG5/
 BfwnK/4+CiJ4xHVQkqqDs+RHULO1jhbyYdqnSEF13rK9j6slAMm/rCdXrlub60ckWaz1
 cJ8WkKAkdjXQWP8SC1O1RrYIE1BrrjAAW70YtXA9D2izNJRLkvxK07qKKv0nHnCc/zET
 lyVyKNEC+v4GrcvsdTSVxFGDQwlKMj5lZ+p+qYcVua+16DOLvgSMWdKhs/ZUq+waKsrD
 AYbmv9d2dofL5ECbsWKYBhTorBPl2SoJsHm0EJNInPggUmynGvKLhdughLNaJu3Gq7qH
 csUQ==
X-Gm-Message-State: ANoB5pmADMTbsmc2NNgKMZyEUlKBsYztU1D9l/uD1KBQakoB7joMRW+j
 U5Vq3flXYbRQWM53HEuHbxyDAzo6x/xK/2b76V4=
X-Google-Smtp-Source: AA0mqf5itsHIuECEuXtrDcbzNBTcoe2O0cQqyoxKutf3xEEMDYjDXbePsdBDgZgUV1Pgfnsh8N22pg==
X-Received: by 2002:a17:902:7609:b0:185:441e:6ef3 with SMTP id
 k9-20020a170902760900b00185441e6ef3mr18356576pll.61.1670877571712; 
 Mon, 12 Dec 2022 12:39:31 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 h8-20020a170902680800b00186ffe62502sm6776246plk.254.2022.12.12.12.39.30
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 12:39:30 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso1220760pjt.0
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 12:39:30 -0800 (PST)
X-Received: by 2002:a17:902:ce04:b0:174:af35:4b90 with SMTP id
 k4-20020a170902ce0400b00174af354b90mr78902745plg.8.1670877569645; Mon, 12 Dec
 2022 12:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <20221209114529.3909192-2-kai.vehmanen@linux.intel.com>
In-Reply-To: <20221209114529.3909192-2-kai.vehmanen@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Dec 2022 21:39:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCthQdgxeowFMbGUfTvBNVh0iJMBCRRdi4WjazOJ4r1uww@mail.gmail.com>
Message-ID: <CANiDSCthQdgxeowFMbGUfTvBNVh0iJMBCRRdi4WjazOJ4r1uww@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA
 stop has failed"
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.de,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 broonie@kernel.org, Archana Patni <archana.patni@intel.com>,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi kai

nit: I think you have an extra " at the end of the subject

Thanks for the patch!

On Fri, 9 Dec 2022 at 12:46, Kai Vehmanen <kai.vehmanen@linux.intel.com> wr=
ote:
>
> If system shutdown has not been completed cleanly, it is possible the
> DMA stream shutdown has not been done, or was not clean.
>
> If this is the case, Intel TGL/ADL HDA platforms may fail to shutdown
> cleanly due to pending HDA DMA transactions. To avoid this, detect this
> scenario in the shutdown callback, and perform an additional controller
> reset. This has been tested to unblock S5 entry if this condition is
> hit.
>
> Co-developed-by: Archana Patni <archana.patni@intel.com>
> Signed-off-by: Archana Patni <archana.patni@intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  sound/soc/sof/intel/hda-dsp.c | 72 +++++++++++++++++++++++++++++++++++
>  sound/soc/sof/intel/hda.h     |  1 +
>  sound/soc/sof/intel/tgl.c     |  2 +-
>  3 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.=
c
> index 5fa29df54b42..b4eacae8564c 100644
> --- a/sound/soc/sof/intel/hda-dsp.c
> +++ b/sound/soc/sof/intel/hda-dsp.c
> @@ -878,6 +878,78 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 ta=
rget_state)
>         return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
>  }
>
> +static unsigned int hda_dsp_check_for_dma_streams(struct snd_sof_dev *sd=
ev)
> +{
> +       struct hdac_bus *bus =3D sof_to_bus(sdev);
> +       struct hdac_stream *s;
> +       unsigned int active_streams =3D 0;
> +       int sd_offset;
> +       u32 val;
> +
> +       list_for_each_entry(s, &bus->stream_list, list) {
> +               sd_offset =3D SOF_STREAM_SD_OFFSET(s);
> +               val =3D snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
> +                                      sd_offset);
> +               if (val & SOF_HDA_SD_CTL_DMA_START)
> +                       active_streams |=3D BIT(s->index);
> +       }
> +
> +       return active_streams;
> +}
> +
> +static int hda_dsp_s5_quirk(struct snd_sof_dev *sdev)
> +{
> +       int ret;
> +
> +       /*
> +        * Do not assume a certain timing between the prior
> +        * suspend flow, and running of this quirk function.
> +        * This is needed if the controller was just put
> +        * to reset before calling this function.
> +        */
> +       usleep_range(500, 1000);
> +
> +       /*
> +        * Take controller out of reset to flush DMA
> +        * transactions.
> +        */
> +       ret =3D hda_dsp_ctrl_link_reset(sdev, false);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(500, 1000);
> +
> +       /* Restore state for shutdown, back to reset */
> +       ret =3D hda_dsp_ctrl_link_reset(sdev, true);
> +       if (ret < 0)
> +               return ret;
> +
> +       return ret;
> +}
> +
> +int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
> +{
> +       unsigned int active_streams;
> +       int ret, ret2;
> +
> +       /* check if DMA cleanup has been successful */
> +       active_streams =3D hda_dsp_check_for_dma_streams(sdev);
> +
> +       sdev->system_suspend_target =3D SOF_SUSPEND_S3;
> +       ret =3D snd_sof_suspend(sdev->dev);
> +
> +       if (active_streams) {
> +               dev_warn(sdev->dev,
> +                        "There were active DSP streams (%#x) at shutdown=
, trying to recover\n",
> +                        active_streams);
> +               ret2 =3D hda_dsp_s5_quirk(sdev);
> +               if (ret2 < 0)
> +                       dev_err(sdev->dev, "shutdown recovery failed (%d)=
\n", ret2);
> +       }
> +
> +       return ret;
> +}
> +
>  int hda_dsp_shutdown(struct snd_sof_dev *sdev)
>  {
>         sdev->system_suspend_target =3D SOF_SUSPEND_S3;
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 022ce80968dd..caccaf8fba9c 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -592,6 +592,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev);
>  int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
>  int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
>  int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
> +int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev);
>  int hda_dsp_shutdown(struct snd_sof_dev *sdev);
>  int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
>  void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
> diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
> index 30f2f49ee149..58ac3a46e6a7 100644
> --- a/sound/soc/sof/intel/tgl.c
> +++ b/sound/soc/sof/intel/tgl.c
> @@ -60,7 +60,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
>         memcpy(&sof_tgl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_d=
sp_ops));
>
>         /* probe/remove/shutdown */
> -       sof_tgl_ops.shutdown    =3D hda_dsp_shutdown;
> +       sof_tgl_ops.shutdown    =3D hda_dsp_shutdown_dma_flush;
>
>         if (sdev->pdata->ipc_type =3D=3D SOF_IPC) {
>                 /* doorbell */
> --
> 2.38.1
>


--=20
Ricardo Ribalda
