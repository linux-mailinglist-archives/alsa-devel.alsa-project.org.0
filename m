Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602A23E4FF
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 02:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A9F82E;
	Fri,  7 Aug 2020 02:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A9F82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596759296;
	bh=2FZbiNxXvnjy1c8LL6wMAR+JHdLmZ42HrUYS7Rhn+xw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mce8n/jcmk//FWa1jeH8Ouz2KuTxqXOlWGvWT0ls2LTKO8xzO/z7bhYE91IJDKPHp
	 wjcUVqEk/w5B0ZSie9RkqviXO0Hi7a1czvghWkb+cFjnfjbE5gU3CwnuLSoMQCp6Bx
	 3rloTseZPHpyUDHa3GGDh/0oYbMEW6gh7hncXk7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B2AF8015A;
	Fri,  7 Aug 2020 02:13:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F3CF80159; Fri,  7 Aug 2020 02:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C824BF80124;
 Fri,  7 Aug 2020 02:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C824BF80124
IronPort-SDR: 171HMrbGmzZKge5zyYNAi7QWfr/r9zPviG7KPsmooEfKW1an4byrhiwk4yrfX1eDTp8OjRyQr1
 a44yCPhsGmzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="140830726"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="140830726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 17:12:58 -0700
IronPort-SDR: jKZEB/CfZUWxgTyhUytLg4obQqVnkOk5UcJlx4fF+qQ8VNiFr4n03ICifiwt+TL3kPKEAt9YdW
 xn2uOBprKsiw==
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="325578799"
Received: from thoffner-mobl2.amr.corp.intel.com (HELO [10.209.152.229])
 ([10.209.152.229])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 17:12:56 -0700
Subject: Re: [pulseaudio-discuss] Why doesn't mixer control (values) have some
 kind of locking mechanism? (mutex?)
To: General PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>, 
 Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <61bf48f0-e63e-c762-c083-27a0bf371483@linux.intel.com>
 <20200806174708.GA404054@workstation>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ff97864d-d21f-a6e2-967b-f9ecd1a412f7@linux.intel.com>
Date: Thu, 6 Aug 2020 19:12:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806174708.GA404054@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


> On Thu, Aug 06, 2020 at 10:30:36AM -0500, Pierre-Louis Bossart wrote:
>> What I was trying to describe in my earlier answer is a different need to
>> have an atomic update of *multiple* controls.
>>
>> If e.g. a DSP or hardware engine exposes two separate filters for left and
>> right channels, and the coefficients for those filters are modified with
>> separate controls, it would be really nice to have the capability of writing
>> these controls separately, but have a 'commit' mechanism so that these
>> updated coefficients are used at the same time by the left and right
>> filters.
> 
> For the pair of left and right filters, the simplest solution is to unify
> the two control elements into single one, as you know. The array of
> two values can be passed to your driver by single system call and
> ALSA control core surely calls driver code under lock acquisition
> against any operation for control element.

I am not worried about other applications, the issue is that a 
transaction on a bus or IPC is assumed to have an immediate effect. In 
the case of multiple values, it'd really be desirable to defer the 
effect of write transactions until they are all complete.
I am not making this up, this sort of capabilities is described in 
standards and I am not aware of any support from the ALSA control 
framework for a global commit operation. We have mechanisms to 
synchronize triggers on PCM devices with the snd_pcm_link(), 
synchronization of control changes is a miss IMHO.
