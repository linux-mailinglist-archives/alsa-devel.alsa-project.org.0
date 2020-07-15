Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C715220FD3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A071674;
	Wed, 15 Jul 2020 16:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A071674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594824618;
	bh=MiQfn4ZYQD1qMIa29vI0PNI08yk4PYMu28VyDBf3hmE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujgKCPsuJFUX5/ce5/FevFBQZY/MDoLhA1e7JSt2nT+WHccNxSECx4Ayn1brsTHyR
	 XjfU1Zw31l+NMQfDqUVrm4C1MSUQusRrqsL+C1hBaxwHoZuv8Xh8CXRR20SAlKaa3B
	 teFyCrbvUnKeqYtL8ge6dEN17qfn0R+4LWUZxf34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42B9F80227;
	Wed, 15 Jul 2020 16:48:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70038F8014E; Wed, 15 Jul 2020 16:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C80BF8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C80BF8014E
IronPort-SDR: R/J0YR2k2EecTVjzDDIzCpKf4EWVvRgHE6pBNw5Oenr7GbkTU6FapUoGdBVapvuyfkFoy5RPCH
 /6xL3glm58mg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="128724454"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="128724454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:49 -0700
IronPort-SDR: lf6xa5xBKw91hNzg5MMjGcIskZGmuo27sggLIryHvkH0TYdaqf4WG3bjd0ubnDC8ny0vl7opp0
 6YvItvLmguBg==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460114374"
Received: from sjeong-mobl.amr.corp.intel.com (HELO [10.255.231.101])
 ([10.255.231.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:48 -0700
Subject: Re: [PATCH 01/10] ALSA: Replace the word "slave" in vmaster API
To: Takashi Iwai <tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
 <20200714172631.25371-2-tiwai@suse.de>
 <eda4df2e-d7b0-9e7e-e873-e3d8d3088174@linux.intel.com>
 <s5h5zaptgaz.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a93460a3-ac0e-be0b-7c46-47b87fd611c2@linux.intel.com>
Date: Wed, 15 Jul 2020 09:34:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5h5zaptgaz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



>> On 7/14/20 12:26 PM, Takashi Iwai wrote:
>>> Follow the recent inclusive terminology guidelines and replace the
>>> word "slave" in vmaster API.  I chose the word "replica" at this time
>>> since it seems fitting for the purpose.
>>
>> Thanks Takashi for starting this.
>>
>> For the HDaudio Volume widgets, the spec says they may have different
>> step size but use the same number of steps, so they are not copy-exact
>> versions in the usual 'replica' sense but rather follow or track the
>> master configuration.
>>
>> The internal guidance I see at Intel is to use 'replica' mainly in a
>> database/configuration management context.
>>
>> If the idea is that the 'replicas' use the same configuration as the
>> 'master', that'd be fine indeed but we may want to add a clarifying
>> comment that the end-result may be different for each 'replica'?
> 
> I don't mind to pick up another word.
> What could be another better alternative?

I don't have a suggestion that is really better. the usual suggestions 
of 'secondary' or 'subordinate' are not really great in this context, 
something like 'tracker' or 'follower' might work but are maybe more 
vague for controls.

I am really fine with 'replica', just wanted to clarify that it's not 
doing the same thing in multiple places but using the same configuration 
in multiple places.
