Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0A19D773
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 15:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89392167A;
	Fri,  3 Apr 2020 15:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89392167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585919962;
	bh=/wXIa3Zs6g6ImQvQTOVncHWlNNIAHBGMjvpYZQV1UwY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7IDXRdKNYn3GHukXgDneMw4AMQYQfLxpb1ZSHvinw57lZWPkzF8eOVDQA2rhEYYK
	 m+MVPIf7oyK/dmaXcPdszr2y6JlS1+aSX+DGPfTAG6FbzOwLH1WWHgEh7xf176WLfM
	 F+wmUmry/KnV1CM+MEsymeaqk+W+I4jtTb0aVST0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B6D4F8015C;
	Fri,  3 Apr 2020 15:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7790DF8014C; Fri,  3 Apr 2020 15:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5234BF800E4
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 15:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5234BF800E4
IronPort-SDR: PUnrF9gcvYBtoZ9auJqCCh9yKQD+4Rrx6874XIsGk0F3LpSCp8hUQafacbjfzesmQS204EE8qm
 PkrdqfFubsJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 06:17:33 -0700
IronPort-SDR: iEOoxXspajAULt0n2H/SJZ5NoqsXrwx5Baj9+6OtSJm2+YGgBr16O6M1XJkWNIGaTpDvzIGVeh
 X5GRFHRPQLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="268357010"
Received: from qwong-mobl.amr.corp.intel.com (HELO [10.212.132.190])
 ([10.212.132.190])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 06:17:33 -0700
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
 <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
 <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <be66d657-f4c5-46d8-d0b5-4879d7aa7463@linux.intel.com>
Date: Fri, 3 Apr 2020 08:17:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 4/3/20 3:01 AM, Hans de Goede wrote:
> Hi,
> 
> On 4/2/20 9:15 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 4/2/20 1:49 PM, Hans de Goede wrote:
>>> At least on Canon Lake each time the SOF firmware is booted,
>>> the following error is logged in dmesg:
>>>
>>> [   36.711803] sof-audio-pci 0000:00:1f.3: error: no reply expected, 
>>> received 0x0
>>>
>>> Since the DSP is powered down when not in used this happens everytime
>>> e.g. a notification plays, polluting dmesg with these false-positive
>>> errors.
>>
>> What kernel are you using Hans? I thought this was solved with
> 
> 5.6.0
> 
>> 8354d9b44530b ("ASoC: SOF: Intel: hda-loader: clear the IPC ack bit 
>> after FW_PURGE done") >
>> Set DONE bit after the FW_PURGE IPC is polled successfully, to clear the
>> interrupt and avoid the arrival of the confusing unexpected ipc.
> 
> That commit is not in Torvald's tree yet, but it is in
> broonie/sound.git, I've cherry picked it into my local tree
> and reverted my own fix.
> 
> Unfortunately even with that patch cherry picked the errors my
> patch silences still happen.

Ok, we'll look into it. Give us a couple of days on this one, thanks!
