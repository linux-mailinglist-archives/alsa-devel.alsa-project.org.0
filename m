Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DC28D9B8
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 07:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A871216C0;
	Wed, 14 Oct 2020 07:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A871216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602654978;
	bh=w/Q6Y2ALEcBoX07SqJPZHTNPd5j9N71xYELA8VhNSs4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRy7sxoYjUmkvo9PccRS8WUhamw83rm/R0C/ohBIEVUHNdrWH5QAw7/IZgF9XxOe9
	 ZpjF5v9NwCx08CxhmvHCsEXShacHnvrBS2nCFBl1x+NglD+e8+WvvbmWeQva1mFTdc
	 wwyWTNlVzJAWrqFD/kg2ai6hTmLoV7Ne+FsLut8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DCA7F8021D;
	Wed, 14 Oct 2020 07:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD775F80217; Wed, 14 Oct 2020 07:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6AD2F8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 07:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AD2F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="bnhC0zvB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=VBhfFbcum7XqbvqnX65rC2cJinR64wvSqBnpbpj4otY=; b=bnhC0zvB0LmWbSJHu5QthQHi3+
 D3vU89kUm7mR9S1RpJwfliTGWEBvzkNupZKuzr1SPTGMHEv1LXTdW42vUw0CYXWUIgv1/fXcvwHyL
 qE8+/PwM3wArw7HqzNbb8lCSmHzX1SXQC5k20esROfvocGUfqmZ393Ec76b19KhNVxFR1jGjQdxfe
 +7/N297i0jo8SKe1J1DE1WUKiplPpWRwc6q8eWAjR8g8iRMh4khoX4QmCuLoEbYFXBpHefJpQf8zy
 xAqfBfMpKL+B04FbzJKTY3qApVK1i34M+C18ISTzWb9spLCoepokBzMNXmcHeBEZgz1EyTA84Ko/N
 KgHivglg==;
Received: from [2601:1c0:6280:3f0::507c]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSZjv-0001kM-VH; Wed, 14 Oct 2020 05:54:20 +0000
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
To: Udo van den Heuvel <udovdh@xs4all.nl>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Takashi Iwai <tiwai@suse.de>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
Date: Tue, 13 Oct 2020 22:54:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
Content-Type: text/plain; charset=utf-8
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

On 10/13/20 10:16 PM, Udo van den Heuvel wrote:
> On 14-10-2020 07:07, Randy Dunlap wrote:
>> On 10/13/20 9:56 PM, Udo van den Heuvel wrote:
> 
>>> I.e.: it looks like I will lose some funcionality when I disable
>>> SND_HDA_CODEC_REALTEK.
>>
>> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
>> with no LEDS. That driver apparently wants LEDS.
> 
> Thanks but why have I gone for years without LEDS?
> I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> visible, usable, etc).
> 
> Please make this selectable instead of forcing more bulk into my kernel.
> 
> Kind regards,
> Udo

Hi Takashi,

Regarding
commit 7cdf8c49b1df0a385db06c4f9a5ba1b16510fdcc
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jun 18 13:08:31 2020 +0200
    ALSA: hda: generic: Add a helper for mic-mute LED with LED classdev

and this Kconfig entry:

config SND_HDA_CODEC_REALTEK
	tristate "Build Realtek HD-audio codec support"
	select SND_HDA_GENERIC
	select SND_HDA_GENERIC_LEDS

it seems that LED support is not always wanted (please see above).
I.e., user(s) would like to build a kernel without LED support at all.

Can you make it a build option?

thanks.
-- 
~Randy

