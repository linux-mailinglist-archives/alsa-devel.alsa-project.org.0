Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E327B8C33
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 21:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271B084B;
	Wed,  4 Oct 2023 21:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271B084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696446118;
	bh=+7Kuxlc0687hSqhXVR358o6+jlXhpr+b6WxOI4qYX08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0KsR8FBdY634ajLAZlp6bSQrAW6oVrb3OO1fmymiIIxdaaydgNMZNN0ahpxRflOi
	 8YApSfnOsuwdPqKjfb4NGunNKB2gClJLFt4CKdWi+qcgs4//RpJH2m/kvKqHj0qKVW
	 VC0Jza4JQkEujZj2s1CYbrBZSNM+VO6N8mwXRsY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68B52F8055B; Wed,  4 Oct 2023 21:01:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74656F80310;
	Wed,  4 Oct 2023 21:01:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF16F8047D; Wed,  4 Oct 2023 21:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 667C3F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 21:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 667C3F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W2qFzaO3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696446047; x=1727982047;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+7Kuxlc0687hSqhXVR358o6+jlXhpr+b6WxOI4qYX08=;
  b=W2qFzaO32HoqkrjzWHnJWv06I/IDej/WBUZKWVS1n42igZNtuVfTvjv6
   ReIX1eMVBTxz5Kca9eFeqqTDBDqaVUCUTsA0yt8qU+DSiWHZBZfMRYtyl
   2V/+dHAUdl8saOoGO+LYAcmP27ssXONKv6nc1gJh7Ss64WF2sX76l7lhx
   uzYmA7yBJg4d8caI1jUpwq4Hs/AaagE/SHgbsNO0xEQHcFp4T/JdOTaKV
   /VTtOq8B2IDkPPlfjz3VakPVs+4BHpO8v4+f8e2PkJk7L6DwZEerVZ2On
   hmdtU5YFPh5+jrpYmXLV1R4AEoV57kXzuku60JcIxT0KcyDx1ij5cOXeN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383175698"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200";
   d="scan'208";a="383175698"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751445426"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200";
   d="scan'208";a="751445426"
Received: from mfmousa-mobl1.amr.corp.intel.com (HELO [10.212.98.56])
 ([10.212.98.56])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:00:41 -0700
Message-ID: <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
Date: Wed, 4 Oct 2023 15:00:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
 <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
 <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TJJHATPLX4LCSEGFZEVDB6IEQVIAIEM7
X-Message-ID-Hash: TJJHATPLX4LCSEGFZEVDB6IEQVIAIEM7
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJJHATPLX4LCSEGFZEVDB6IEQVIAIEM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/4/23 11:40, Mark Brown wrote:
> On Wed, Oct 04, 2023 at 11:16:09AM -0400, Pierre-Louis Bossart wrote:
> 
>>> matching the name is fine (if you are matching it against an existing
>>> name) but expecting the name to be anything specific is not going to
>>> work as the name is dynamic and can/will change each boot.
> 
>> Not following, sorry.
> 
>> In the SoundWire context, the device name directly follows the ACPI or
>> Device Tree information, I don't really see how its name could change on
>> each boot (assuming no DSDT override or overlays of course). The
>> platform descriptors are pretty much fixed, aren't they?
> 
>> Intel and AMD make such assumptions on names for pretty much all machine
>> drivers, it's not really something new - probably 15+ years? Adding Mark
>> Brown in CC: to make sure he's aware of this thread.
> 
> FWIW DT is much less affected here since all the inter-device references
> are explicit in the DT (modulo needing to work around breakage) so we're
> not hard coding in the way ACPI so unfortunately requires.

Isn't there a contradiction between making "all inter-device references
explicit in the DT" and having a device name use an IDA, which cannot
possibly known ahead of time?

I think we keep circling on the differences between "Controller" and
"link" (aka bus). A Controller can have one or more links. A system can
have one or more controllers.

Intel platforms have one controller and 4 or more links.
QCOM platforms have one or more controllers with one link each.

I am not sure how this IDA-generated bus_id helps deal with these two
cases, since we can't really make any assumptions on how
controllers/links will be started and probed.

What we are missing is a hierarchical controller/link definition, IOW a
controller_id should be given to the master by a higher level instead of
using an IDA.
