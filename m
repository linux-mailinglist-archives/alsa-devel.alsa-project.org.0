Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A678122BB9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:35:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2DB1658;
	Tue, 17 Dec 2019 13:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2DB1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576586142;
	bh=Yg2JjSywIDqiEV8IF0yxtzbzyU+b8OBjh1OlAW++24Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOA2ajD0sTI3dslQuCWGd86rhRf8kjzBQzQdVjA7Q177zIpRi73hzoBAUZ48g00I0
	 TkThu806ahP4yrqOwOozlPCr6G0uhMcx+YRI5C2DXucmBGbE+X9faUSm+Qz7Xn6pHZ
	 7sk9W6v6CUkjldFUhY2r+mMy4FiEr/AVBmp9aeYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A4AF80218;
	Tue, 17 Dec 2019 13:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4612F80234; Tue, 17 Dec 2019 13:33:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D0DF80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D0DF80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 04:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="298037448"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga001.jf.intel.com with ESMTP; 17 Dec 2019 04:33:48 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
 <20191217095851.19629-8-cezary.rojewski@intel.com>
 <s5hy2vb1bxg.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <40723c20-2adf-60bc-eb11-a2efb1f89ce3@intel.com>
Date: Tue, 17 Dec 2019 13:33:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <s5hy2vb1bxg.wl-tiwai@suse.de>
Content-Language: en-US
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 7/7] ASoC: SOF: Intel: Account for compress
 streams when servicing IRQs
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

On 2019-12-17 11:30, Takashi Iwai wrote:
> On Tue, 17 Dec 2019 10:58:51 +0100,
> Cezary Rojewski wrote:
>>
>> Update stream irq handler definition to correctly set hdac_stream
>> current position when servicing stream interrupts for compress streams.
>>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   include/sound/hdaudio.h          |  1 +
>>   sound/soc/sof/intel/hda-stream.c | 26 ++++++++++++++++++++++++--
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> index 9a8bf1eb7d69..9a24d57f0cf2 100644
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -496,6 +496,7 @@ struct hdac_stream {
>>   	bool locked:1;
>>   	bool stripe:1;			/* apply stripe control */
>>   
>> +	unsigned long curr_pos;
> 
> Unless the actual implementation of this user is shown, it's a bit
> hard to judge whether this addition is really OK or not....
> 
> I don't believe it'd be a big problem at all, but still we need the
> usage implementation for a proper evaluation.
> 
> And, IMO, such a change should be split to two parts: the common API
> change and its user.
> 
> 
> thanks,
> 
> Takashi
> 

The actual user of this is _pointer op for hda compr stream.

Probing pull request link:
https://github.com/thesofproject/linux/pull/1276/

- ASoC: SOF: Intel: Probe compress operations
https://github.com/thesofproject/linux/pull/1276/commits/fb3e724a54bf859f039b2b0b03503a52e1740375

Method hda_probe_compr_pointer initializes 
snd_compr_tstamp::copied_total with hdac_stream::curr_pos value.

If this can be done better or in more elegant way, let's do so.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
