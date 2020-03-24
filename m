Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59B1911B1
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 14:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54C41662;
	Tue, 24 Mar 2020 14:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54C41662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585057633;
	bh=x05N1Cdm+/JZdKL0xVbC6ZiKRwJ89oISOfE5MkMtRyo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdEKf5FrmUJMQdGNnLiWwVzLPvOekXbTMpE3n02u1ABBFGgW69FJ4WtIg/GPTbs9x
	 qDGKt1yk405DZ/H6+jaiqId3SxRiQ1vhPIft8+f6uRiVSVi6Ef909BpplrKIesYAAl
	 UfRdh4WBn39+tl43ZsNcxagxUYV6TI84oDAGVnes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544C8F80258;
	Tue, 24 Mar 2020 14:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E92EF80249; Tue, 24 Mar 2020 14:45:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22FFDF800B9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 14:45:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 20B64A0040;
 Tue, 24 Mar 2020 14:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 20B64A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585057520; bh=QMUb/9wDDXELcI9oWukU6yLeQpaWI/asRwxQ6QYi8EY=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=efoukPIjK3II2NVrVES2NJX9vxvbwQgd0iNW6CtJdE4T/6YkDAz9X9JmA9XyW598i
 jq+sE0kwSgSHOQpDKLje7FrFMZu4RilsnNIwnb47B1BPvpx8G5mwjWWXChG7JyPF5W
 KM5wMFhSUOIW49/YaxLCVCd3dcqmjeITx5hahllo=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 Mar 2020 14:45:16 +0100 (CET)
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
 <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
 <20200324043336.GA8342@workstation>
 <a74e4b68-d6f6-c12d-d600-d8cb7321cc00@linux.intel.com>
 <20200324090152.GA14579@workstation>
 <69761ee4-463b-25ff-1d2d-635a19487663@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a78f283f-f6d3-0e37-ec1b-de4f4621d0a9@perex.cz>
Date: Tue, 24 Mar 2020 14:45:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <69761ee4-463b-25ff-1d2d-635a19487663@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

Dne 24. 03. 20 v 14:15 Pierre-Louis Bossart napsal(a):
> 
> 
> On 3/24/20 4:01 AM, Takashi Sakamoto wrote:
>> On Tue, Mar 24, 2020 at 12:12:15AM -0500, Pierre-Louis Bossart wrote:
>>> when people report that their microphone is not reported by PulseAudio/UCM,
>>> it's very helpful to know what UCM was supposed to use in the first place.
>>> We don't have a debugger or step-by-step mechanisms to figure out what the
>>> configurations are.
>>
>> If I get your intension correctly, the addition of sysfs node is just to
>> investigate which use-case configuration is applied in cases that people
>> get issues. If so, it's really exaggerative in a point of the concept of
>> sysfs.
>>
>> I have two alternatives. If it's possible to focus on ALSA SoC part only,
>> addition of node to debugfs is reasonable for this purpose.
>>
>> Another alternative is to change output of 'cards' node of procfs. The
>> latter is commonly available for all cases. For example:
> 
> I initially wanted to use /proc but thought it was a thing from the past
> so I looked at sysfs. If this is the recommendation I don't mind using it.
> 
> debugsfs is not something the average user is familiar with, and it's
> not available in all cases. I'd like to extend existing pieces of
> information than add new things.

I won't modify /proc/asound/cards in this case, but create a per card file 
like /proc/asound/card#/components .

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
