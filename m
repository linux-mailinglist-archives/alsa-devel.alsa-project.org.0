Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDD10F3D1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 01:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9359F1660;
	Tue,  3 Dec 2019 01:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9359F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575331833;
	bh=GDRr7HaiyVTTPtqSyj/MPHBCEccSu+31OywO4t+7BP4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EopPjvXP565fbF/BfAEn0+bUtS8K6ykNF6Uv5IP6UpniLY7g0qcftmtGvJgvhj+om
	 ze56PUg4kZ8hYqK6NyfnsEpOh8TG2SXXjrDx/5Rf4o7/r9rO1t8t9U9llvrjBERVmT
	 kbu0+wYnSgaeTvJ8H6chlWGOAYnt9Ry8PWu89Xwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43759F80217;
	Tue,  3 Dec 2019 01:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA3CF80214; Tue,  3 Dec 2019 01:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85210F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 01:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85210F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 16:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="262391297"
Received: from hmok-mobl.amr.corp.intel.com (HELO [10.254.182.242])
 ([10.254.182.242])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2019 16:08:40 -0800
To: Mark Brown <broonie@kernel.org>
References: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
 <d86b3869-274c-e96e-69d6-9122dc044ae3@linux.intel.com>
 <20191202233257.GG1998@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b168d21f-58d5-6157-70b3-c9673ea87431@linux.intel.com>
Date: Mon, 2 Dec 2019 18:08:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191202233257.GG1998@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 00/10] ASoC: SOF: initial cleanup for DT
 and multi-client support
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



On 12/2/19 5:32 PM, Mark Brown wrote:
> On Mon, Dec 02, 2019 at 02:39:31PM -0600, Pierre-Louis Bossart wrote:
> 
>>> Daniel Baluta (2):
>>>     ASoC: SOF: Make creation of machine device from SOF core optional
> 
>> This patch conflicts with Jaroslav's "[PATCH] ASoC: intel/skl/hda - export
>> number of digital microphones via control components"
> 
>> I will resubmit a v2 when Jaroslav's patches are available in Mark's tree.
>> For SOF development Jaroslav's changes were already applied and the conflict
>> solved already.
> 
> If you want to respin this series with Jaroslav's patches also
> wrapped in that'd work just as well and get everything merged
> quicker.  I've just got stuff in my to apply queue so far, not
> actually applied anything that you can't see in git.  Waiting
> till after the merge window is also fine but if you did the
> merge/rebase already seems like you may as well post.

sounds good.
I'll repost once I have the merge/rebase test results, somehow there was 
a firmware regression during the Thanksgiving break.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
