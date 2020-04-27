Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167281BAEA2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 22:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B29168C;
	Mon, 27 Apr 2020 22:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B29168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588017760;
	bh=WxvgNkyLcQn42Pz48pbBkt5kATll5Ch0dv6g9EN+Wl8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJhpgDe3AfHvjwK+BWHvEGeoTS6cN1gZxq2JO/0th/Xv3vsb181BiLDfsAj8uFtlJ
	 POdcUkCLRrfByEdEm6k69TFNKWh5UA/rQvv/tXXcN5TmN4Ekmo6otiarQ1URuyYV35
	 d/02F7Y81gdqgVkTNmB7SHMqWKRnTBtWXAARv+2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BACDF80113;
	Mon, 27 Apr 2020 22:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C3DF8022B; Mon, 27 Apr 2020 22:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD7CDF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 22:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD7CDF80113
IronPort-SDR: WKHMmsELl/MloiA4uBhdUPBlAIqwjl+l2Ize3wpNJVm+LkF09Qv1R43t4aKHic9DJibBHZ/dMN
 CZ79vjDDUCrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 13:00:44 -0700
IronPort-SDR: fDtLeEuP3sSVa4mdzkBv3R8A6qi93TSOKes1DtKZNN8Vm0Vc+BkZ8YybBpysPl6vVv0r90cxIR
 dKNt5Ylspu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="281888165"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.7.127])
 ([10.213.7.127])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2020 13:00:41 -0700
Subject: Re: [PATCH v2 0/3] add channel constraint for BDW machine drivers
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1588007614-25061-1-git-send-email-brent.lu@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4d4b8978-88b3-9d54-8812-85fe35456ead@intel.com>
Date: Mon, 27 Apr 2020 22:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1588007614-25061-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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

On 2020-04-27 19:13, Brent Lu wrote:
> The machine driver bdw-rt5650 (for Google buddy) supports 2 or 4-channel
> recording while other two drivers support only 2-channel recording. HW
> constraints are implemented to reflect the hardware limitation on BDW
> platform.
> 
> Changes since v1:
> - Change the patch title.
> - Remove the DUAL_CHANNEL and QUAD_CHANNEL macros which are too obvious.
> - Follow the naming convertion, using 'bdw_rt5650_' and 'bdw_rt5677_' to
>    name startup functions.
> - Refine the comments in startup functions.
> - Redesign the bdw_rt5650_fe_startup() function for readability.
> - Add an assignment to initialize runtime->hw.channels_max variable.
> 

Thank you for addressing all listed issues.
I'll recheck hw constraints on my end just to be sure but this series 
looks good already, so:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
