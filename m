Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A0664A8CB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC7B189A;
	Mon, 12 Dec 2022 21:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC7B189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670877459;
	bh=WZqNiC4nA5q4m5CqyHucGWPrZNB5LCTxRWz0Cbml/AI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sl9UWUByjLVMaPPTaeFgSV+fkGUFr0+H6pghsRSc890deqjJ3nE9qUJSJQX1ai/n5
	 n6CK1a1d/iwLYyZTDKPuwM79CCVO+9eYPKTzCTm1H0rO0oZ45gYVdHwy+5utVo7kvA
	 0tHTfu8Ahx/ljb2LlW9HRDQRfQbsQo0vU10KvpKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D14F80141;
	Mon, 12 Dec 2022 21:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF36F8042F; Mon, 12 Dec 2022 21:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 020B2F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 020B2F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=M/jEXQeg
Received: by mail-pl1-x635.google.com with SMTP id g10so13313287plo.11
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 12:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEcjmM5Re/+v4gW0VOGJ5VCSwc4Y8gVGp6Vhu28mqwQ=;
 b=M/jEXQegdnHGVlM4DZllDlptZWOtpNsGX3NILdjsUlZdBnlLMgixsKWgVcake2B4N7
 YpwxFVEcyZuKY9VghfLdMBLAU4mu2RezLaieVBWr5LDYhDdx9nuSuOXioOaz9JLwYaKv
 pDY4cvhgSZABtKZy+VRcsC5PnPuUGyG89QtKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEcjmM5Re/+v4gW0VOGJ5VCSwc4Y8gVGp6Vhu28mqwQ=;
 b=4C6rodFlDyKtPVQQv7ttWxv0NklkKDDcxr07u6v/lYiqRBe8ASNon3K64NZhYflM9x
 mqNCQX5NvxbTOhAPItTqlTI2dXbcSXU9t+tcbGzuRQQ04n2CDbeWOGC1+Smvg6pvKzbE
 jPIu3Uj7U0vqbCQSa3Hpnwoopx5LYBdGCkWdOfeY42J4uHhaLr91G5J3Ys8n3w0B6hTS
 VzOFcCsgo+bMD/A+AobXAejBh4HMEholY62gkA9mWmEkYIkeVO5R2HT0NDPpwAd7jDCq
 fZZIa8bpEUsJeKFMs5R9Pe5ppvDqpG2yn1EgiBGrDoXsHSQKLI4MdVpgIujuVdGfU1d5
 +0Sw==
X-Gm-Message-State: ANoB5pnW1K9u+68aBypPrGz04hyTLFLxbaQT9Nj7wVLUM36JUTVr3r33
 Ws7CndZ12nu775SWUrK/0jbSm1Lwp8UNt4dy
X-Google-Smtp-Source: AA0mqf7tjW24R9EXs5dz45JauLnLc+7zHgBV282G5xLFzimkeaUIXy3AX2Cd6bu+f0MxgLg4n1Qg0A==
X-Received: by 2002:a17:902:c14a:b0:189:6d2f:4bc7 with SMTP id
 10-20020a170902c14a00b001896d2f4bc7mr17831634plj.37.1670877395153; 
 Mon, 12 Dec 2022 12:36:35 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178]) by smtp.gmail.com with ESMTPSA id
 u15-20020a1709026e0f00b001894dc5fdf2sm6742886plk.296.2022.12.12.12.36.34
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 12:36:34 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id 142so9035098pga.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 12:36:34 -0800 (PST)
X-Received: by 2002:a05:6a00:3409:b0:577:f993:6786 with SMTP id
 cn9-20020a056a00340900b00577f9936786mr828321pfb.21.1670877393962; Mon, 12 Dec
 2022 12:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
In-Reply-To: <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Dec 2022 21:36:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCv28wbMOvjgsFc0T06tER3J9SoZ4cTZPHP0vkXz_5H8gg@mail.gmail.com>
Message-ID: <CANiDSCv28wbMOvjgsFc0T06tER3J9SoZ4cTZPHP0vkXz_5H8gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Revert: "core: unregister clients and
 machine drivers in .shutdown"
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

Hi Kai

Thanks for the patch. Just tested it on Alderlake-P

On Fri, 9 Dec 2022 at 12:46, Kai Vehmanen <kai.vehmanen@linux.intel.com> wr=
ote:
>
> The unregister machine drivers call is not safe to do when
> kexec is used. Kexec-lite gets blocked with following backtrace:
>
> [   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) =
done.
> [  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 secon=
ds.
> [  246.819035] Call Trace:
> [  246.821782]  <TASK>
> [  246.824186]  __schedule+0x5f9/0x1263
> [  246.828231]  schedule+0x87/0xc5
> [  246.831779]  snd_card_disconnect_sync+0xb5/0x127
> ...
> [  246.889249]  snd_sof_device_shutdown+0xb4/0x150
> [  246.899317]  pci_device_shutdown+0x37/0x61
> [  246.903990]  device_shutdown+0x14c/0x1d6
> [  246.908391]  kernel_kexec+0x45/0xb9
>
> This reverts commit 83bfc7e793b555291785136c3ae86abcdc046887.
>
> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  sound/soc/sof/core.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 3e6141d03770..625977a29d8a 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -475,19 +475,10 @@ EXPORT_SYMBOL(snd_sof_device_remove);
>  int snd_sof_device_shutdown(struct device *dev)
>  {
>         struct snd_sof_dev *sdev =3D dev_get_drvdata(dev);
> -       struct snd_sof_pdata *pdata =3D sdev->pdata;
>
>         if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>                 cancel_work_sync(&sdev->probe_work);
>
> -       /*
> -        * make sure clients and machine driver(s) are unregistered to fo=
rce
> -        * all userspace devices to be closed prior to the DSP shutdown s=
equence
> -        */
> -       sof_unregister_clients(sdev);
> -
> -       snd_sof_machine_unregister(sdev, pdata);
> -
>         if (sdev->fw_state =3D=3D SOF_FW_BOOT_COMPLETE)
>                 return snd_sof_shutdown(sdev);
>
> --
> 2.38.1
>


--=20
Ricardo Ribalda
