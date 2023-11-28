Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF007FBC22
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:04:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDDC828;
	Tue, 28 Nov 2023 15:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDDC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180273;
	bh=aCdRsF9wl2XV2ZphAfMjWpZj9WAkr2DKIlp1EXoHEGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVEHVQXJTVU4ppT2f8evuSxTta8xXtqIiOfPJE1d4+0xPZDPovFmx75Ob13dEhbWQ
	 V/APni2xRF2dz/DuTbG+r2Uc1RTWoMUFP0fdb2ffEngtMJ3/IkGQNFenmI3ev8HvMc
	 ycZS1uTegHhJQhS82BZlTsKSddys0zCdgcPRATbU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC206F80557; Tue, 28 Nov 2023 15:04:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03835F80570;
	Tue, 28 Nov 2023 15:04:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23046F8016E; Tue, 28 Nov 2023 15:03:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B99F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B99F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ETnIrCgI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701180232; x=1732716232;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aCdRsF9wl2XV2ZphAfMjWpZj9WAkr2DKIlp1EXoHEGE=;
  b=ETnIrCgIO1xiTbWZ/lgbICS4kif8eu8PD+oK9XZerEyNtWXFCLxjBROE
   0BdixVxLeicv6rwgf7qQsmDo80OZT2eWcTSJPI+e2Z1g/GjprFxjyosn4
   oH+U+wO4lj0TD3D6KtZhimre21ziWHeHxSJ2VPykhnSQ7x4yZI9aYwI0M
   pNlaL/MAsfUe7zCEnjhFsLlm89SYjyQlKcxUfTpQnMpY7QcmfK3en+kbn
   hN3ddi9XYh0VVCIQ5zLSyg7x44gT3ak2wvkbC8dL2BEvwKHClSIg9VekL
   rIlRNpsCvDgp0/1QlfZQlRgNfYmmuvElYgSGH+J5NvdI0jMn2VHQ95zqs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383313848"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="383313848"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 06:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="892081172"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="892081172"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 06:03:46 -0800
Date: Tue, 28 Nov 2023 16:03:18 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.de,
    alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
    pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
    ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH v2] ASoC: hdac_hda: Conditionally register dais for HDMI
 and Analog
In-Reply-To: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2311281602230.14041@eliteleevi.tm.intel.com>
References: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: URY5HEEUCYP5QB3UOIQRHS7IAWTU2GKP
X-Message-ID-Hash: URY5HEEUCYP5QB3UOIQRHS7IAWTU2GKP
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URY5HEEUCYP5QB3UOIQRHS7IAWTU2GKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, 28 Nov 2023, Peter Ujfalusi wrote:

> The current driver is registering the same dais for each hdev found in the
> system which results duplicated widgets to be registered and the kernel
> log contains similar prints:
[...]
> Changes since v1:
> - Drop the patch for patch_hdmi to export a funtion to match the device
> - Use the struct hdac_hda_priv.need_display_power boolean as indication that the
>   device is a HDMI/DP audio codec

thanks, this works as well:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai

