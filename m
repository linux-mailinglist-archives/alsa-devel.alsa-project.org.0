Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71B315A0E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 00:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCD816C2;
	Wed, 10 Feb 2021 00:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCD816C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612913625;
	bh=811rKjInQqM21PeYFQOEaN1C1w+cYXlfG0x+V6tDNUA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j27JqrDYd3IpKAGz1s+D494eFy2TM18PmBOeRn2LhVe58rv5E9U17bBd0DeS8CAoa
	 mhj4cUip33r2WNySaDMjtnqk0ZAPMtopNZlTlkFuURLO2D43rcRvJHqqAz8zMGEWVW
	 Uj3G0tsbpAnU2ZeEkNrWYfuDUCr3pNRZCWQur+Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4073F801EB;
	Wed, 10 Feb 2021 00:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03607F801D5; Wed, 10 Feb 2021 00:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E865F8013A
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 00:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E865F8013A
IronPort-SDR: YNxPEvClJ6g4Hq55BPTKU1yxABZXFEJLT5eUX6MxOLWmHhU6A6bJ8SwYFqr6BRcKMQ+ArXeTLZ
 3+rZdj0i0Bgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182041296"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="182041296"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 15:05:18 -0800
IronPort-SDR: a6arwtBDVlPnid9+/2ah9wjbZszzK/zJLS0ONW6THj5ne4QAa+B8fBY/tZKS6ShOMB874XtM2k
 fczV6phvdBYw==
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="510117583"
Received: from muncuer-mobl1.amr.corp.intel.com (HELO [10.209.127.55])
 ([10.209.127.55])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 15:05:17 -0800
Subject: Re: [PATCH] ASoC: soc-pcm: change error message to debug message
To: Mark Brown <broonie@kernel.org>
References: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
 <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
 <20210209222331.GD4916@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a3cac294-4562-3042-7118-f013d6e4300b@linux.intel.com>
Date: Tue, 9 Feb 2021 17:05:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209222331.GD4916@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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



On 2/9/21 4:23 PM, Mark Brown wrote:
> On Mon, Feb 08, 2021 at 09:06:44AM -0600, Pierre-Louis Bossart wrote:
> 
>> If you demote this to dev_dbg, we'll have to ask every single user who
>> reports 'sound is broken' to enable dynamic debug traces. I really don't see
>> the benefit, this is a clear case of 'fail big and fail early', partly
>> concealing the problem doesn't make it go away but harder to diagnose.
> 
> Don't you also get the same information out of the DAPM debugfs or did
> I misread where the error is generated from?

I re-checked and I will back-pedal on my comment. I confused this error 
message with the classic "ASoC: no backend DAIs enabled for %s".

I didn't find a single occurrence of this "ASoC: no BE found for %s" in 
any bug report or Google search.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


