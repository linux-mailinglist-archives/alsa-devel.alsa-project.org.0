Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AF172D69
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 01:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA6F16E0;
	Fri, 28 Feb 2020 01:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA6F16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582849989;
	bh=5mkc9o3CWMJEP6x8PhL0tuZM9/OvBuWxGRKlSVUvLZE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8Fruvd2RdGn8QTUrC12qWnD9cO45GZ73JOmLlz7QhzVjkJ5NF0ou3X+zLEFxQzUp
	 F+0G6mgU1X13RsNTLSiWfqWybV6U0gGQClxM+yaNkgOC91uy9YF8zR5ep2wYexa3w/
	 8FX5EaDZ/QkUuaLKj2sGmtJDeC93/PeSX2thl7ZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB388F8013E;
	Fri, 28 Feb 2020 01:31:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 271E4F80142; Fri, 28 Feb 2020 01:31:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38B0F80089
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 01:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38B0F80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 16:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="230941858"
Received: from wggoh-mobl.gar.corp.intel.com (HELO [10.254.45.93])
 ([10.254.45.93])
 by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2020 16:31:16 -0800
Subject: Re: [alsa-devel] [PATCH AUTOSEL 5.5 406/542] ASoC: SOF: Intel: hda:
 Fix SKL dai count
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-406-sashal@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aa50de05-6122-0ce4-e6e9-5fa587169adf@linux.intel.com>
Date: Thu, 27 Feb 2020 18:31:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214154854.6746-406-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Hi Sasha,

On 2/14/20 9:46 AM, Sasha Levin wrote:
> From: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> [ Upstream commit a6947c9d86bcfd61b758b5693eba58defe7fd2ae ]
> 
> With fourth pin added for iDisp for skl_dai, update SOF_SKL_DAI_NUM to
> account for the change. Without this, dais from the bottom of the list
> are skipped. In current state that's the case for 'Alt Analog CPU DAI'.
> 
> Fixes: ac42b142cd76 ("ASoC: SOF: Intel: hda: Add iDisp4 DAI")

This patch generates a kernel oops with v5.5.6 - mainly because the 
initial commit ac42b142cd76 is missing, which ends-up creating an empty 
entry in the skl_dai[] array.

This was just reported to us, see logs at
https://github.com/thesofproject/sof/issues/2418

the same problem is likely to happen with 5.4-stable
[PATCH AUTOSEL 5.4 349/459] ASoC: SOF: Intel: hda: Fix SKL dai count

Since the initial commit to be fixed was not included, the -stable 
branches should probably revert this patch? Adding ac42b142cd76 should 
also not generate any problems, I tested it on top of v5.5.6

The 'right' fix should be to use ARRAY_SIZE instead of hard-coded 
defines, but there are multiple dependencies so we'd probably need to 
refactor the code to so so.

Let me know if you want more details or additional help,
-Pierre

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Link: https://lore.kernel.org/r/20200113114054.9716-1-cezary.rojewski@intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   sound/soc/sof/intel/hda.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 63df888dddb6c..de0115294c74e 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -348,7 +348,7 @@
>   
>   /* Number of DAIs */
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> -#define SOF_SKL_NUM_DAIS		14
> +#define SOF_SKL_NUM_DAIS		15
>   #else
>   #define SOF_SKL_NUM_DAIS		8
>   #endif
> 
