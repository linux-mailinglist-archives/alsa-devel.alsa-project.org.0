Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F14D1F32
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:37:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2292E18D2;
	Tue,  8 Mar 2022 18:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2292E18D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646761026;
	bh=thOvARg1UtVlOLotQd7Li3cy7FNbJPL8X9+8eAjIcd4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwymN2XBvs5brUKkrEARifTTWFK8+2tRCFG/tGAUBkMqiav5byR8L4itovKFVnMEU
	 nH5Gni3GQq70EO/kLqpQP6MW5gJ4/vzUo/oJh0tu5vUc2kXe5yyUoPoZjpuTS0MxcW
	 xxoTcaHocQ5F+RxKIMOWUT5CgivtTSpk0No+phUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3CBF8026D;
	Tue,  8 Mar 2022 18:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CB47F8026A; Tue,  8 Mar 2022 18:35:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D617DF800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D617DF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Tj4dwiIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646760956; x=1678296956;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thOvARg1UtVlOLotQd7Li3cy7FNbJPL8X9+8eAjIcd4=;
 b=Tj4dwiIEPU7Zg0ny8iiVK3vXf4eOXeYwqmF830+Nic+vYHN9x0AAPKGz
 UYXVfCD3a6uDn+1tWedPLSnRNfo0yzfY+r6Fji2SzYqbDuKPgAR51b5UG
 Xx7LI3ZscTFHPWzw2AgMaUBv5hhekR5KuUalqZAuGHb4o2IJqIF03kMla
 Xo9SmSTzutM9MhjzI/sR2sBUahmxeLKtt3hR+0TZLX9Jriy7zHzd2BS+G
 1ccbgXDc73gVG6OO2b0Bod+3dXbQv5kKePl7uwX40f26u9hQkxR1PUGeV
 HtTUadlPlqCzIR9a40/PI6CgjrbiGwAkbxlaOoH25yKlK2WY6SVST4yFy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254488139"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254488139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:22:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537649598"
Received: from bustam3x-mobl.amr.corp.intel.com ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:22:54 -0800
Message-ID: <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources
 management utilities
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Tue, 08 Mar 2022 09:22:54 -0800
In-Reply-To: <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
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

On Tue, 2022-03-08 at 17:57 +0100, Cezary Rojewski wrote:
> Scenario you describe is correct and does not prompt the need for the
> mutex.
> 
> 
> 
> However, ->mods_info is accessed through getters found in utils.c
> (this 
> 
> very patch) during stream creation too. That fragment is part of
> path 
> 
> management series though - it was requested to split those bits away.
> 
> 
> 
> So, there is a possibility for a platform-soc-component to have its 
> 
> ->probe() called - and thus triggering ->mods_info update - while a 
> 
> stream is being opened on a different sound card simultaneously. To 
> 
> avoid unwanted behavior e.g.: looping through ->mods_info while it's 
> 
> being updated in separate thread, we lock the array.

Keeping in mind that this driver is meant for older platforms, how
likely are you to support multiple sound cards with those topologies?

Thanks,
Ranjani

