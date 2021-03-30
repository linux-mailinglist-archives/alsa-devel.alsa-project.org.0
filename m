Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BA34F191
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 21:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 202171681;
	Tue, 30 Mar 2021 21:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 202171681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617132493;
	bh=eq+HXrVJrTAVshUi84DQShpc4v7czfwveWqZvpE36HQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUxqDYCDnfkqop3I0014+yGLKubLrw2h4djQcxIJOrZfbygfhXFemVfYfW+RhQifv
	 HV3jvySg2p7c3uEh99N0FiN9phAC+z9nh2WC5/SaBLFXZ9u6Sl9DDwHyfto1bS5WDi
	 3QuHahiVoLRNJr1HCgNnunhdgz/5axYwtfM7tsow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B225F8026B;
	Tue, 30 Mar 2021 21:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5AC4F80240; Tue, 30 Mar 2021 21:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ADFDF8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 21:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADFDF8014E
IronPort-SDR: Pgi1Wk0Npuh3V//j+Xs5J/3km4JS7ZspieCziA5y4TPgAtrp3acdh6BYAYUWa4YIb6VYykyID6
 FBIorSQgsI+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="212062552"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="212062552"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 12:26:35 -0700
IronPort-SDR: XWc9DDgrfb5nhSAn5ey7ehcucwGl7YLKHydfD62OFhx1+w6ANPiq4Eggou2FZi20jGp4Bnzmrm
 J47dXXnlk0dw==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="610213285"
Received: from magnuson-mobl1.amr.corp.intel.com (HELO [10.254.111.68])
 ([10.254.111.68])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 12:26:34 -0700
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Jack Yu <jack.yu@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
Date: Tue, 30 Mar 2021 14:26:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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



>>> Using new kcontrols "Capture Switch" and "Capture Volume" instead,
>>> remove kcontrols which no longer be used.
>>
>> Is this going to disrupt any UCM profiles?
> 
> Yes (the rt715 prefix is from the SOF driver):
> 
> # RT715 specific volume control settings
> 
> BootSequence [
> 	cset "name='rt715 DMIC3 Boost' 2"
> 	cset "name='rt715 DMIC4 Boost' 2"
> 	cset "name='rt715 ADC 24 Mux' 3"
> 	cset "name='rt715 ADC 25 Mux' 4"
> 	cset "name='rt715 ADC 27 Capture Switch' 1"
> 	cset "name='rt715 ADC 07 Capture Switch' 1"
> 	cset "name='rt715 ADC 07 Capture Volume' 58"
> ]

To be clearer, we wanted to change the UCM files to only try to 
configure the 'old' controls when they are present. The 'new' controls 
are aligned between RT715 and RT715-sdca.

There will be a minor inconvenience if an existing platform updates the 
kernel without updating UCM files, but it's the only solution we found 
in earlier discussions.

Distributions are typically faster with alsa-ucmconf updates than kernel 
changes so that inconvenience is likely very limited (we support 4-5 
Dell CML/TGL platforms w/ SoundWire)
