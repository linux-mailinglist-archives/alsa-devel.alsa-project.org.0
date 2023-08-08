Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0B773AB6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 16:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D9E829;
	Tue,  8 Aug 2023 16:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D9E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691504680;
	bh=Av8IsQYnPqSHhEAXzRk3K9qgSgX1t300hPFn/Qp+V88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSBcMd1oWx4d25oofLmQh9LZGJad5/W+Jtls1v2iwgsmRRzHQlseFNvlVzNQhvMX4
	 zGxRprJJwWQgwUvuRmmH8zOs2Jy8uSjOR20go2/HhXsRbiT7cxKm58dfYbknfK8mLZ
	 07kCRxYY85jaE48ZMFvuJWjpL/R4/3ql68JLfOYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 414A9F80538; Tue,  8 Aug 2023 16:23:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4EE6F80154;
	Tue,  8 Aug 2023 16:23:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8B7F80534; Tue,  8 Aug 2023 16:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42D0BF800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 16:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D0BF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uaan71a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691504616; x=1723040616;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Av8IsQYnPqSHhEAXzRk3K9qgSgX1t300hPFn/Qp+V88=;
  b=Uaan71a3hUo/lXhKxqqAVjTk5P6f0oGgPuRoSxLaInWQSij26WOh3R7C
   XazDkeNBKcSXTUwmyiTU7IVwtXFXmnIHKuzVU4rUnw2CeO3fNLoSiqXx8
   dwNNH+sWV21CjCLM6sU4vkdlzzimw291cFKgoC1DCxGl1ptWI4WDsuarZ
   6lKUa88N6GiuaEpVMmbY5xFQE8iYuWqkL7HG2LB5sLp7x/UT0sZ+hEWtV
   WSExxgocItlKhgSCNNF+y097n1WcoImTE/83MbucuSnSCAFhiYO3GhvXq
   6c8mNXYoVqnsR+b27wKqX1zFssKCacS8nmtNkdVEB6ASdS4C2bEYuwhY9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351137949"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200";
   d="scan'208";a="351137949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821390121"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200";
   d="scan'208";a="821390121"
Received: from bvenkata-mobl5.amr.corp.intel.com (HELO [10.209.137.103])
 ([10.209.137.103])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:23:26 -0700
Message-ID: <687ac12d-ff72-14b5-1f90-ffe7c2e9de83@linux.intel.com>
Date: Tue, 8 Aug 2023 09:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 02/20] ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
 <20230807210959.506849-3-pierre-louis.bossart@linux.intel.com>
 <ee52997b-55b9-4f8d-9a29-4f18474c6f3f@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ee52997b-55b9-4f8d-9a29-4f18474c6f3f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I64UKIKQNU2COQ7P23MEZHJWIXTD4HL3
X-Message-ID-Hash: I64UKIKQNU2COQ7P23MEZHJWIXTD4HL3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I64UKIKQNU2COQ7P23MEZHJWIXTD4HL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/7/23 17:06, Mark Brown wrote:
> On Mon, Aug 07, 2023 at 04:09:41PM -0500, Pierre-Louis Bossart wrote:
>> Likely a combination of copy-paste and test coverage problem. Oops.
>>
>> Fixes: 87a6ddc0cf1c ("ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID registers")
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@intel.com>
> 
> The above commit doesn't seem to be from mainline?

git log tells me it's been in your tree since April?

This was part of the series "ASoC: SOF: Intel: hda-mlink: HDaudio
multi-link", commit merge a1d68507c1cd3192785d0b9a1a476590c63e9a3c

git log 87a6ddc0cf1c
commit 87a6ddc0cf1c62dbc7c2cc4b5f764a2e992c5ba6
Author: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date:   Tue Apr 4 13:41:24 2023 +0300

    ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID registers

    Each SoundWire peripheral can be programmed from the manager side
    either with a regular command FIFO, or with the HDaudio CORB/RIRB
    DMA-based mechanism. The mapping between SoundWire peripheral and SDI
    address is handled with the LSDIID register.

    This mapping only works of course if each peripheral has a unique
    address across all links. This has already been enforced in previous
    Intel contributions allowing for an IDA-based solution for the device
    number allocation.

    The checks on the dev_num are handled at the SoundWire level, but the
    locking is handled at the hda-mlink level.

    Signed-off-by: Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com>
    Reviewed-by: Rander Wang <rander.wang@intel.com>
    Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
    Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
    Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
    Reviewed-by: Takashi Iwai <tiwai@suse.de>
    Link:
https://lore.kernel.org/r/20230404104127.5629-16-peter.ujfalusi@linux.intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>
