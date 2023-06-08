Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A172834F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 17:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ECED827;
	Thu,  8 Jun 2023 17:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ECED827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686237084;
	bh=gLEq3vi4ShR5o0t/JrKR4zfOv7ndOd96flRBabiHYaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GlQgc90A9Bw6qz9w546Upc6Z4mCvbQg6kmuoad/L93u96ttZHuAQHTlbdttvglkAP
	 fPOxlk39i/2WKtfhtx6NGTJpi9iU40bZiJm0MS7QWTnRCjJuhOmRlXyrxHLIKJutLF
	 8XxAEmstIAAPcdPLivzyuWAN93AcVaR0MdWXVP2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08602F80551; Thu,  8 Jun 2023 17:09:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63416F80549;
	Thu,  8 Jun 2023 17:09:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5DA6F80254; Thu,  8 Jun 2023 17:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81B89F8016C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 17:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B89F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RY18g0b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686236976; x=1717772976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gLEq3vi4ShR5o0t/JrKR4zfOv7ndOd96flRBabiHYaw=;
  b=RY18g0b3vPYFzjbqGvYtgJNcN/LmJoB7zGs3NcANBK/lQjYam69Wu6f3
   4r4xsc8h5X40QPpv+/RS6zLw0I9nj/i+dABqpm3sY6xLHe1onS5rMWKMl
   VKD0GRblh1xSHlcnkHT+pl7tx3I4j68MIURh4m6QIZYHxqDE6QWq7bveR
   8F3H0Z+w6bMNLbdVk6Yiy1xWJYu+LeEUS0/NC1riH7cYAkNkJr2GXMDVt
   N21qYcNPt/Jf4AVLjRjAxjCVcqbfZkgBhjGxAYR1qvzWRd9ptnrzn6XFN
   VluSX+4ydqhff+xKmTIMXICgL9HQMxfw2KICv60RFsPfWqd/P3JnmCEdX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443700530"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400";
   d="scan'208";a="443700530"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799842560"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400";
   d="scan'208";a="799842560"
Received: from svuppala-mobl.amr.corp.intel.com (HELO [10.212.207.249])
 ([10.212.207.249])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:09:29 -0700
Message-ID: <e07d507e-57bf-a2b7-2ab1-f5f45ff5399b@linux.intel.com>
Date: Thu, 8 Jun 2023 08:24:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] soundwire: extend parameters of
 new_peripheral_assigned() callback
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-4-yung-chuan.liao@linux.intel.com>
 <ZIF+G1mbis/lb8Po@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZIF+G1mbis/lb8Po@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NPORFW5Y6TSEO6AAQWWQ5QNTOHCNGO7I
X-Message-ID-Hash: NPORFW5Y6TSEO6AAQWWQ5QNTOHCNGO7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPORFW5Y6TSEO6AAQWWQ5QNTOHCNGO7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> -static void generic_new_peripheral_assigned(struct sdw_bus *bus, int dev_num)
>> +static void generic_new_peripheral_assigned(struct sdw_bus *bus,
>> +					    struct sdw_slave *slave,
>> +					    int dev_num)
>>  {
>>  	struct sdw_cdns *cdns = bus_to_cdns(bus);
>>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 8a7541ac735e..41a856bedf1e 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -861,7 +861,9 @@ struct sdw_master_ops {
>>  	int (*pre_bank_switch)(struct sdw_bus *bus);
>>  	int (*post_bank_switch)(struct sdw_bus *bus);
>>  	u32 (*read_ping_status)(struct sdw_bus *bus);
>> -	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
>> +	void (*new_peripheral_assigned)(struct sdw_bus *bus,
>> +					struct sdw_slave *slave,
> 
> maybe better, drop the bus and pass slave (which contains bus)

I kept it for consistency, all callbacks for sdw_master_ops start with
the bus parameter.
