Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B336F1B597E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 12:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C99169A;
	Thu, 23 Apr 2020 12:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C99169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587638687;
	bh=QGC+GiNW3P9m4GxPzCbD1ArTBfv39vEtIRbX9EdJf6M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vg0qFywWbxlzlPyQ0YuK+4ruCdUzErmUv1DPu93sfYYaNUCz/eTaH222H28lz8thz
	 ii4+lnGpglZ9A8JQtTCet/ByNNJF+ySNHgvqaFgSSVQlXpd3rIW3wrHSc/p4LTkviO
	 ZAACIsBpt1euofhuHiRtcK4iXkMSAV1k1T1Pa0AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E1CF801ED;
	Thu, 23 Apr 2020 12:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442D9F801EC; Thu, 23 Apr 2020 12:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E56AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 12:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E56AF800FF
IronPort-SDR: 5fnq+xklqkjv4cuTGipheTqta9heqzwjQV2knrkXfFgJhi4QspfkSIpZJSzN07J+Ni+69Lwo8r
 nPOFuMboTRfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 03:42:44 -0700
IronPort-SDR: 4Sb3Ia5LTMYNWNFUkEnop6kS5+L6Dbo+FekZ1Ja/k6zQGAk770SRrOzrkZkyk992OsfQgiB3x/
 310YVgt/CHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="456862856"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.5.100])
 ([10.213.5.100])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 03:42:42 -0700
Subject: Re: [PATCH v2 0/3] Add support for different DMIC configurations
To: Mark Brown <broonie@kernel.org>
References: <20200422120532.31492-1-mateusz.gorski@linux.intel.com>
 <89873366-c063-5754-0e18-511477c3daa5@intel.com>
 <20200423102116.GB4808@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20dcc0a1-1306-1eb9-1060-42b46eb2d56a@intel.com>
Date: Thu, 23 Apr 2020 12:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423102116.GB4808@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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

On 2020-04-23 12:21, Mark Brown wrote:
> On Thu, Apr 23, 2020 at 11:11:05AM +0200, Cezary Rojewski wrote:
>> On 2020-04-22 14:05, Mateusz Gorski wrote:
> 
>>> Changes in v2:
>>> - removed patch 1/4 swapping machine device and platform device
>>>     registration order
>>> - alt_tplg_name creation now uses different field to read machine driver
>>>     name
>>> - including of <sound/soc-acpi.h> moved to different patch
> 
>> Ain't change-block supposed to be just below message body?
> 
> Only in patches to stop them getting included in the git changelog.
> 

Thanks for info, Mark.

>> Don't believe series need to be resend just to fix cosmetics:
>> Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Well, I don't seem to have a copy of it so it'll need a resend for that
> unless it's just held up somewhere and arrives shortly.
> 

Doubt it will as Mateusz forgot to include you & Pierre in v2.
Resend it is then!
