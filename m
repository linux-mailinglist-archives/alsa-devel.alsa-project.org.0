Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093767EB46
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:43:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7AF493A;
	Fri, 27 Jan 2023 17:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7AF493A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674837785;
	bh=y5WiWYoPmeWRQTq+h3ADF9qMzdRYPVjguNQ/7zr5ZKc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PPfFK/+lNB490Wyf22rj6DiW4mBtB9xhnu7ljHfpvUDCTVDrQvuwMzvzuiygLZ2U6
	 oNZBMAZIcQFI6r9QswL0uy0UM30Tze0SAFhBNocLNmfLv/8xVUpvbj6hLkLd0VVJ4E
	 gyQfkgyOv4BTMoI6n9W2LmsOMrzj8ZuTv52KX+rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA8C4F8007C;
	Fri, 27 Jan 2023 17:42:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194ABF8007C; Fri, 27 Jan 2023 17:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673F6F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:41:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673F6F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=qsE7WeDh
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 664B911E4;
 Fri, 27 Jan 2023 17:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 664B911E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1674837714; bh=72VCcJJxXXJ2bRu6xheDpCpxeIDPr4x7r7Bh9fqdkxo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qsE7WeDhAIYITdqIx4QhUbq4ukEd81gGTxkWg1gHEcz+MM2p8mXAQfT8rrss4d7h9
 il6oXy/w1cphUQ2yixydix3aek4tCPlzUOzZcVYBqmDVH1MupuJH8ydK42YwtKOcmH
 VHRs/5VZvRdjtNQ0qJtzKkbmKhBKAP/TLElU0uOw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Jan 2023 17:41:44 +0100 (CET)
Message-ID: <e9733e9a-ac70-846f-c3a2-f96a6787b9bc@perex.cz>
Date: Fri, 27 Jan 2023 17:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] ASoC: amd: yc: Add a module parameter to influence
 pdm_gain
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230127160134.2658-1-mario.limonciello@amd.com>
 <20230127160134.2658-3-mario.limonciello@amd.com>
 <2e9f4301-0211-04f5-5b38-caf2be9f4fd1@perex.cz>
 <MN0PR12MB61014C004C798F7DE8682AAFE2CC9@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <MN0PR12MB61014C004C798F7DE8682AAFE2CC9@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Pananchikkal,
 Renjith" <Renjith.Pananchikkal@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27. 01. 23 17:25, Limonciello, Mario wrote:
> [AMD Official Use Only - General]
> 
> 
> 
>> -----Original Message-----
>> From: Jaroslav Kysela <perex@perex.cz>
>> Sent: Friday, January 27, 2023 10:23
>> To: Limonciello, Mario <Mario.Limonciello@amd.com>; Mukunda, Vijendar
>> <Vijendar.Mukunda@amd.com>; Saba Kareem, Syed
>> <Syed.SabaKareem@amd.com>; linux-kernel@vger.kernel.org
>> Cc: Pananchikkal, Renjith <Renjith.Pananchikkal@amd.com>; Mark Pearson
>> <mpearson@lenovo.com>; Liam Girdwood <lgirdwood@gmail.com>; Mark
>> Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>; alsa-
>> devel@alsa-project.org
>> Subject: Re: [PATCH 2/6] ASoC: amd: yc: Add a module parameter to
>> influence pdm_gain
>>
>> On 27. 01. 23 17:01, Mario Limonciello wrote:
>>> In case of regressions for any users that the new pdm_gain value is
>>> too high and for additional debugging, introduce a module parameter
>>> that would let them configure it.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>    sound/soc/amd/yc/acp6x-pdm-dma.c | 7 ++++++-
>>>    sound/soc/amd/yc/acp6x.h         | 2 +-
>>>    2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> ...
>>
>>>    	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
>>> -	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
>>> +	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);
>>
>> The bits should be zeroed (AND - &) before OR to make sure that the correct
>> value is written to the register. More related patches are affected.
> 
> I had consider this, but the hardware default at reset is 0x0.  Do you think it's
> still necessary for posterity?

You're using 0644 permissions for the module parameter, so the value can be 
changed by root using sysfs anytime (between SNDRV_PCM_TRIGGER calls).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

