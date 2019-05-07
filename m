Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A247C16C34
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 22:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448D017D6;
	Tue,  7 May 2019 22:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448D017D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557260869;
	bh=T9GRwiOeIIDwnBpFJPPkCGjfXDgd8uGjcZ2eBn0+Vtk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osky1iZYFBw1pkJHDPy8yuJKiHuG/uFhdxz03WPitV5d7VWB/qts2vSrLJiTbevab
	 XOia80HxI6GVAvorUl9WfnUzq9N7HWGJ96SnYVzeFz+FnHLDl3fYAI2+KCHWbtnoKM
	 LLWLtn3Gw89Xpgqne83J8nMv7ewHg3tBVPPEdchY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 989D5F89678;
	Tue,  7 May 2019 22:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 995C4F89678; Tue,  7 May 2019 22:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A00F8F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 22:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A00F8F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 13:26:47 -0700
X-ExtLoop1: 1
Received: from rashavex-mobl.amr.corp.intel.com (HELO [10.252.204.102])
 ([10.252.204.102])
 by fmsmga006.fm.intel.com with ESMTP; 07 May 2019 13:26:45 -0700
To: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Evan Green <evgreen@chromium.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190506225321.74100-1-evgreen@chromium.org>
 <20190506225321.74100-2-evgreen@chromium.org>
 <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
 <64FD1F8348A3A14CA3CB4D4C9EB1D15F30A7C756@BGSMSX107.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5c42b741-5e5c-ce00-8321-59df1df115f1@linux.intel.com>
Date: Tue, 7 May 2019 15:26:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <64FD1F8348A3A14CA3CB4D4C9EB1D15F30A7C756@BGSMSX107.gar.corp.intel.com>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Zhang <benzh@chromium.org>, "M, Naveen" <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
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



> On 5/6/19 5:53 PM, Evan Green wrote:
>>> Add support for Intel Comet Lake platforms by adding a new Kconfig for
>>> CometLake and the appropriate PCI ID.
> 
>> This is odd. I checked internally a few weeks back and the CML PCI ID was 9dc8, same as WHL and CNL, so we did not add a PCI ID on purpose. To the best of my knowledge SOF probes fine on CML and the known issues can be found on the SOF github [1].
> 
> The PCI ID change is seen on later production Si versions. The PCI ID is 02c8.

As I suspected, we are talking about different skews and generations of 
the chipset and a board-level change, not silicon change.

The CNL PCH-LP PCI ID is 0x9DC8, the CNL PCH-H PCI ID is 0xA348 (used 
for CoffeeLake). Both are supported by SOF.

What we are missing are the PCI IDs for CML PCH-LP (0x02C8) and CML 
PCH-H (0x06C8).

Can we respin this patchset to add support for those last two instead of 
just the -LP case?

I'll send a patch to add those IDs for the HDaudio legacy driver for 
consistency.

Thanks!
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
