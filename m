Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53E7508F3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 14:59:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 222AE1F6;
	Wed, 12 Jul 2023 14:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 222AE1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689166791;
	bh=FvuonApgo3gnnJdPGRqPyo1DrsyIWj9AcxIUCeLyd6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Br+e2JPkUL8FYaBwL7/un9wrC9jVCZ7zfiN/unK7/KdZ5k+zeKloGciN7k+W1No5b
	 v/rJyCdazVS0YdsLAqIHVAWbkZMuFZzzHo6uPJTjbx1h8XghiuNl8J4+TuHoQAH03U
	 oC/NC5WNnDqOHQn3tSwoi49G0BTjnsDH+9zM5ZCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5132FF80290; Wed, 12 Jul 2023 14:59:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F46F80236;
	Wed, 12 Jul 2023 14:59:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBCEDF80249; Wed, 12 Jul 2023 14:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29037F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29037F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cHxCj9mh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689166732; x=1720702732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FvuonApgo3gnnJdPGRqPyo1DrsyIWj9AcxIUCeLyd6A=;
  b=cHxCj9mh7eMCw/LLfrZJicLJ8OJvdj+08GN2u3SLVzNoS9JNgS2959zY
   2kvT+6HdVhpTR7p9ND5rBm3WWftj2DctnyPv84qmkrqiM1hdA12SLAgfY
   otkPHZyCVgXBPiJM+yigOrIkRR1G3TTLe6HsXPTKTb2IE6/JJNSK7D3xR
   +Ttoy25Ky0nTlsBzX5wF+8dbHYaG4viyxo5Lnthm19aHPFGS+OY7vGUop
   vK3j1H2GkVeO8g1eTZmvjWR9SywRfQihVFOemASP+C2zsi8N1SKLqk2u0
   i+sw0dY//ldYy1u+jcPMa78O67AluglCMd5xOVj+7CX3uhiHvA6vQsQqq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428617416"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="428617416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895623137"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="895623137"
Received: from hoermank-mobl.ger.corp.intel.com (HELO [10.252.42.188])
 ([10.252.42.188])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:58:42 -0700
Message-ID: <6d1e5e05-1bc8-25cc-0d53-043c3bc1fc72@linux.intel.com>
Date: Wed, 12 Jul 2023 14:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v4] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Yong Zhi <yong.zhi@intel.com>,
 Uday M Bhat <uday.m.bhat@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Arnd Bergmann <arnd@arndb.de>, Terry Cheong <htcheong@chromium.org>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, linux-kernel@vger.kernel.org
References: <20230712191423.443765-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230712191423.443765-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ON6AHNMRGOUSXTZRBNB3I3ZQLFKA5O2N
X-Message-ID-Hash: ON6AHNMRGOUSXTZRBNB3I3ZQLFKA5O2N
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON6AHNMRGOUSXTZRBNB3I3ZQLFKA5O2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/12/23 21:14, Brent Lu wrote:
> This configuration supports JSL boards which implement ALC5650 dual
> I2S interface codec. Two DAI links are added: AIF1 (on codec side) for
> headphone and AIF2 for speakers.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks!
