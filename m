Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2BC766EE4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 15:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC11A1E9;
	Fri, 28 Jul 2023 15:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC11A1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690552615;
	bh=uC9yAsjXNhXOqn4JMpuvw+cggO9mbOzAB+ikv0XiAVI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPDApFkaWmbgsT5lgXhXd9o71JV2FRdkDeVxBG5g308H6/DB+YPWowyTrw7eTaxC9
	 jE8Dgjfe75tlU3vKdIX0qZUlvtdrzJjrCjk2bpkIRCT5NiNpXbj7vX/oW23AzwPsW1
	 /Tr73kSDpxlCcVDNGeR88p1HyqkhtUyGeV9CVqyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0BAEF80544; Fri, 28 Jul 2023 15:56:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5BF8F80163;
	Fri, 28 Jul 2023 15:56:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1ABDF8019B; Fri, 28 Jul 2023 15:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E266F800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 15:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E266F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Wqv6HGc5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36S81BcW025215;
	Fri, 28 Jul 2023 08:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=chgwWO5YMIJjQv9UF1hYPVXhRGHNmfv4cxQzjsK6WJM=; b=
	Wqv6HGc5Ft644SU73s4gAw7sCRVoLMQPvnJv5tf5OylMkjWvbynbBgNSln30a3Qv
	NDodQpDA2m6gm0TrwIbhZU7PRlxX9gtAGZwk9ZUosYp1FabfdkfxYG+3GXSf6d5V
	7iTIQqmTnoeGHrkjVXHlviV9PJqdhO0QqyGxOXLAnj8EDpugHbIrHY0EyZUZ3wjB
	Q0AXWVSoivkfJ2iWlEM0DKH3Ib1mlQYBaOan0uaqB/V99OW+dmP6oNl+n9zV27lu
	GQKXBOSUoJwtizrma6nqryf/nmVrjs/3lXxK4/9ukHSdIxES4tRCp1sNYpscRckU
	K280eV3Tr9Jh2FycAiUVEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s2q713g7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 08:55:49 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 14:55:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 28 Jul 2023 14:55:46 +0100
Received: from [198.61.65.141] (LONN2DGDQ73.ad.cirrus.com [198.61.65.141])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8505E11AB;
	Fri, 28 Jul 2023 13:55:46 +0000 (UTC)
Message-ID: <ab5a2372-c377-a738-4bce-7f67efd656c1@opensource.cirrus.com>
Date: Fri, 28 Jul 2023 14:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/11] Fix support for System Suspend for CS35L41 HDA
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
 <87jzupwuo9.wl-tiwai@suse.de> <87ila4cmvh.wl-tiwai@suse.de>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <87ila4cmvh.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XmUt5XBUa9BKajNgyPuTU-u4oGe3Jn9H
X-Proofpoint-ORIG-GUID: XmUt5XBUa9BKajNgyPuTU-u4oGe3Jn9H
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ARCUJAKK6WK5T4YK2N5GIHAY3W32LYN6
X-Message-ID-Hash: ARCUJAKK6WK5T4YK2N5GIHAY3W32LYN6
X-MailFrom: prvs=35737bc531=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARCUJAKK6WK5T4YK2N5GIHAY3W32LYN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 28/07/2023 12:10, Takashi Iwai wrote:
> On Mon, 24 Jul 2023 11:00:38 +0200,
> Takashi Iwai wrote:
>> On Fri, 21 Jul 2023 17:18:05 +0200,
>> Stefan Binding wrote:
>>> There have been a couple of customer reports of intermittant issues after
>>> system resume, where sometimes the DSP firmware stops responding.
>>> Investigations into this issue show that there is a race between receiving
>>> a prepare from the HDA core, and the firmware reload which is started by
>>> the system resume. This can causes the Global Enable on the CS35L41 to be
>>> enabled during the firmware load, which can sometimes cause issues in the
>>> DSP.
>>>
>>> The existing system resume behaviour also did not resume the audio, if
>>> audio was previously playing when it was suspended.
>>> In addition, during investigation, it was found there were additional
>>> problems in the System Resume sequence, as well as the Playback sequence
>>> with External Boost, where the driver does not correctly follow its
>>> enable sequence for this mode. This can cause additional issues such as
>>> pops and clicks.
>>>
>>> This chain intends to correct the sequences for playback and system
>>> suspend/resume so that the driver: obeys the external boost enable sequence;
>>> resumes audio on system resume; and avoids the race condition on firmware
>>> load and playback during system resume.
>>>
>>> Changes since v1:
>>> - Split patch 1 into 2 separate patches
>>> - Combine Patches 6 and 9
>>>
>>> Stefan Binding (11):
>>>    ALSA: cs35l41: Use mbox command to enable speaker output for external
>>>      boost
>>>    ALSA: cs35l41: Poll for Power Up/Down rather than waiting a fixed
>>>      delay
>>>    ALSA: hda: cs35l41: Check mailbox status of pause command after
>>>      firmware load
>>>    ALSA: hda: cs35l41: Ensure we correctly re-sync regmap before system
>>>      suspending.
>>>    ALSA: hda: cs35l41: Ensure we pass up any errors during system
>>>      suspend.
>>>    ALSA: hda: cs35l41: Move Play and Pause into separate functions
>>>    ALSA: hda: hda_component: Add pre and post playback hooks to
>>>      hda_component
>>>    ALSA: hda: cs35l41: Use pre and post playback hooks
>>>    ALSA: hda: cs35l41: Rework System Suspend to ensure correct call
>>>      separation
>>>    ALSA: hda: cs35l41: Add device_link between HDA and cs35l41_hda
>>>    ALSA: hda: cs35l41: Ensure amp is only unmuted during playback
>> Applied all patches now to for-next branch.
> It seems that this patch set causes occasional freeze at suspend:
>    https://bugzilla.suse.com/show_bug.cgi?id=1213745
>
> Could you take a look?
>
>
> thanks,
>
> Takashi

Hi Takashi,

The initial bug report shows one of the original issues that this patch 
chain was trying to fix.
 From what I can tell from the second issue, something has caused the 
CS35L41 to stop responding,
which in turn caused the system suspend call to fail, and the error is 
passed up. Since system suspend
failed, there was no corresponding system resume, which means the 
CS35L41 was stuck broken.

I'm not sure what was meant by "freeze" and "overheating" in the bug 
report, since the log seems to
indicate the laptop is still responsive, even if audio is broken.

There is some oddity in the log, since one of the errors that was 
printed should only be printed when
the CS35L41 is using External Boost, but I think this laptop is supposed 
to use Internal Boost.
We'll investigate further.

Thanks,

Stefan Binding

