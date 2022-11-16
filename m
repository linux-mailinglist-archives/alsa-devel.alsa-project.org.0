Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3D62C185
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:57:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E871116A9;
	Wed, 16 Nov 2022 15:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E871116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668610625;
	bh=QlP42Fx/JuwOmRdSTtwWZ3hAH4WFE+BQsR2c4PKpqZY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVMfEkkXmI7+YpBWNz7jJvtJJDZsDhSPZvDEfd5i41lHFaDpU5B5Pw36eg3FonbKE
	 Cmq7RfCCVvFYsZ96TNn4JtqlE6NSz4AIkkZn9wlsWHCv7461ff/qB+IH7BoAJ919gw
	 VYLXBxE4m9hYEcMCN6c1cO+546iA2Rm31yonDAxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4863DF800B8;
	Wed, 16 Nov 2022 15:56:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78B7FF80549; Wed, 16 Nov 2022 15:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 669E5F800B8;
 Wed, 16 Nov 2022 15:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 669E5F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Q1owE4mj"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E340E660038D;
 Wed, 16 Nov 2022 14:55:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668610551;
 bh=QlP42Fx/JuwOmRdSTtwWZ3hAH4WFE+BQsR2c4PKpqZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q1owE4mjt4uoDXCVZqesuCU329WJhBtJfFeWuRjzkBwtbVWTFbs8PXXL3EA0G+rM3
 NvQ0SFmYZb5WmEMhglFUuNvxJfHzFrnND6Vw9gJjfDFEncvRofsxNavdcI+ZZSu6rt
 4YR0rTeYAqz4Tkl/SCWgOarlDfHdRwvEfBAVgOgpsoO2B3d91d4D4U7mIin9g56Flr
 F/j9NuPyoav8G+9VdH6GluMig2+Souuo3z7ODtXzWgm1pbgGGBpbujt90Zv3VHXtOv
 2OfDhRtVJLCC8rgvaWGr9mcJGyHLIv/QQqUsfLbR44L0M6EvNTI68OGSKoVvq0jObN
 kH6cZNLOS8dwQ==
Message-ID: <36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com>
Date: Wed, 16 Nov 2022 15:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/4] ASoC: SOF: Adding amd HS functionality to the sof core
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
 <20220913144319.1055302-4-Vsujithkumar.Reddy@amd.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220913144319.1055302-4-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Il 13/09/22 16:43, V sujith kumar Reddy ha scritto:
> Add I2S HS control instance to the sof core.
> This will help the amd topology to use the I2S HS Dai.
> 
> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

Hello,

Since this patch was merged, SoundOpenFirmware stopped working on MediaTek MT8195,
as it fails on DAI component creation (firmware side)... check below...

> ---
>   include/sound/sof/dai.h       |  2 ++
>   sound/soc/sof/ipc3-pcm.c      |  9 +++++++++
>   sound/soc/sof/ipc3-topology.c | 33 +++++++++++++++++++++++++++++++++
>   sound/soc/sof/topology.c      |  1 +
>   4 files changed, 45 insertions(+)
> 
> diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
> index 21d98f31a9ca..83fd81c82e4c 100644
> --- a/include/sound/sof/dai.h
> +++ b/include/sound/sof/dai.h
> @@ -84,6 +84,7 @@ enum sof_ipc_dai_type {
>   	SOF_DAI_AMD_BT,			/**< AMD ACP BT*/
>   	SOF_DAI_AMD_SP,			/**< AMD ACP SP */
>   	SOF_DAI_AMD_DMIC,		/**< AMD ACP DMIC */
> +	SOF_DAI_AMD_HS,			/**< Amd HS */
>   	SOF_DAI_MEDIATEK_AFE,		/**< Mediatek AFE */

Adding SOF_DAI_AMD_HS before SOF_DAI_MEDIATEK_AFE desynced this enumeration
so the DAI type is now 11 and not 10 anymore, leading to a failure in firmware
at IPC3 helper function `dai_get()`, as when `dai_find_type()` is called, the
DAI type that the firmware expects doesn't match with the one that gets sent
in the request message from the kernel.

As a local test, I tried moving SOF_DAI_AMD_HS after SOF_DAI_MEDIATEK_AFE and
this has restored full functionality on my MT8195 platform (Tomato Chromebook).

If SOF is supposed to guarantee backwards compatibility (and I believe it is),
this commit breaks that.

I would be tempted to send a commit that moves SOF_DAI_AMD_HS to the end, but
that would break the already compiled firmware for AMD platforms, so I am not
sure how to proceed.

So... how can we solve that?
Any ideas?

P.S.: Sharing some logs at the end of this email, just for completeness.

Best regards,
Angelo




.. Relevant firmware and kernel trace/debug log lines ..

Log from Xtensa DSP:
[      828266.737921] (           3.125000) c0 ipc 
src/ipc/ipc3/handler.c:1579 INFO ipc: new cmd 0x30010000
[      828273.404587] (           6.666667) c0 component 
src/ipc/ipc3/helper.c:296  INFO comp new dai <c2b00d27-ffbc-4150-a51a-245c79c5e54b> 
type 2 id 4.22
[      828284.342087] (          10.937500) c0 dai 
src/audio/dai.c:177  ERROR dai_new(): dai_get() failed to create DAI.
[      828291.321253] (           6.979167) c0 dai 
src/ipc/ipc3/helper.c:303  ERROR comp_new(): unable to create the new component
[      828295.383753] (           4.062500) c0 ipc 
src/ipc/ipc3/helper.c:624  ERROR ipc_comp_new(): component cd = NULL
[      828299.654586] (           4.270833) c0 ipc 
src/ipc/ipc3/handler.c:1248 ERROR ipc: pipe 4 comp 22 creation failed -22


Kernel log:
[   15.011677] sof-audio-of-mt8195 10803000.dsp: request_firmware 
mediatek/sof/sof-mt8195.ri successful
...............
[   15.021452] sof-audio-of-mt8195 10803000.dsp: Firmware info: version 2:0:0-df141
[   15.039661] sof-audio-of-mt8195 10803000.dsp: Firmware: ABI 3:21:0 Kernel ABI 3:23:0
[   15.039663] sof-audio-of-mt8195 10803000.dsp: found sof_ext_man header type 2 
size 0x70
[   15.039665] sof-audio-of-mt8195 10803000.dsp: Firmware info: used compiler XCC 
12:0:8 <RI-2019.1-linux> used optimization flags -O2

...........

[   15.107660] sof-audio-of-mt8195 10803000.dsp: Firmware: DBG_ABI 5:3:0
[   15.292019] sof-audio-of-mt8195 10803000.dsp: booting DSP firmware
[   15.292025] sof-audio-of-mt8195 10803000.dsp: HIFIxDSP boot from base : 0x40000000
[   15.297257] sof-audio-of-mt8195 10803000.dsp: ipc rx: 0x70000000: FW_READY
[   15.363305] sof-audio-of-mt8195 10803000.dsp: DSP is ready 0x70000000 offset 
0x800000
[   15.363319] sof-audio-of-mt8195 10803000.dsp: Firmware info: version 2:0:0-df141
[   15.383651] sof-audio-of-mt8195 10803000.dsp: Firmware: ABI 3:21:0 Kernel ABI 3:23:0

............

[   16.336460] sof-audio-of-mt8195 10803000.dsp: loaded host PCM16P
[   16.336461] sof-audio-of-mt8195 10803000.dsp:  config: periods snk 2 src 0 fmt 0
[   16.336466] sof-audio-of-mt8195 10803000.dsp: ipc tx: 0x30100000: GLB_TPLG_MSG: 
PIPE_NEW
[   16.336603] sof-audio-of-mt8195 10803000.dsp: widget PIPELINE.4.AFE3.IN setup 
complete
[   16.336607] sof-audio-of-mt8195 10803000.dsp: ipc tx: 0x30010000: GLB_TPLG_MSG: 
COMP_NEW
[   16.336663] sof-audio-of-mt8195 10803000.dsp: ipc tx error for 0x30010000 
(msg/reply size: 96/20): -22
[   16.336665] sof-audio-of-mt8195 10803000.dsp: Failed to setup widget AFE3.IN
[   16.336670] sof-audio-of-mt8195 10803000.dsp: ipc tx: 0x30110000: GLB_TPLG_MSG: 
PIPE_FREE
[   16.336778] sof-audio-of-mt8195 10803000.dsp: widget PIPELINE.4.AFE3.IN freed
[   16.336887] sof-audio-of-mt8195 10803000.dsp: error: tplg component load failed -22
[   16.336899] sof-audio-of-mt8195 10803000.dsp: error: failed to load DSP topology -22
[   16.336900] sof-audio-of-mt8195 10803000.dsp: ASoC: error at 
snd_soc_component_probe on 10803000.dsp: -22
[   16.336983] mt8195_mt6359 mt8195-sound: ASoC: failed to instantiate card -22
[   16.340339] mt8195_mt6359: probe of mt8195-sound failed with error -22
