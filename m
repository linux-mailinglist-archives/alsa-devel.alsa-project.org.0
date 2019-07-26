Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B276573
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C15202A;
	Fri, 26 Jul 2019 14:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C15202A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143190;
	bh=Yqib46ucbbdoWMWLKxcCRyXkvU9l0RA23CTWjsK98YA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ozl1EXTOoDQXzUgsO3pcWCsIMl+00r7SJZIVpCDRFVoKxkGQ6w/J5Nes9jXpoDFbd
	 u7BO2wJzkLWDvEhoZwowWZZmZkJQj563bZf53DUFRyOt7zOYVD63RdnvdTVEhUThxX
	 jvF0ySOjso7/9NH2op1pLGohBLTe6jyShVHXYaqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FA2F804CB;
	Fri, 26 Jul 2019 14:10:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13332F804AB; Fri, 26 Jul 2019 14:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71BA7F804A9
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BA7F804A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 05:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="175579886"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 05:10:48 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190722134410.9602-1-pierre-louis.bossart@linux.intel.com>
 <20190722134410.9602-3-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <b302a687-36a8-c3b4-32a9-27c47d3fb9cd@intel.com>
Date: Fri, 26 Jul 2019 14:10:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722134410.9602-3-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/5] ALSA: hda: move parts of NHLT code
 to new module
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

On 2019-07-22 15:44, Pierre-Louis Bossart wrote:
> Move parts of the code outside of the Skylake driver to help detect
> the presence of DMICs (which are not supported by the HDaudio legacy
> driver).
> 
> No functionality change (except for the removal of useless OR
> operations), only indentation and checkpatch fixes, and making sure
> that the code compiles without ACPI
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I didn't really see response to previous review apart from CONFIG_ thingy.
- By the way, thanks Takashi for in-depth explanation!

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/152407.html

Especially the ACPI leak part, though I'd hoped you would jump on my 
shift-left train too :s
Although, maybe those changes should be separated from relocation patch 
and ignored for current series..

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
