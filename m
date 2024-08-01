Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444394479A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72B737A2;
	Thu,  1 Aug 2024 11:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72B737A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503577;
	bh=bWXEw8TFjsKa/Hb4/Eb5rG16j7U/8Z24Kda92N1MJ4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z5gpk7isRNr/R64HOutX+ZJzORfS5xlIkRzOZlFnr0j8Xm4kkNNz+FsL3LC82f0zl
	 wS5OKze7+PcaIUI+I3a+lTVxczcrKuJNuLBr+2nAn44tdV+at/YoQdMFHu2b6bBUyO
	 AtdkkakYLSAzTuXuqYdiNrHR0PSKCooMDNY79o7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2452EF805E0; Thu,  1 Aug 2024 11:12:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CD4F805B4;
	Thu,  1 Aug 2024 11:12:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65BB9F80580; Thu,  1 Aug 2024 11:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56275F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56275F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C5sfOjqP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503518; x=1754039518;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bWXEw8TFjsKa/Hb4/Eb5rG16j7U/8Z24Kda92N1MJ4I=;
  b=C5sfOjqP2rjl1C1KLk4MpTYqS0UEd9xfzgvev8kbtVybbXDB1g80tP67
   +nMrzFyfsvZvahyO28d+3tRshvNAjhVGnmXWGLWLZpdR1ZdZgQIXyTyVF
   z+OX3zlcPIWB9hkFfAM4pko2SXG3oUV7LqyEHT6JukDYb1dU18SAM0rRn
   N9PK7upb+ZDYVfMO9p8Hd6iDUAhol+Z1n5Lok+DeI4q32FtmLflOdPFII
   /uZI3jE3gG8S2e6T44bsoprXSG+jdi63M3QqqUrGusH3rFe19Jyyh56Sd
   ncinQGPHquiv/MMy7fdnfE2mnPcDTcaXEs2kWUw6ZB5Gq4WUBXlFWrk1f
   g==;
X-CSE-ConnectionGUID: RrhRysN2TVqZRuzEKVp0tA==
X-CSE-MsgGUID: ZQWwrCeQRm6BQRJd2qpc8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383381"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:10:59 -0700
X-CSE-ConnectionGUID: wD2mZchpQ2uK+zw06fP8TQ==
X-CSE-MsgGUID: 2y4A7VElRRC8qWG3k+0cRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089784"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:10:53 -0700
Message-ID: <f70b6f65-fd8f-4d2c-ba41-fa814d0b5154@linux.intel.com>
Date: Thu, 1 Aug 2024 11:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/34] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H6XFQH5AI352NWBRF4222S3QDYMZNCXC
X-Message-ID-Hash: H6XFQH5AI352NWBRF4222S3QDYMZNCXC
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6XFQH5AI352NWBRF4222S3QDYMZNCXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 03:16, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.

I find this update a lot easier to review than previous versions, thanks
for this. That said, there are still quite a few confusing parts in the
documentation and implementation - specifically the get_offload_dev()
stuff makes sense at a high-level but the details can be improved a
great deal.

It's encouraging though, there aren't any major conceptual issues IMHO,
it shouldn't be too hard to make the patches clearer/cleaner.

