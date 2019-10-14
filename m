Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11490D66D1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FED1684;
	Mon, 14 Oct 2019 18:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FED1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571069111;
	bh=U46O8BcLmmnqSA1HXzt94/06HCYPItnbvoGQHytF7/0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JigAyyvNcn8Q37SrVvxfFNDpMPZ/Jadp5oQj81JFoLZknh5SXndLW3lCAwNPF3fiA
	 HByXsDvWOx5uizTs9kTuGaWhqNSaHXmGMmOLaw7CxbcwAx4U7C0IEbYLK7uCOjbiCb
	 RbD2UBsRvZqUzE9IgmbkM9DmS8ZmjeB4pVVeRE0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA36F805FA;
	Mon, 14 Oct 2019 18:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE930F80369; Mon, 14 Oct 2019 18:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58C6F80322
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58C6F80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 09:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="199439439"
Received: from rtnitta-mobl1.amr.corp.intel.com (HELO [10.251.134.135])
 ([10.251.134.135])
 by orsmga006.jf.intel.com with ESMTP; 14 Oct 2019 09:02:31 -0700
To: alsa-devel@alsa-project.org
References: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <635444ee-0a7f-73ab-f0d8-a910d9f38848@linux.intel.com>
Date: Mon, 14 Oct 2019 11:00:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 0/5] soundwire: intel/cadence: better
 initialization
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



On 9/16/19 2:09 PM, Pierre-Louis Bossart wrote:
> V2 of the original series 'soundwire: inits and PM additions for 5.4',
> with PM additions removed since more tests on hardware are required.

Vinod, if you are back at your desk, those patches are almost a month 
old. thanks!

> 
> Changes since v1: addressed feedback from Vinod Koul
> clarified init changes impact Intel and Cadence sides
> remove unnecessary intermediate variable
> disable interrupts when exit_reset fails, updated error handling
> returned -EINVAL on debugfs invalid parameter
> 
> Pierre-Louis Bossart (5):
>    soundwire: intel/cadence: fix startup sequence
>    soundwire: cadence_master: add hw_reset capability in debugfs
>    soundwire: intel: add helper for initialization
>    soundwire: intel/cadence: add flag for interrupt enable
>    soundwire: cadence_master: make clock stop exit configurable on init
> 
>   drivers/soundwire/cadence_master.c | 131 +++++++++++++++++++++--------
>   drivers/soundwire/cadence_master.h |   5 +-
>   drivers/soundwire/intel.c          |  38 ++++++---
>   3 files changed, 126 insertions(+), 48 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
