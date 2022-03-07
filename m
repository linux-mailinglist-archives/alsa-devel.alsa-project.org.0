Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BC4D045B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2E41720;
	Mon,  7 Mar 2022 17:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2E41720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646671402;
	bh=aPGSMPziAk1c8hWpejh68nVliOMBmz/9pDN4t02K0Qc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0OyfUlOwVL/NPD14+JW6l4LqYHCpSBXQ4M03n0PsI8qqu0qg6uG9hpuZLQw9cUup
	 N/NYcyDVgVnLI+dqy/5o223a0NysdbAAMDJtUd04+1PZY1kEwQZp6vKzGaHn3+Tc3R
	 H5nybO1fPf41qveHC/ZQzrY7mj9UzoacHeyBK44k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F8AF80124;
	Mon,  7 Mar 2022 17:42:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD6BF8013F; Mon,  7 Mar 2022 17:42:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E6B1F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E6B1F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PUdXd3wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646671331; x=1678207331;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPGSMPziAk1c8hWpejh68nVliOMBmz/9pDN4t02K0Qc=;
 b=PUdXd3wuzKWS8x5qBHMamjXb2oF975FWoK6dGVbAPx4kNuWZTFTgLydu
 yD1bVKJGGtw/M5H+/PzI4MQBT5+8TbN2lV3jGJRHPO08JnObF36snlAXr
 RH0oO1pB2LijjgaPRc5fL3r5P007ic5TidWHRg19y0o6Ir6uwwVDyk+X9
 0iBtYTG1lkYwsOXQTxzrYWSigxgroJiOrwflMC+V42gXgyuJxxSz2EN87
 mx0ZwYbwui6+t0t1yCruVSMLcFO++4DYeltrbW/0k9FoHcY1E4kaVaX5q
 xCyC03+ylKwOr4gbSr1ALZgbX40+04D6p1TexUCUGUrWpmKZLZwNXA92j Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279145399"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="279145399"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:41:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="546947595"
Received: from zhaojohn-mobl1.amr.corp.intel.com ([10.254.24.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:41:55 -0800
Message-ID: <75e4e6e483a90057831fa8b9ab3ece6ef5cc2f12.camel@linux.intel.com>
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 08:41:55 -0800
In-Reply-To: <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
 <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
 <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
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

> > > +	kfree(payload);
> > I think it would be easier to understand this kfree if payload was
> > also
> > allocated in this function in stead of inside the
> > get_large_config().
> 
> That's a good thinking. There was an internal conversation regarding 
> this back in time when we have been implementing getters for the
> first 
> time. There are no clear victors, there are drawbacks - as you do
> not 
> know the size upfront, caller has to guess and then reallocate the 
> buffer accordingly to retrieved payload size from the firmware. So,
> even 
> if you allocate buffer here, chances are, it's not the same buffer
> when 
> the avs_ipc_get_large_config() returns to the caller.
> 
> We have decided to reduce the code size by letting the single,
> common 
> handler do the allocation and leave the other responsibilities to
> the 
> caller.

What could make it simpler is if you allocate MAX IPC size for payload
in this function and then copy the right size in the
avs_ipc_get_large_config(). payload_size tells you that information
anyway right?

Thanks,
Ranjani

