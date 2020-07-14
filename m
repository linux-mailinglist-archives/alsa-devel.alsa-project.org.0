Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A821F116
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02CC1662;
	Tue, 14 Jul 2020 14:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02CC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729171;
	bh=tmIZKTZTurMqEP44rJ4xgDQd3eVrCYyPcxpG5rDQPQY=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ykxp4pPvpGw19lAVT48JGh3QzQ2XTJo8RZHV6lZ+DYBMnqNBO7UA0FF+JOX9fTyWk
	 p2OK61PqzM7v1xuvBI2tStuCOfuRMDEeJCy6AXZI15VGPHLqn8STIIxtKSkJexPcXp
	 E83x3NLOraVGSkRgQRePWghhw8RbCI+5bPUlDX3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE34F8014E;
	Tue, 14 Jul 2020 14:17:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A978F800E5; Tue, 14 Jul 2020 14:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from out-1.mail.amis.net (out-1.mail.amis.net [212.18.32.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50686F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50686F800E5
Received: from in-2.mail.amis.net (in-2.mail.amis.net [212.18.32.19])
 by out-1.mail.amis.net (Postfix) with ESMTP id 72A36822B5;
 Tue, 14 Jul 2020 14:17:35 +0200 (CEST)
Received: from in-2.mail.amis.net (localhost [127.0.0.1])
 by in-2.mail.amis.net (Postfix) with ESMTP id 6E3A8C9483;
 Tue, 14 Jul 2020 14:17:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amis.net
Received: from in-2.mail.amis.net ([127.0.0.1])
 by in-2.mail.amis.net (in-2.mail.amis.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 4rnEfJ5bJiX2; Tue, 14 Jul 2020 14:17:35 +0200 (CEST)
Received: from smtp1.amis.net (smtp1.amis.net [212.18.32.41])
 by in-2.mail.amis.net (Postfix) with ESMTP id 1B2B6C9406;
 Tue, 14 Jul 2020 14:17:35 +0200 (CEST)
Received: from [192.168.69.116] (89-212-21-243.static.t-2.net [89.212.21.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by smtp1.amis.net (Postfix) with ESMTPSA id E1E51C2DD3;
 Tue, 14 Jul 2020 14:17:34 +0200 (CEST)
To: alsa-devel@alsa-project.org
From: Primoz Fiser <primoz.fiser@norik.com>
Subject: ASoC: codecs: wm9712: Mux no paths errors
Message-ID: <b050f906-35e7-b9a8-ea9d-93786ea5006a@norik.com>
Date: Tue, 14 Jul 2020 14:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org
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

Hi all,

I have a sound setup based on fsl_ssi + wm9712 codec.

On every drivers load I get the following console error:

>> [ 5666.776770] wm9712-codec wm9712-codec: ASoC: mux Capture Phone Mux has no paths
>> [ 5666.784281] wm9712-codec wm9712-codec: ASoC: mux Differential Source has no paths

What is the proper way to get rid of this errors?

As a temporary solution I have ifdef-ed the following muxes from the 
driver like so:

> @@ -364,8 +365,10 @@ SND_SOC_DAPM_MUX("Out3 Mux", SND_SOC_NOPM, 0, 0,
>         &wm9712_out3_mux_controls),
>  SND_SOC_DAPM_MUX("Speaker Mux", SND_SOC_NOPM, 0, 0,
>         &wm9712_spk_mux_controls),
> +#if 0
>  SND_SOC_DAPM_MUX("Capture Phone Mux", SND_SOC_NOPM, 0, 0,
>         &wm9712_capture_phone_mux_controls),
> +#endif
>  SND_SOC_DAPM_MUX("Left Capture Select", SND_SOC_NOPM, 0, 0,
>         &wm9712_capture_selectl_controls),
>  SND_SOC_DAPM_MUX("Right Capture Select", SND_SOC_NOPM, 0, 0,
> @@ -374,8 +377,10 @@ SND_SOC_DAPM_MUX("Left Mic Select Source", SND_SOC_NOPM, 0, 0,
>         &wm9712_mic_src_controls),
>  SND_SOC_DAPM_MUX("Right Mic Select Source", SND_SOC_NOPM, 0, 0,
>         &wm9712_mic_src_controls),
> +#ifdef 0
>  SND_SOC_DAPM_MUX("Differential Source", SND_SOC_NOPM, 0, 0,
>         &wm9712_diff_sel_controls),
> +#endif
>  SND_SOC_DAPM_MIXER("AC97 Mixer", SND_SOC_NOPM, 0, 0, NULL, 0),
>  SND_SOC_DAPM_MIXER("Left HP Mixer", AC97_INT_PAGING, 9, 1,
>         &wm9712_hpl_mixer_controls[0], ARRAY_SIZE(wm9712_hpl_mixer_controls)),

which works but feels like a dirty workaround, right?

How can this be properly fixed in the wm9712 driver or somewhere else?

BR,
Primoz



