Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC6D00CC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 20:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CAD165D;
	Tue,  8 Oct 2019 20:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CAD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570560370;
	bh=laAjeVyc4vovNiXEhmSpLH/rOHnO0iaQepnS6MNtLxE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpyLvO9lZisZ9m1zr9FAVcQ2+dIezZBdInAm4aQPR5bmkYCFI41dyoBvpaZnM4mpr
	 G74+YpToaNTsPIuQLkpe2nWYsIi9MttSab3ujskeQBCoWYFCKVpYqVtjmc0bZl6WBN
	 eF1tmLRgeL2dvPkd7Ozdf7WOIc8vFt1sd9YM6/ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2892FF80322;
	Tue,  8 Oct 2019 20:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BCB9F8038F; Tue,  8 Oct 2019 20:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D7ACF800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 20:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D7ACF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 11:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; d="scan'208";a="192649929"
Received: from ywang-mobl1.amr.corp.intel.com (HELO [10.254.63.191])
 ([10.254.63.191])
 by fmsmga008.fm.intel.com with ESMTP; 08 Oct 2019 11:44:17 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191006152232.17701-1-perex@perex.cz>
 <fd997c93-c7c9-6ede-90c2-a94df93a613e@linux.intel.com>
 <d79e7cdd-2f94-1f00-0025-907682ab9988@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e3e763ac-d477-030c-3508-f40d692dfba2@linux.intel.com>
Date: Tue, 8 Oct 2019 13:44:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d79e7cdd-2f94-1f00-0025-907682ab9988@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH v3] ALSA: hda: add Intel DSP configuration
 / probe code
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


> Added. Will be in v4. Thanks for all of the input.

I took the liberty of adding suggested fixes on top this v3 in a GitHub PR:

https://github.com/thesofproject/linux/pull/1290

That PR also references changes to our default .config where all 3 
drivers are enabled. Hopefully we get test results on multiple platforms 
and can double-check the quirks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
