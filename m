Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D556E3B118D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 04:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B3AF1671;
	Wed, 23 Jun 2021 04:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B3AF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624414156;
	bh=eRf5LCzK0AoinU9YtmLhojlySy3D/OeInFdIPa7NZ5s=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uz0NP2l69WW78w5HK6WhAfa5o++rqZN2RAv18DAJ7bwVWlxZXqZoaKZQWiQmOq4uT
	 70jsqx/eow5TZZ5dmuy0yNw1N9KhLS1/L4Z5R7E3h8ecsLqeYY/PJdRzXpjDckTHK+
	 oQ20ZwP6bOgyp1iFL7lwMUmNkHDTbn1nWpUnTD7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D32F80279;
	Wed, 23 Jun 2021 04:07:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2B8AF80245; Wed, 23 Jun 2021 04:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CAC1F80137
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 04:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CAC1F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="IoG3lMoX"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 0ebc5450
 for <alsa-devel@alsa-project.org>;
 Tue, 22 Jun 2021 19:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=subject
 :from:to:references:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=aI+CsjYx4zvZwSp
 lW8dcjQ7VuEo=; b=IoG3lMoXdVfLPe7GcXq64ymSkhjCcU0t7NuVKY+HQXs2umJ
 MKSxeqggViB7RhKEoMrCa+MROqUGU7lglYPWD5O5qmjLjfxHIr/VQo/HOwXkiX3G
 p80I+rG0hHbDdb7cqpU+3YN3BILzJJm60s9KY5mgvEKMaQShmLDnTOB+hHtA=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id b18e2364
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Tue, 22 Jun 2021 19:07:52 -0700 (PDT)
Subject: Re: Lenovo Legion/Yoga Slim 7 speaker output
From: Cameron Berkenpas <cam@neo-zeon.de>
To: alsa-devel@alsa-project.org
References: <e51c7eb8-cb89-be61-a891-242122caa4d3@neo-zeon.de>
 <b75f97a2-3aeb-4815-9463-43e65e44119c@neo-zeon.de>
Message-ID: <fd1c6557-3a21-5697-8446-f4197608e24c@neo-zeon.de>
Date: Tue, 22 Jun 2021 19:07:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b75f97a2-3aeb-4815-9463-43e65e44119c@neo-zeon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Whoops, he's the correct patch:
https://bugzilla.kernel.org/attachment.cgi?id=297571&action=diff


On 6/22/21 7:00 PM, Cameron Berkenpas wrote:
> Updated the patch to use the automute_hook and it works:
> https://bugzilla.kernel.org/attachment.cgi?id=297569&action=diff
>
> I suspect this is the right way to do things. Hopefully someone can 
> confirm.
>
> The automute hooks are called indirectly by call_update_outputs(), 
> which means likely the automute hooks are called both when headphones 
> are plugged in as well as when they're removed. When I get around to 
> it, I'll add a check such that the verbs are only sent on removal. 
> Sending the verbs when the headphones are inserted don't appear to 
> harm anything, but... There's not reason to.
>
> Thanks!
>
> On 6/22/21 12:17 PM, Cameron Berkenpas wrote:
>> Hello,
>>
>> I'm working on a patch to get audio output working on the speakers of 
>> the Lenovo Legion/Yoga Slim 7 laptops:
>> https://bugzilla.kernel.org/attachment.cgi?id=297559&action=diff
>>
>> Please let me know if this isn't the right place for these types of 
>> questions.
>>
>> Both of these laptops have ALC287's that both seem to need some codec 
>> initialization to get the speakers working. For both laptops, the 
>> specs report ALC3306, but Linux on both systems reports that it's an 
>> ALC287, and looking at the PCI ID's on Windows agrees that it's an 
>> ALC287.
>>
>> This is my first time working on such a patch, and I'm having a 
>> headphone related problem:
>>
>> 1. When plugging headphones into the audio jack, I get sound on the 
>> headphones as expected. I see that the speakers are muted and the 
>> headphones are unmuted as expected in alsamixer.
>>
>> 2. When I unplug the headphones, I can no longer get speaker output. 
>> Monitoring alsamixer,  I observe that unplugging the headphones 
>> results in the speakers being unmuted and the headphones are muted as 
>> expected. However, I am unable to get speaker output in this case.
>>
>> 3. If I plug in the headphones, don't play any sound, and then unplug 
>> the headphones, I see the same behavior in alsamixer, BUT speaker 
>> output still works.
>>
>> 4. If I apply the initialization verbs via hda-verb (the same verbs 
>> that I'm using in my patch), speaker output works again.
>>
>> 5. If speaker output is no longer working (due to #2), putting the 
>> laptop to sleep and resuming fixes the speakers. The code in the 
>> kernel seems to call the sound card's init again so this makes sense.
>>
>>
>> In short, it seems I need to re-initialize the speakers when the 
>> headphones are unplugged. Studying sound/pci/hda/patch_realtek.c, 
>> there's alc_headset_mode_unplugged(), but as there's currently no 
>> case for 0x10ec0287 at all. I'm not sure adding in a case that 
>> re-initializes makes sense if the vast majority of ALC287's don't 
>> need to when headphones are unplugged. It seems none of the other 
>> cards, at least as far as I can tell, do a re-init when headphones 
>> are unplugged either. They just seem to setup some pins and 
>> coefficients for the most part if anything at all.
>>
>> How can I re-init the speakers when headphones are unplugged 
>> specifically for these specific models? The initial-initialization is 
>> only done for these laptops, I'm just unclear what, if any, mechanism 
>> there is for initialization on headphone unplugs?
>>
>> Thanks!
>>
>> -Cameron
>

