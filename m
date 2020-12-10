Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1532D5085
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 02:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51CD6169B;
	Thu, 10 Dec 2020 02:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51CD6169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607565371;
	bh=wz/80BABdpPt3JBlZsnrJxM9VjmDgMRSMmus5lZX0GA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoFCjuh2xdIgmU9XvU6l49A3g/WUTfGe+g0KJ95kj05eqXMBiyOwM4KG400kvXLvP
	 Tzu+5cXexxA3llaBp14NMK082DP0gP1SqBwgrFgVKq6dZ0kNNubQJVuIIvm9GO1gUC
	 MmPHjKMRweOzrsYUnaXkVlalOG7W3q9ty6VD0SqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75016F80217;
	Thu, 10 Dec 2020 02:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE1DAF8020D; Thu, 10 Dec 2020 02:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4136F800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 02:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4136F800E1
Received: from [123.114.42.209] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1knBA2-0005id-EK; Thu, 10 Dec 2020 01:54:26 +0000
Subject: Re: [RFC][PATCH 0/2] design a way to change audio Jack state by
 software
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
References: <20201209124344.219158-1-hui.wang@canonical.com>
 <575811fc-cb64-c7d4-bf6b-5044949a326c@perex.cz>
 <s5hy2i7rqcc.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <3cccdf16-b865-3bf2-d518-bf456b9a29e5@canonical.com>
Date: Thu, 10 Dec 2020 09:54:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hy2i7rqcc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 12/9/20 10:44 PM, Takashi Iwai wrote:
> On Wed, 09 Dec 2020 15:25:42 +0100,
> Jaroslav Kysela wrote:
>> Dne 09. 12. 20 v 13:43 Hui Wang napsal(a):
>>> After we change sth in the userspace audio stack like alsa-ucm or
>>> pulseaudio, we want to perform remote audio auto test to verify if the
>>> change introduce the regression or not, some of the tests are about
>>> the defaut_sink/default_source or active_port switching, this needs
>>> the audio jack state to be changed to trigger the userspace's audio
>>> device switching.
>>>
>>> So far, there is no software ways to change the audio jack state, this
>>> block the auto test.
>> I'm not convinced to pollute the kernel space with this code. You can use
>> LD_PRELOAD and simulate this via a shared library or the alsa-lib may be extended.
> While I understand this argument, I see the merit of having the
> kernel-side injection, too.  Wrapping with LD_PRELOAD (or use alsa-lib
> plugin) doesn't verify whether the whole jack system works.  OTOH, the
> jack injection in kernel simulates the closer path to the real use
> case, which covers also the call paths inside the kernel.
>
> Though, I'm not sure whether the current design is the best choice.
> Basically sysfs is expressed in one value per file (although there are
> many exceptions, of course).  So creating a node per jack object might
> fit better?  Or can it better be in debugfs?
OK, got it, will investigate it.
>
>> Also, the first patch can be omitted if you just create another
>> snd_jack_report() function for the user API and put the common code to the
>> static function in jack.c.
> Fully agreed on this point.

Indeed, it is a better and cleaner way, will think about it and 
implement it.

Thanks.

>
> thanks,
>
> Takashi
