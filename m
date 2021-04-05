Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADF3546F9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 21:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1B8E16FC;
	Mon,  5 Apr 2021 21:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1B8E16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617649809;
	bh=ye8SGXCzFZ6AoxZisndeHoHcSC51u6XaQiNrKvG35lc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFekKFxsRo+M8UY9ZyAiVdfJ2v0b58JRS1GmHDs/rsjmFp6M3GdXYuACr8xPUFKCg
	 ZgF2ZsF2RAEHethqHsiT+kQ8o4GSc59/1xuUUsdCKV6e31wv6KnOdQfvAZ62Bob2BN
	 HBPZtOGL1+qLeq1wEZlxzveRDPvQrx5QUrQvJPak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 627CCF8025C;
	Mon,  5 Apr 2021 21:08:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1888F80245; Mon,  5 Apr 2021 21:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E42F80169
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 21:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E42F80169
IronPort-SDR: hl8cFAQ4Thu8+1/6wppULWPiv2zlzQMzjG4Hwc57HcZw4YAuJhsuLYBLOu7LiwrjCuIFF9C2EO
 ePSJMOT9xi6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="192946588"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; d="scan'208";a="192946588"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 12:08:10 -0700
IronPort-SDR: 6hZmBs60OEfWSaYWvN9ShjApW45n9NmUrIXO11/QPX6ihTsqwwfpSWum9ap2fGUK4qdiQv+YUz
 TTahOkkrySIQ==
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; d="scan'208";a="420847805"
Received: from esiow1-mobl1.amr.corp.intel.com (HELO [10.212.57.118])
 ([10.212.57.118])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 12:08:09 -0700
Subject: Re: [PATCH v3 0/2] kbl_da7219_max9357a machine changes for wov and MST
To: vamshi.krishna.gopal@intel.com, alsa-devel@alsa-project.org
References: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad53e956-59a3-c4dc-df73-a9d65087b4ed@linux.intel.com>
Date: Mon, 5 Apr 2021 11:33:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: harshapriya.n@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, biernacki@google.com,
 pierre-louis.bossart@intel.com
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



On 4/5/21 7:48 AM, vamshi.krishna.gopal@intel.com wrote:
> From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.corp-partner.google.com>
> 
> Hi all,
> 
> This patch series about creating dailink for Wake on voice functionality
> and also adding MST route changes.
> 
> changes in v3:
> 
> -Remove DP from widgets
> -Add MST support in other routing table for kbl_rt5663_max98927.c

Looks good to me now

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Looking forward to the remaining fixes for other platforms, as discussed 
they will be provided separately.

Thanks!

> 
> v2 is here:
> 
> https://patchwork.kernel.org/project/alsa-devel/cover/20210325174325.31802-1-vamshi.krishna.gopal@intel.com/
> 
> v1 is here:
> 
> https://patchwork.kernel.org/project/alsa-devel/cover/20210324175200.44922-1-vamshi.krishna.gopal@intel.com/
> 
> 
> Mac Chiang (1):
>    ASoc: Intel: board: add BE DAI link for WoV
> 
> Vamshi Krishna Gopal (1):
>    ASoC: Intel: kbl: Add MST route change to kbl machine drivers
> 
>   sound/soc/intel/boards/kbl_da7219_max98357a.c | 58 +++++++++++++++++--
>   sound/soc/intel/boards/kbl_da7219_max98927.c  | 10 ++--
>   sound/soc/intel/boards/kbl_rt5663_max98927.c  | 14 +++--
>   3 files changed, 70 insertions(+), 12 deletions(-)
> 
