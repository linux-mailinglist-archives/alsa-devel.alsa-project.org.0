Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2F64844E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 15:56:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C3B21EB;
	Fri,  9 Dec 2022 15:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C3B21EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670597792;
	bh=As5TIUX896GFaXNoD36Zt43VBKJ9dzyR6zEUTgT8c3o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EL7cY2wBaiqMjUFHlg/wWsWRXYRvDh91wE6IpiSg3vSDXUSTw5QTk8iDj9XC59pl5
	 eOFNVDVcX3W9g2JHUti7qCS3p6WToBEP1ohnZ4lwBZjRXZ4YzdF/tHk15Tj5fSGxSc
	 b+OQqSHu2rj9Wn8C3+2OMpZXEUTCD+gw7VRZkZkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB7BF8024C;
	Fri,  9 Dec 2022 15:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA14F8022D; Fri,  9 Dec 2022 15:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A01F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 15:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A01F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AYyiutbM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B9Covj4017285; Fri, 9 Dec 2022 08:55:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=beHLIVYruywZ9h8tJeHU6upU+UkqfaDUEu7U/XxUask=;
 b=AYyiutbMSM6Z9b29VMxrrakzIkwmu9E/z87NQPLxcvMio8NdvvvuFfH5hvj4EnB2rEgv
 8+louhyyF4MgQkE2SaxfWCyOnVJ2DmkX6qL5gaUDcqbQbZG85OtlxulsXR+7qi3wfQW+
 PrMy8HmblSL+5z1aVrwpwaYc+gPw8+uvK/rGVFbKJXOexrA/Lb8mw5OUbBsGlHp62P2W
 1hgnxCu0SWwCHdm2z3u6BwU2Y43Ui1ohKehYZJ1a+/aG6VFmKcN3f+/Sd8IeyEiU4/ug
 EiKTj1FcfxE7sGsZsBG7HYNDYSXGx6DytFnCZIb+Y7qmvI6/FgEbmL78hl90rs72+oTW cw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3matyutms8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 08:55:27 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 08:55:26 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 08:55:26 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DFC98B0E;
 Fri,  9 Dec 2022 14:55:25 +0000 (UTC)
Message-ID: <dc65501c-c2fd-5608-c3d9-7cea184c3989@opensource.cirrus.com>
Date: Fri, 9 Dec 2022 14:55:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open() breaks
 SOF Audio in Lenovo laptops
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
References: <f7a515a0d5429b41348341874b78f3c3254970e6.camel@infinera.com>
 <Y5IOEAw5pjAvGgiN@sirena.org.uk>
 <8fa316d5-b525-2207-9092-da14f1d77232@linux.intel.com>
 <ade9deca-2f15-a3a6-97c3-7198f1cf0da0@linux.intel.com>
 <a31e0bee-6972-0c0f-7579-449fb412a0b2@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <a31e0bee-6972-0c0f-7579-449fb412a0b2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aE_8eGMwmoUkZjsd4mdMShecgz1N_eGO
X-Proofpoint-GUID: aE_8eGMwmoUkZjsd4mdMShecgz1N_eGO
X-Proofpoint-Spam-Reason: safe
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
Cc: "sashal@kernel.org" <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, patches@opensource.cirrus.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/12/22 14:42, Pierre-Louis Bossart wrote:
> 
> 
> On 12/9/22 01:37, Péter Ujfalusi wrote:
>>
>>
>> On 08/12/2022 18:37, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 12/8/22 10:17, Mark Brown wrote:
>>>> On Thu, Dec 08, 2022 at 02:02:02PM +0000, Joakim Tjernlund wrote:
>>>>> Several of our Lenovo laptops lost PC audio output in Teams in 5.15.81(also in 5.15.82)
>>>>> Revering above patch:https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=b2ddd76237121155dcadfc4ae77ca1775dfc99f7
>>>>> fixes it.
>>>>>
>>>>> Any idea what the real fix is?
>>>>
>>>> Adding the Intel people.  I've no idea if there's issues with
>>>> dependencies, missing quirks for the hardare or anything in that stable
>>>> version.
>>>
>>> Humm, yes in the past we used the TDM masks to convey the 'stream_tag'
>>> for HDaudio.
>>>
>>> I can still see this in v5.15.85 in sound/soc/sof/intel/hda-dai.c
>>>
>>> 	/* set the stream tag in the codec dai dma params */
>>> 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>>> 		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
>>> 	else
>>> 		snd_soc_dai_set_tdm_slot(codec_dai, 0, stream_tag, 0, 0);
>>>
>>>
>>> That was changed in
>>> 636110411ca72 ASoC: Intel/SOF: use set_stream() instead of
>>> set_tdm_slots() for HDAudio
>>>
>>> snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream),
>>> substream->stream);
>>>
>>> So my guess is that zeroing out TDM masks has a side effect on older
>>> stable kernels, and that effect is not seen on newer kernels.
>>>
>>> I don't really understand what the side effect might be though.
>>
>> The reason is that on the the tdm mask now became persistent and the HDA
>> code relied on the fact that it is volatile, it is reset for each stream
>> open.
>> The core would do some fixup if the tx/rx_mask is set:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/soc/soc-pcm.c?h=linux-5.15.y&#n963
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/soc/soc-pcm.c?h=linux-5.15.y&#n968
>>
>> This did not happened when the tx/rx_mask was reset at open - and later
>> set bny the HDA driver, I guess after these checks, so the fixup did not
>> happened, but without resetting them we would use the previously set
>> masks to do fixups for the number of channels (!) based on a stream_tag
>> value, which has nothing to do with channels.
> 
> Agree with the analysis, so what would be the least bad recommendation?
> a) revert the "don't zero TDM masks" patch
> b) backport the change to use set_stream()?

Adding alsa-devel@alsa-project.org and patches@opensource.cirrus.com.
Please add relevant lists when sending emails so that other people who
might need to know, or have an opinion, are aware of the discussion.
