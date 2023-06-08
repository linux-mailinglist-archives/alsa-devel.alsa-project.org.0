Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C359F727C6B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 12:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 869D66C1;
	Thu,  8 Jun 2023 12:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 869D66C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686219143;
	bh=Kdoa+A4zfK5hWYSR0TKThErEb7nbv61wEl1348h4gaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuaD27UO+OdXyucZ8tPAL+hugC97xr+lDhpfKEKMCG45orfhbcr8psrXSg3Si2dzT
	 vNdWnQG+0EzximQ/9xdPzjpcdGCTKr2hU0lL3+RWG4+xpcdJj2buhjzfQhM877AHlK
	 oZIIka++varNyINYqILxwH4DhTxJ3Fsfw9IFhJlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4432F80290; Thu,  8 Jun 2023 12:11:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7328DF80155;
	Thu,  8 Jun 2023 12:11:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8D40F80199; Thu,  8 Jun 2023 12:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74906F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 12:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74906F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AyyDL7/n
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC0EA64BBE;
	Thu,  8 Jun 2023 10:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5024FC4339B;
	Thu,  8 Jun 2023 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686219080;
	bh=Kdoa+A4zfK5hWYSR0TKThErEb7nbv61wEl1348h4gaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyyDL7/nsoNEq58sEyUvaSBc9emUHBAr26ahYp7M94RtClgMcJo9Wn8muPvy1ikI8
	 TAH+BTbHa9qgy+BWtRz0XMiOcCrLVWqRXXthYGZ1PmbZcd2zRxQa/NFzBkGr/4Ryy3
	 LqXYhjBU5OKpHSmZuz2OK7bue6KPruIITS9UdTB8Aa+VKQEV04AtGFX+qTghOdwW5R
	 080virOFb94yNCyq0rCsdxdcAGa6kTzoDdPxLOdhIQ96+5M41xVsK8VyxG4fIGG0vl
	 GKunDlCrB0AeggphUiWB5KYjqW5NHDbfu+/chQMk3ltW5VDUiElCTFu8zZdIkd5kkJ
	 b18w6LOI3dI3A==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q7CcK-0005ub-Sj; Thu, 08 Jun 2023 12:11:45 +0200
Date: Thu, 8 Jun 2023 12:11:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: vkoul@kernel.org, andersson@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Message-ID: <ZIGpYPrNYDlkRQIf@hovoldconsulting.com>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
 <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
 <5d6bcc6a-151e-ac21-2dd2-f72a91f562d5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d6bcc6a-151e-ac21-2dd2-f72a91f562d5@linaro.org>
Message-ID-Hash: VAXFQ4T3NJLYSBB4EK3ANRQV2J6MVTC2
X-Message-ID-Hash: VAXFQ4T3NJLYSBB4EK3ANRQV2J6MVTC2
X-MailFrom: johan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAXFQ4T3NJLYSBB4EK3ANRQV2J6MVTC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 07, 2023 at 10:36:40AM +0100, Srinivas Kandagatla wrote:
> On 05/06/2023 10:08, Johan Hovold wrote:
> > On Thu, May 25, 2023 at 02:38:08PM +0100, Srinivas Kandagatla wrote:
> >> During x13s audio testing we hit few corner cases due to issues
> >> in codec drivers and some obvious code bugs.
> >>
> >> Here are the fixes for those issues, mostly the issues are around
> >> devices loosing the sync in between runtime pm suspend resume path.
> >>
> >> With codec fixes along with these fixes, audio on x13s is pretty stable.

> >> Changes since v1:
> >> 	- dropped runtime pm changes patch as unable to reproduced it anymore
> >> 	- fixed clk stop flag as suggested by Pierre
> >> 	- rebased on top of linux-next
> > 
> > I tried to update to this series on my 6.4-rc5 branch for the X13s and
> > the above changes appear to lead to breakages again.
> > 
> These patches are based on linux next, we can not cleanly apply them on 
> rc5 i guess without the depended patches.

Yeah, I did the corresponding changes you did in v2 to v1 applied to
6.4-rc5 instead of backporting the dependencies.

> I have tried these patches with your rc4 branch along with other 
> depended patches my branch is at: 
> https://git.linaro.org/people/srinivas.kandagatla/linux.git/log/?h=wip/sc8280xp-v6.4-rc4
> 
> this works fine for me, not seeing any issues so far.
> tested both speakers and headset.
> 
> > Specifically, with the updated clk stop flag (simple_clk_stop_capable) I
> > see:
> > 
> > [   14.789533] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1
> > [   14.789717] qcom-soundwire 3330000.soundwire-controller: qcom_swrm_irq_handler: SWR bus clsh detected
> > [   14.796164] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1

So as we discussed of list, this particular issue was due to a mistake I
made when "backporting" your v2 where I forgot to invert the test when
replacing simple_clk_stop_capable with clk_stop_mode1.

> > and without the runtime pm patch that you dropped in v2 I get
> > intermittent (e.g. twice in five boots):
> > 
> > [   11.527301] snd-sc8280xp sound: ASoC: adding FE link failed
> > [   11.527409] snd-sc8280xp sound: ASoC: topology: could not load header: -517
> Never seen this, looks like some corrupted tplg to me.. I might be wrong.
> 
> > [   11.527557] qcom-apm gprsvc:service:2:1: tplg component load failed-517
> > [   11.527640] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
> > [   11.528079] snd-sc8280xp sound: ASoC: failed to instantiate card -22
> > [   11.533388] snd-sc8280xp: probe of sound failed with error -22
> > 
> > Again, this was with 6.4-rc5, but these problems are likely still there
> > also with linux-next.
> 
> Have you tried linux-next?

No, not yet, but I just triggered the above once more after not having
seen with my latest -rc5 branch for a while (e.g. 20 reboots?):

[   11.430131] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   11.431741] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   11.431933] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   11.435406] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   11.449286] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   11.450632] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.453155] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.456511] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.562623] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
[   11.585766] snd-sc8280xp sound: ASoC: adding FE link failed
[   11.585872] snd-sc8280xp sound: ASoC: topology: could not load header: -517
[   11.586021] qcom-apm gprsvc:service:2:1: tplg component load failed-517
[   11.586100] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
[   11.586530] snd-sc8280xp sound: ASoC: failed to instantiate card -22
[   11.591831] snd-sc8280xp: probe of sound failed with error -22

I don't think I've ever seen it before dropping the runtime PM patch as
you did in v2, and I hit it twice fairly quickly after dropping it. And
now again.

I'm not saying that the runtime PM patch is necessarily correct, and
perhaps it is just changes in timing that lead to the above, but we
definitely have a bug here.

My X13s is sitting here in the above state right now if there's some
state you want me to inspect.

This is the branch I'm using:

	https://github.com/jhovold/linux/tree/wip/sc8280xp-v6.4-rc5

with commit

	c0ab29445663 ("soundwire: qcom: enable runtime pm before controller is registered")

reverted.

Johan
