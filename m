Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BB53AB32
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 18:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650FF16EE;
	Wed,  1 Jun 2022 18:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650FF16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654101880;
	bh=yyLnNvzJcswusAwm9Iy4JDnpuYJVfnraaQGCq/X4F2E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JsmLxLmlfo1KuHNVPPHKJW+VI/uzoQZ7tjDjoSD/gZJQacRjFvYZLP0gHI9vuwIbr
	 bT7FlsIfPAYsjHCJTMBNDOiV3Awe9J3ufSnITRyr6qzsNfY43k3ScV5VXL1nxMoE5B
	 d2RFVbsUTyk1iSb14YmlGtBZDlbmxqNHL/GYxv7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4838F800BD;
	Wed,  1 Jun 2022 18:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7D25F800BD; Wed,  1 Jun 2022 18:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2564F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 18:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2564F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L/kkIbLb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251GD9Lw013228;
 Wed, 1 Jun 2022 11:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=8JmM4oK3zicQ8AMY1tUoSEXJdzasmZmWSpyRHYe8enQ=;
 b=L/kkIbLbtQIJ9I3vWKhAjHezDOGVZt98MukU62+rhBBualRcZCwWiIlRqZfrsTtTw0lw
 /W+foEYWfxZdhLCAiFmWdY1zR3+w0V7pNHMjXIAiSZooa9lZ3p9XtA3vJjZ9JBoVd/og
 Y/cPbJm9eyr+vLNi6SAxlSGYFPo/Vqrtrd3fL+Guxs7lGvsgSAUHrOq84Qm/IuNfXfSr
 U0LSgcwbIAOkhtcOp4drdmXJJKy7zYUKKEOVsZsnQ+KAoylQdJNpC6iyTEmN//XUuawu
 v2uXwx0HcP9DfStB08JC3VIRHytazXi+ysiKxnbySjJEm/fNhlJ8qh1KYkMjUj3eNT3a cw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51mgy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Jun 2022 11:43:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 17:43:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 1 Jun 2022 17:43:31 +0100
Received: from [198.61.65.68] (unknown [198.61.65.68])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 70941458;
 Wed,  1 Jun 2022 16:43:31 +0000 (UTC)
Message-ID: <008e3188-f35d-4323-08ea-de5f3a88333a@opensource.cirrus.com>
Date: Wed, 1 Jun 2022 17:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Charles Keepax
 <ckeepax@opensource.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <871qwf0x8t.wl-tiwai@suse.de>
 <20220530090846.GS38351@ediswmail.ad.cirrus.com>
 <87czfvxtsc.wl-tiwai@suse.de>
 <20220530093639.GT38351@ediswmail.ad.cirrus.com>
 <87a6azxr7h.wl-tiwai@suse.de>
 <20220530103415.GU38351@ediswmail.ad.cirrus.com>
 <871qwbxpsb.wl-tiwai@suse.de>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <871qwbxpsb.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MOD9ZZq_-P5NvfVDB-krZ1iJyKdTnsB4
X-Proofpoint-ORIG-GUID: MOD9ZZq_-P5NvfVDB-krZ1iJyKdTnsB4
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On 30/05/2022 11:45, Takashi Iwai wrote:
> On Mon, 30 May 2022 12:34:15 +0200,
> Charles Keepax wrote:
>>
>> On Mon, May 30, 2022 at 12:14:26PM +0200, Takashi Iwai wrote:
>>> On Mon, 30 May 2022 11:36:39 +0200,
>>> Charles Keepax wrote:
>>>> On Mon, May 30, 2022 at 11:18:43AM +0200, Takashi Iwai wrote:
>>>>> On Mon, 30 May 2022 11:08:46 +0200,
>>>>> Charles Keepax wrote:
>>>>>> On Fri, May 27, 2022 at 06:13:38PM +0200, Takashi Iwai wrote:
>>>>>>> On Wed, 25 May 2022 15:16:21 +0200,
>>>>>>> Vitaly Rodionov wrote:
>>>> Yeah that should be what is happening here. Although it looks
>>>> like this code might be removing all the controls if the firmware
>>>> is unloaded. I will discuss that with the guys, we normal just
>>>> disable the controls on the wm_adsp stuff.
>>>
>>> OK, that sounds good.  Basically my concern came up from the code
>>> snippet doing asynchronous addition/removal via work.  This showed
>>> some yellow signal, as such a pattern doesn't appear in the normal
>>> implementation.  If this is (still) really necessary, it has to be
>>> clarified as an exception.
>>>
>>
>> Hm... ok we will think about that. I think that part will
>> probably still be necessary. Because there is an ALSA control
>> that selects the firmware, then it is necesarry to defer creating
>> the controls to some work, since you are already holding the
>> lock.
> 
> Well, if an ALSA control can trigger the firmware loading, that's
> already fragile.  A firmware loading is a heavy task, which should
> happen only at probing and/or resuming in general.  Do we have other
> drivers doing the f/w loading triggered by a kctl...?
> 

On Wolfson/Cirrus codecs the firmware isn't to "make the chip work".
The DSP is programmable to allow for additional audio processing
algorithms. Which algorithm you need depends on the audio use case(s)
you are running, and can change as you change use-case. Many of the
codecs don't have enough DSP memory to hold all possible algorithms.
Which is why the firmware load has always been triggered from ALSA
controls in the ASoC code. It's not something that can be loaded
once in probe().
