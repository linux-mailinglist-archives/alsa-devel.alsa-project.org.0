Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A57B8124
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:40:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD502852;
	Wed,  4 Oct 2023 15:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD502852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696426800;
	bh=Ss8s2/WlfLl0ZNk8aSgmRatjydRsXp0ZEDMGWEjLamU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cbiG90eaAz/glSRxNeCUcSOrPb8TOc6lTKmB9eDCuZPXbF3Tc3WmEp77Z3Np8WknA
	 5KiUgk1ntkBaKC6rTS43WwMUupZj5RuCYqFLf4v3RzgiDl03D6oJn4GGXbh0IKHPDt
	 mcLzwmuSAjSG9Wm2X59fxzbHQvtpxcvstb73Tfqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C53F80553; Wed,  4 Oct 2023 15:38:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E53F80310;
	Wed,  4 Oct 2023 15:38:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED600F8047D; Wed,  4 Oct 2023 15:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59E18F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E18F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=bwLCv5yD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B7C66CE1C3C;
	Wed,  4 Oct 2023 13:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8D5C433C7;
	Wed,  4 Oct 2023 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696426701;
	bh=Ss8s2/WlfLl0ZNk8aSgmRatjydRsXp0ZEDMGWEjLamU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwLCv5yDlxxJhHZE0LC3IeQnmAG4csT8qF4YAjaQ0xcXLbUZK2c7uZyWHqop+cnEX
	 Zf/JiwkHG7L4HCtePF4vhsCVI0mKaFVHkAUbMWhrk84bTCQ93eeIzHv8Bhz38rvpeR
	 q7R7aUhEvjoySqsFswSQFfZwYfh/0oJaDoOepF3o=
Date: Wed, 4 Oct 2023 15:38:18 +0200
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
Message-ID: <2023100453-perfected-palm-3503@gregkh>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
Message-ID-Hash: SK7UH6IYCWOR4KAKKDKMRSZLHP52TNXC
X-Message-ID-Hash: SK7UH6IYCWOR4KAKKDKMRSZLHP52TNXC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SK7UH6IYCWOR4KAKKDKMRSZLHP52TNXC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 04, 2023 at 09:16:47AM -0400, Pierre-Louis Bossart wrote:
> 
> 
> On 10/4/23 09:02, Krzysztof Kozlowski wrote:
> > If same devices with same device IDs are present on different soundwire
> > buses, the probe fails due to conflicting device names and sysfs
> > entries:
> > 
> >   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
> > 
> > The link ID is 0 for both devices, so they should be differentiated by
> > bus ID.  Add the bus ID so, the device names and sysfs entries look
> > like:
> 
> I am pretty sure this will break Intel platforms by changing the device
> names.
> 
> sof_sdw.c:      else if (is_unique_device(adr_link, sdw_version, mfg_id,
> part_id,
> sof_sdw.c:
> "sdw:%01x:%04x:%04x:%02x", link_id,
> sof_sdw.c:
> "sdw:%01x:%04x:%04x:%02x:%01x", link_id,

device id name changes shouldn't break things, what is requring them to
look a specific way?

thanks,

greg k-h
