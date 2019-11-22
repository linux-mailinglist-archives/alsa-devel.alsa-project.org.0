Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6061076A3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE4D181C;
	Fri, 22 Nov 2019 18:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE4D181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574444631;
	bh=nqI97SqBotsZLauRfxvURfrCvfTgrSZSWaeGgJRYAdM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9/k+GZsfof8sJEmldVYK+1oAIuDKQ5uQd9M1HfCT89hsBFPxoBQRrkWt2BKw1161
	 deZ4C7FtDpg9ciDtks5d7zHDZNoPGbP2KWnpJYnaM6YW3sExY/gG+2Tq+UMFantGQU
	 9ImyeQ4heASfFwV2ZJ6SBdx+mGal3U7gj0TaCVBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259E7F80214;
	Fri, 22 Nov 2019 18:39:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA6FF8015E; Fri, 22 Nov 2019 18:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9F86F80157
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F86F80157
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="238682968"
Received: from sygreen1-mobl4.amr.corp.intel.com (HELO [10.252.195.68])
 ([10.252.195.68])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2019 09:38:38 -0800
To: Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org
References: <20191122073114.219945-1-tzungbi@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e78ef583-da9c-3491-ab70-6be26c33acc6@linux.intel.com>
Date: Fri, 22 Nov 2019 09:21:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191122073114.219945-1-tzungbi@google.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH v2 0/3] ASoC: max98090: fix PLL unlocked
 workaround-related
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



On 11/22/19 1:31 AM, Tzung-Bi Shih wrote:
> This series is a follow up fix for the question:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157364.html

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Hope this is the last time we see this PLL unlock error :-)


> 
> Changes from v1:
> ASoC: max98090: remove msleep in PLL unlocked workaround
> - add more comments
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158969.html
> 
> ASoC: max98090: exit workaround earlier if PLL is locked
> - "sleep first and then check the status"
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158998.html
> 
> ASoC: max98090: fix possible race conditions
> - fix typo
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158966.html
> - add more descriptions in commit message
> 
> Tzung-Bi Shih (3):
>    ASoC: max98090: remove msleep in PLL unlocked workaround
>    ASoC: max98090: exit workaround earlier if PLL is locked
>    ASoC: max98090: fix possible race conditions
> 
>   sound/soc/codecs/max98090.c | 30 +++++++++++++++++++++---------
>   sound/soc/codecs/max98090.h |  1 -
>   2 files changed, 21 insertions(+), 10 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
