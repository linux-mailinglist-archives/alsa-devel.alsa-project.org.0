Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C9288C0A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 17:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8381658;
	Fri,  9 Oct 2020 17:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8381658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602255727;
	bh=tGD94/K/hffkL4YcDfFqcoiMm0xDX2cZ4+Km5UyImJ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOM7W+zJCIkniYeeimGdV+4PbCcFYTwnZv2qVHrxuu2vJdrhFZnapBtrSbEoy8fzg
	 Qy9KVqbAjsg9fzMeK0kv8yS3MGohaAibN4ml+7Fae9EGrpBGt0JcS4rGrsx+tnTzjx
	 Lrf4Kl5k/QVU4I0XLyrIoLj8sV+c10IRvi5E+gPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2EE1F80128;
	Fri,  9 Oct 2020 17:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D78CFF8015B; Fri,  9 Oct 2020 17:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF86F80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 17:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF86F80128
IronPort-SDR: vCHanfEWqW63Cx/AwF8jky8tdFSk8/pTQgy6obl7pF0SI/TI0AHqCj2k+CgjWKL//PA2y92rbg
 5iG4maCWtjjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="145359378"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145359378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 08:00:17 -0700
IronPort-SDR: O6/lPDeAZFrkMJUCQOW068EFs+Gz9I+mXXeKsgwUEK6Dgtm4yfOecM1SPcXp9lANaSLJhitdmM
 VApNNyixGHRQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419472596"
Received: from sjkim-mobl1.amr.corp.intel.com (HELO [10.212.131.60])
 ([10.212.131.60])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 08:00:16 -0700
Subject: Re: [PATCH 1/1] ALSA: hda: fix jack detection with Realtek codecs
 when in D3
To: Takashi Iwai <tiwai@suse.de>
References: <20201009140227.691140-1-kai.vehmanen@linux.intel.com>
 <f1c3ff3f-8f7c-a82c-b03d-32369e32e395@linux.intel.com>
 <s5hzh4vsbl0.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0c7d8dd4-b5cc-34f2-bbbe-7a4824e08128@linux.intel.com>
Date: Fri, 9 Oct 2020 10:00:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hzh4vsbl0.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


>> On 10/9/20 9:02 AM, Kai Vehmanen wrote:
>>> In case HDA controller is active, but codec is runtime suspended, jack
>>> detection is not successful and no interrupt is raised. This has been
>>> observed with multiple Realtek codecs and HDA controllers from different
>>> vendors. Bug does not occur if both codec and controller are active,
>>> or both are in suspend. Bug can be easily hit on desktop systems with
>>> no built-in speaker.
>>>
>>> The problem can be fixed by powering up the codec once after every
>>> controller runtime resume. Even if codec goes back to suspend, the jack
>>> detection will now work. Add a flag to 'hda_codec' to describe codecs
>>> that require this flow from the controller driver. Mark all Realtek
>>> codecs with this flag.
>>
>> It does make sense to request the codec to resume when the controller
>> resumes, we did the same for SoundWire IIRC.
>>
>> I am still confused on what happens if e.g. the controller resumes and
>> remains active, e.g. capturing from the DMIC. The codec would become
>> suspended after a while and then we would be back to the same problem,
>> wouldn't we?
>>
>> Or are you saying that this initial resume of the codec is enough?
> 
> When the controller is active and the codec goes to runtime suspend,
> the codec will be woken up via the unsolicited event per jack change.
> So it seems that the problem is only about the wake up from the
> controller's runtime suspend.

Right, I guess the first sentence in commit message could be updated as

"In case HDA controller becomes active, but codec is runtime suspended, 
jack detection is not successful and no interrupt is raised."

