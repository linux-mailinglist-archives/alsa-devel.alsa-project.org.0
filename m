Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A94D04EE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF35F173B;
	Mon,  7 Mar 2022 18:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF35F173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646672855;
	bh=5oomLSrFApsc6z+43W8UIAVGHDuVh8pgP4O3aBa8M74=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oATu8vQwTKhuEWGXUZ+u2Ka68imI72gsEF6TfLVA5dVR2HtERxL/y/1XS11ts8gAy
	 DJCGLbMPz/j1UnTXsx1NhPf0BLEX7ujS2bIa7/j92K0dtDG8ysDy+iMm2b4YckFpbt
	 9bwhJVwUyr5d5uDk2+hte6ri7cQh85h1RD/GW0Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A5DF80132;
	Mon,  7 Mar 2022 18:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44912F8020D; Mon,  7 Mar 2022 18:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693DBF80132
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693DBF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cZXpveLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646672801; x=1678208801;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5oomLSrFApsc6z+43W8UIAVGHDuVh8pgP4O3aBa8M74=;
 b=cZXpveLd/F3sbV/0tBeAhTNF+b7Adz/tyRDiOes+x5kWIAZLvSmjUKRW
 WKRUUl1i/wa+MYvd+Am3i8JZ7L+9lcWpojhwMim4siSqUyFhIP5JugCPM
 IIrEBhckKjjGo7mn1XsKDKANP6NO2+ynEVVP2G1ARloxwWAPkluJMTlOQ
 0pIkOwvllEtZEJwS/QwwLAMZnvZAW81GZzYB6zFLUoKDw1jHVFTqNkmYM
 A1G9+PvNCK4D7+K60DdOhnlTs1Q1wymbtNvXHJ3LWnCb2s2xI9eacLi/o
 4hGVKFjbOs3a22B6oIoNgKLH+oXMmEIFAVJxpGsTZXUzdBHfjwZ8aUNK+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254637998"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254637998"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:06:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="641400160"
Received: from zhaojohn-mobl1.amr.corp.intel.com ([10.254.24.100])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:06:35 -0800
Message-ID: <64f3d41df8e8978af23471ebe05d678f80d3e271.camel@linux.intel.com>
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 09:06:35 -0800
In-Reply-To: <e26c1dff-1797-b18b-81fc-5a741006d399@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
 <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
 <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
 <75e4e6e483a90057831fa8b9ab3ece6ef5cc2f12.camel@linux.intel.com>
 <e26c1dff-1797-b18b-81fc-5a741006d399@intel.com>
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

On Mon, 2022-03-07 at 18:02 +0100, Cezary Rojewski wrote:
> > What could make it simpler is if you allocate MAX IPC size for
> > payload
> > in this function and then copy the right size in the
> > avs_ipc_get_large_config(). payload_size tells you that information
> > anyway right?
> 
> 
> 
> 
> As stated, there is no clear winner here - you had to repeat such
> code 
> 
> for every getter.
> 
> 
> 
> Since we are getting payload_size already, retrieving payload itself
> is 
> 
> just fine.

OK, can you please add a comment to state this in the patch so the
reviewer doesnt have to track down where this memory is allocated?

Thanks,Ranjani

