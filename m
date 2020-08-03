Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1523AB37
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 19:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0621668;
	Mon,  3 Aug 2020 19:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0621668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596474150;
	bh=F0f3l4jacSewQXod/BFD90YVeuPpxFK1MeKNE+GfUAo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDEdtTcJgxAOcfq/+l53SdNz2S2We1S9SZoqTw3KeO8q3Q77o7llG6bVlx317Ls21
	 FOFISoNv8Mbjt3JfsSTRwVz3a6VoXWszyqEziO7QT1jd5d83dWB69JVpI/bhWgJ5ZI
	 x5O1YAEaKDtGtvhusP5q96aWhgQzaO1+V7sYWrPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30A2EF801F7;
	Mon,  3 Aug 2020 19:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D96FFF80218; Mon,  3 Aug 2020 19:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95AFEF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 19:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95AFEF80148
IronPort-SDR: EOjN+aR3y+iYQSlaNEtXwZI17cin7XcMhy1TmHNb7T0jEhevFWB6FDHtv33zlxRJ/AEqXbkt0j
 0XLAMYfIAKzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="132209074"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="132209074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:00:31 -0700
IronPort-SDR: TRwz/MhK6c+F5gRQxBebl4W57gBcg4ULjqLdp02Mvt7L5qhP+0h7R+BfWq0VOUvvuW52ZhKIH6
 ilKTsZKDhU6A==
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="330137073"
Received: from dravoori-mobl.amr.corp.intel.com (HELO [10.212.46.95])
 ([10.212.46.95])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:00:31 -0700
Subject: Re: [PATCH] Revert "ALSA: hda: call runtime_allow() for all hda
 controllers"
To: Takashi Iwai <tiwai@suse.de>
References: <20200803064638.6139-1-hui.wang@canonical.com>
 <0db4f5fe-7895-2d00-8ce3-96f1245000ab@linux.intel.com>
 <s5hwo2f3cux.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6f583ccc-2251-384d-bc20-aa17c83a45b4@linux.intel.com>
Date: Mon, 3 Aug 2020 12:00:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hwo2f3cux.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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



On 8/3/20 11:36 AM, Takashi Iwai wrote:
> On Mon, 03 Aug 2020 17:27:12 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 8/3/20 1:46 AM, Hui Wang wrote:
>>> This reverts commit 9a6418487b56 ("ALSA: hda: call runtime_allow()
>>> for all hda controllers").
>>>
>>> The reverted patch already introduced some regressions on some
>>> machines:
>>>    - on gemini-lake machines, the error of "azx_get_response timeout"
>>>      happens in the hda driver.
>>>    - on the machines with alc662 codec, the audio jack detection doesn't
>>>      work anymore.
>>>
>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208511
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>>> ---
>>>    sound/pci/hda/hda_intel.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>> index e699873c8293..e34a4d5d047c 100644
>>> --- a/sound/pci/hda/hda_intel.c
>>> +++ b/sound/pci/hda/hda_intel.c
>>> @@ -2352,7 +2352,6 @@ static int azx_probe_continue(struct azx *chip)
>>>      	if (azx_has_pm_runtime(chip)) {
>>>    		pm_runtime_use_autosuspend(&pci->dev);
>>> -		pm_runtime_allow(&pci->dev);
>>>    		pm_runtime_put_autosuspend(&pci->dev);
>>>    	}
>>
>> Do I get this right that this permanently disables pm_runtime on all
>> Intel HDaudio controllers?
> 
> It just drops the unconditional enablement of runtime PM.
> It can be enabled via sysfs, and that's the old default (let admin
> enabling it via udev or whatever).

Sorry I am confused now.
Kai seemed to suggest in the Bugzilla comments that this would be 
temporary, until these problems with i915 and ALC662 get fixed?
