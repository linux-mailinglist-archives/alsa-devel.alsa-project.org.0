Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02074728346
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 17:10:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78253E8;
	Thu,  8 Jun 2023 17:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78253E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686237034;
	bh=hKQWNsfMCaxOhcLznocENZflEOSMlleDFC62geegNPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AeqZLxmLm4zthzTiiD5nF9HWAQmWzi1fbutk+rPJMyP3vYlIWMeTqGmpFqkmZ5Mmm
	 v0zCb8wCbem8Dw1KH39TVU9IYanDzh+mHhxgk22kxj95ZGrIsxpijZ0/l4UwcK1q7c
	 Mqd4Wzco6Zm+hcemCUWOytsVGjzBmkbg8Dlg1N48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30FB2F80520; Thu,  8 Jun 2023 17:09:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B99DF80199;
	Thu,  8 Jun 2023 17:09:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B70CF80290; Thu,  8 Jun 2023 17:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59778F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 17:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59778F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=loTHc0Ht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686236976; x=1717772976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hKQWNsfMCaxOhcLznocENZflEOSMlleDFC62geegNPg=;
  b=loTHc0Ht+U+rObCWDeRO+LvIocRhk7va/B933MfJogzn3q3f/znZ9aGU
   e4sc431DNaLfGZrWoEnb1E4fpXhl22sj4XeLFQif69v6pZX+IwyG1aOMu
   JW/E/OQGHKX/CHIc/tXHw9HPockb4oGPyynKzIjcbGPBvwwsxOjXrvQ20
   viv/nxhg9KyFFK2uH6Ehc+IA9tnLHUc13LQkkF4djqNQE0UDSCBMPA8uT
   E/i1h0I9yNJ5iy+LVvcZyWZbQgYdueIdBgwrXgwrTT6EZQ5i+jx54q0f0
   Ecikvruu0MAewoKZ3my6cHkjW+9Lv3CkY7kumbwx9VUyO6iGOkUrE+SWv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443700540"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400";
   d="scan'208";a="443700540"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799842564"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400";
   d="scan'208";a="799842564"
Received: from svuppala-mobl.amr.corp.intel.com (HELO [10.212.207.249])
 ([10.212.207.249])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:09:31 -0700
Message-ID: <9d2a7b72-b145-ba97-987a-4611fc3db3ad@linux.intel.com>
Date: Thu, 8 Jun 2023 08:25:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] soundwire: add enum to control device number
 allocation
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-2-yung-chuan.liao@linux.intel.com>
 <ZIF9Hd5Hv/CKQeUW@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZIF9Hd5Hv/CKQeUW@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5ZOXJWO2VVI6OLYFD7HZH4KZ3UIQEDRV
X-Message-ID-Hash: 5ZOXJWO2VVI6OLYFD7HZH4KZ3UIQEDRV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZOXJWO2VVI6OLYFD7HZH4KZ3UIQEDRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> +/**
>> + * enum sdw_dev_num_alloc - Device Number allocation strategies
>> + * @SDW_DEV_NUM_ALLOC_DEFAULT: unconstrained first-come-first-serve allocation,
>> + * using range [1, 11]
>> + * @SDW_DEV_NUM_ALLOC_IDA: IDA-based allocation, using range [ida_min, 11]
>> + */
>> +enum sdw_dev_num_alloc {
>> +	SDW_DEV_NUM_ALLOC_DEFAULT = 0,
>> +	SDW_DEV_NUM_ALLOC_IDA,
> 
> Let default be IDA as 0, am sure we are not setting this field in qcom
> or amd controller, lets retain the defaults please

Not following, QCOM or AMD are NOT using the IDA-based version, so the
default is zero.
