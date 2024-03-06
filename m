Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6287370E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 13:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E10868;
	Wed,  6 Mar 2024 13:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E10868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709729734;
	bh=czwmuKZynxP030wgUGa8GWEjB9o8Lc2TErJL0actoqk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R0ZAY5dkYF1wLrfg6IxfE66Hc4PvaGRQKy+hQYxghKwvSy5f1gOvzau+TaXcElvDj
	 pkYjJ4FZRaHfIytOiVH0eQZLBsWrfO+K4dcyuMDWz6PHG3uHkPrDkZSxaFAtDYvIZS
	 br2GIs3E9f6MlsiOfyLNBTGwycLxK3Tq1ZqecmAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D2D4F805A1; Wed,  6 Mar 2024 13:55:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D54F801F5;
	Wed,  6 Mar 2024 13:55:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF33F8024E; Wed,  6 Mar 2024 13:54:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D293F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 13:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D293F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KxfLIW5Z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4268keDm013652;
	Wed, 6 Mar 2024 06:54:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=dUnOWEoxp3SnJf2CLLou3NRw4azRYH8sTPSVS7jTw3c=; b=
	KxfLIW5ZslqURg+L4ZEH6tjKmxwt06qhWECFicj/THLPKjRvstRQgfQ6ki4e5PTf
	+35OntL91YPaaGaigZAWUN5i5TbjwCHRl25guPLLG2z81RcZ3yiuQUjaCbzCochX
	bQU8nHv+XY//hCf7NAkmc6MFc3OUw40//e0FS/nIMZsbMJOmTG+pHRq0/wiCS3bw
	4tN+R8jXnrpzETHN2UA5sVhuBV6POgzb47aptlax+m2xIIjJa8Jew17F/LkL/5BO
	q2+pJZvF7DHXCvdFa3y1+9K3jj6BoLvyYVEu88oCntCt11sFfKCy90/D/iJtTSJM
	oVoJuKZTokzobNHXdtxK6w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn930795-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:45 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Mar 2024
 12:54:43 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Wed, 6 Mar 2024 12:54:43 +0000
Received: from [198.61.64.14] (EDIN4L06LR3.ad.cirrus.com [198.61.64.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7BA69820241;
	Wed,  6 Mar 2024 12:54:43 +0000 (UTC)
Message-ID: <fedf6e86-ca14-4236-85c0-64205c63d7f9@opensource.cirrus.com>
Date: Wed, 6 Mar 2024 12:54:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-card: Fix missing locking in
 snd_soc_card_get_kcontrol()
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <patches@opensource.cirrus.com>
References: <20240221123710.690224-1-rf@opensource.cirrus.com>
 <878r33hf81.wl-tiwai@suse.de>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <878r33hf81.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YEs5JGMEo5VD8m1KlprrWBCx10iE2ihb
X-Proofpoint-ORIG-GUID: YEs5JGMEo5VD8m1KlprrWBCx10iE2ihb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EVFQAQ3KQ4MKQQN3ALEBYH23NM6W376Y
X-Message-ID-Hash: EVFQAQ3KQ4MKQQN3ALEBYH23NM6W376Y
X-MailFrom: prvs=07954e2aa0=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVFQAQ3KQ4MKQQN3ALEBYH23NM6W376Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/2/24 08:00, Takashi Iwai wrote:
> On Wed, 21 Feb 2024 13:37:10 +0100,
> Richard Fitzgerald wrote:
>>
>> snd_soc_card_get_kcontrol() must be holding a read lock on
>> card->controls_rwsem while walking the controls list.
>>
>> Compare with snd_ctl_find_numid().
>>
>> The existing function is renamed snd_soc_card_get_kcontrol_locked()
>> so that it can be called from contexts that are already holding
>> card->controls_rwsem (for example, control get/put functions).
>>
>> There are few direct or indirect callers of
>> snd_soc_card_get_kcontrol(), and most are safe. Three require
>> changes, which have been included in this patch:
>>
>> codecs/cs35l45.c:
>>    cs35l45_activate_ctl() is called from a control put() function so
>>    is changed to call snd_soc_card_get_kcontrol_locked().
>>
>> codecs/cs35l56.c:
>>    cs35l56_sync_asp1_mixer_widgets_with_firmware() is called from
>>    control get()/put() functions so is changed to call
>>    snd_soc_card_get_kcontrol_locked().
>>
>> fsl/fsl_xcvr.c:
>>    fsl_xcvr_activate_ctl() is called from three places, one of which
>>    already holds card->controls_rwsem:
>>    1. fsl_xcvr_mode_put(), a control put function, which will
>>       already be holding card->controls_rwsem.
>>    2. fsl_xcvr_startup(), a DAI startup function.
>>    3. fsl_xcvr_shutdown(), a DAI shutdown function.
>>
>>    To fix this, fsl_xcvr_activate_ctl() has been changed to call
>>    snd_soc_card_get_kcontrol_locked() so that it is safe to call
>>    directly from fsl_xcvr_mode_put().
>>    The fsl_xcvr_startup() and fsl_xcvr_shutdown() functions have been
>>    changed to take a read lock on card->controls_rsem() around calls
>>    to fsl_xcvr_activate_ctl(). While this is not very elegant, it
>>    keeps the change small, to avoid this patch creating a large
>>    collateral churn in fsl/fsl_xcvr.c.
>>
>> Analysis of other callers of snd_soc_card_get_kcontrol() is that
>> they do not need any changes, they are not holding card->controls_rwsem
>> when they call snd_soc_card_get_kcontrol().
>>
>> Direct callers of snd_soc_card_get_kcontrol():
>>    fsl/fsl_spdif.c: fsl_spdif_dai_probe() - DAI probe function
>>    fsl/fsl_micfil.c: voice_detected_fn() - IRQ handler
>>
>> Indirect callers via soc_component_notify_control():
>>    codecs/cs42l43: cs42l43_mic_shutter() - IRQ handler
>>    codecs/cs42l43: cs42l43_spk_shutter() - IRQ handler
>>    codecs/ak4118.c: ak4118_irq_handler() - IRQ handler
>>    codecs/wm_adsp.c: wm_adsp_write_ctl() - not currently used
>>
>> Indirect callers via snd_soc_limit_volume():
>>    qcom/sc8280xp.c: sc8280xp_snd_init() - DAIlink init function
>>    ti/rx51.c: rx51_aic34_init() - DAI init function
>>
>> I don't have hardware to test the fsl/*, qcom/sc828xp.c, ti/rx51.c
>> and ak4118.c changes.
>>
>> Backport note:
>> The fsl/, qcom/, cs35l45, cs35l56 and cs42l43 callers were added
>> since the Fixes commit so won't all be present on older kernels.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: 209c6cdfd283 ("ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card")
>> ---
>> It would be great if people could test the fsl/, qcom/, ti/rx51 and ak4418
>> drivers.
> 
> This fix itself looks correct, and I merged Mark's PR now.
> 
> But in general, it'd be better to use snd_ctl_find_id() and
> snd_ctl_find_id_unlocked() if possible.  Those standard APIs can use
> the fast Xarray lookup, and especially for the case like many ASoC
> drivers that expose hundreds of kcontrols, the performance gain
> becomes significant.
> 
> I see that there is no snd_ctl_find_mixer_id_unlocked() variant, but
> it should be trivial to add.
> 
> 

Yes, I'll have a look at that. I was thinking that it would be good
to have all the code to find controls in one place, instead of a special
case for ASoC. But I decided to make the bugfix with minimum changes.

> thanks,
> 
> Takashi

