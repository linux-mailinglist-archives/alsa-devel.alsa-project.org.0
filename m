Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D896F5FF8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 22:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9CF1454;
	Wed,  3 May 2023 22:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9CF1454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683145138;
	bh=zdT+gGekBFuEEnT9d87lpCErp//eEfZF/ppb8MTflLk=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QFYYQ8olQi1dbcgFbOpY1C7epKIYehaFv2VglvmLiZLdOGdV+sfyw9WpAWtnd9JZe
	 /f/yaZwPkEJhSJ49f2tVdz3u5urxyoq1yhU7NWYF27vWq3LDgHH3QU45/x67vD9xx/
	 uj/HgaQFOZgf7v0sZWh0vrcmFr8GFnqu2O8GYk90=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 262C3F8032B;
	Wed,  3 May 2023 22:18:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CA11F8049E; Wed,  3 May 2023 22:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5C69F80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 22:18:00 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1191711E2;
	Wed,  3 May 2023 22:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1191711E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683145079; bh=ELmmvbckSK75KaWBTnF2Wu4uBtvMsSVV2a5Pe97bN0E=;
	h=Date:To:References:From:Subject:In-Reply-To:From;
	b=SqVcTC5Ufiq0UoAbnxz75sap52Yjzqe3EQ9wfAdnsXFnva1oaRgiNYLHsjtO+BDrc
	 NZWC9De0MDA9mIlIKy+OIM3Gp/7BZWwKyxDoQflf2G2wwt6AgFcSZaY2l6yPuFpz5P
	 qllsK7dUIk0vBE/DgDVq6jnshfG2IUc0Fr3Lkvsg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 May 2023 22:17:53 +0200 (CEST)
Message-ID: <ce9116be-748c-9f8b-390a-a20661914f14@perex.cz>
Date: Wed, 3 May 2023 22:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jeff Chua <jeff.chua.linux@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9ngFLRqLkN6faH@ugly> <87wn1pmm4d.wl-tiwai@suse.de>
 <7b80ef1e-23dd-c523-0663-4bf311c1823a@perex.cz> <ZFK9ZSm34Z3hQPF4@ugly>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: linux-6.4 alsa sound broken
In-Reply-To: <ZFK9ZSm34Z3hQPF4@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IOAYDFKI6XYAD4FHFPN2Q26PC4SLARH6
X-Message-ID-Hash: IOAYDFKI6XYAD4FHFPN2Q26PC4SLARH6
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOAYDFKI6XYAD4FHFPN2Q26PC4SLARH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 05. 23 22:00, Oswald Buddenhagen wrote:
> On Wed, May 03, 2023 at 09:32:02PM +0200, Jaroslav Kysela wrote:
>> On 03. 05. 23 18:10, Takashi Iwai wrote:
>>> The dmix uses the silence_size=boundary as a fill-all operation, and
>>> it's a free-wheel mode, so supposedly something was overlooked in your
>>> code refactoring.
>>>
>>> Could you check it and address quickly?  I'd like to fix it before
>>> 6.4-rc1 release, so if no fix comes up in a couple of days, I'll have
>>> to revert the change for 6.4-rc1.
>>
>> I would revert this patch.
> 
>> It seems that this "do silence right after the playback is finished"
>> mechanism is not handled in the updated code (and I overlooked that,
>> too):
>>
> no, there is nothing wrong with the code _per se_.
> 
> what's happening is that the dmix plugin doesn't update the application
> pointer, and somehow gets away with it.

Dmix uses the free mode, because multiple applications can write to the 
buffer. We cannot do application pointer updates in the shared resource.

> anyway, this means that we need to revert the code path for top-up mode,
> which means reverting most of the patch's "meat".
> i think i can do better than your proposal, but not today anymore.

Ok, let's see. I tried to be minimalistic to fix bugs and then we can talk 
about the improvements.

> fwiw, the echo results from the plugin apparently summing up the samples
> in the buffer without clearing it first, that is, it relies on the
> auto-silencing doing the clearing, which the patch broke under the given
> circumstances. rather obvious in retrospect.

Dmix does not know which samples were updated by other applications. The 
application tracks only own samples.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

