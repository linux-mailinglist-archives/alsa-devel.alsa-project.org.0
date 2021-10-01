Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E115D41F12B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 17:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD4B16D6;
	Fri,  1 Oct 2021 17:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD4B16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633101876;
	bh=GAXL0ico02hYGfQHSmF7OcHldDW0tSK0dpyluJ6SMFc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pY0LrsagTPgRWfw+VDy0KI6ypmtgYahDGfQFPo7iJZOHYrL3sathTlg07WF+M0CMp
	 CEU2pKgt93As7F+hqo9O9hefi9jrM2pnkFPIpczgTIhYNRck+CIZYfxKrz7HXuP7w0
	 jl/7q4XbBrrLapaWMpQUgl2Rp6/yEzXEsFOmIYAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6627F8026D;
	Fri,  1 Oct 2021 17:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B99F80245; Fri,  1 Oct 2021 17:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B131F800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 17:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B131F800F3
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="204950582"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="204950582"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:23:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="540276460"
Received: from pwhela2-mobl1.ger.corp.intel.com (HELO [10.213.160.166])
 ([10.213.160.166])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:23:05 -0700
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20211001150316.414141-1-brent.lu@intel.com>
 <MWHPR11MB1919F695979F9AAED31B27E297AB9@MWHPR11MB1919.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4460fe70-2541-ceb1-1d83-b3deebf21bb0@linux.intel.com>
Date: Fri, 1 Oct 2021 10:23:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1919F695979F9AAED31B27E297AB9@MWHPR11MB1919.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Yang, Libin" <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "Liao,
 Bard" <bard.liao@intel.com>, "Wang, Rander" <rander.wang@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
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



On 10/1/21 10:07 AM, Lu, Brent wrote:
>>
>> From: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
>>
>> Add a board config adl_mx98360a_rt5682 to support alc5682 headset codec
>> and max98360a speaker amplifier. Follow Intel BT offload design by
>> connecting alc5682 to SSP0 and max98360a to SSP1.
>>
>> Signed-off-by: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
>> Signed-off-by: Brent Lu <brent.lu@intel.com>
> 
> Already accepted on SOF github. Merged with another fixup patch for the
> platform device name.

Yes this was reviewed by Bard and me on GitHub.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
