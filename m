Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BBB4187
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 22:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A5F1669;
	Mon, 16 Sep 2019 22:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A5F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568664225;
	bh=zDTE1Zpx5W+6SYTelhPBScVGq6av89NYqsw85RbhMwk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezkzTyoR883vP5bf5bRBDtlcv4RPXmKbFgBNLmL4YQwPJCeijrvippfvfjZmvbDx5
	 MtFm91jTUNnzOixOkpQiYyaFRC7sBJp/uwnG8JZzG0WAqQK+WTaU5WRmodElNUjZ/w
	 KTXYU9X6fhpk3v+GVGbOZrzuQqQTodqEohtgQ93o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69899F80506;
	Mon, 16 Sep 2019 22:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D6DBF80506; Mon, 16 Sep 2019 22:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9078EF80137
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 22:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9078EF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 13:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="361630605"
Received: from jvhicko1-mobl2.amr.corp.intel.com (HELO [10.254.104.227])
 ([10.254.104.227])
 by orsmga005.jf.intel.com with ESMTP; 16 Sep 2019 13:01:52 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
 <5579b62d-d949-ec62-0a85-45d0842af38f@linux.intel.com>
 <s5hpnk0xcbu.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ff72482-41a5-2655-d713-b91efd2601f5@linux.intel.com>
Date: Mon, 16 Sep 2019 15:01:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hpnk0xcbu.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 0/9] adapt SOF to use snd-hda-codec-hdmi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/16/19 2:36 PM, Takashi Iwai wrote:
> On Mon, 16 Sep 2019 17:59:06 +0200,
> Pierre-Louis Bossart wrote:
>>
>> On 9/12/19 9:21 AM, Kai Vehmanen wrote:
>>> Hi all,
>>>
>>> here's the 4th round for this series that adapts SOF to use
>>> snd-hda-codec-hdmi (patch_hdmi.c) codec driver instead of hdac_hdmi
>>> (soc/codecs/hdac_hdmi.c). The primary goal is to unify the HDMI codec
>>> implementation between DSP and non-DSP HDA configurations, offer same
>>> interface to user-space and reduce maintenance load for all.
>>
>> The series looks good to me so
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> I would recommend that we have a matching change for the Skylake
>> driver and validation that both SOF and cAVS/SST drivers can operate
>> with this mode set. Our goal is still to have coexistence between the
>> two drivers in a single build/distro, e.g. cAVS for SKL/KBL/APL and
>> SOF for newer platforms. This can be done in a follow-up patch but it
>> needs to be done before distros start selecting this common HDMI mode.
>>
>> The other concern I have is that we have other changes coming for
>> soc-acpi and machine drivers to deal with SoundWire, so it'd be nice
>> to have the changes mirrored between Mark and Takashi trees e.g. with
>> the merge of a fixed branch.
> 
> In general it's already a bit too late to merge for 5.4, so the whole
> series will be after that, at most, hence we still have enough time :)

yes indeed, this was just to let you know we'll need extra work to 
synchronize between you/Mark/Vinod, not to rush things through.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
