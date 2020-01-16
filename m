Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC613D1C3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 02:56:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15BE17B9;
	Thu, 16 Jan 2020 02:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15BE17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579139797;
	bh=w6ANQuuwqOpqDPnhpuOkddw7uivui3LyikxnbZ4BnFA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4HNyqVn3lt3u1ShuaNZmHU0YDHXJsJBq4fm5LA8d7iZ/MZzNafjb62u7c4botkge
	 eLtE6Qgx1J5Xmqhn7062env+uhmMeveX8tGRMK9jQplC3jRQleqqWjwdIpwTCblESG
	 I4iL3TdVipwtug2hd/jatBUNPk5m1EQKmtSfAPxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FFBFF80274;
	Thu, 16 Jan 2020 02:53:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F02F800CC; Thu, 16 Jan 2020 02:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04167F800CC
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 02:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04167F800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 17:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,324,1574150400"; d="scan'208";a="423839878"
Received: from cecox1-mobl.amr.corp.intel.com (HELO [10.251.131.55])
 ([10.251.131.55])
 by fmsmga005.fm.intel.com with ESMTP; 15 Jan 2020 17:52:57 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a64a8635-0393-c8ed-dca5-dc232aac7348@linux.intel.com>
Date: Wed, 15 Jan 2020 19:52:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH RFC v2 0/4] ASoC: Add Multi CPU DAI support
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



On 1/14/20 11:51 AM, Bard liao wrote:
> As discussed in [1], ASoC core supports multi codec DAIs
> on a DAI link. However it does not do so for CPU DAIs.
> 
> So, add support for multi CPU DAIs on a DAI Link by adding
> multi CPU DAI in Card instantiation, suspend and resume
> functions, PCM ops, stream handling functions and DAPM.
> 
> [1]: https://www.spinics.net/lists/alsa-devel/msg71369.html
> 
> changes in v2:
>   - rebase on asoc-next
>   - fix some typo
>   - compare and merge Kuninori Morimoto's version
>   - add warning if the function is not support multi cpu yet

I checked the code and didn't find blatant issues, except for 
inconsistent errors/warnings for the multi-cpu case, see other emails.

Looks really good to me otherwise, thanks Bard and Morimoto-san, nice work!

> 
> Bard liao (1):
>    ASoC: add warning if the function is not support multi cpu yet.
> 
> Shreyas NC (3):
>    ASoC: Add initial support for multiple CPU DAIs
>    ASoC: Add multiple CPU DAI support for PCM ops
>    ASoC: Add multiple CPU DAI support in DAPM
> 
>   include/sound/soc.h                   |  15 +
>   sound/soc/soc-compress.c              |   7 +-
>   sound/soc/soc-core.c                  | 222 ++++++-----
>   sound/soc/soc-dapm.c                  | 131 +++---
>   sound/soc/soc-generic-dmaengine-pcm.c |  12 +
>   sound/soc/soc-pcm.c                   | 547 +++++++++++++++++---------
>   6 files changed, 599 insertions(+), 335 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
