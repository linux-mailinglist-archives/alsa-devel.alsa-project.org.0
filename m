Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B614D3BE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 00:45:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F44C1673;
	Thu, 30 Jan 2020 00:44:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F44C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580341512;
	bh=1AZLP9aKm/4VjiGGnhXcqrrKxazfqnt27gR+1gTWOJQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcMEnaZXQiwm2r3n9LxMfqIT1modI4yJ0TbtX3VxMpoA3KdAHshWYZGRymuEhMcxo
	 5vwB8YCxiftz4K4bZ59MRynykxa2sSx+HveuKdZSTt1UUfY+AUa8xjY1Rw0G6JZgPy
	 BKSbVfNRJ3cDJAUiPkk3muER+ATsZpPMY/g37I+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D47F80218;
	Thu, 30 Jan 2020 00:43:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D09CF8021E; Thu, 30 Jan 2020 00:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04427F80122
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 00:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04427F80122
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 15:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="252831298"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO [10.254.70.93])
 ([10.254.70.93])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2020 15:43:20 -0800
To: sylvain.bertrand@gmail.com, alsa-devel@alsa-project.org
References: <20200129232340.GA23769@freedom>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
Date: Wed, 29 Jan 2020 17:43:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129232340.GA23769@freedom>
Content-Language: en-US
Subject: Re: [alsa-devel] no period wakeup support
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



> Nowadays, is this reasonable to consider disabling the period wakeup as default
> instead of expecting period wakeup by default?

I'd say yes - it's been nearly 10 years since this capability was added, 
and it's quite common across HDaudio, Chrome, Android plaforms.

But considering this as a default doesn't mean it's available in 100% of 
the cases, you still you need to check that

a) the driver is capable of disabling the period wakeup
b) the driver is capable of providing a precise position outside of 
period elapsed events (usually marked with the INFO_BATCH capability).

alsa-lib gives you the means to query both cases.

Note that you also have the case where you cannot disable interrupts but 
can still use timer-based solutions (e.g. for USB audio).

Hope this helps
-Pierre

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
