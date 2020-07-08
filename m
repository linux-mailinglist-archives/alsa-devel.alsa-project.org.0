Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34535218856
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC9C01661;
	Wed,  8 Jul 2020 15:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC9C01661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594213335;
	bh=w1Xqns6cPNqIgMpD/bdAWp30WNlhsU0SRzzDXNMLBqg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKEF9ZuDeHp0VwlXfA7SVODVpwFgC4hc6Ix0JiYCQ/STw/2pGo+IzXKHOnql02JlD
	 UHfw6+LrV4ErIeD88KhqHygZRJi09P7HHFmh2Yem+/JDPy6Az+hLDFtqooi3hNg2WG
	 vynCxWW68G/IpnqWOf8KhM4F+XSxoUV5hmrBfmKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20843F8015C;
	Wed,  8 Jul 2020 15:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2F4FF80161; Wed,  8 Jul 2020 15:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F507F8015C
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F507F8015C
IronPort-SDR: j3+Z0g3Fn8EYlbtJrZG7POFvpXLVR4c0bvyeobDA/Yy0oZZvmkMBEMz1u9+Kk+CintYBwVNC7M
 ggweF8vYz/JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232648385"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="232648385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:01:04 -0700
IronPort-SDR: jUx0e1hVdr93HTcPhqTXyGf01GpyRbez/rY6o15vnvpL7ZEqswSt2JdDl3KF7TQvg7DHQBq6bo
 HdiLCpqV7t/A==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="323871519"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:01:03 -0700
Subject: Re: [PATCH v2 1/6] ASoC: codecs: max98373: split I2C and common parts
To: Mark Brown <broonie@kernel.org>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
 <20200707205740.114927-2-pierre-louis.bossart@linux.intel.com>
 <20200708113828.GI4655@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <017f1c40-bb24-f98e-fe67-620b4d66bcb8@linux.intel.com>
Date: Wed, 8 Jul 2020 08:01:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708113828.GI4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 7/8/20 6:38 AM, Mark Brown wrote:
> On Tue, Jul 07, 2020 at 03:57:35PM -0500, Pierre-Louis Bossart wrote:
>> To prepare support for SoundWire, let's first split the I2C and common
>> parts. No new functionality, just indents and formatting to make
>> checkpatch happy.
> 
> You've got a couple of fixes after this patch, the fixes should've been
> first.

ok, will respin them.
