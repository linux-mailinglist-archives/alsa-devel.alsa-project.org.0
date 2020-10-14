Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3E28E418
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 18:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2161733;
	Wed, 14 Oct 2020 18:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2161733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602692009;
	bh=3ze/S9n35S7MftCYFx4VGsChO7RkjJu5lIvqHdSgK38=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RD5wASmutlNb1XJO7ucH2kXX8+fsa68Xh96Sh1Dv0v1OS7md0ukUvPxGWVdmQX7mm
	 BRae+fAdRYFAJaTT5ewNNmO/OtvByVSBhYjwzYnsfGmdUzzhRLmuUVjHK74FLx9FBR
	 sbeor8bII3t82xkwjue5O8SuImQB5yAHrLUiccrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 203DCF80226;
	Wed, 14 Oct 2020 18:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3516F80217; Wed, 14 Oct 2020 18:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EADBCF80118;
 Wed, 14 Oct 2020 18:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADBCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="kG402yil"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ta6mruCMduE6D2ZZOTxtdTJ7Lw97dPEZg8G/P2qpIFQ=; b=kG402yilk0a0iijiythGFY+38f
 xwgChbCR26RXdFAQmksT6g7EPCAa02pwGNiWHGBRf7YuvO1U1S4HB7z5NRFlomciEVkl2Aj6sOmhn
 1z6Aso7xrYJ2gVuJmeKsw+PFP0XlFBrqftxJU21pMnawKs5RLoRFqSME49KFIW9cdhmQITry3FPzZ
 fI135hmb9mm3+jCr3aSCOaYAjMnoVj0O+n2Ak8HAQIKKxeRGBZ8KT/Cx4e78UJsUDOtijFoFx4ogw
 GBLEBnx+nAEp2drLdPpBEurMME4EGX7yBGvFJDwQgSnE/WchC0yzCijGJiAz0fkqgbOCvsGhhd12T
 ol0gBcTw==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSjNC-0000GQ-WD; Wed, 14 Oct 2020 16:11:31 +0000
Subject: Re: [PATCH 0/3] ASoC: sof: cleanup Kconfig files
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20201014025633.4879-1-rdunlap@infradead.org>
 <86a0251d-3d0d-bff8-a591-22d184c40fc7@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4b7a7c3c-217d-27a5-4cca-26e8ec88778d@infradead.org>
Date: Wed, 14 Oct 2020 09:11:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <86a0251d-3d0d-bff8-a591-22d184c40fc7@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On 10/14/20 7:37 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/13/20 9:56 PM, Randy Dunlap wrote:
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Cc: Daniel Baluta <daniel.baluta@nxp.com>
>> Cc: sound-open-firmware@alsa-project.org
>> Cc: alsa-devel@alsa-project.org
>>
>> Some general editing of sound/soc/sof/ Kconfig files:
> 
> Thanks Randy!
> 
> That looks all good to me, but I see you didn't CC: Mark Brown and Takashi Iwai so not sure if Mark can apply this directly. Might need to resend the series?

Oops, my bad.

> I also can take this series in the SOF tree and combine it with other changes I am making to Kconfigs to remove hard-coded exclusions, that would mean less churn on the same files.

Please go ahead with this.

>>   [PATCH 1/3] ASoC: sof: imx: fix Kconfig punctuation
>>   [PATCH 2/3] ASoC: sof: intel: fix Kconfig punctuation and wording
>>   [PATCH 3/3] ASoC: sof: Kconfig: fix Kconfig punctuation and wording
>>
>>   sound/soc/sof/Kconfig       |   42 +++++++++++------------
>>   sound/soc/sof/imx/Kconfig   |   10 ++---
>>   sound/soc/sof/intel/Kconfig |   62 +++++++++++++++++-----------------
>>   3 files changed, 57 insertions(+), 57 deletions(-)
>>

thanks.
-- 
~Randy

