Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25667ADCBB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 18:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13751675;
	Mon,  9 Sep 2019 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13751675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568045334;
	bh=MnvGbh3Z8XCSQmQk6Lgn07ZCUF/ISOEL6fz2zWkfHjQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+sX7QGimWrBACj/z9CvGqyEvSH5OqqPBMsINnYAKYgisuz7Htl3KsfFmWsStQCW0
	 JeAlbSh2oYBiNh3lOenIlwuCQJkxW0fXfTj+lBOGwMz/LK9Gk7y5l4/vRPjwGQFTTG
	 +Lbk+K4mq3U7ZkJ4BveLsHn673s7+BWGie3uKL14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3226F80507;
	Mon,  9 Sep 2019 18:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C4AF804FD; Mon,  9 Sep 2019 18:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A94BF800E6
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 18:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A94BF800E6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 09:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,486,1559545200"; d="scan'208";a="384024717"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2019 09:07:39 -0700
Received: from wkhong-mobl2.amr.corp.intel.com (unknown [10.255.34.248])
 by linux.intel.com (Postfix) with ESMTP id 5BAD458062C;
 Mon,  9 Sep 2019 09:07:39 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <15679391594432724-alsa-devel@perex.cz>
 <cf4b5150-a9f5-fa82-8e4b-0978509a60b6@perex.cz>
 <2ae761bd-c161-b8be-41d4-9e003e5ef263@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0db789e8-9e09-a78c-e0ee-39546d0f9f01@linux.intel.com>
Date: Mon, 9 Sep 2019 11:07:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ae761bd-c161-b8be-41d4-9e003e5ef263@perex.cz>
Content-Language: en-US
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit (Lu,
 Han: 1 total)
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

On 9/8/19 7:57 AM, Jaroslav Kysela wrote:
> Ir seems that Lu, Han no longer works for Intel (e-mail delivery problem).
> Piere, could you ack this change, too?

Acked and agreed for all Intel contributors.
Thanks
-Pierre

> 
> 				Thanks,
> 					Jaroslav
> 
> Dne 08. 09. 19 v 14:50 Jaroslav Kysela napsal(a):
>> Resend (delivery issues for the direct e-mail). Please, answer. Thank you.
>>
>> 					Jaroslav
>>
>> Dne 08. 09. 19 v 12:39 Jaroslav Kysela napsal(a):
>>> As discussed, we would like to move the UCM configuration files from the
>>> alsa-lib repository to new alsa-ucm-conf repository with the licence change
>>> from LGPL-2.1 to BSD-3-Clause.
>>>
>>> I would like to check, if you agree with this licence change. Please, answer
>>> to this e-mail and write your agreement / disagreement (keep CC to
>>> the alsa-devel mailing list for the archiving purposes).
>>>
>>> Thank you for your time and co-operation.
>>>
>>> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
>>>
>>> List of your commit(s):
>>>
>>>    3c263716fd5bd2d9d5308cb13dba667d138c0097
>>>      conf/ucm: broadwell-rt286: add ucm config
>>>
>>> ---
>>> Jaroslav Kysela <perex@perex.cz>
>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>> _______________________________________________
>>> Alsa-devel mailing list
>>> Alsa-devel@alsa-project.org
>>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>>
>>
>>
> 
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
