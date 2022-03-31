Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB344ED3A7
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 07:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44A2118F6;
	Thu, 31 Mar 2022 07:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44A2118F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648706251;
	bh=tXwbSZidJ+4cFepu8Ve71uTN/vuIl3KViGM5IFUojT0=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3Eq0q+Iia//qiJH/4RTvW89G35ouCR95a2glt11uDVLiCC+iZXHhqjP0ZNlESpK+
	 tuV1OdUzKCSFcyswqlIvFxeVjAMGpJAkFzvyXxU48lfnmPDLYe7VshvBMZ/OIhM9yT
	 osav6mivp9rMpE3Q1XIE1q/xu2Y6+QZzL22oZp5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1E7F80238;
	Thu, 31 Mar 2022 07:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 413C7F80227; Thu, 31 Mar 2022 07:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3269F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 07:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3269F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qg5ukbq6"
Received: by mail-wr1-x42c.google.com with SMTP id w21so27548024wra.2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=/rBQoemRldR9qn2dcrk1Y9OIhDSxbESeKWQK6ukDSco=;
 b=Qg5ukbq6DCzmhALR3y5ZD6eIT6ct6AT4HfhBuFVNxoi5zcXzgMQU67Z0N0quYj+d/b
 ArOnQ3Pe25badQSkr51lmCb21ctNoDPd2EM6YbvM6VyFWhACZ7v7oxjFKdY5KiTnKt7N
 ksUrT5gl59FZi8teVpLu2LBubOD/tdDXvv4ARkxPX5qHJhqj7QqcMTIpwbP8ujuK6Utq
 lLIfpmvXe1/DKWjAbb8PQ6UrV2GERv0mtmVUDDUUbSk3d9gq+1zwz0tpZnG0Nc7cwA9T
 es2dZd7F8dJJTr5650ReOVIkpZn+tmrit9RLM1ruK37CcDZqYIsL/7NcOV9J3eaT4OiF
 ymHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/rBQoemRldR9qn2dcrk1Y9OIhDSxbESeKWQK6ukDSco=;
 b=RYHy3/sBO1dHdG5SgcsxL8+lO0nOOzEad09Yfw2NhQvvSKXeeADV2ke5gppJEUGU+/
 mlwy9FGwUyA1nwHYSUZJn/qZwRWdyBJfVP7PqCBTM80YDtxPdcygpYg4IkPM+RfRCuMg
 jLy374P34M3nIwD3SQ6cg7J0pIs9BIoKBKtW1Il+M1T6lnOQex8IvKHVJJbtmQIW3Kdg
 SLP8+mxOsxx+8TSigtggZ4L5XB0z6vAc+MFc9fklORSMzCp0Ujx9XYnyVhkd8aiAMYAZ
 DeO4xROvjM1tLOYEcaRGS6715OvI4XOKVb1d90AFWAeJHpVwAJr3YjzYapQmeTZWl71a
 aNTw==
X-Gm-Message-State: AOAM532gj7y2Apr1QZHP9S8zmzfdpocH/y1cDMn4hjGgdhc7fEFno/5I
 /JoSo3vkUAI9H4Aj6pAonZg=
X-Google-Smtp-Source: ABdhPJxgFSCX5IP/sZSCuEa0he4OSwPmqc6KupLwxvW9h6xvYBU+qf3FZIhm/bm6cS+hGVK010tWnA==
X-Received: by 2002:a5d:6e54:0:b0:204:635:42ba with SMTP id
 j20-20020a5d6e54000000b00204063542bamr2698956wrz.214.1648706173629; 
 Wed, 30 Mar 2022 22:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:773f:f600:109e:75b6:b898:ba52?
 (dynamic-2a01-0c22-773f-f600-109e-75b6-b898-ba52.c22.pool.telefonica.de.
 [2a01:c22:773f:f600:109e:75b6:b898:ba52])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d6d0c000000b001a65e479d20sm23221637wrq.83.2022.03.30.22.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 22:56:13 -0700 (PDT)
Message-ID: <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
Date: Thu, 31 Mar 2022 07:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On 09.03.2022 21:20, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). The proposed solution allows
> other drivers to adopt the same approach with minimal effort.
> With the patch the error is gone and that's the debugfs entries.
> 
> /sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller
> 
> v2:
> - Reworked approach based on [0]
> 
> [0] https://www.spinics.net/lists/arm-kernel/msg960881.html
> 
> Heiner Kallweit (2):
>   ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
>   ASoC: meson: aiu: fix duplicate debugfs directory error
> 
>  include/sound/soc-component.h     | 4 ++++
>  sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
>  sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
>  sound/soc/meson/aiu.c             | 3 +++
>  sound/soc/soc-core.c              | 5 +++++
>  5 files changed, 18 insertions(+)
> 

Any feedback here?
