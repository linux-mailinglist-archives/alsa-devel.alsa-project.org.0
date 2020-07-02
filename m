Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14A212758
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF7116E1;
	Thu,  2 Jul 2020 17:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF7116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593702544;
	bh=MZaSn20N9vbNlcflGXGLgoIKLp7OhrNAPw6g6sLsCM8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qyqQ/p/KYtvvMklXQkGO1Dlz0p5xg9D5+4b1f4gB6nrY4Ypdi6stRhrs+FoC2VSOi
	 suXAGqnOeWqLBqarGfP1piN3nlv3z/j+rRpLkJzI4x6N8iZsWT9a6vNVSzoy/Wq+XX
	 cKxvkuK61jOqeONvJ48nvjDQ4SkkIwdjCj2BdG8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90BC4F80245;
	Thu,  2 Jul 2020 17:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36683F8022D; Thu,  2 Jul 2020 17:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C93A5F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93A5F800C1
IronPort-SDR: EkkIaWou8Fpf6WzReWs2AphR+fKHMyU7P3GCA7+qB937al0aNXIZiqZjW69pRQmF4wwqK5/WOU
 qdD+Xns/C2Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148468347"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="148468347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:07:15 -0700
IronPort-SDR: ZR0UMN3WcFHnx0VAwF4wDFeA4aKpHzgbfRNoCOzKpWi6k63NWHrkLP+vYvWr5YYKjerUeXLTrk
 AxkbSClCAPpQ==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="304276958"
Received: from nchava-mobl1.amr.corp.intel.com (HELO [10.252.135.144])
 ([10.252.135.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:07:14 -0700
Subject: Re: [PATCH 7/7] ASoC: codecs: wm8400: add _maybe_unused as needed
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
 <20200701181320.80848-8-pierre-louis.bossart@linux.intel.com>
 <20200702092318.GL71940@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3c2c9d10-0d7d-2447-01a6-3cf04836c34c@linux.intel.com>
Date: Thu, 2 Jul 2020 10:07:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702092318.GL71940@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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



On 7/2/20 4:23 AM, Charles Keepax wrote:
> On Wed, Jul 01, 2020 at 01:13:20PM -0500, Pierre-Louis Bossart wrote:
>> Fix W=1 warning by adding __maybe_unused. Maintainers for this file
>> may want to double-check if those definitions are necessary.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
> 
> Yeah I think in this case better to remove them, they arn't used
> in the driver, the driver is pretty old and no one really works
> on it so little chance the features are ever getting added.

Thanks Charles, I can resend a v2 series with your Acked-by and remove 
these definitions.

Out of curiosity, who can check the patch 1 and 2 (cs4270 / cs42l42)?
