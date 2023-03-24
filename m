Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF66C753E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:55:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8A8EB5;
	Fri, 24 Mar 2023 02:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8A8EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679622957;
	bh=REOTEITK50+vh3MSCsfpwHIWblZn7MpWv9dFPaOlG0c=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K4B6MODEb2W3QBsVsiMMLE2IQNFVqKzTkIqmEnJWH7GCnqluZdV/7a6BrvoJsnYZ8
	 fBpsMpbS6djWn5+ehTJH6Us2QpezwMm80PMnzuzbvJCpS/23hg8J82vSZypLX03hNf
	 zQrdPdKix3B+4O8QEH+vArRs1S+Le6zxTSOFjrLg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B1FF8024E;
	Fri, 24 Mar 2023 02:55:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53740F8027B; Fri, 24 Mar 2023 02:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2164F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2164F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eziFaqej
Received: by mail-yb1-xb36.google.com with SMTP id i7so613526ybt.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679622894;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjw9hF1VqdmoHrY7ec4dOnY8KEiWEpFK1tLrgDIDPDw=;
        b=eziFaqejjMAv1eVg6WqiqVY3+kigp1I2BPEy4+djxCzBamXasUMj/2nDsi9ee4D+n3
         /TKg9FIIgIXfMv2ccPN9oZUZt44eOknQbY50mUVPw5mP+k830hiFIScd6i1NUgq375iT
         PsHEMoYC5ZEpfo0P9jrJd9AvQCURIaIyHKXMRdEfQ7RTKsshnJ68jwhDI8/yFVhZGGFk
         b9LCK2reeRD0+fUG7vNrXQpPtWHtITWLUvSl2Lw54dGV3LNqWkAwoBNOKyQ7MvgXjHhC
         /Rzzjc2T3Ew5XKN53mxoBAAE9CqHe+0IHFq+bf7mT6fG9CUbsVyKh0ChKYwJVw/wBdJ8
         xFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679622894;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjw9hF1VqdmoHrY7ec4dOnY8KEiWEpFK1tLrgDIDPDw=;
        b=x07x7puTaOLn6SbIp0mAK25oCOZME2HpIBK3XP1GNl+xAYWKMBg+938uJ2koqhmX4v
         2Dj4x1aq0nujWMgEhja7yWer2kEA+exQBUNR6EXzHKRfjvRHtLdGEevOJdUO7Sw/I4I4
         cyIaPwqGq3tZV0CQmqGdGk3WJ0a6DnTrsk3dFCPHX5bttQSPsS3OLkF5mHy95Y6DSjDB
         6hDjnJpnO2mpRP56HzL1RqET6T81HzsPGnabeNlSLH+B/Wq2r1oKUfEuvojB4XzKC2f8
         gTFCZzE64PK/4eI2bfnlqwy7S5x9oRjCB946cJH0pz0RAWtxEvv9oNnM3gOelxvEFN1J
         KsSw==
X-Gm-Message-State: AAQBX9fe025bMlbOJWXekeBMCATOPi5t2b8srK5CWtaZ9qPGQdSkWrjk
	B9HsLttdMI7dtmmNbB9PWIOzZ28p98f144+qY04=
X-Google-Smtp-Source: 
 AKy350Ydyuz+4Fe/nk2NQpBJ8nMQgVF3kz9s37elFvOGqH1xZln2OSjULGSmp6b8rFccUS18mE9s9Csi7GtQ7aCOQUI=
X-Received: by 2002:a05:6902:1009:b0:b6b:e967:920d with SMTP id
 w9-20020a056902100900b00b6be967920dmr288549ybt.13.1679622893642; Thu, 23 Mar
 2023 18:54:53 -0700 (PDT)
MIME-Version: 1.0
From: Zhu Ning <zhuning0077@gmail.com>
Date: Fri, 24 Mar 2023 09:54:41 +0800
Message-ID: 
 <CANPLYpBv82p-Fve-JgM=WDwUFp-VnKfG2yFvcGv8AT2roPEifw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables sound
 for systems with a ES8336 codec
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 5SAWJESFJU7QBPD7YGDL2UVI2WHR6DSZ
X-Message-ID-Hash: 5SAWJESFJU7QBPD7YGDL2UVI2WHR6DSZ
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, posteuca@mutex.one, tiwai@suse.com,
 yangxiaohua <yangxiaohua@everest-semi.com>, Ning Zhu <zhuning0077@gmail.com>,
 Zhu Ning <zhuning@everest-semi.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SAWJESFJU7QBPD7YGDL2UVI2WHR6DSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > The GPIO thing on Huawei Intel platform is too complicated, they use two GPIOs
> > for headphone and speaker, and the headphone GPIO is inverted, which means low
> > means on and high means off. Luckily there should be only one hardware config
> > for the AMD acp3x platform GPIO and you may just choose the correct one.
>
> There being two different GPIOs sounds like it just allows the headphone
> and speaker to be controlled separately - that seems more flexible, not
> a problem?

Yes it's called multi stream in Windows. However, extra GPIO causes
more confusion
in the driver.

> > There is no such situation, and the system doesn't produce sound from speaker
> > when headphones are plugged in. The user may manually open speaker using
> > amixer sset 'Speaker' on or pavucontrol.
>
> Again, you're describing a specific configuration - someone might want
> to do something different.

Hi Marian Postevca you may want to separate the GPIO control by adding Headphone
Power SND_SOC_DAPM_SUPPLY. You may also want to change the gpio
handling function
in the acp3x_es83xx_jack_events function.

static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
        SND_SOC_DAPM_SPK("Speaker", NULL),
        SND_SOC_DAPM_HP("Headphone", NULL),
        SND_SOC_DAPM_MIC("Headset Mic", NULL),
        SND_SOC_DAPM_MIC("Internal Mic", NULL),

+       SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
+                           acp3x_es83xx_headphone_power_event,
+                           SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
        SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
                            acp3x_es83xx_speaker_power_event,
                            SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
};

static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
        {"Headphone", NULL, "HPOL"},
        {"Headphone", NULL, "HPOR"},
+       {"Headphone", NULL, "Headphone Power"},

        {"Speaker", NULL, "HPOL"},
        {"Speaker", NULL, "HPOR"},
        {"Speaker", NULL, "Speaker Power"},
};

+static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
+                                           struct snd_kcontrol
*kcontrol, int event)
+{
+       struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
+
+       dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
+       if (SND_SOC_DAPM_EVENT_ON(event))
+               gpiod_set_value_cansleep(priv->gpio_headphone, true);
+       else
+               gpiod_set_value_cansleep(priv->gpio_headphone, false);
+
+       return 0;
+}
+
+static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
+                                           struct snd_kcontrol
*kcontrol, int event)
+{
+       struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
+
+       dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
+       if (SND_SOC_DAPM_EVENT_ON(event))
+               gpiod_set_value_cansleep(priv->gpio_speakers, true);
+       else
+               gpiod_set_value_cansleep(priv->gpio_speakers, false);
+
+       return 0;
+}
