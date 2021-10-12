Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A568742AB86
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 20:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F52C168C;
	Tue, 12 Oct 2021 20:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F52C168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634061850;
	bh=96LyfBC+P7JSHIS5B/bKSZdNPEOF7TgWiVCgP/i7MbM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4mxpKDALBpzQRa/ExIIMcWi5izDJoIqDrCqU7UWPXRWTB44B6VlxxbYS6tT7ii4/
	 IeLHRDYRI6hNKezOkSdtlgxTmUZjz6DgDd1cDgdr7BF4fdMQq69rpoM+Rz4L0Yye/G
	 Ajfc8Fsbi1AUpQSDHEo6YM3473mgzrIExEpvmMcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B114F80245;
	Tue, 12 Oct 2021 20:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A379CF80212; Tue, 12 Oct 2021 20:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D423F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 20:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D423F800CB
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288101818"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="288101818"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 11:02:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="486483857"
Received: from csharp1-mobl.amr.corp.intel.com (HELO [10.213.183.127])
 ([10.213.183.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 11:02:09 -0700
Subject: Re: [PATCH v2 1/3] ALSA: pcm: introduce INFO_NO_REWINDS flag
To: Takashi Iwai <tiwai@suse.de>
References: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
 <20211004162423.85323-2-pierre-louis.bossart@linux.intel.com>
 <s5h8rz8ez3s.wl-tiwai@suse.de>
 <c62b3749-c5ea-7b1e-2831-272c8a14d3ac@linux.intel.com>
 <s5hbl43egs8.wl-tiwai@suse.de>
 <1ae2012b-d6bd-77ce-0a9e-98aec4d0f868@linux.intel.com>
 <s5hv9223h86.wl-tiwai@suse.de>
 <e630eb5f-f0f2-c193-ab68-46df26083275@linux.intel.com>
 <s5hk0ii1cwf.wl-tiwai@suse.de>
 <e3c854ba-9abf-c9f1-1d74-1a82c9a7b6b3@linux.intel.com>
 <s5hczoa17vx.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <51b47edf-cec2-6f11-17ee-3b8bca7e7c37@linux.intel.com>
Date: Tue, 12 Oct 2021 13:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hczoa17vx.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 P9ter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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


>> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
>> index a144a3f68e9e..e839459916ca 100644
>> --- a/sound/core/pcm_lib.c
>> +++ b/sound/core/pcm_lib.c
>> @@ -2127,11 +2127,30 @@ int pcm_lib_apply_appl_ptr(struct
>> snd_pcm_substream *substream,
>>  {
>>         struct snd_pcm_runtime *runtime = substream->runtime;
>>         snd_pcm_uframes_t old_appl_ptr = runtime->control->appl_ptr;
>> +       snd_pcm_sframes_t diff;
>>         int ret;
>>
>>         if (old_appl_ptr == appl_ptr)
>>                 return 0;
>>
>> +       /*
>> +        * check if a rewind is requested by the application, after
>> +        * verifying the new appl_ptr is in the 0..boundary range
>> +        */
>> +       if (substream->runtime->info & SNDRV_PCM_INFO_NO_REWINDS) {
>> +               if (appl_ptr >= runtime->boundary)
>> +                       appl_ptr -= runtime->boundary;
> 
> The boundary check can (or should) be done unconditionally.
> It was too naive to assume a sane appl_ptr passed always.
> And, it can rather return an error.  So,
> 
> 	if (appl_ptr >= runtime->boundary)
> 		return -EINVAL;

ok, but that would be a separate patch then since it impacts all users,
even without the NO_REWINDS.

> 
> 	/* check if a rewind is requested by the application */
> 	if (substream->runtime->info & SNDRV_PCM_INFO_NO_REWINDS) {
> 		diff = appl_ptr - old_appl_ptr;
> 		....
> 
>> +               if (diff >= 0) {
>> +                       if (diff > runtime->buffer_size)
>> +                               return 0;
>> +               } else {
>> +                       if (runtime->boundary + diff > runtime->buffer_size)
>> +                               return 0;
> 
> I'm not sure whether we should return 0 here.  In snd_pcm_rewind() it
> returns 0 due to application breakage, though.

We could return -EINVAL indeed, that would keep the work-around in place
for PulseAudio.
Even for other uses, it's not so bad: the selection of NO_REWINDS is an
opt-in, and if a rewind still occurs a big fail would help detect a
configuration issue.
