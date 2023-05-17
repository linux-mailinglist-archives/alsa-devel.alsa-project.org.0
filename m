Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3728708FCB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:21:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A15846;
	Fri, 19 May 2023 08:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A15846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477298;
	bh=cReIs5i7pc0uiqCg7lnH+JVrLBMItiFcQMbI2hu6JEM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i0u5lizbqWTcSPeL9HZDRkkQZJfEcsCly3Ivodg1NiOlz1AQbnfDIhKlBsj0B2xs3
	 7pQ6klt160Ejn8AzmByHavxm5RbRQlDH7LnCrt2O1e6OWHK/5qFHQ3esxTPyNY/sML
	 4iK13G3LVBww2SbBH+OELDNstYCsB8d+QEqRtZOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 904C3F805E2; Fri, 19 May 2023 08:18:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 660B4F805C1;
	Fri, 19 May 2023 08:18:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47871F80272; Wed, 17 May 2023 13:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A501F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A501F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H+lE8c1R
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so60567485e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684323839; x=1686915839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qiTbxTvoGmb0rvPSQY9gZGcVxttKCHNsaRhfGoOBfNA=;
        b=H+lE8c1Rv4Jv1dNud1rmbZ696J4yV9EhgBs/HEHcHJbNvoz4jueDXYVUAFunOxxrge
         lR5BcZRv2wOuVQCTnuAuUTNGTUZ3x996xqpJq6uOF02kTc9Td2JcYTvGeoB66KHGIUlM
         0ZYGDjTqcZeTyvMg1jHbPeOw8Eog+7FdyB2lr0jRiYNoasE77f1irLSgsszVgwyaZSFu
         f9DelUyAU2APkkFQfkH/GbtcI6b6ZcLrqwUz6TqUvrmEBeiO5AdJJdiVYsjW7I1kSwv/
         hwybYiTLJV3n7eTBTm0+hlicz3UUi3wY1LurMS2bFAFtQQp6ATgghGHCWrFqdFklJ3xV
         4B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684323839; x=1686915839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qiTbxTvoGmb0rvPSQY9gZGcVxttKCHNsaRhfGoOBfNA=;
        b=JWt+EBIWG64Umhd9h+5vXALbMuq9jGOcKLRORTt9BZNnYLT7mMe19NQv1RwGVgaD6u
         6rzVoEbcnoTaybW0uq2+y1zKbeZz1xMaaxAI/c19O0y/K17NHOA5tIzmrnRznfaLAaBX
         Ptyxt8E+wRfR0T82mQn/rOeO3RvSll8ljfHP0M7Fj1ZgETOGAIf6Id3h72cki45tSyn1
         ZyYuCU98VqssU3aQOYbMjDzNpj3ktrqH4tSWx7aD9aYUxS8/MIPZgpQUuZ39a9FIgxB9
         8J95mIGJvSoCYSqw2T9jcaA45/d09rXe1gkU21QaKBoQifVHX8oKU0kWaISmCUWt0J27
         S45A==
X-Gm-Message-State: AC+VfDyVs+id4uuJZOEcGua2DxrX8IRZ44Bs2nR0yAxoIcha2nl12R72
	xzmiDQT0nOFy6ZkvYIjcQMF/3g==
X-Google-Smtp-Source: 
 ACHHUZ4efk8RWsWM3C3GXVuiM4Fe1ECwS6n6ko2oL3mvhS40S1N5bQ+BMP2YacfFvyN/A4/M6Ki+FA==
X-Received: by 2002:a7b:c3ce:0:b0:3f4:2174:b28c with SMTP id
 t14-20020a7bc3ce000000b003f42174b28cmr1472582wmj.14.1684323839055;
        Wed, 17 May 2023 04:43:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003f421979398sm1981951wmb.26.2023.05.17.04.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:43:57 -0700 (PDT)
Date: Wed, 17 May 2023 14:43:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ranjani.sridharan@linux.intel.com
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: SOF: ipc4-pcm: reset all pipelines during FE DAI
 hw_free
Message-ID: <787a9124-e49c-4c1b-bcb3-fcf03b2695c8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NQWUHNOCIQMJUEZPW6FY43MGXHG4BSZK
X-Message-ID-Hash: NQWUHNOCIQMJUEZPW6FY43MGXHG4BSZK
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Ranjani Sridharan,

The patch 225f37b578a9: "ASoC: SOF: ipc4-pcm: reset all pipelines
during FE DAI hw_free" from May 15, 2023, leads to the following
Smatch static checker warning:

	sound/soc/sof/intel/hda-dai-ops.c:215 hda_ipc4_pre_trigger()
	warn: inconsistent returns '&ipc4_data->pipeline_state_mutex'.

sound/soc/sof/intel/hda-dai-ops.c
    178 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
    179                                 struct snd_pcm_substream *substream, int cmd)
    180 {
    181         struct sof_ipc4_fw_data *ipc4_data = sdev->private;
    182         struct snd_sof_widget *pipe_widget;
    183         struct sof_ipc4_pipeline *pipeline;
    184         struct snd_sof_widget *swidget;
    185         struct snd_soc_dapm_widget *w;
    186         int ret;
    187 
    188         w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
    189         swidget = w->dobj.private;
    190         pipe_widget = swidget->spipe->pipe_widget;
    191         pipeline = pipe_widget->private;
    192 
    193         mutex_lock(&ipc4_data->pipeline_state_mutex);
    194 
    195         switch (cmd) {
    196         case SNDRV_PCM_TRIGGER_START:
    197         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
    198                 break;
    199         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
    200         case SNDRV_PCM_TRIGGER_SUSPEND:
    201         case SNDRV_PCM_TRIGGER_STOP:
    202                 ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
    203                                                   SOF_IPC4_PIPE_PAUSED);
    204                 if (ret < 0)
    205                         goto out;

Originally we propagated the error code back on this path, but now we
are returning 0.  Was this intentional?

    206 
    207                 pipeline->state = SOF_IPC4_PIPE_PAUSED;
    208                 break;
    209         default:
    210                 dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
    211                 return -EINVAL;

Needs an unlock before returning.

    212         }
    213 out:
    214         mutex_unlock(&ipc4_data->pipeline_state_mutex);
--> 215         return 0;
    216 }

regards,
dan carpenter
