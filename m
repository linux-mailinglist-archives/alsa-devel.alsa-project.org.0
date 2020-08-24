Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B703124FFAF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 16:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C1041673;
	Mon, 24 Aug 2020 16:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C1041673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598278766;
	bh=60Ue2rYDLZ/ZXi+Sit1PnQB39UQFYJYRkBcorllkZ5E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cf3MmgBjcwl41SLwXwHGnuiwXYHxeYT9p4q72UShErBUiGZr+l+saiSyPIPSo0daE
	 0+MDIvr/3b0tAaBDZA7hIcA4iNxJglZrX7oPSCfXmonXp3QjVjku2kuiHYSDvGbk+9
	 OMRxBTea3fKm/onIWdwUE7+sTeEk9nCo6Bye8c0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4232AF801EC;
	Mon, 24 Aug 2020 16:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F27F801D9; Mon, 24 Aug 2020 16:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A5C7F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 16:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A5C7F800B8
IronPort-SDR: 393zK3z56Z1HVtjMetUegWg/+x8URMuZ9EQ3ZpvX0p34V2oO9E7vhRGa7E121ZQfBGP3KQIIP0
 Hh/7tF33YJNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="135968869"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="135968869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 07:17:30 -0700
IronPort-SDR: swU+Ppaegf0sNVoF6ub1cT8SEn391LTbdxhm2CvRQkpllRuBgxcK08Y2xKyt9OXKQJclX73NKA
 CACNzfbh/8Bw==
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="294616829"
Received: from bpjohn-mobl.amr.corp.intel.com (HELO [10.212.174.18])
 ([10.212.174.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 07:17:30 -0700
Subject: Re: [PATCH 1/5] ASOC: SOF: Intel: hda-codec: move unused label to
 correct position
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
 <20200813175839.59422-2-pierre-louis.bossart@linux.intel.com>
 <20200823034829.GA2636427@ubuntu-n2-xlarge-x86>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d1480ba-f17d-bc0f-4242-f34584725bcb@linux.intel.com>
Date: Mon, 24 Aug 2020 09:17:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823034829.GA2636427@ubuntu-n2-xlarge-x86>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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




> I don't get this patch because there is no moving of a label, it just
> introduces it, where it is actually completely unused in the function as
> far as I can tell in both v5.9-rc1 and next-20200821. When building with
> clang in certain configurations, this introduces the same type of
> warning:
> 
> sound/soc/sof/intel/hda-codec.c:182:1: warning: unused label 'error'
> [-Wunused-label]
> error:
> ^~~~~~
> 1 warning generated.
> 
> It seems like this should be reverted as it does not actually do
> anything.

I must have made a mistake with these cppcheck patches, the patch that 
needed to be fixed is not upstream but in the SOF tree. I will send it 
later today, sorry about the noise.


