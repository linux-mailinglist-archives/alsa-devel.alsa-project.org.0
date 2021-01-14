Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190B2F5BEF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 09:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD82B1683;
	Thu, 14 Jan 2021 09:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD82B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610611340;
	bh=pumRICp3iKAIdt0JlDIrf6H4RaG2UgbAmO+kJJF50TM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bouGDMsVCIyPXsEm1kT4o7lqLBrvzSj/xYa0jsLchT1PVSr+2yUfeGmWXd906QWRK
	 hdN0iif2IqtEUXjhp2twZhdbK+Mhzo1FxQ2hk6v2sKLDPxxm5X+Tf65NT1F8JGZAaL
	 3ESSPI3qWTAlMYQi3hpgGPwGoSWAgmGhtqR7ynCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F77AF80249;
	Thu, 14 Jan 2021 09:00:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC944F8025E; Thu, 14 Jan 2021 09:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E241F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 09:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E241F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="UzedJ5vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610611225;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=bkNGPZ13uWjd8cczvmb4km7OHCtXFosYNbuypWXDBRA=;
 b=UzedJ5vuos1XF03EOqifoPktwAvXbjPUyjA0984idny3/RSYFY2PnSmv1kObOfaDoc
 JeWBYxlrist8/hgpnlzdIk76XRQfvfq84BtF5z0+vE1Xxq2LMiXrBwn/55c9FgYCG3ft
 ArQEoM/cRDzfJVZo8nhHwpiXrXPys74WVHnU2w7OWo7ht/E4/kUMGNI2mKx79p9/ocpp
 o01o6seq8M+nDK9ReVK4/pUvTWwxVngSBtqeHHzUKHzPiCgxSKGg6NKyxyrSmJcC1NAX
 w/TOL6FH9h5m4EB0MRjI0Ch5rkZ3dbG+BH2NqzSWwIUcVApkgqooz+RV247JKpnnBIU4
 npNw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j5IczAa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0E80Ch2A
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 14 Jan 2021 09:00:12 +0100 (CET)
Date: Thu, 14 Jan 2021 08:59:59 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support
 audio over dp port
Message-ID: <X//58kig1QK4htdA@gerhold.net>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
 <244e74f6-fa8c-692a-aa84-4677a0fd815b@linaro.org>
 <X/9TS6bQa3Zh+EXa@gerhold.net>
 <4b34bd4f-e7bc-84f9-5e8a-b2348c17b7aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b34bd4f-e7bc-84f9-5e8a-b2348c17b7aa@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, agross@kernel.org,
 rohitkr@codeaurora.org, broonie@kernel.org, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
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

Hi,

On Wed, Jan 13, 2021 at 10:24:49PM +0000, Srinivas Kandagatla wrote:
> On 13/01/2021 20:08, Stephan Gerhold wrote:
> > On Thu, Oct 08, 2020 at 06:37:40AM +0100, Srinivas Kandagatla wrote:
> > > On 08/10/2020 06:16, Srinivasa Rao Mandadapu wrote:
> > > > These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
> > > > Asoc. It includes machine driver, cpu driver, platform driver updates for
> > > > HDMI path support, device tree documention, lpass variant structure
> > > > optimization and configuration changes.
> > > > These patches depends on the DP patch series
> > > > https://patchwork.kernel.org/project/dri-devel/list/?series=332029
> > > > https://lore.kernel.org/patchwork/project/lkml/list/?series=464856
> > > > 
> > > > changes since V10:
> > > >       -- Moved hdmi regmap functions from lpass-hdmi.c to lpass-cpu.c
> > > >       -- Moved QCOM_REGMAP_FIELD_ALLOC macro from lpass-hdmi.c to lpass.h
> > > > changes since V9:
> > > >       -- Removed unused structures lpass_hdmi.h
> > > > changes since V8:
> > > >       -- Removed redundant structure wrapper for reg map field memebrs
> > > >       -- Updated lpass_hdmi_regmap_volatile API with appropriate registers as true
> > > >          and others as false.
> > > > changes since V7:
> > > >       -- Fixed typo errors
> > > >       -- Created Separate patch for buffer size change
> > > > changes since V6:
> > > >       -- Removed compile time define flag, which used for enabling
> > > >        HDMI code, based on corresponding config param is included.
> > > >       -- Updated reg map alloc API with reg map bulk API.
> > > >       -- Removed unnecessary line splits
> > > > changes since V5:
> > > >       -- Removed unused struct regmap *map in lpass_platform_alloc_hdmidmactl_fields.
> > > >       -- DMA alloc and free API signature change in lpass-apq8016.c, lpass-ipq806x.c
> > > >       -- Keeping API "irqreturn_t lpass_platform_hdmiif_irq" under ifdef macro
> > > > Changes Since v4:
> > > >       -- Updated with single compatible node for both I2S and HDMI.
> > > > Changes Since v3:
> > > >       -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
> > > > Changes Since v2:
> > > >       -- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
> > > > Changes Since v1:
> > > >       -- Commit messages are updated
> > > >       -- Addressed Rob Herring review comments
> > > > 
> > > > V Sujith Kumar Reddy (7):
> > > >     ASoC: Add sc7180-lpass binding header hdmi define
> > > >     ASoC: dt-bindings: Add dt binding for lpass hdmi
> > > >     Asoc:qcom:lpass-cpu:Update dts property read API
> > > >     Asoc: qcom: lpass:Update lpaif_dmactl members order
> > > >     ASoC: qcom: Add support for lpass hdmi driver
> > > >     Asoc: qcom: lpass-platform : Increase buffer size
> > > >     ASoC: qcom: sc7180: Add support for audio over DP
> > > > 
> > > >    .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++--
> > > >    include/dt-bindings/sound/sc7180-lpass.h           |   1 +
> > > >    sound/soc/qcom/Kconfig                             |   5 +
> > > >    sound/soc/qcom/Makefile                            |   2 +
> > > >    sound/soc/qcom/lpass-apq8016.c                     |   4 +-
> > > >    sound/soc/qcom/lpass-cpu.c                         | 249 ++++++++++++-
> > > >    sound/soc/qcom/lpass-hdmi.c                        | 258 ++++++++++++++
> > > >    sound/soc/qcom/lpass-hdmi.h                        | 102 ++++++
> > > >    sound/soc/qcom/lpass-ipq806x.c                     |   4 +-
> > > >    sound/soc/qcom/lpass-lpaif-reg.h                   |  49 ++-
> > > >    sound/soc/qcom/lpass-platform.c                    | 395 +++++++++++++++++----
> > > >    sound/soc/qcom/lpass-sc7180.c                      | 116 +++++-
> > > >    sound/soc/qcom/lpass.h                             | 124 ++++++-
> > > >    13 files changed, 1240 insertions(+), 143 deletions(-)
> > > >    create mode 100644 sound/soc/qcom/lpass-hdmi.c
> > > >    create mode 100644 sound/soc/qcom/lpass-hdmi.h
> > > > 
> > > 
> > > Tested this series on DragonBoard 410c
> > > 
> > > Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > I spent quite some time today trying to track down another regression
> > for MSM8916/DragonBoard 410c audio in 5.10 and identified this patch
> > series as the cause. So I'm very surprised that you successfully tested
> > this on DB410c.
> > 
> > Attempting to play HDMI audio results in:
> > 
> >    ADV7533: lpass_platform_pcmops_hw_params: invalid  interface: 3
> >    ADV7533: lpass_platform_pcmops_trigger: invalid 3 interface
> >    apq8016-lpass-cpu 7708000.audio-controller: ASoC: error at soc_component_trigger on 7708000.audio-controller: -22
> > 
> > Attempting to record analog audio results in:
> > 
> >    Unable to handle kernel NULL pointer dereference at virtual address 00000000000001e4
> >    Internal error: Oops: 96000004 [#1] PREEMPT SMP
> >    CPU: 1 PID: 1568 Comm: arecord Not tainted 5.11.0-rc3 #20
> >    Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> >    pc : regmap_write+0x14/0x80
> >    lr : lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
> >    Call trace:
> >     regmap_write+0x14/0x80
> >     lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
> >     snd_soc_component_open+0x2c/0x94
> >     ...
> > 
> > Looking at the changes in "ASoC: qcom: Add support for lpass hdmi driver"
> > there is a quite obvious mistake there. lpass.h now contains
> > 
> 
> We did hit these two bugs recently while June was testing a platform based
> of 410c.
> 
> we had to these 2 fixes in his dev branch
> 
> https://paste.ubuntu.com/p/MCbpBgH7JV/
> 

I fixed that one a bit differently in
"ASoC: hdmi-codec: Fix return value in hdmi_codec_set_jack()"
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-5.11&id=2a0435df963f996ca870a2ef1cbf1773dc0ea25a

It might be useful to implement the jack detection in adv7511, but
I guess we would also need some changes in sound/soc/qcom/apq8016_sbc.c
to setup SND_JACK_LINEOUT. And somehow there would need to be a way to
differentiate between the normal audio jack and the "HDMI jack".

> and a hack:
> https://paste.ubuntu.com/p/GYDSDmJt7Y/
> 
> I got side tracked with other stuff, so I could not cleanup the lpass hack
> patch to send it!
> 
> With this two patches June was able to test all the usecases for 410c.
> 
> [...]
> 
> We should probably consolidate these defines to a single lpass.h file in
> include/dt-bindings/ and not split them into soc specific.
> 

I agree, especially in case more special DAIs are added in the future.
However, in my patch I tried to avoid doing that for the following two reasons:

  - Changing dt-bindings after they are added is generally discouraged.

but more importantly:

  - lpass-ipq806x.c does not seem to have PRIMARY, SECONDARY, ...
    but something completely different. I know nothing about that
    platform so I would not know how to handle it.

I will post my patch and then you can decide.

Thanks,
Stephan
