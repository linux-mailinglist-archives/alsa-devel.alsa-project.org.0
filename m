Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56446BB64F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 15:39:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9795A125F;
	Wed, 15 Mar 2023 15:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9795A125F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678891181;
	bh=rNfYVw1Y+3DpMigD974Ti51cxEjaa+Bxwr0aNjinN1I=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVz6vZ5tW4JXJhA2nDM737WL/TkrBTcxacw785RkKc9MCxKqcc/nhuSVrM65olMvh
	 qi3KHlq5iApjKd/vA2NWea9wVug5sX4Gxv27+MPJv+YTikpd4KZBTrXc8pvyOClFza
	 qqeHy/sETLvHpX0H1Ku3rAwuoWvKwwE0wMDn3JB0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F4074F8032D;
	Wed, 15 Mar 2023 15:38:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7228DF80423; Wed, 15 Mar 2023 15:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 433E2F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 15:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 433E2F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n4wn1Lmv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678891125; x=1710427125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rNfYVw1Y+3DpMigD974Ti51cxEjaa+Bxwr0aNjinN1I=;
  b=n4wn1LmvYFMLu3m5e+d0hIDwH3apQiNq1bXlozIlvwndoZLOgAddH+t4
   +VcRqvxFInXRMY555EUkWBF9llSUleW0ku3KT0AX7/yBQNOUEewywT4WM
   171ApcUn91d1YJokVWb9Fstb/RtnXUbWhOwnfpJGXLKCDojcX0JNRLgN0
   S/oiq08utp11YtGGLoshvzejZ2AUpKgvOmUeNc6e2DIEYguqcObdLrAN8
   +R8/b2RXJBMg2MRmrrMWv1BMf+h/ZPcuHhRXiE8uE5mpPpRWJpFtiaViW
   QHeBNZYUO1flh0D7orwkNp6e3HCQZT0pwPGHbGzbGrf/mIjFY27Fj6gU9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423990090"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="423990090"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 07:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681872352"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="681872352"
Received: from rperez12-mobl.amr.corp.intel.com (HELO [10.255.35.81])
 ([10.255.35.81])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 07:38:41 -0700
Message-ID: <c40192e9-6207-3204-819f-abbabc320c38@linux.intel.com>
Date: Wed, 15 Mar 2023 09:38:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] soundwire: stream: uniquify dev_err() logs
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230309054905.21507-1-yung-chuan.liao@linux.intel.com>
 <ZBGZR2ACa8AbNmvy@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZBGZR2ACa8AbNmvy@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TKG46JE43FPX72FJ4IDLKPTHL4BZG5ZR
X-Message-ID-Hash: TKG46JE43FPX72FJ4IDLKPTHL4BZG5ZR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKG46JE43FPX72FJ4IDLKPTHL4BZG5ZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/15/23 05:09, Vinod Koul wrote:
> On 09-03-23, 13:49, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> There are a couple of duplicate logs which makes harder than needed to
>> follow the error flows. Add __func__ or make the log unique.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>  drivers/soundwire/stream.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index 2e39587ed1de..dd09855caac9 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>>  
>>  	ret = do_bank_switch(stream);
>>  	if (ret < 0) {
>> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
>> +		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> 
> why make it pr_ and loose the dev name? There is a trick to emit
> function for dev_err too using dynamic debug

a stream can be cased on multiple managers/buses.

It's incorrect to use bus->dev in this case, see all other error cases
in stream.c, they all use pr_err already for the same reason. bus->dev
is only valid when dealing with a single bus, typically in loops in that
file.

That said we could have split the two changes where dev_err() is changed
as pr_err() for clarity.

