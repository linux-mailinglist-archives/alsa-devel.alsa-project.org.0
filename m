Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1FB19F1D1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 10:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4481662;
	Mon,  6 Apr 2020 10:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4481662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586163035;
	bh=qKntilfW7DvxDLClBuD0ZyICKcMin7ha0IT2JYQK+bs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sh4aw0wCS+ieKNzk+Dv9FY7LW5WigO+9mLJVbWRzDIL3l3DWAMufZiPjmJmDX7SFn
	 uXg6cGaexV1uzE+tcauxXdHDwX36FA5tmV38RBjpr73b7hbGXb43PO/xvV0VBbqJDt
	 GcGChRAbLSoIg7VdNg2PYInVx4j4CP80iHOs9EJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C418DF80150;
	Mon,  6 Apr 2020 10:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ADE7F80143; Mon,  6 Apr 2020 10:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE24FF80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 10:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE24FF80121
IronPort-SDR: TTgeVLJw22bYgR/JAO3oaIDrnnOVwgOzfix5YiKrCG3MgQphXpcTlVCyzcF9Z9t1XXCtoSJnPH
 qmyZZ/DVny/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 01:48:44 -0700
IronPort-SDR: rmgPZlFHxARBJ53t68oND/gO7z2sFnd6AUcw9u0cwQFX0XkInDaW8z5JhlAcBFwiWioM9eCF/9
 H5oK/erwzfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="285826482"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.13.79])
 ([10.213.13.79])
 by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2020 01:48:42 -0700
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: alsa-devel@alsa-project.org
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
Date: Mon, 6 Apr 2020 10:48:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330194520.13253-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On 2020-03-30 21:45, Cezary Rojewski wrote:
> Update D0 <-> D3 sequence to correctly transition hardware and DSP core
> from and to D3. On top of that, set SHIM registers to their recommended
> defaults during D0 and D3 proceduces as HW does not reset registers for
> us.
> 
> Connected to:
> [alsa-devel][BUG] bdw-rt5650 DSP boot timeout
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153098.html
> 
> Github issue ticket reference:
> https://github.com/thesofproject/linux/pull/1842
> 
> Tested on:
> - BDW-Y RVP with rt286
> - SAMUS with rt5677
> 
> Proposed solution (both in July 2019 and on github):
> 'Revert "ASoC: Intel: Work around to fix HW d3 potential crash issue"'
> is NAKed as it only covers the problem up and actually brings back the
> undefined behavior: some registers (e.g.: APLLSE) are describing LPT
> offsets rather than WPT ones. In consequence, during power-transitions
> driver issues incorrect writes and leaves the regs of interest alone.
> 
> Existing patch - the non-revert - does not resolve the HW D3 issue at
> all as it ignores the recommended sequence and does not initialize
> hardware registers as expected. And thus, leaving things as are is also
> unacceptable.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---

Pierre, your thoughts on this? This has already been confirmed working.
