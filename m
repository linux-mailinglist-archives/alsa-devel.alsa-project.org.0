Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E414C001
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 19:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BF731670;
	Tue, 28 Jan 2020 19:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BF731670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580236834;
	bh=wo9qXXEhZs1MId4laHl4ul/uT0TTmCFQowSU/F4g+08=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+xkWElI6l1RyX+CHEAhmr3xHXcf9bT6wObipa7JUnFk9Vix7CNLnQlfrurvJwKG2
	 TItNdmz3nihVy46F0CvAUe7sdZIYtcd5GqIKaT9BPrqKKhM28U33VDkiWRNISlS3u8
	 EE1OcAeFEA1P7QvHUbgtVqOOURSKwKtWso/H3HJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54803F80150;
	Tue, 28 Jan 2020 19:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5BCF80150; Tue, 28 Jan 2020 19:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B93E1F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 19:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B93E1F80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:01:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="232042988"
Received: from cauduong-mobl1.amr.corp.intel.com (HELO [10.254.184.245])
 ([10.254.184.245])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 10:01:13 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7817f679-fb6f-ad36-aeee-5ee62034a735@linux.intel.com>
Date: Tue, 28 Jan 2020 11:55:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128104356.16570-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v3 00/11] ASoC: SOF: Data probing
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



On 1/28/20 4:43 AM, Cezary Rojewski wrote:
> This set of patches achieves few goals in order to enable data probing
> feature for audio DSP.

I am fine with this update, but I just thought of an obscure case and 
couldn't find the answer on my own.

These probe points are enabled/disabled with direct IPC calls. Once 
those routines have been called, I don't see any context maintained by 
the driver (other than the stream tag for the extractor).

So here's my question: what happens if there is a pm_runtime or system 
suspend after playing with debugfs to configure those probes? Would all 
context be lost and the user needs to re-enable all probes?

Also what happens if there is a system suspend while an extractor is 
opened, would it be restored? I imagine a pm_runtime suspend is not 
possible since the device is active then.

I'd be fine if this was handled in a follow-up series, just want to see 
if my question is relevant and if yes what it takes to support suspend.

Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
