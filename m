Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B89886B4B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 12:31:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C4D2341;
	Fri, 22 Mar 2024 12:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C4D2341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711107090;
	bh=+QPNseh8J77DItgsgk3EhdQKJhe92gJ3314dglV2RPI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Irw2PaqfMIC7sKg+bo9ryudPc3sqDm3IgIdUnH28ljLnNVcOphqTRTlpJY6NR58Oy
	 FPUTMO0bdQwBWGPaGOzkeG6STuKhF8AoMmjpEYKapvmyZd1IomYGd6xZ0TzIJxo+xi
	 BrwCbX/j1wN68vuV0UBejFBrjZV9b8Fco7x7N/RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E6DDF805AD; Fri, 22 Mar 2024 12:30:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E1D9F8059F;
	Fri, 22 Mar 2024 12:30:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7132F804E7; Fri, 22 Mar 2024 12:30:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0E5EF80093
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 12:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E5EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LEHwYTdA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711107045; x=1742643045;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=+QPNseh8J77DItgsgk3EhdQKJhe92gJ3314dglV2RPI=;
  b=LEHwYTdApc8nP5Oe9vdTk41vBNn6lxCUm64DmnMDKwj4UWcp1tUUfQrb
   e8HxlRHhOFEWpbWxdv0V300nrwMfbbnMqJiBefgzxLwsjc5Eo5aEO0ibk
   fch39FbpOokqdJbOJhPQzBCs2iFsQ8RG9C54biwT2BZFXfEqe9zc/SqWV
   Xu+MIlukwxrr9+N9ajvjOpLcuqj0WXNK4mkiEP7/JhbPoqwsTpcOMIFic
   yqkHm86XuYIQyjqVxbQC8SntTeMqJp0vY7VOwULwdKnN6EUgIU93rZ6X3
   zdz4rDHyUJNHd4Agc50xdvrEL7RdoYUEAwX/Xl4ZvW+4DujYWCEOwuXv4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9102544"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000";
   d="scan'208";a="9102544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000";
   d="scan'208";a="15288036"
Received: from kridax-mobl1.ger.corp.intel.com (HELO [10.249.32.117])
 ([10.249.32.117])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:30:35 -0700
Message-ID: <ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
Date: Fri, 22 Mar 2024 13:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HTDOMRRG5AYWONBZJAWFBT7KQ4QLZJI3
X-Message-ID-Hash: HTDOMRRG5AYWONBZJAWFBT7KQ4QLZJI3
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTDOMRRG5AYWONBZJAWFBT7KQ4QLZJI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 27/11/2023 14:06, Peter Ujfalusi wrote:
> Hi,
> 
> SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
> up the blob from the NHLT table. This causes issues since alsa-utils commit
> 3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")
> 
> The dev_type is no longer always 0 in the topology embedded NHLT table resulting
> lookup failures for analog codecs since they will have dev_type=4.
> 
> With SOF the dev_type is not used, we always use the SSP port index for looking
> up the configuration blob.
> 
> The solution for the issue is to fetch the dev_type for the SSP port and feed it
> back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
> regardless of the assigned dev_type.

Can you take these patches via the ALSA tree, I have hoped that it would
land in 6.9.

Thank you,
Peter

> Regards,
> Peter
> ---
> Brent Lu (2):
>   ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type() function
>   ASoC: SOF: ipc4-topology: support NHLT device type
> 
>  include/sound/intel-nhlt.h    | 10 ++++++++++
>  sound/hda/intel-nhlt.c        | 26 ++++++++++++++++++++++++++
>  sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
> 

-- 
Péter
