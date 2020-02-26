Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F3170496
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:40:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6211670;
	Wed, 26 Feb 2020 17:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6211670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582735259;
	bh=bKOL3ATWXHlEM0Yy7ni6T5vHF8MTPyXlquyNaMip9ac=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OO/tydxKF8xxB0v+Llz1Fq2lWfoGbvV9g3FkmuZb3JyCqo+BqSTeLOTpn+HUjTDEd
	 yFIiQeJAFDC4hR6TTlxiB1ZgiLUrqXOz1nC8nJdQsizW4BgM492kTQKa7cwLS4FrSr
	 9DshQeQjjh+GnQ6KPHfslwxYJYfgUxi5cXQUTupY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 597F2F8028A;
	Wed, 26 Feb 2020 17:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F51EF80213; Wed, 26 Feb 2020 17:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C58D5F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58D5F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 08:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="410671955"
Received: from nkaburla-mobl.amr.corp.intel.com (HELO [10.252.133.245])
 ([10.252.133.245])
 by orsmga005.jf.intel.com with ESMTP; 26 Feb 2020 08:38:04 -0800
Subject: Re: [PATCH 0/8] ASoC: soc-pcm cleanup step5
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <232de973-b977-fda8-b1c0-ca1b94494ebc@linux.intel.com>
Date: Wed, 26 Feb 2020 09:24:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 2/26/20 12:39 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> These are soc-pcm cleanup step5.
> These are based on Bard Liao's "ASoC: Add Multi CPU DAI support"
> patch-set.
> 
> [7/8] patch might exchange the behavior
> 
> Kuninori Morimoto (8):
>    1) ASoC: soc-pcm: use defined stream
>    2) ASoC: soc-pcm: remove duplicate be check from dpcm_add_paths()
>    3) ASoC: soc-pcm: move dpcm_fe_dai_close()
>    4) ASoC: soc-pcm: add dpcm_fe_dai_clean()
>    5) ASoC: soc-pcm: use snd_soc_dai_get_pcm_stream() at dpcm_set_fe_runtime()
>    6) ASoC: soc-pcm: check DAI's activity more simply
>    7) ASoC: soc-pcm: Do Digital Mute for both CPU/Codec in same timing.
>    8) ASoC: soc-pcm: tidyup dulicate handing at dpcm_fe_dai_startup()

Looks good to me (only minor nit-picks)

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

if you give 2-3 days we'll provide a Tested-by tag.

> 
>   sound/soc/soc-pcm.c | 107 ++++++++++++++++++++------------------------
>   1 file changed, 48 insertions(+), 59 deletions(-)
> 
