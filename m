Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB876B688
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 16:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27E1828;
	Tue,  1 Aug 2023 15:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27E1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690898415;
	bh=kgqZ0lldSdcQ5l23zB1YhBHtJZ1dHUDF3WWEdbGGXw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJY7D00AR+ELimNAT4EOrcuC7CzyE6oOJ5DRj4R/mTacgyRQQi2DML7eKFyy7WC9x
	 gxOq1NIBwNRnmcFsC8NlxKGMqR+LI74Dik3DLD4F70EEVq5O7fBhYMw7EYfipIF0z+
	 etzBJE4sGjOXIU39gMIIXeYECoE5kw+KEC21A+EA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59CF3F80552; Tue,  1 Aug 2023 15:58:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C40F80544;
	Tue,  1 Aug 2023 15:58:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE30F80548; Tue,  1 Aug 2023 15:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44483F8025A
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 15:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44483F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VwPraxCe
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so6474188e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Aug 2023 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690898317; x=1691503117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LCAsr2bIL8kLMgkEwkdI+MgOLqKLakMLSAWcTBAIPs=;
        b=VwPraxCeRIr2mAW9uLS3E1/rWkUsOFaKUUwtl5DRFP4MAwgK6s8t3MTB+pSty7hiU0
         vAbe3m1AJM5QMtYLXqCLXQtDM9GKEKyysMuWgczAMYNGC6kNV7bucErLjdVFC4TSUM3p
         P9fgJGHDX8mAw16H57HZcG1xNLdIMVZBMBDoU7NBBtSLC8V6RJYR5G2xDvjQJq4ljzAL
         kACOqBSZewUf3PNLkJtg//OAJKCuvTXRSjsPLj6vPsqsJNzhbpDizI9uwnYcTzbFp/o3
         Ga5RHWYQabbaAgpChUI9ZoT52HMfbp9guSuW0o0v7GfpGa+pY8vlrmWeWfbC/kIDH2Lc
         3AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690898317; x=1691503117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LCAsr2bIL8kLMgkEwkdI+MgOLqKLakMLSAWcTBAIPs=;
        b=Ynd6XxPYwWPBWLwRAS7PG4OvQ6nkeRPyNrQf+kP0MpSWAHIiX6rupzqbFDIv4LQO9Q
         thUagevU+MwQP4IiBQmdfYHHTAPOa/R3MwreBdcBH1nmbfJBr9V9pkzFkwYcvHdEgiOL
         ukRDHHlhUaNiCCt5maTgTX/sDCFpJfTF7580j1nHeO1RUGa2OTzndd94QtqUaAHgFxzj
         BEF+5pxCBOz4IkgCms7u3E8arQQJpq3R1dW8dKD1ongA7fq5qbrlANrHYzxpp0nkYQej
         MpjPXgMwfJyl3RlLwUogYSrEkRAMiSZIm7tk+E/2zdE7OU79BmGa3659sNvz7Ut8VkBa
         t3yA==
X-Gm-Message-State: ABy/qLbTd3vzbwtUHNVbOfeJrEEm/rVhlgHn0vHP9CLK3nDDWUNy9Ic3
	6PSmVf7oJCaqde/dUeACoIXrERmEaI5Gwa8JciQ=
X-Google-Smtp-Source: 
 APBJJlEoNwnh+Ebgn0hDAnQlavgKTJxX9UrRWcPCk34A/XO9GiTaGag7RkbaBBxz7XtW7k0d504mj057GMahDehAfac=
X-Received: by 2002:a19:6514:0:b0:4fb:845d:9e8f with SMTP id
 z20-20020a196514000000b004fb845d9e8fmr1871744lfb.53.1690898316655; Tue, 01
 Aug 2023 06:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1690265540-25999-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 1 Aug 2023 16:58:24 +0300
Message-ID: 
 <CAEnQRZCzUkpE-ppSDqBzhTXZHphr+twSju=snSiMii9gR=v0nA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ASoC: fsl_asrc: define functions for memory to
 memory usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: Z2RI6VXEJGMZWQMHOBBY4COAZNGBPDBM
X-Message-ID-Hash: Z2RI6VXEJGMZWQMHOBBY4COAZNGBPDBM
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2RI6VXEJGMZWQMHOBBY4COAZNGBPDBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> +static int fsl_asrc_m2m_check_format(u8 dir, u32 rate, u32 channels, u32 format)
> +{
> +       u64 support_format = FSL_ASRC_FORMATS;
> +
> +       if (channels < 1 || channels > 10)
> +               return -EINVAL;
> +
> +       if (rate < 5512 || rate > 192000)
> +               return -EINVAL;
> +

I think we can avoid using magic numbers. Instead we could do:

#define FSL_ASRC_MIN_CHANNELS 1
/...
#define FSL_ASRC_MAX_RATE 192000


> +       if (dir == IN)
> +               support_format |= SNDRV_PCM_FMTBIT_S8;
> +
> +       if (!(1 << format & support_format))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +/* calculate capture data length according to output data length and sample rate */
> +static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
> +{
> +       unsigned int in_width, out_width;
> +       unsigned int channels = pair->channels;
> +       unsigned int in_samples, out_samples;
> +       unsigned int out_length;
> +
> +       in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
> +       out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
> +
> +       in_samples = input_buffer_length / in_width / channels;
> +       out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
> +       out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
> +
> +       return out_length;
> +}
> +
> +static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
> +{
> +       struct fsl_asrc *asrc = pair->asrc;
> +       struct fsl_asrc_priv *asrc_priv = asrc->private;
> +       int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
> +
> +       if (!asrc_priv->soc->use_edma)
> +               return wml * pair->channels;
> +       else
> +               return 1;
> +}
> +
> +static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
> +{
> +       struct fsl_asrc *asrc = pair->asrc;
> +       int i;
> +
> +       for (i = 0; i < pair->channels * 4; i++)
> +               regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
> +
> +       return 0;
> +}
> +
>  static int fsl_asrc_runtime_resume(struct device *dev);
>  static int fsl_asrc_runtime_suspend(struct device *dev);

<snip>

There is no implementation for _suspend although you mention it
in the commit message.

> + * @complete: dma task complete
> + * @sample_format: format of m2m
> + * @rate: rate of m2m
> + * @buf_len: buffer length of m2m
> + * @req_pair: flag for request pair


For example @complete field is not used in this patch. Maybe add it in the patch
that uses it?

I think is the same for other fields.
