Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EB6284E2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 17:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A0AB1683;
	Mon, 14 Nov 2022 17:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A0AB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668442691;
	bh=kiwQ0EsjaVIc5nx8UNug8Up0eAjXuQJy1+lUnlUIbdA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/h+DUigMzHRFEuB8LLGE3KaZN2m6PHLgHBeh2f5Ch21IYRsb/Wb4YhwjrsLu0Xd3
	 bJ7nd6kF2w2kWup2IhmXWCscJUJmgztQtK/L5j4XI9oEbN1rFWqYxtg920vGBQTHmb
	 flHd1pjDBVfr5VlQs4J/ny8+/SEBottk/Z3NIph8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DC7F80549;
	Mon, 14 Nov 2022 17:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF2AF8047D; Mon, 14 Nov 2022 17:16:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3865F80431
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 17:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3865F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mYA5sjB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442603; x=1699978603;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kiwQ0EsjaVIc5nx8UNug8Up0eAjXuQJy1+lUnlUIbdA=;
 b=mYA5sjB0s4E9NIoJOaKf6U0/XECCw0fo2MTTqnYm/6oqgsZ+yEwjTQhK
 AKZVoGCgburezLS9T6luQb7pCKEmnNaqEgZixEU3/4VGJzJpgrSYTTGId
 9UKjWE13SDVwz0yGu7P3SYX8T3pNw18KoyGNR/ARU1+jN1GbF1h6i40Jj
 TRbGfy4gdCR1nHtVLxbYCziYy+vJkyuxZtUjHH3MRahuWJO+IgUNDFwxF
 tVvs93tvoX8k1EVLD0gk+CHDolFgXJRdbqxTuDHeL0f1k+3peRBi0wyFn
 zV3hsO7YrNfVYQtDNlU22CTTtAvlHJbPXBGEnBCterMp69BJS+tMkTbzd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398301407"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="398301407"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638542546"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="638542546"
Received: from scewbso01.amr.corp.intel.com (HELO [10.212.76.77])
 ([10.212.76.77])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:37 -0800
Message-ID: <20d36e6d-0c4b-f903-8940-841ac1b65d98@linux.intel.com>
Date: Mon, 14 Nov 2022 10:11:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1 0/2] Adds the combination of headset codec ALC5682I-VD
 + amp rt1019p
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 11/7/22 22:27, Ajye Huang wrote:
> v1:
> - machine driver: 
>   - Adds the combination of headset codec ALC5682I-VD + amp rt1019p.
>   - Remove the duplicate code in machine driver.
> 
> Ajye Huang (2):
>   ASoC: Intel: sof_rt5682: add support for ALC5682I-VD with amp rt1019p
>   ASoC: Intel: sof rt5682: remove the duplicate codes

Nice catch on the second patch, this sort of duplicates are hard to
detect in code reviews.

For the series:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> 
>  sound/soc/intel/boards/sof_rt5682.c               | 7 +------
>  sound/soc/intel/common/soc-acpi-intel-adl-match.c | 4 ++--
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
