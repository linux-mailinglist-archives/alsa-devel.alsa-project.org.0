Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28B29BE7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 18:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179431703;
	Fri, 24 May 2019 18:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179431703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558714419;
	bh=aAlUrvFQ75YOuNbrCbIVLVvV6QiaxVjuMIQQyYVD8zo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUOH1HXhfO7iOEKD0sTfNxFS+lxoMbpHJeZ+UIj0huRrfJL610g97U8RP89bFHbA5
	 fIwk8YNMjv9pjDxTKRdsEFvWqexyBT7iIMGiyN8uSmqmH/wFvzrKlXzCUnJ/bzl8My
	 B/oyv++9G0BntRyiVw+04L+OnrThLdQ19JFDAW+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3ECF89673;
	Fri, 24 May 2019 18:12:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3660F89636; Fri, 24 May 2019 18:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D9EDF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 18:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9EDF806F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 09:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,507,1549958400"; d="scan'208";a="177764233"
Received: from nmela-mobl2.amr.corp.intel.com (HELO [10.251.6.190])
 ([10.251.6.190])
 by fmsmga002.fm.intel.com with ESMTP; 24 May 2019 09:12:34 -0700
To: Daniel Drake <drake@endlessm.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
Date: Fri, 24 May 2019 11:12:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
 are detected
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



On 5/24/19 10:45 AM, Daniel Drake wrote:
> Thanks for the patches!
> 
> On Fri, May 24, 2019 at 7:26 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> I am not sure if it's a good idea to enable this by default, the
>> experience of the first round showed it's risky to make assumptions on
>> what BIOS vendors implemented.
> 
> Can you clarify what you mean here, are you saying you don't want to
> enable this new DMIC hardware support by default?

No. What I am saying is that
a) the legacy HDaudio driver does not support DMICs
b) the decision to abort the HDaudio legacy driver probe should not be 
the default, since it depends on BIOS information that may be wrong and 
on which I have *zero* control.

There are 4 cases really:

1. DMICs attached to PCH and BIOS/NHLT reports DMICS -> abort HDaudio 
legacy probe
2. No DMICs attached to PCH and BIOS/NHLT does not report DMICs -> 
continue probe and use HDAudio legacy.
3. DMICs attached to PCH and BIOS/NHLT does not report DMICs -> broken 
config, we will need an option to abort the probe by force and ignore 
the BIOS if you care about audio capture.
4. no DMICs attached to PCH and BIOS/NHLT reports DMICs -> broken 
config, we need an option to ignore the BIOS and continue the probe.

Does this help?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
