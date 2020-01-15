Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3D13CAC0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 18:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FFC117A8;
	Wed, 15 Jan 2020 18:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FFC117A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579108599;
	bh=SLFDPVJM4NiuapMuGc2ZOFzEeB3TwDmfjnqLyFqmCOk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sES4qGpAZ3z5mHWaZsdD6NIwhPzVBLEyDOfQdMC5aNQICDUNmxv4tuFxF0uGnqDb2
	 Ptp3UOHjVO7B+pkQ3D7moV+O0sJl1UAnOL5n/d4LAgokS0+EL0Sv41GKVBPN0F7a5p
	 08P0uq3AdZ8XqKdKkCYoipEw5CQKUCf9lNXdgkaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A7EF8014B;
	Wed, 15 Jan 2020 18:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53FDF801EB; Wed, 15 Jan 2020 18:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44603F800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 18:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44603F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 09:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="248476035"
Received: from sbreyer-mobl.amr.corp.intel.com (HELO [10.255.228.18])
 ([10.255.228.18])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jan 2020 09:14:46 -0800
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20200115164619.101705-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6d2feba3-384f-e33b-e97f-78483ababf1f@linux.intel.com>
Date: Wed, 15 Jan 2020 11:14:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200115164619.101705-1-hdegoede@redhat.com>
Content-Language: en-US
Cc: Jordy Ubink <jordyubink@hotmail.nl>, Erik Bussing <eabbussing@outlook.com>,
 alsa-devel@alsa-project.org, Damian van Soelen <dj.vsoelen@gmail.com>,
 Nariman Etemadi <narimantos@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/4] ASoC: Intel: 4 small cleanups
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/15/20 10:46 AM, Hans de Goede wrote:
> Hi All,
> 
> Here are 4 ASoC/Intel cleanup patches, these were written to
> get to know the kernel-devel process by a group of students
> which I was coaching on a kernel project.
> 
> Their original submission needed some cleanup which they never
> got around to. So I've done the cleanup now and I'm submitting
> a cleaned-up version of the cleanup patches.

Thanks! For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
