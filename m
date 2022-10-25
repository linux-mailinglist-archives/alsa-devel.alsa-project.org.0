Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D260D3A5
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 20:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03C2F4D5C;
	Tue, 25 Oct 2022 20:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03C2F4D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666722925;
	bh=RCkhSfweTsGsXXy7IbSmwyfhuGCOBl9hOVmo4BrUQyU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unJ8Utm4FB5GhiU+vHvyMzsjOMHDXpcg1Q3pp4p1vh4fb3W3ThihGpSVDOsE0LdVD
	 qAHe9kBjmCBkm8zaHXcU9YP7heAWltUAlJZVJWVC1LddAmGjTHoiDoyic5pbI7X7sF
	 Eq63xSPQSM9TFMUQ2svFhQHK9xe9a4EUaofUMOqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C36F80100;
	Tue, 25 Oct 2022 20:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F75F80100; Tue, 25 Oct 2022 20:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC507F80115
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 20:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC507F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lx3pjmnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666722863; x=1698258863;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RCkhSfweTsGsXXy7IbSmwyfhuGCOBl9hOVmo4BrUQyU=;
 b=lx3pjmnVkWCNKvavDWZBOWbcdl522KWPo9eegWhOh8rc60Om0bZMd9n2
 tuFhgP5W5oz78JzBxfVIuz/iyxgWAeruIFJDa0jX5i6uqWQh8dgGKyScR
 5U62aonSydWm63LfOK2h7UvIuQpNZc3wX4ktBycses0d3nZrBA4oH7yy8
 qLzXF8KPBz3Q4Rz2K0yNHvhBH9F+sOtRdaxgH3vSE5+BbmB62firz59N7
 AOIsKB69t7V5R+ZdejM6QEDReveae3Yfs8TMKH8Qar2miK+ydHF9WSU8R
 KA+0XsGjGWxlatpQS7LxWKZS3pCg+NSRcuOtezAy+eInVdquy/SX0L0wC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="295165377"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="295165377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 11:33:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="634207296"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="634207296"
Received: from pperezji-mobl.amr.corp.intel.com (HELO [10.212.98.192])
 ([10.212.98.192])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 11:33:30 -0700
Message-ID: <66f708c9-2528-1905-0bc3-f2538b799743@linux.intel.com>
Date: Tue, 25 Oct 2022 11:48:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote
 UMPC-01
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20221025140942.509066-1-hdegoede@redhat.com>
 <91287204-9a3b-af63-463f-99d579db8fe3@linux.intel.com>
 <c2c3c635-c262-f931-0cfa-4b967f75a861@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c2c3c635-c262-f931-0cfa-4b967f75a861@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 10/25/22 10:22, Hans de Goede wrote:
> Hi,
> 
> On 10/25/22 16:29, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/25/22 09:09, Hans de Goede wrote:
>>> The Nanote UMPC-01 mini laptop has stereo speakers, while the default
>>> bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  sound/soc/intel/boards/bytcht_es8316.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
>>> index 6432b83f616f..a935c5fd9edb 100644
>>> --- a/sound/soc/intel/boards/bytcht_es8316.c
>>> +++ b/sound/soc/intel/boards/bytcht_es8316.c
>>> @@ -443,6 +443,13 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
>>>  					| BYT_CHT_ES8316_INTMIC_IN2_MAP
>>>  					| BYT_CHT_ES8316_JD_INVERTED),
>>>  	},
>>> +	{	/* Nanote UMPC-01 */
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
>>> +		},
>>> +		.driver_data = (void *)BYT_CHT_ES8316_INTMIC_IN1_MAP,
>>
>> the commit massage talks about a mono speaker, this quirk changes the
>> microphone setup. Is the quirk correct?
> 
> The default quirk for a CHT es8316 codec using device is:
> 
>         } else {
>                 /* Others default to internal-mic-in1-map, mono-speaker */
>                 quirk = BYT_CHT_ES8316_INTMIC_IN1_MAP |
>                         BYT_CHT_ES8316_MONO_SPEAKER;
>         }
> 
> So this just drops the BYT_CHT_ES8316_MONO_SPEAKER from the default quirks.
> 
> Yes defaulting to mono is a bit weird, but the es8316 is mostly
> used in very low budget devices which often have only 1 speaker.

Yes, I read this sideways - need more coffee.
Thanks Hans!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

