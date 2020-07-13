Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B621CF70
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 08:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF1B1672;
	Mon, 13 Jul 2020 08:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF1B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594620894;
	bh=ERG8B6jO/44IIAl3e+/vWjEyWXs/2/OGkpvDjy7Qz9Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ax/pMXMhgZb8UxJWNLkajwcCn5cuGQKJ6JNNfcTaYTR/evBEbRBKZ/iKgjUCPGOwQ
	 tsiiOm9dU6Zja7EjsSSvu89EYfO1TtlkOEkcSzI1fA1FkFDlxo/dAWCUWZ0Ubr7RG2
	 ONgy+44JuSExCU7rEubx75mrw64D7ijqAJgkGlCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDE3F80116;
	Mon, 13 Jul 2020 08:13:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEBFCF8021D; Mon, 13 Jul 2020 08:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 PRX_BODYSUB_18,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D99EBF80116
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 08:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D99EBF80116
IronPort-SDR: PUN9hFwNzKjerdHpJchxBJLHYaNEcVxcQQALfvurE+6VqGeWTaADNCad1Nn1N5rlnP9lWlVQCn
 nLPxy4gLRJSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="147679954"
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="scan'208,217";a="147679954"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2020 23:12:52 -0700
IronPort-SDR: 4gGVodEgNaCYmAdq47HgoZzwDpn2xZGFGbdUi3c4nvP5OplmHzGtFmWGN45pp+JHP2cyh5oT4j
 6VZhTZRYs1hg==
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="scan'208,217";a="459176907"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.185.206])
 ([10.252.185.206])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2020 23:12:49 -0700
Subject: Re: [PATCH 1/1] MAINTAINERS: change SoundWire maintainer
To: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20200703192644.751-1-sanyog.r.kale@intel.com>
 <20200708073020.GA34333@vkoul-mobl> <20200710175510.GA25404@buildpc-HP-Z230>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <918aca91-8890-813e-9dea-06d09241c780@linux.intel.com>
Date: Mon, 13 Jul 2020 14:12:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710175510.GA25404@buildpc-HP-Z230>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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


On 7/11/2020 1:55 AM, Sanyog Kale wrote:
> On Wed, Jul 08, 2020 at 01:00:20PM +0530, Vinod Koul wrote:
>> On 04-07-20, 00:56, Sanyog Kale wrote:
>>> Add Bard as SoundWire maintainer from Intel and change Sanyog's
>>> role as reviewer.
>> Sad to see you go!
>>
>>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Need ack from Bard (i think he is on vacation)
> Yes. he will be back next week.


Thanks Sanyog and Vinod


>
>>> Signed-off-by: Sanyog Kale <sanyog.r.kale@intel.com>


Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>


>>> ---
>>>   MAINTAINERS | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 1c1527a34d99..9559e947bf67 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -16012,8 +16012,9 @@ F:	sound/soc/sof/
>>>   
>>>   SOUNDWIRE SUBSYSTEM
>>>   M:	Vinod Koul <vkoul@kernel.org>
>>> -M:	Sanyog Kale <sanyog.r.kale@intel.com>
>>> +M:	Bard Liao <yung-chuan.liao@linux.intel.com>
>>>   R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> +R:	Sanyog Kale <sanyog.r.kale@intel.com>
>> Do you still want to be a reviewer, I would like folks in this to be bit
>> active for reviews etc
> Yes Vinod, will spare time to review patches.
>
> Thanks
>
>> Thanks
>>
>>>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>>>   S:	Supported
>>>   F:	Documentation/driver-api/soundwire/
>>> -- 
>>> 2.17.1
>> -- 
>> ~Vinod
