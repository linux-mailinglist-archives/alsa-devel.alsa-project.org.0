Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40948251CC2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 18:00:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B76168C;
	Tue, 25 Aug 2020 17:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B76168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598371221;
	bh=CL0zsDZBcW12P1dXztwpiFdca2o/Fb1WPb1SBz+RDwc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBzWG1U6YKOZ/kXdDTYW2KPm7Ox+JXDbQ63qOxPVsm8EMgVdKYZhriNa7rduL07WH
	 XUA3x9sIWsC+iztT/OXnQys5eGtZXO9f+YDYjlZ7XAi1s+Hu9O8uHZBtqoJAxSy8bd
	 BIFATg3XGYKvgkdcDb7UxyPrIwT/RuwN5KnMQ1eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3571F800D1;
	Tue, 25 Aug 2020 17:58:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C07B3F8025A; Tue, 25 Aug 2020 17:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB07F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 17:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB07F800D1
IronPort-SDR: +lBPgIW+WuoRiQRiW+RBSDeIkCI6WA0TxMMh/0nkWQ7YZ8V9nLqRjb9G2sdZ7bhLmC7gQXG2/2
 ke//2Z38VPWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="174183432"
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="174183432"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 08:58:25 -0700
IronPort-SDR: D5zYFt/nyuJGEFBm4vwbVxWu+5xkYf0JlIeiP5VdXa30u0UtO3FLhBcKmjNf8fBfK21yt8A2zD
 JU2VwuBreb/Q==
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="299136097"
Received: from unknown (HELO [10.251.129.80]) ([10.251.129.80])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 08:58:24 -0700
Subject: Re: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20200825132102.GA306074@mwanda>
 <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
 <20200825135800.GS5493@kadam>
 <2B5A2EFF-7391-4565-9B35-DCE395C7DD80@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5789a393-d2b7-4127-4875-2dbcb5a19bfc@linux.intel.com>
Date: Tue, 25 Aug 2020 10:58:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2B5A2EFF-7391-4565-9B35-DCE395C7DD80@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>
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


>>>>   506          switch (config->chan_nr) {
>>>>   507          case 8:
>>>>   508          case 4:
>>>>   509                  /*
>>>>   510                   * Platform is not capable of providing clocks for
>>>>   511                   * multi channel audio
>>>>   512                   */
>>>>   513                  if (kmb_i2s->master)
>>>>   514                          return -EINVAL;
>>>>   515
>>>>   516                  write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
>>>>   517                                  (config->data_width << DATA_WIDTH_CONFIG_BIT) |
>>>>   518                                  !MASTER_MODE | TDM_OPERATION;
>>>>                                        ^^^^^^^^^^^^
>>>> MASTER_MODE is BIT(13).  It's unclear what this is supposed to be.  My
>>>> best guess is that the ! should just be deleted.
>>>
>>> This ! is intentional because it is meant to be Slave mode. Would a better approach be to create another #define for slave mode?
>>
>> In my opinion, it's better to just leave it out.  ORing with zero causes
>> a different static checker warning on my unreleased checks...  Is it
>> 0 << 13?  I feel like ORing with zero just makes things more confusing.
>>
> It is 0<<13, in the event it was previously configured to Master I would need to unset the bit

You are assigning the result to write_val, so there's no memory of what 
was configured before?
