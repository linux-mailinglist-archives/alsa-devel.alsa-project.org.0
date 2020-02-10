Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31187157F7A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 17:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3071670;
	Mon, 10 Feb 2020 17:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3071670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581350979;
	bh=zbWb5VcgsrnDPp9Sd69vAlG0kMnIuApbfu7jKpyangk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdcDNFHhQ8cqKxR/zNPrRUqK2UahNsujIYzUQDiounbUB16wANPv/JV8J+S9HmQ7j
	 cUUi1/OhBWdIOBo3/kVfu0WHlFWPQ7IaFMTDSwetOrezGmSLXGpqSoWsjL45Rj0MJj
	 kDt4PGYT1pOc1ctL2C6DyufyJHSeFAYXGccvQh8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC4C9F800E7;
	Mon, 10 Feb 2020 17:07:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA56DF80157; Mon, 10 Feb 2020 17:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 213EEF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 17:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213EEF800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 08:07:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="226237939"
Received: from ykatsuma-mobl1.gar.corp.intel.com (HELO [10.251.140.95])
 ([10.251.140.95])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2020 08:07:48 -0800
To: Curtis Malainey <cujomalainey@google.com>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <00ed82c4-404a-ec70-970e-56ddce9285ae@linux.intel.com>
 <CAOReqxhHfTuj6mxeX2e_ejMY8N4u+BFLfzKDgn=y5EbWLL_joA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a0aa0705-8d74-3316-13f8-8661d31e928b@linux.intel.com>
Date: Mon, 10 Feb 2020 10:07:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxhHfTuj6mxeX2e_ejMY8N4u+BFLfzKDgn=y5EbWLL_joA@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Brent Lu <brent.lu@intel.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
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



On 2/10/20 9:44 AM, Curtis Malainey wrote:
> +Jimmy Cheng-Yi Chiang <cychiang@google.com>
> 
> This error is causing pcm_open commands to fail timing requirements,
> sometimes taking +500ms to open the PCM as a result. This work around is
> required so we can meet the timing requirements. The bug is explained in
> detail here https://github.com/thesofproject/sof/issues/2124

Ah, thanks for the pointer, but this still does not tell me if it's a 
GLK-only issue or not. And if yes, there are alternate proposals 
discussed in that issue #2124, which has been idle since November 25.

What I am really worried is side effects on unrelated platforms.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
