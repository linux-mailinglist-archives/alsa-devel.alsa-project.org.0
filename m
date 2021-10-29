Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25043FF75
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EB41709;
	Fri, 29 Oct 2021 17:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EB41709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635521292;
	bh=B1Cd4tVc2r7XUI3JXwmUIXBku/fVyACR0rou73Am3LQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zm5D0ljdjyu+uBu8sTgR2HaOeDLrLUaNgjPQfM3V9VSJH/ZMOk7xg+FRbrM+tsbjf
	 hPfocDJ1v3wudjWQsU8hzvkM7VkOy/1meXRWEmt1WanuBWtM1zuSJBvEbDgFQq+HT2
	 deU+4nJ4IBboVXJ9RISi1+f1hQGYUL+u8pbPXDgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C61F800D1;
	Fri, 29 Oct 2021 17:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53877F8025A; Fri, 29 Oct 2021 17:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CD4EF800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 17:26:44 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F345FA0049;
 Fri, 29 Oct 2021 17:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F345FA0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1635521204; bh=34OOJZeF7fIOonM6ercXMgmUTe4EfYzKs0a5zkCpoYc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dXwLqXlpGfaHehXGmpIoYdksLlU+13fd773929LyRw7lINOI4EqkJa7kmapPRce49
 G61m9UNfn2srSKxqQNJOY5gNdaZPv0ne+/4n7smc1xjAHKe01G23CK+s+ibNH8s3y2
 EgBCWmtld7RksURsJu1cYNEWpOvVyU8/kRne/yts=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 29 Oct 2021 17:26:34 +0200 (CEST)
Message-ID: <f709fcff-1bd4-1251-1471-aad01fdfdedd@perex.cz>
Date: Fri, 29 Oct 2021 17:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
 <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
 <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On 29. 10. 21 17:08, Sameer Pujar wrote:
> 
> 
> On 10/26/2021 11:53 AM, Sameer Pujar wrote:
>>
>>
>> On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:
>>> On 25. 10. 21 13:06, Sameer Pujar wrote:
>>>
>>>> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct
>>>> snd_kcontrol *kcontrol,
>>>
>>> ...
>>>>
>>>>        return 1;
>>>
>>> It's a bit unrelated comment to this change, but it may be worth to
>>> verify all
>>> kcontrol put callbacks in the tegra code. Ensure that value 1 is
>>> returned only
>>> when something was really changed in hardware.
> 
> There are cases when the mixer control update is not immediately written
> to HW, instead the update is ACKed (stored in variable) and writen to HW
> at a later point of time. Do these cases qualify for "return 1" as well?

Yes - assuming that the get callback returns the cached value. The get/put 
implementation should be consistent from the caller view. The driver 
implementation (delayed write) is a separate thing.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
