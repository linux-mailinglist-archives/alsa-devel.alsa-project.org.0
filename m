Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8C6B5614
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 00:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA77218B9;
	Sat, 11 Mar 2023 00:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA77218B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678492602;
	bh=gWCrIQAIjd5XZRW/vE09X0yz6UogYDq9cnim+0nuoHs=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=du5b/s9hMOzK10+j82mOLBGqrQR3KU42A6Hxzo9fMA976cjBA5cwe78z9uODEqv9E
	 uTLTCwyu7zR5Lgg61GR/mjg265qQsIQyjcyC4DKH4qnsiuUY1KLxPkjBaehHZnq8YD
	 n0D7icHzQtCu/cIna32Ve85kTbjyvD4wTfKzqZvw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC19F80236;
	Sat, 11 Mar 2023 00:55:52 +0100 (CET)
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
 <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
In-Reply-To: <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
Date: Sat, 11 Mar 2023 07:55:21 +0800
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JI4A2CNUC57NUBKUAD2BCVIRG2UR4HAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167849255147.26.11242454718916669535@mailman-core.alsa-project.org>
From: Ajye Huang via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8B6F8042F; Sat, 11 Mar 2023 00:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29F05F800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 00:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29F05F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=hekJD/8G
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-540a12e0e78so26712187b3.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 15:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678492533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T67u9qiBnxZK6yM+YE+DE3Z4ixj9FN+kLodEfozavM=;
        b=hekJD/8GbJPOCYVthryCiglmil04QIVz2Wb49EuOE/weKVSADLVeLNz00i0R5VufQL
         GpT+ZXcfpWswyppZzie4XnOUCpFsDRjTtBKni9ggjuDx4ut2+R7U9+ftpMPwu0xwbWrM
         cJbQcupqnhiYYzK+9VQmG4+9qiNj0Sv9025l03X5pR5tIOFmOhsdzoKjCRxqFcC0fshv
         WYRxf9y2MOCnEgdM5kuZ/RkJGlAXESEMb5YUmf21IPkzl78JQp+Qdl4D5bV+qZ/4ayQ9
         kZo561kTK/XPG3ZHpywgd/wemUnSrRTmQgevgvaB3yrlSymWW6Y+SMJZZcxwOlKhpu+T
         e1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678492533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T67u9qiBnxZK6yM+YE+DE3Z4ixj9FN+kLodEfozavM=;
        b=m8YsUdfDVKTTh5xU6YrIfEICh+9OjF7SP0R9BPwmxsYcDySXG4hhyG7cN7ApT5TV6j
         fm/6x4k9RUhEZhj/olLW1ZYxzBhTQdfbhBrA0KFr20xs4Xzy7zY7NgpbGV8wXLcbQKOt
         nxcqWrte6pxfxU1YKGLtOiW/YrCWSYCjuINKPianTBMQOxiLEe0SDiTD37aEqA7mpUJq
         RLsEph/gCurYND1+/4sZjtn+1CmBCN9o8ehw3ZlaIjrUB4Z4kfRk4Xlxyabh8UPqJNe7
         1TnWawd7d6k+vU2pMu2ruXRu6bCofflbzg2jFUSx/zxKT6jlwHMMXOZKtmO7myn3hhRk
         x9PQ==
X-Gm-Message-State: AO0yUKWoTBnvJDp5C9oolMD1ZRrxwjISM1qWRz9fC2p/8YtB33TwO+XC
	/Eq7CsJE3hUc+6vymUdxi2MlFkUHC/XudUnGNNmGbA==
X-Google-Smtp-Source: 
 AK7set+wPxRik1vLXVOjZi47R3V+MThG93j9VO8C8SGLknV/y5pCvR1I7B5rqUkSyw2LwpPfYM/GuR7RJVFVs34KesI=
X-Received: by 2002:a81:af4e:0:b0:521:db3f:9e27 with SMTP id
 x14-20020a81af4e000000b00521db3f9e27mr17774983ywj.2.1678492532641; Fri, 10
 Mar 2023 15:55:32 -0800 (PST)
MIME-Version: 1.0
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
 <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
In-Reply-To: <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 11 Mar 2023 07:55:21 +0800
Message-ID: 
 <CALprXBYVFWDFkT5tnrj6Ef=+ibFLoBAnCnBHtZwSThDauN=uzw@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JI4A2CNUC57NUBKUAD2BCVIRG2UR4HAN
X-Message-ID-Hash: JI4A2CNUC57NUBKUAD2BCVIRG2UR4HAN
X-MailFrom: ajye_huang@compal.corp-partner.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JI4A2CNUC57NUBKUAD2BCVIRG2UR4HAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 11, 2023 at 6:46=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>

> It's best if you provide a series that enables BT offload across the
> board for ADL, if that's the intended goal.
Hi Pierre,

  {        .name =3D "adl_mx98357_rt5682",
        .driver_data =3D (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
                    SOF_RT5682_SSP_CODEC(0) |
                    SOF_SPEAKER_AMP_PRESENT |
                    SOF_RT5682_SSP_AMP(2) |
                    SOF_RT5682_NUM_HDMIDEV(4)),
    },
The "adl_mx98357_rt5682" is the sound card of the google "Brya" Board proje=
ct.
Because the SSP2 is used for the max98357 amplifier, so SSP2
bt_offload can't be enabled at the drv_name  "adl_mx98357_rt5682".
(The hardway layout I2S port2 connected to max98357 amplifier)

The other adl projects that enabled the bt_offload feature were
designed with ssp1 for amp, ssp2 for bt_offload based on pins
definition.
    {
        .name =3D "adl_rt1019_rt5682",
        .driver_data =3D (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
                    SOF_RT5682_SSP_CODEC(0) |
                    SOF_SPEAKER_AMP_PRESENT |
                    SOF_RT1019_SPEAKER_AMP_PRESENT |
                    SOF_RT5682_SSP_AMP(1) |
                    SOF_RT5682_NUM_HDMIDEV(4) |
                    SOF_BT_OFFLOAD_SSP(2) |
                    SOF_SSP_BT_OFFLOAD_PRESENT),
    },
thanks
