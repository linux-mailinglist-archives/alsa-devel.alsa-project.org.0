Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71587B81F9
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 16:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA08082C;
	Wed,  4 Oct 2023 16:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA08082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696428938;
	bh=L/Mr44New+pyfxS07F3RFMAGC4EBy3Vu3NpvP3/raio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lIR9zN16QNxpw8Ppiu2snQE0+tDKqq5usZ8LBB5fKnWHYmxM0zaTu8fwtJZXbHtkt
	 9PU9iFCzLL+VsFrEEznwxvy3d5gs+z8ee3CHqiRozRz5sRJMCfATe6pVqLtQbm39DV
	 zezXGNi6pwuhs7az0EQb3FtlSV3R9PpAzhnS2Qqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2BD2F800C1; Wed,  4 Oct 2023 16:14:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CA5F80310;
	Wed,  4 Oct 2023 16:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C26EF8047D; Wed,  4 Oct 2023 16:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 687F5F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 16:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687F5F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=yeKec6tp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2028EB81E6C;
	Wed,  4 Oct 2023 14:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF02C433C8;
	Wed,  4 Oct 2023 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696428858;
	bh=L/Mr44New+pyfxS07F3RFMAGC4EBy3Vu3NpvP3/raio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yeKec6tpX2O10Q2faEGUUVXpPIS7VBXxsaSMPd9dM2AHTpCbniY8X/ZO/2nCl6K8o
	 gIwIvz9svx/TQtj6YeuixfSu3AXSAX0GHvfvjZq/Ff2ulrK5lPQTpQ5MDZ6Hpwt11G
	 l5/Ba3ymRkys0LBP20mSjXOUoYi9q0HfwG8pva3g=
Date: Wed, 4 Oct 2023 16:13:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Message-ID: <2023100452-craziness-unpopular-7d97@gregkh>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
Message-ID-Hash: D3Z42LTMYGOU5L2PJQP335IUJWVCG363
X-Message-ID-Hash: D3Z42LTMYGOU5L2PJQP335IUJWVCG363
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3Z42LTMYGOU5L2PJQP335IUJWVCG363/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 04, 2023 at 09:57:49AM -0400, Pierre-Louis Bossart wrote:
> 
> 
> On 10/4/23 09:38, Greg Kroah-Hartman wrote:
> > On Wed, Oct 04, 2023 at 09:16:47AM -0400, Pierre-Louis Bossart wrote:
> >>
> >>
> >> On 10/4/23 09:02, Krzysztof Kozlowski wrote:
> >>> If same devices with same device IDs are present on different soundwire
> >>> buses, the probe fails due to conflicting device names and sysfs
> >>> entries:
> >>>
> >>>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
> >>>
> >>> The link ID is 0 for both devices, so they should be differentiated by
> >>> bus ID.  Add the bus ID so, the device names and sysfs entries look
> >>> like:
> >>
> >> I am pretty sure this will break Intel platforms by changing the device
> >> names.
> >>
> >> sof_sdw.c:      else if (is_unique_device(adr_link, sdw_version, mfg_id,
> >> part_id,
> >> sof_sdw.c:
> >> "sdw:%01x:%04x:%04x:%02x", link_id,
> >> sof_sdw.c:
> >> "sdw:%01x:%04x:%04x:%02x:%01x", link_id,
> > 
> > device id name changes shouldn't break things, what is requring them to
> > look a specific way?
> 
> it's the ASoC dailink creation that relies on strings, we have similar
> cases for I2C.
> 
> There's no requirement that the name follows any specific convention,
> just that when you want to rely on a specific device for an ASoC card
> you need to use the string that matches its device name.

matching the name is fine (if you are matching it against an existing
name) but expecting the name to be anything specific is not going to
work as the name is dynamic and can/will change each boot.

thanks,

greg k-h
