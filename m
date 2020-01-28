Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9114C1E8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 22:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83362165D;
	Tue, 28 Jan 2020 22:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83362165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580246019;
	bh=Sk5TgSYoFadu8YlhLj7hfSJA5/KcGnktk0o3ThR+/1M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6hHtqGKvTGxKQGy80QVqdlpOiPNU4uEKntMd+nu4EgkTqudAUsy3ks1Qgv27QUgR
	 mPwZ9s/TFcG0APa+GNgp3zae3JZ7JQkv/jqLoyV3Wg6r/G2eCbDFDIXRjrfg++CUqh
	 7X7UtSH3/yB5lkjwXrK8ma+r8OBRd+fz3DgRBotg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940BEF80082;
	Tue, 28 Jan 2020 22:11:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A13B8F80150; Tue, 28 Jan 2020 22:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E679F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 22:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E679F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 13:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; d="scan'208";a="261576935"
Received: from lhan5-mobl.amr.corp.intel.com (HELO [10.254.38.242])
 ([10.254.38.242])
 by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2020 13:11:39 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <7817f679-fb6f-ad36-aeee-5ee62034a735@linux.intel.com>
 <462e700e-96e8-8941-5de1-fd8ef5f6c18f@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <450d7f9a-239a-0251-a58f-60591cc92736@linux.intel.com>
Date: Tue, 28 Jan 2020 15:11:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <462e700e-96e8-8941-5de1-fd8ef5f6c18f@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


>> I am fine with this update, but I just thought of an obscure case and 
>> couldn't find the answer on my own.
>>
>> These probe points are enabled/disabled with direct IPC calls. Once 
>> those routines have been called, I don't see any context maintained by 
>> the driver (other than the stream tag for the extractor).
> 
> These do not need to be maintained by the driver at all, it's FW's job 
> actually. Notice the existence of _INFO getters for probe_points and 
> dmas. FW caches all the necessary info for us and when required, host 
> can request for it via IPCs.

D'oh. That's a major disconnect I am afraid.

When the the PCI device enters D3 on APL+, the power rails are turned 
off and the SOF firmware does not save any context. On D0 resume, the 
power rails are turned back on, firmware is downloaded again, and 
ALSA/ASoC/topology cores restore the context with a set of IPCs.

The behavior you describe might be relevant for previous versions of the 
closed-source firmware but not for SOF as of today. The 
firmware-initiated context save/restore just does not exist.

I also wonder if a firmware-only solution would work, the DMA stream 
tags are allocated on the host side, so on resume you could have a 
coherency issue with possibly mismatches.

> Driver makes use of such operation during sof_probe_compr_free(). Before 
> _probe_deinit() is called, all the probe_points should be disconnected 
> and all the dmas detached. Since this patchset addresses extraction-only 
> (from the runtime point of view), the later is ignored.
> 
>>
>> So here's my question: what happens if there is a pm_runtime or system 
>> suspend after playing with debugfs to configure those probes? Would 
>> all context be lost and the user needs to re-enable all probes?
>>
>> Also what happens if there is a system suspend while an extractor is 
>> opened, would it be restored? I imagine a pm_runtime suspend is not 
>> possible since the device is active then.

> As stated, there is no cache on the host side, caching is left up to FW 
> alone. Debugfs files act only as a ipc-proxies. As probes require device 
> to be up and running, suspend is not possible. After suspend, I believe 
> FW context would be lost so all the actions had to be repeated.
> 
> I'd suggest consulting SOF FW team in regard to probes design if you 
> want to pursue the suspend case - whether it is achievable or not.

That team is in your building :-)

suspend/resume support is a requirement for all SOF capabilities - no 
exceptions. At minimum, you would want to do a pm_runtime_get_sync() to 
prevent runtime_pm from kicking-in while probes are enabled.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
