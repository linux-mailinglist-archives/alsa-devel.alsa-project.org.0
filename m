Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E25EA847
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3948E100;
	Mon, 26 Sep 2022 16:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3948E100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664202150;
	bh=pczAC7rwPyL+qRuM8U+1Fcu9xT/pHTkexP69i6zoqV0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihIYakQJs3lWZdGoB0eFheTIMw8QxlyH3v7nfyNcC8GUIxdPP2eFoMK8/RB9soVnD
	 bHMZ9D7zT1NPA3MvQk7gPOR2qMhuWtnDAYykd96D2xXHm4kB4yOkxxZW5CXpMS7hkG
	 RY62tKlhSwhphiNEdmZsnzp7SbcCjBnzNBm3rCJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 929F4F802BE;
	Mon, 26 Sep 2022 16:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B34BF80254; Mon, 26 Sep 2022 16:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF9F7F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 16:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF9F7F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b8HC5/GN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664202090; x=1695738090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pczAC7rwPyL+qRuM8U+1Fcu9xT/pHTkexP69i6zoqV0=;
 b=b8HC5/GN06vRI86eQ29TgRMk38WlU6kOYmlwgD8u4mNoYepg8cfT1CiK
 rb2SMyhxj5OQlrkbdLD6I5ZqNC8TZ3lsEbAdto20oDKT0yMOl4JU42B0Q
 +UYfUZbXqS0ftpBcdZ0h6TZptZ+mHe4u2vtYGwxfiEJBmIOZDGpKzkC9/
 tVzJo2gY5JNIAVjhZcs3nPLSM2/dI5bA2o+xDcNYlzWh/3+fQZFVmtj+3
 CH4P9KfDfaT8+wNlSVQAF6WtBxYaQEFMTn64HP0tZe9TGwmJjM53+zNPw
 xL3gQVCeGGrQ4c5BxQeBEr3ywtNOUA+WTAwesL6XbM0er8NlvEzGjVh5g g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="281414566"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="281414566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 07:21:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654280206"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="654280206"
Received: from shrutik1-mobl.ger.corp.intel.com (HELO [10.252.60.30])
 ([10.252.60.30])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 07:21:18 -0700
Message-ID: <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
Date: Mon, 26 Sep 2022 09:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Content-Language: en-US
To: Jason Zhu <jason.zhu@rock-chips.com>, Mark Brown <broonie@kernel.org>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: sugar.zhang@rock-chips.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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



On 9/26/22 03:34, Jason Zhu wrote:
> 
> 在 2022/9/23 20:55, Mark Brown 写道:
>> On Wed, Sep 21, 2022 at 10:37:06AM +0800, Jason Zhu wrote:
>>> 在 2022/9/20 20:47, Mark Brown 写道:
>>>> On Tue, Sep 20, 2022 at 11:45:45AM +0800, Jason Zhu wrote:
>>>>> Sometimes we need to make some dais alive when close the card, like
>>>>> VAD, so these functions must be exported so that they can be called.
>>>> I'm not sure I fully understand the use case here - why wouldn't
>>>> the core know about the audio stream being kept active?  For
>>>> something like VAD I'd expect this to be just working like a
>>>> normal audio path, if there's a DSP consuming the audio stream
>>>> then it'll keep everything open.  If there is a good use case I
>>>> suspect it'll be clearer if you send the users along with this
>>>> patch.
>>> Thanks. For example, we use the VAD(Voice Activity Detect) & PDM(
>>> Pulse Density Modulation) to record sound>. The PDM is used to
>>> record and copy data to DDR memory by DMA when the system is alive.
>>> The VAD is used to detect voice from PDM and copy data to sram
>>> (The sram is small) when the system is sleep. If the VAD detect
>>> specific sound, wake up the system and continue to record sound.
>>> The data can not be lost in this process. So we attach VAD & PDM
>>> in the same card, then close the card and wake up VAD & PDM again
>>> when the system is goto sleep. Like these code:
>> This sounds like a very normal thing with a standard audio stream -
>> other devices have similar VAD stuff without needing to open code access
>> to the PCM operations?
> 
> 
> At present, only VAD is handled in this way by Rockchip.
> 
>>
>>> When the system is waked up, open the sound card. The data in sram
>>> is copied firstly and close the vad. Then use the DMA to move data
>>> to DDR memory from PDM.
>> Generally things just continue to stream the voice data through the same
>> VAD stream IIRC - switching just adds complexity here, you don't have to
>> deal with joining the VAD and regular streams up for one thing.
> 
> 
> Yes, this looks complicated. But our chip's sram which is assigned to VAD
> 
> maybe used by other devices when the system is alive.  So we have to copy
> 
> sound data in sram firstly, then use the DDR(SDRAM) to record sound data.

There are other devices that requires a copy of the history buffer from
one PCM device and a software stitching with the real-time data coming
from another PCM device. It's not ideal but not uncommon either, even
for upcoming SDCA devices, combining data from 2 PCM devices will be an
allowed option (with additional control information to help with the
stitching).

That said, the usual practice for exporting symbols is to share
additional patches that show why this was needed. A single patch in
isolation is hard to review.
