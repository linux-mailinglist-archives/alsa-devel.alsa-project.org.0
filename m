Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0B4196B2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5045C16B1;
	Mon, 27 Sep 2021 16:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5045C16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632754125;
	bh=c8yDq97SgI2SBiryrYGmX0UnwnIqHvEaxuvla0Y9AlM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0TRFv8b6Wte57zIPGHo1O6kL7aHpb6K/GGyDMl+Z308PpOl9pGeC7ju6/haVk+7y
	 Ixdb+xScclzOln7yG7dcKoDrVUL0RHDtrq8W9HZNR0r9AMBmEZXpafV5cOTqCVdpWP
	 +mLKhSwbt7FsOfvgjSqMjpO32YD2Zn9KWttK61e0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79FEAF8026D;
	Mon, 27 Sep 2021 16:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2232EF80227; Mon, 27 Sep 2021 16:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A9EF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 16:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A9EF80161
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="224521185"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="224521185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 07:47:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="486170661"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 07:47:12 -0700
Subject: Re: [PATCH] ASoC: intel: sof_rt5682: update platform device name for
 Maxim amplifier
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20210927143249.439129-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b08ed96d-853f-2f00-d4d5-5704573722ee@linux.intel.com>
Date: Mon, 27 Sep 2021 09:47:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927143249.439129-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 9/27/21 9:32 AM, Brent Lu wrote:
> To follow 20-character length limitation of platform device name, we
> have only 7 character space for amplifier. Therefore, the last
> character of mx98357a and mx98360a is removed to save space.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

This patch fixes an issue reported in our Sparse checks:

sound/soc/intel/boards/sof_rt5682.c:1070:25: error: too long
initializer-string for array of char(no space for nul char)

Fixes: e224ef76fa8a ('ASoC: intel: sof_rt5682: support
jsl_rt5682s_mx98360a board')

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

FWIW here's what we use in our checks:

export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all -Wno-bitwise-pointer
-Wno-pointer-arith -Wno-typesign -Wnoshadow"
make allmodconfig
make -k sound/soc/sof/ C=2
make -k sound/soc/intel/common/ C=2
make -k sound/soc/intel/boards/ C=2
make -k sound/soc/amd/ C=2
make -k drivers/soundwire/ C=2

