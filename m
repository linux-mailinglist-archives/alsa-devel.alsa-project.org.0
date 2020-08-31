Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BA257BF2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 17:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3733317B0;
	Mon, 31 Aug 2020 17:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3733317B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598886848;
	bh=XTkGY2MK3KaY/l+4C2P8iT+SJXe5m6stW1P075xTss8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9OR6UdCTE0MVdZP7OBrhZAVwrprMzE7UO8+IAOu+m+Fuh3la98n3yKhbh7GVtA1o
	 EUw6zHcXkVh/+8sTsiZ3fvlOUpEBUa6rzaWgRNC7Ke6as1GZVLkVQ4LLrz7MRUH1tZ
	 qsqSmi2qyP51b8UXGbf4me6fiH86wNb7RJOAe5Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E90F80058;
	Mon, 31 Aug 2020 17:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56667F801DA; Mon, 31 Aug 2020 17:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C7FF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 17:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C7FF80146
IronPort-SDR: MXQMAoEUXKKLwCUrT7SjYr3aRFdTDvMYhFnD+WqZTaZ9+XsgVtN73M5ForyjagOREcYoRhbuDj
 XNXwWzlLXqCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="144671416"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="144671416"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 08:12:11 -0700
IronPort-SDR: W2JTNx3hI1AVbQtJmUolyOm5HWXco2Bnn/FosS7i9xHr7AwwAdVR8Ta4SJaiRdxTSqkdd6aiE4
 FlbHmIAICbtw==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="501375147"
Received: from jaeikcho-mobl.amr.corp.intel.com (HELO [10.213.165.6])
 ([10.213.165.6])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 08:12:09 -0700
Subject: Re: [PATCH v3 0/3] ASoC: soundwire: fix port_ready[] dynamic
 allocation
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200830132742.20404-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd947a84-87cb-7eed-9ac2-fe3de42dfc31@linux.intel.com>
Date: Mon, 31 Aug 2020 10:12:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200830132742.20404-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 8/30/20 8:27 AM, Bard Liao wrote:
> The existing code allocates memory for the total number of ports.
> This only works if the ports are contiguous, but will break if e.g. a
> Devices uses port0, 1, and 14. The port_ready[] array would contain 3
> elements, which would lead to an out-of-bounds access. Conversely in
> other cases, the wrong port index would be used leading to timeouts on
> prepare.
> 
> This can be fixed by allocating for the worst-case of 15
> ports (DP0..DP14). In addition since the number is now fixed, we can
> use an array instead of a dynamic allocation.

Bard, the order of patches will break git bisect, no? I tried on my side 
and get the following error after applying patch1

sound/soc/codecs/max98373-sdw.c:337:20: error: assignment to expression 
with array type
   337 |  slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
       |

the order should be

ASoC: codecs: soundwire: remove port_ready[] usage from codecs.
soundwire: add definition for maximum number of ports
soundwire: fix port_ready[] dynamic allocation in mipi_disco

> Changes in v3:
> - Add ASoC tag in the cover letter title.
> - Edit the title and commit message of the third patch for better
>    understanding.
> 
> Changes in v2:
> - Split patches into sdw and asoc patches. Please note that "soundwire:
>    fix port_ready[] dynamic allocation in mipi_disco" and "ASoC: codecs:
>    fix port_ready[] dynamic allocation in ASoC codecs" should be merged
>    at the same time.
> 
> Pierre-Louis Bossart (3):
>    soundwire: add definition for maximum number of ports
>    soundwire: fix port_ready[] dynamic allocation in mipi_disco
>    ASoC: codecs: soundwire: remove port_ready[] usage from codecs.
> 
>   drivers/soundwire/mipi_disco.c  | 18 +-----------------
>   drivers/soundwire/slave.c       |  4 ++++
>   include/linux/soundwire/sdw.h   |  5 +++--
>   sound/soc/codecs/max98373-sdw.c | 15 +--------------
>   sound/soc/codecs/rt1308-sdw.c   | 14 +-------------
>   sound/soc/codecs/rt5682-sdw.c   | 15 +--------------
>   sound/soc/codecs/rt700-sdw.c    | 15 +--------------
>   sound/soc/codecs/rt711-sdw.c    | 15 +--------------
>   sound/soc/codecs/rt715-sdw.c    | 33 +--------------------------------
>   9 files changed, 14 insertions(+), 120 deletions(-)
> 
