Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECB182FA5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:56:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46AE16E2;
	Thu, 12 Mar 2020 12:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46AE16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584014191;
	bh=g8/58VZ6dIt8m0B1Y7zWry5rWASpAewoKtJnj+k24Ww=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dS13dIa+tG69HmQu9iQAZ1xvDRxZC38J/UFkdY9hCRJJbs1RZXnHUVEHTZUfZ01Pn
	 sBiT4mp9C1i1XrLOrx4QnYTF4qlTaUdNE6lx6FUP1qVEspIbVZ4qyKZlbxz55P8/n/
	 AzXfLYSd8vAt+JsrCRoPAW+RWoB3U8CDF+WK9ALA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91D7F800BE;
	Thu, 12 Mar 2020 12:54:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A90BDF8020C; Thu, 12 Mar 2020 12:54:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1198BF8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 12:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1198BF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="246345327"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 12 Mar 2020 04:54:41 -0700
Subject: Re: [PATCH] ASoC: SOF: Intel: Fix stream cleanup on pcm close
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200218141013.7290-1-cezary.rojewski@intel.com>
 <63adf568-74f4-2c01-8257-955d5aa51420@linux.intel.com>
 <95efa175-e72a-fe48-9c91-ec65d31ae130@intel.com>
 <446b11ad-648f-1add-e827-06088e13ee2f@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <49e7c1c9-ddba-1f8c-7765-2fd0103b6429@intel.com>
Date: Thu, 12 Mar 2020 12:54:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <446b11ad-648f-1add-e827-06088e13ee2f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com
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

On 2020-02-18 20:05, Pierre-Louis Bossart wrote:
>>
>> Ain't hda-pcm.c the best place for it as "hstream->substream = 
>> substream" happens there too? If the cleanup is to be done in 
>> _hw_free(), then I'd expect the same to happen to the original 
>> assignments. Doubt we want to do the later so.. _close() for the win?
>>
>> In general the existing hstream->substream initialization looks kinda 
>> disconnected from the actual stream assignment code - _stream_get() - 
>> as if the duties of the state machine were shared.
> 
> I am having difficulties interpreting your answer, i.e. I don't know 
> what the last sentence refers to.

It's just safer to tie substream assignment directly with _stream_get() 
so problems such as this don't stay hidden and arise later during the 
development process. _stream_assign() in /hda/ext/hdac_ext_stream/ & 
_stream_release in /hda/hdac_stream do exactly that.

> Currently open() and close() are perfectly symmetrical, I don't really 
> see why you'd want to change and add an imbalanced set of operations, 
> unless you moved
> 
> hstream->substream = substream;
> 
> to the open() instead of hw_params().
> 
> Or alternatively add a hw_free() in hda-pcm.c to mirror what's done in 
> hw_params.

Relocated to _hw_free(). Thanks.
