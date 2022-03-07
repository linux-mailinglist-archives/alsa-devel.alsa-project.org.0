Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B24D0478
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:47:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC971727;
	Mon,  7 Mar 2022 17:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC971727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646671647;
	bh=q3EnzzjtcI/zgBv22dKlA2cGLxB7RYLsmRde44U5Q6I=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2wsqDgHmR4IPXJiwCz9TfZi78PL44zGy+0YF3Q0adid4ehDouZNVNIM+t6+WJwA0
	 mzqj3R9tz9GRbHt8bVGtdGiUGvBYotK/LhD/EFngq1y8KBVhIMCu3gA3TYLaJ6LBSu
	 e/++wcq60rcgNi+MzOscPvjedvME3aYSdK3J2j28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE318F80159;
	Mon,  7 Mar 2022 17:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2DC8F8013F; Mon,  7 Mar 2022 17:46:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B49F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B49F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RYerq3R1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646671575; x=1678207575;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3EnzzjtcI/zgBv22dKlA2cGLxB7RYLsmRde44U5Q6I=;
 b=RYerq3R1cRkGKt/uPxbwtHdr8ZtlNPN2aGNOuEyf+DUo1F5cyvkM+c/l
 XNvbyJ7EfgGyKIYpMDj+AcVTrY4ua+l8cV8WLc7dXCEEYvs4qvVAqqCVF
 PKWvCuHFLjaCYDEMmV1L2RLlUI30M+hRBx8zpoSF6bwgY1csDUMBWZWvS
 5O1fJepFT8XT1TKe2aU0sqT0ot4lCdepiXooh0ToQQWX8mCX3EIQS23+Y
 4+NAHFcFl4GygMkoHQ3Tqza8btCa29B9kxxUufT34Q/9oBJLag4Z9sukm
 4EAXFE3K1aaRQH1Qwz5UMZUZUJaGzxe3cPov5d22Dm7+n/oFPUVc8T5Tv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254379527"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254379527"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:46:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="546948992"
Received: from zhaojohn-mobl1.amr.corp.intel.com ([10.254.24.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:46:10 -0800
Message-ID: <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources
 management utilities
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 08:46:10 -0800
In-Reply-To: <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> > > + * @modres_mutex: For synchronizing any @mods_info updates
> > Is this mutex really necessary? Can you please elaborate under what
> > circumstances your will have parallel module updates?
> 
> 
> 
> 
> Yes, we believe modres_mutex is necessary. All information regarding 
> 
> modules exposed by the firmware are stored within ->mods_info cache.
> 
> 
> 
> That's just a snapshot though. When a new library gets loaded, new 
> 
> modules may be available for use and so the driver updates the 
> 
> ->mods_info cache to have the latest snapshot. As information found 
> 
> there is used when streaming (e.g.: instantiating modules), we enter
> a 
> 
> scenario when multiple threads could be reading/updating the
> ->mods_info 
> 
> at once. To prevent any unwanted behavior, mutex has been added.
This is the part that's hard to follow without seeing the actual code
where this new library is loaded. When does a libray get loaded? When
you start streaming and you realize that the stream requires a module
that is not built into the base FW? Can this be done during topology
loading instead?

Thanks,
Rnajani

