Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12EC8F375
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 20:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE85166E;
	Thu, 15 Aug 2019 20:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE85166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565893968;
	bh=T+3mgGpnV4slV5xJqmDMexlD5E09Mf9A4IwpLFiTawo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjULI8kagUxmiD7vFqqRsXHvWZp0RP/qn1JEIBfRuAEyXgbR7KdFl6LPn2EM59Qez
	 72NwmuAkxSVaIA1on91eLgQ0vbPIheYZgZFAkCaV+cbGWAWipJjm+lA9OAxwSU5lIC
	 VxVf9b649BMYIlXWn8L8DN2x7GLDSrbpM+e0BTYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF11F80273;
	Thu, 15 Aug 2019 20:31:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99DF9F80274; Thu, 15 Aug 2019 20:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F8A1F8011F
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 20:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F8A1F8011F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 11:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="181951776"
Received: from smharb-mobl1.amr.corp.intel.com (HELO [10.255.228.248])
 ([10.255.228.248])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2019 11:30:53 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190815155032.29181-1-pierre-louis.bossart@linux.intel.com>
 <20190815155032.29181-2-pierre-louis.bossart@linux.intel.com>
 <20190815170853.GC4841@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <607969d8-2377-9e6a-a980-e89d67443438@linux.intel.com>
Date: Thu, 15 Aug 2019 13:30:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815170853.GC4841@sirena.co.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: SOF: rename SOUNDWIRE to ALH
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/15/19 12:08 PM, Mark Brown wrote:
> On Thu, Aug 15, 2019 at 10:50:29AM -0500, Pierre-Louis Bossart wrote:
>> From: Bard liao <yung-chuan.liao@linux.intel.com>
>>
>> Rename SOUNDWIRE to ALH.
> 
> What's this patch based on, it doesn't seem to be something upstream?
> 
> Description: [1/4] ASoC: SOF: rename SOUNDWIRE to ALH
> Applying: ASoC: SOF: rename SOUNDWIRE to ALH
> error: sha1 information is lacking or useless (include/sound/sof/dai.h).
> error: could not build fake ancestor
> Patch failed at 0001 ASoC: SOF: rename SOUNDWIRE to ALH

ok so this is upstream but the patch will not apply if you didn't take 
Daniel's iMX patches, which change the same dai.h file in '[PATCH 3/3] 
ASoC: SOF: topology: Add dummy support for i.MX8 DAIs'

I'll resubmit this separately.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
