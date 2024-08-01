Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB49447B4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CD938A3;
	Thu,  1 Aug 2024 11:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CD938A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503671;
	bh=50P3KPPudZtfFpobkd/S2nDT5u5cmn8wStzeY+8OftQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ts6+Sv+FqbqAfW7e8fc7tk7DhIN4n392Ay/RWfhHDeR3TsOEHqBlYrrantL4IW61C
	 aIT71p0wh04aeryrtGSAVwadq5YsvyiTjyeYPT+KQvGBuLD8YDaNnkspYz4SZKOogR
	 Jmp6wJAmy69sPuGbdy7XIxlpLib2xiuU1U3EpNtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BFAF80673; Thu,  1 Aug 2024 11:13:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4927EF8065D;
	Thu,  1 Aug 2024 11:13:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE0E3F805FE; Thu,  1 Aug 2024 11:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA42FF8057A
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA42FF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=It3O1J4R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503532; x=1754039532;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=50P3KPPudZtfFpobkd/S2nDT5u5cmn8wStzeY+8OftQ=;
  b=It3O1J4RJTkwtCl5Q6Bd6lESB6Ya2X8zxM1w5XJUjrZ/3gwDijWhmWE4
   LADptvKOG66pTmvY4xSxN0EpyUhiWRlj9ZrQNsmQZGIY1H01J7fiif1nI
   mmZNHg0nBuZDV3rqIr0KieYX+wHv9b3ty81c9z+a2x1+ciuG1bpa/qV3N
   oCeZGfHEDPZuRvt0BA1sJD9X2ffTsZgbbdHUpLelJyP7mEmeGf5IB8r3g
   kHXTXMHQZFFC9Lwyf+XecVNaDhA8m2loMN5fz9ETx0r0lmH4Of84N4fN5
   Eg7t/5qFW4q3F/pXW9T8g8ve634OI0kFJ12ixOhvkbJhLRd6MB/dE1w6E
   w==;
X-CSE-ConnectionGUID: 3grqwtTJQ8SpRBnVtOUlLw==
X-CSE-MsgGUID: X9oMrGDPRTSFwnz9P/6PEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383637"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383637"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:02 -0700
X-CSE-ConnectionGUID: 84VSGcL4TDymkhaL5jLvig==
X-CSE-MsgGUID: j43mw11GSaWyLm80EYxT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59090106"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:56 -0700
Message-ID: <9b3cccf2-8481-413e-8b9d-7de8a26de2cf@linux.intel.com>
Date: Thu, 1 Aug 2024 10:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 20/34] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
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
 <20240801011730.4797-21-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZOKFIMRN6YE6M4ZD2XTBLG4CDRDHBYFG
X-Message-ID-Hash: ZOKFIMRN6YE6M4ZD2XTBLG4CDRDHBYFG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOKFIMRN6YE6M4ZD2XTBLG4CDRDHBYFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 03:17, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize

typo: sequences


