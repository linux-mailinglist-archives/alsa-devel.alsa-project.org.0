Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C373A1EB079
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 22:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5FD166D;
	Mon,  1 Jun 2020 22:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5FD166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591044735;
	bh=FgbJoYoUnaNT2Be+7L9+6vp7itS9Q2Wm5Kmyiwc/xRM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvkOUaJD1860TM9z4QMotxMpWGXhQurlrFyfKQKK9q+sUx/HCIRJdIYAoJ5hwyiZw
	 9AfLAR8HJ/CJTmW9WnRqMihwLctAYl97/FsBFy2PY0Wrvxl2QmtU2VpYGFvH8MX+Lj
	 yEERWiJUv4uV8vXlo79AFOyGTLWYLsFlAk4ULm3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FE2F801EC;
	Mon,  1 Jun 2020 22:50:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2CDF801ED; Mon,  1 Jun 2020 22:50:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB84F80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 22:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB84F80159
IronPort-SDR: zdFrBczNuv2Ds9E1KCuVh8158rGYQUyHiwxgmG9CV9xg/Ty350mcfkd9sNG4hMSobVB3SUOtpX
 rnk/dpeKGv+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 13:50:15 -0700
IronPort-SDR: bTUm3amk7QMCFwB2VTG76Lhz3xQiMTgOilKl0Norwi6VrvskLOxHpyrYURhD4p2u+PkUzLd+uh
 I0r78hlFKpHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; d="scan'208";a="257376265"
Received: from fwong2-mobl.amr.corp.intel.com (HELO [10.251.12.107])
 ([10.251.12.107])
 by orsmga007.jf.intel.com with ESMTP; 01 Jun 2020 13:50:14 -0700
Subject: Re: [PATCH] soundwire: clarify SPDX use of GPL-2.0
To: Greg KH <gregkh@linuxfoundation.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200531172807.27042-1-yung-chuan.liao@linux.intel.com>
 <20200601053809.GA1420218@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <686345af-4fda-4bc1-c3bf-da31406e806b@linux.intel.com>
Date: Mon, 1 Jun 2020 15:50:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601053809.GA1420218@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 mengdong.lin@intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 6/1/20 12:38 AM, Greg KH wrote:
> On Mon, Jun 01, 2020 at 01:28:07AM +0800, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> Change SPDX from GPL-2.0 to GPL-2.0-only for Intel-contributed
>> code. This was explicit before the transition to SPDX and lost in
>> translation.
> 
> It is also explicit in the "GPL-2.0" lines as well, did you read the
> LICENSES/preferred/GPL-2.0 file for the allowed tags to be used for this
> license?
> 
> So this doesn't change anything, and we are trying to cut down on this
> type of churn until, maybe, after the whole kernel has proper SPDX
> lines.

My commit message was misleading, sorry. For SoundWire, we recently 
added new files with GPL-2.0-only (master + sysfs), as recommended since 
the short GPL-2.0 identifier is deprecated 
(https://spdx.org/licenses/GPL-2.0.html https://spdx.org/licenses/).

Intel does not mind if we delay this change, you are right that this 
doesn't change anything license-wise. I just felt it was a good time to 
align old and new contributions to avoid having half of the files with 
GPL-2.0 and half with GPL-2.0-only.

We still have quite a few patches for SoundWire (~80 coming w/ 7k lines 
changed), so those changes are really minimal in comparison with the 
actual 'churn' to fix programming sequences, power management, 
multi-link management and bit allocation.

Oh and this was not intended to be added to 5.8 btw or pulled as a fix, 
really nothing to do with the merge window.

If you prefer us to keep this change on the back burner, that's fine, 
the only intent was to keep all SoundWire-related files consistent.


