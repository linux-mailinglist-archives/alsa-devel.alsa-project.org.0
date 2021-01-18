Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330C2FA353
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 15:42:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23102183B;
	Mon, 18 Jan 2021 15:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23102183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610980951;
	bh=dovklxNTQVdgkflXnpRCiV1PTF2ZcxuOwY5BZsHjDPg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stNKvZE3jF936ltNYC4I8MYB2TPAGKR/1mKPAldNxzFu2VSLKPdhXIXqs1SkogSHc
	 4OZHh9jW7MIH5X4XcvhMTCGiDa+QWg41EdEwXj2A09XHXkzrbTvWv7CuT/1bTFNcde
	 0mT88Gqo2J9fDQEr1XpckVB6JNNO1uDw5wx/pn5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E5B6F8019D;
	Mon, 18 Jan 2021 15:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E376F8016E; Mon, 18 Jan 2021 15:40:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DF8F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 15:40:50 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 82576A0040;
 Mon, 18 Jan 2021 15:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 82576A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1610980844; bh=Fu+3X2LEs1KKohiOmbSShBNc9sfyCFpVED+4xWu8VUs=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Mo0LWd3qOaLqgs9mgOawkWcVcVGt6tSSN1tk4z7MnDfdZcCHj0ux0EDx2m2e+zVvK
 LE2E4537O5DdlNFQmblOS0no0qripWEGaF6Wkmh/L+EzxTobxOB9YL6WoxiWHYVWdk
 zAA8Gq7a6hgn9kndbDfas5upzwMVSfpF9mwG+/V4=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 18 Jan 2021 15:40:41 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf 1/3] chtnau8824: Move DAC Channel Source
 selection to Speaker/Headphones EnableSeq
From: Jaroslav Kysela <perex@perex.cz>
To: Hans de Goede <hdegoede@redhat.com>
References: <20201216153838.34945-1-hdegoede@redhat.com>
 <7c075e59-8576-99e9-3688-1ab858e59716@redhat.com>
 <90f18f8a-192e-fa2c-8975-93acd70006ee@perex.cz>
Message-ID: <78e29bab-1b9f-b57e-0d2a-46a6838018db@perex.cz>
Date: Mon, 18 Jan 2021 15:40:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <90f18f8a-192e-fa2c-8975-93acd70006ee@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 17. 01. 21 v 17:52 Jaroslav Kysela napsal(a):
> Dne 17. 01. 21 v 17:09 Hans de Goede napsal(a):
>> Hi,
>>
>> On 12/16/20 4:38 PM, Hans de Goede wrote:
>>> Move DAC Channel Source selection to Speaker/Headphones EnableSeq.
>>>
>>> The main reason for doing this is to make it easier to allow using
>>> variables, as the Speaker/Headphones conf files are evaluated after
>>> the main HiFi.conf had a chance to set them.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> ping? It would be nice to get this series merged for proper SOF
>> support.
>>
>> Maybe this got confused with my other UCM chtnau8824 series which
>> I send 10 days before t
> 
> Hi,
> 
> Thanks for the reminder. I though that this one was resolved. I don't think
> that we need the first change - the evaluation for If and Include sequences is
> executed before SectionVerb {} parsing. So the If...Define.RightOutputChannel
> should be valid for SectionVerb...Include...File
> "/codecs/nau8824/EnableSeq.conf". The 'DACR Channel Source' control seems to
> require a static settings so keeping it in the verb init sequence has sense.
> 
> I applied the second (SST variable) patch for now. It's nice cleanup. Thanks.

Hans,

	could you test https://github.com/alsa-project/alsa-ucm-conf/pull/74 ?

					Thank you,
						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
