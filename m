Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101F333D6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 17:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9571662;
	Mon,  3 Jun 2019 17:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9571662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559576868;
	bh=qNUoMdwZYWqykXFFieNLY+Tl+gLm8XHnSsNFqQoUWkU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSxBWW71XPRehkb4sB0suuNZuD3h+xgZx/yArG3WDk4WaCSB/cSlkYJdYChZyzWxL
	 9RzUc70pQ/M/y6CbTvx++ye7WvJ3/+SskM+vnUvKYAdLsRdRs96oJwIz068wBM3Alf
	 62rR/X3j+yq29YjYwaJDG16ebjQtbH7U5qpUasDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B8B7F896DD;
	Mon,  3 Jun 2019 17:46:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 688C5F896DD; Mon,  3 Jun 2019 17:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFB74F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 17:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB74F80774
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 08:45:54 -0700
X-ExtLoop1: 1
Received: from amatsuba-mobl.amr.corp.intel.com (HELO [10.251.134.25])
 ([10.251.134.25])
 by orsmga001.jf.intel.com with ESMTP; 03 Jun 2019 08:45:53 -0700
To: alsa-devel@alsa-project.org
References: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <436681ea-6ffb-93f5-9bae-1f01d98e072f@linux.intel.com>
Date: Mon, 3 Jun 2019 10:45:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: SOF: suspend/resume debug tools
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



On 5/24/19 2:23 PM, Pierre-Louis Bossart wrote:
> No new functionality per se, just utilities for developers. The vast
> majority of current integration issues are related to HDAudio + trace
> support combined with runtime suspend/resume.
> 
> Add a couple of changes to make it easier for developers to see the
> firmware logs across suspend/resume transitions, disable the trace
> and/or disable runtime_pm to help narrow down the problems.
> 
> Kai Vehmanen (2):
>    ASoC: SOF: trace: remove code duplication in sof_wait_trace_avail()
>    ASoC: SOF: force end-of-file for debugfs trace at suspend

Hi Mark, you applied the first two patches in this series but the last 3 
patches were left out. Were they missed somehow or is there any objection?

> Pierre-Louis Bossart (3):
>    ASoC: SOF: trace: move to opt-in with Kconfig and module parameter
>    ASoC: SOF: acpi: add module param to disable pm_runtime
>    ASoC: SOF: pci: add module param to disable pm_runtime
> 
>   sound/soc/sof/Kconfig        |  8 +++++
>   sound/soc/sof/core.c         | 26 ++++++++++----
>   sound/soc/sof/sof-acpi-dev.c | 12 ++++++-
>   sound/soc/sof/sof-pci-dev.c  | 12 ++++++-
>   sound/soc/sof/sof-priv.h     |  3 ++
>   sound/soc/sof/trace.c        | 67 ++++++++++++++++++++++++++++++------
>   6 files changed, 110 insertions(+), 18 deletions(-)
> 
> 
> base-commit: 188d45fe779eeb8e3521b59fcb12cc48a6f2c203
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
