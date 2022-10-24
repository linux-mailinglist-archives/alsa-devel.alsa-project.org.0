Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29460AEBF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 17:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FAD872E3;
	Mon, 24 Oct 2022 17:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FAD872E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666624488;
	bh=niF3OOMuxBJf42GNSgH6rGt2vBqcz2E/dTF4a0i39U0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TUZ6+2n5TsPX979RPH5H8wJthxFIoiHVjhdFyTn5/BimFkxMdqe0E+pNyl2D70ycS
	 1tYT290p07pEfHUh5pvchTkHhZX2G8/wNKvwSm9/bjp4i5vllen1C18itB76IIXM1q
	 DDFR4A6oJE275m5B7ZZzxc6LNY7rz3QuApoy3tnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E637F80553;
	Mon, 24 Oct 2022 17:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D35B3F80548; Mon, 24 Oct 2022 17:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB48F8052F
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB48F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TxIAniYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666624400; x=1698160400;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=niF3OOMuxBJf42GNSgH6rGt2vBqcz2E/dTF4a0i39U0=;
 b=TxIAniYNpXkQZ85UskYpbT+6ekoqHotfaCjYoHfq9eWv5PFoNQnve7jk
 zMwdLiJPdSi52HMI66Sks2E1101/pqzRv3kNOOEL5/aN07C2HGa7bYD4m
 w3MvyUV+Cof/SLOoYU+BbnHWyyRwwMzuFUNd1D2sko4H61sVL43x8D1ZM
 jcORsiZaryzjtyfJgo83MasGT2TXmMHLQKpErocq1kZ3XClrLBWc2fdmE
 XAcWbu8F8at1wnSsyMwiZvHyyEL+cVCDQeludoDmk72+w+3Fz9L+sM0Eb
 xbQbk1lc+gZMIgvQRz7PIIIsaD4rk1nW50uEq4taeRTfro2ujofAKRG4y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306174628"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="306174628"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:13:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="626099079"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626099079"
Received: from lmforney-mobl1.amr.corp.intel.com (HELO [10.209.175.17])
 ([10.209.175.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:13:12 -0700
Message-ID: <903eec24-3ea6-d4b1-3b3b-2a73770dca83@linux.intel.com>
Date: Mon, 24 Oct 2022 09:13:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ASoC: Intel: boards: Fix typo in comments
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
 <20221024190841.31572-2-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221024190841.31572-2-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 10/24/22 14:08, Amadeusz Sławiński wrote:
> It keeps propagating through machine boards, fix it once and for all.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bdw-rt5650.c             | 2 +-
>  sound/soc/intel/boards/bdw-rt5677.c             | 2 +-
>  sound/soc/intel/boards/bxt_rt298.c              | 2 +-
>  sound/soc/intel/boards/bytcht_cx2072x.c         | 2 +-
>  sound/soc/intel/boards/bytcht_es8316.c          | 2 +-
>  sound/soc/intel/boards/bytcr_rt5640.c           | 2 +-
>  sound/soc/intel/boards/bytcr_rt5651.c           | 2 +-
>  sound/soc/intel/boards/bytcr_wm5102.c           | 2 +-
>  sound/soc/intel/boards/cht_bsw_max98090_ti.c    | 2 +-
>  sound/soc/intel/boards/cht_bsw_nau8824.c        | 2 +-
>  sound/soc/intel/boards/cht_bsw_rt5645.c         | 2 +-
>  sound/soc/intel/boards/cht_bsw_rt5672.c         | 2 +-
>  sound/soc/intel/boards/skl_nau88l25_max98357a.c | 2 +-
>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c   | 2 +-
>  14 files changed, 14 insertions(+), 14 deletions(-)
