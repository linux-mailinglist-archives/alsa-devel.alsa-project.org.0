Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD66402B5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 09:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528851757;
	Fri,  2 Dec 2022 09:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528851757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669971472;
	bh=UlNx30RPtgKeL9nLa/AiSZM8JyUCfmYHC1NkKo8Ot/o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DKGrE2YKvwb8+Ya8+etb9vCbmpqpTsM8XtGnwAiDGTX0kYq7h4z4L+AP1I3KtPjpT
	 /wBQSp172kG9dSLfBAMLBG4IFvWI0e+azQdx9PjGFGl9sCL622OGpVFs0E75U1xxDQ
	 qoUmw+6cGF4bf5YBOQtjtnOPEAaE6H/yTtT9PGFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9830F8026A;
	Fri,  2 Dec 2022 09:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E2AF80310; Fri,  2 Dec 2022 09:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B7AF8026A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 09:56:45 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9B05FA0040;
 Fri,  2 Dec 2022 09:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9B05FA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1669971404; bh=Szcg+AUOhSUn375yy3z3M665b76gaws9om5cfurJA/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eR7xUP0fMvc645RJl6zmSOo+x0e83wj58nQz+qalhuYHRhiaBi8iVWbvFl+xBW9MB
 bmFaDn8eKzG3s7G83NM4z32Xt/+LquD4uHf8CMTE4DTQMrgwcVtCpu9M45aILfs+a4
 3U3U0hasrRCtMD6XyMRlC7tHYEfiePK5fuOCKD0A=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  2 Dec 2022 09:56:39 +0100 (CET)
Message-ID: <66bef382-e38f-85d5-0e07-3cf672a89882@perex.cz>
Date: Fri, 2 Dec 2022 09:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20221130000608.519574-1-broonie@kernel.org>
 <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz> <87359zlz9t.wl-tiwai@suse.de>
 <Y4kOvNi5I8/GK1yU@sirena.org.uk> <87y1rqkzto.wl-tiwai@suse.de>
 <87wn7akzp7.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87wn7akzp7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
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

On 02. 12. 22 8:54, Takashi Iwai wrote:
> On Fri, 02 Dec 2022 08:52:03 +0100,
> Takashi Iwai wrote:
>>
>> On Thu, 01 Dec 2022 21:29:48 +0100,
>> Mark Brown wrote:
>>>
>>> On Thu, Dec 01, 2022 at 08:06:22PM +0100, Takashi Iwai wrote:
>>>> On Thu, 01 Dec 2022 18:42:22 +0100,
>>>> Jaroslav Kysela wrote:
>>>>>
>>>>> Let me know, if I can stack your changes on top, or perhaps, you may
>>>>> be willing to adapt them.
>>>>
>>>> As Mark has already sent a v2 series, I applied his v2 at first.
>>>> Could you rebase and resubmit on top of my for-next branch?
>>>
>>> Oh, this is getting a little confusing - I'd just picked Jaroslav's
>>> patch into my tree and was in the middle redoing my ideas on top of his
>>> code!  I might have something more later this evening...  I think we can
>>> converge here, let me continue taking a look.
>>
>> Ah then it was my misunderstanding, and everything should be fine now
>> ;)  Thanks!
> 
> Erm, you meant sent as *v3*.  I've seen now.
> 
> As the v2 patches were already merged, could you rather rebase and
> resubmit?  I'd like to avoid rebase the full series that are already
> included in linux-next.

It's rebased. The first patch from the set drops the previous Mark's changes.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
