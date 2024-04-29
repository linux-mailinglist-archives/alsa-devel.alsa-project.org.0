Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 777788B5D1B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06EA6839;
	Mon, 29 Apr 2024 17:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06EA6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714403768;
	bh=B70cHC5B2+Mi8fKnsDPo/GoKjmjKzMFW4JNazblknHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SvtuRfjypXudZ0CkapcFBuI6h/OsHIlArE/i9tpjZj1W9mKBi2OYmL+lHefEaPVBo
	 6VKw2GsKOgXsuYWeJCKXdrtky7jnthS51YsQiVR56b5Kxs09k/9W22Llwj1u8JgJoo
	 5ldxLG3dJOPMLRoHs+jAafVStNz4vtPMMReBHI5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6BE7F805A1; Mon, 29 Apr 2024 17:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2ECBF8057B;
	Mon, 29 Apr 2024 17:15:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25583F8028D; Mon, 29 Apr 2024 17:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA84BF800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA84BF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bLq3wE6s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714403726; x=1745939726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B70cHC5B2+Mi8fKnsDPo/GoKjmjKzMFW4JNazblknHQ=;
  b=bLq3wE6s8Vk2B8XbHdYj3z3RsKzvnIM1kNEIUqJANAvsemIIwM0d7ixk
   xxt8k32ME8adGSE0SjZXXLNpiURmwl7kcu6vqmylJNg8uIaNfrJUAWN8F
   Y7XHQ5DDZ6Bxy6pIkyl5glQawqpe3UDcE4n+wgn1EQodwj0Dsa1BaFSqn
   Ldq0vwRQE8rf9sLXG8oQnU6lvb+drYV8EVHf5CadOgsSP8MlFC/uYLToG
   WfIFLhAPC1yFf6i0FnPOV0hQzxN2Xgr5rtvq7KsQyUJae/8unbkeiog2x
   gDGGrBZPdFo1+WWjrs0nxFZU6ht62xG3XKX2wJ76zZNw2XjrYMD9T9yfj
   g==;
X-CSE-ConnectionGUID: vvR4rsPyQemL/JuWN+5LFw==
X-CSE-MsgGUID: Z/U7wu7RTE2hHzVDPHJitg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9945180"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000";
   d="scan'208";a="9945180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:15:20 -0700
X-CSE-ConnectionGUID: u85Xn9esQbiNAOHLNB2I7Q==
X-CSE-MsgGUID: uvcJBmBaTs+Er142l9OU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000";
   d="scan'208";a="30587851"
Received: from pingchan-mobl.amr.corp.intel.com (HELO [10.212.49.248])
 ([10.212.49.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:15:20 -0700
Message-ID: <8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
Date: Mon, 29 Apr 2024 10:15:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of
 device_get_named_child_node()
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
 <874jbkp5zz.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <874jbkp5zz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3DGCJF67F4QCWWFSFQH5PMLTLGKA2L2O
X-Message-ID-Hash: 3DGCJF67F4QCWWFSFQH5PMLTLGKA2L2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DGCJF67F4QCWWFSFQH5PMLTLGKA2L2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

>> The documentation for device_get_named_child_node() mentions this
>> important point:
>>
>> "
>> The caller is responsible for calling fwnode_handle_put() on the
>> returned fwnode pointer.
>> "
>>
>> Add fwnode_handle_put() to avoid a leaked reference.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Can we have a corresponding Fixes tag?

Good question.

The initial code was in

6d2c66695bf3 ("soundwire: intel: transition to 3 steps initialization")

but then moved with

08c2a4bc9f2a ("ALSA: hda: move Intel SoundWire ACPI scan to dedicated
module")

I guess a Fixes tag for the latter is good enough, it's a 2021 commit
and that would probably cover most SoundWire platforms.
