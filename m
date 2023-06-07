Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52015726093
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 15:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 143FC6C1;
	Wed,  7 Jun 2023 15:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 143FC6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686143303;
	bh=aGjLwz4N42P4QiuIiT4FYjf9xa0TcOslcVe57Qh1kn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OH0mv/0SouphSGtohmUw1AbuduTYSCmcqhSJWeRd8AjUO3fO3b44H54Mc8Xb5B4k8
	 36t2W5gqqYfWVmR9l+qrb0b1AI2KWFXqY1jMOJUY5e7untPPyJznqMplGaJ6pGGoEL
	 Ve0WDQavjfO/2Hyff4jkgHWDash/NB7GC9P7+Baw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 249ADF8016C; Wed,  7 Jun 2023 15:07:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE05F8016C;
	Wed,  7 Jun 2023 15:07:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E092F80199; Wed,  7 Jun 2023 15:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29A36F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 15:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A36F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M1kPRqrk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A59BC63F20;
	Wed,  7 Jun 2023 13:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54950C433D2;
	Wed,  7 Jun 2023 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686143234;
	bh=aGjLwz4N42P4QiuIiT4FYjf9xa0TcOslcVe57Qh1kn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1kPRqrkTEJpSyPik+Y2JLNBevPSyr5aM/zRhzNWzjlZqbOrceS01A8hNFOZqHes1
	 IuBn39Lr1eEBLntJbNKRtA+VD2YIIpSVdZXdUPMlDPjOJD56VlzpgSj2c0qs9Ff+Hy
	 dS7ZoupSNZkE54q/IHCHtzH8HLaT7pncDNcoVci5WAIm5fqEzokUXLbbwpsVOw2cvS
	 CosDAJthe6LMcHWuK5UCb8KGOvZPVvjIEf8ZHbQ8ymG62BuifKnM0wpOdpz7caH34D
	 HmJuAbhdo1AvUCe4nDjCeJeYY3JdWkr0CxRrxuK+eWaQN0FeMo1pLuP2I28mIN9/fC
	 xS6sxMvtyanSA==
Date: Wed, 7 Jun 2023 18:37:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	tiwai@suse.de, linux-kernel@vger.kernel.org, bard.liao@intel.com
Subject: Re: [PATCH v2 00/26] ASoC/soundwire: add support for ACE2.x
Message-ID: <ZICA/YIYQ/DGhhdk@matsya>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
 <ZHHdSjXwyHvBezkG@matsya>
 <8f4a024d-a218-c4ed-925c-b74663b7e280@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f4a024d-a218-c4ed-925c-b74663b7e280@linux.intel.com>
Message-ID-Hash: XO2OK7BCJNCBW65ZZZUR5CWKHJMGHNK2
X-Message-ID-Hash: XO2OK7BCJNCBW65ZZZUR5CWKHJMGHNK2
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XO2OK7BCJNCBW65ZZZUR5CWKHJMGHNK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre,

On 02-06-23, 15:46, Pierre-Louis Bossart wrote:
> On 5/27/23 05:36, Vinod Koul wrote:
> > On 15-05-23, 15:10, Bard Liao wrote:
> >> This series uses the abstraction added in past kernel cycles to provide
> >> support for the ACE2.x integration. The existing SHIM and Cadence
> >> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
> >> parts also moved to the HDaudio Extended Multi link structures. Nothing
> >> fundamentally different except for the register map.
> >>
> >> This series only provides the basic mechanisms to expose SoundWire-based
> >> DAIs. The PCI parts and DSP management will be contributed later, and the
> >> DAI ops are now empty as well.
> >>
> >> The change is mainly on SoundWire. It would be better to go through
> >> SoundWire tree.
> > 
> > Applied, thanks
> 
> Hi Vinod, is there a way you could provide an immutable tag for Mark
> Brown, the patch1 in this set is required for my next set of ASoC
> LunarLake patches?

Unfortunately, I have picked the whole series into next. If I was aware
I would have pushed them to a topic.

Mark can pull sdw/next but that would bring other things as well which
may not be preferred. I guess next best would be wait few weeks (rc1)

> 
> "ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake" adds
> the SOF_INTEL_ACE_2_0 definition to select different ops for LunarLake.
> 
> Thank you
> -Pierre

-- 
~Vinod
