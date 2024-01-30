Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9C842238
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 12:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BAEEB6;
	Tue, 30 Jan 2024 12:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BAEEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706612748;
	bh=YWoRr++LtmqrklpXT4FN730vpyGR9Vt9NvXbQgTv6DA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZcvIf1gQfMs2Kf3ys40kMoA42aZDitABqCvOW7aKj4sm60mRzCYLov7wixIDZyFRM
	 NbWhvxrCZcr9BD+7+DkkYXDzVHS3H7OUmrEiPF1aZhf2GxKVGxi3o3T1MLbW1342A8
	 XqzUkvtfReAm7nAYb08ogTBb/+Ef/PHSdzxk5JuU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0942F805B6; Tue, 30 Jan 2024 12:05:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29209F8020D;
	Tue, 30 Jan 2024 12:05:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAEB2F805B1; Tue, 30 Jan 2024 12:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A65D3F8055B
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 12:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65D3F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EwcKsWm7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40U6m6fK015755;
	Tue, 30 Jan 2024 05:04:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=7fkoap6tDn5V09KItRc07wxlB0r/CaVc096KyiaEmTw=; b=
	EwcKsWm7Xv5RXOP9O+rQrFl4ul+uzXVB0OJTT3xwOV6klHLMs2dGIgCByBaFSHZC
	TnbzGFdvLP9CKEw2DPjacbeYvpB7fG4KHRZZSfTFtITvqkyOEI/eHViWDi+rf/oZ
	soEXABvXy1qbsmy5IA0q5DBoynwKcsAwfTAMKXV5erT2BSNs2NlRcTNom9BrtxS5
	+RelvvnNHudCp6XyH6Fn7Io3/FWtGWeUNEpgB5jNnkMov1rQhHKGIsws3s+8VuTg
	uIJ+fliAEobFWKx/rzA5gNMhywqZwvDSbUhMIFDj0H/JLieIXXwFeaCVHXCADUnW
	ICAtk2fZjF8CGglzOLYQmQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vw043u6s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 05:04:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 11:04:54 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 30 Jan 2024 11:04:54 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5F753820247;
	Tue, 30 Jan 2024 11:04:54 +0000 (UTC)
Message-ID: <a8432725-6dc6-4765-831f-178dcee8b829@opensource.cirrus.com>
Date: Tue, 30 Jan 2024 11:04:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] ASoC: cs35l56: Fix default SDW TX mixer registers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
 <20240129162737.497-9-rf@opensource.cirrus.com>
 <4f54a12c-c8a3-414c-b4df-3f7b25e6d524@linux.intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4f54a12c-c8a3-414c-b4df-3f7b25e6d524@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oet1IvvhAV8hsmYkbAJ3mUff-NWRGpf-
X-Proofpoint-GUID: oet1IvvhAV8hsmYkbAJ3mUff-NWRGpf-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WNPQ7342T256SBG627OY2YSB3PG5EZ7M
X-Message-ID-Hash: WNPQ7342T256SBG627OY2YSB3PG5EZ7M
X-MailFrom: prvs=9759113787=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNPQ7342T256SBG627OY2YSB3PG5EZ7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/01/2024 17:15, Pierre-Louis Bossart wrote:
> 
> 
> On 1/29/24 17:27, Richard Fitzgerald wrote:
>> Patch the SDW TX mixer registers to silicon defaults.
>>
>> CS35L56 is designed for SDCA and a generic SDCA driver would
>> know nothing about these chip-specific registers. So the
>> firmware sets up the SDW TX mixer registers to whatever audio
>> is relevant on a specific system.
>>
>> This means that the driver cannot assume the initial values
>> of these registers. But Linux has ALSA controls to configure
>> routing, so the registers can be patched to silicon default and
>> the ALSA controls used to select what audio to feed back to the
>> host capture path.
> 
> humm, which has the precedence then?
> a) the values set by firmware
> b) the default values set by the driver?
> 
> Also if the firmware touches those registers shouldn't they be marked as
> 'volatile'?
>

The firmware was designed to work with Windows, so it looks a bit
strange if you are coming at it from ALSA. There's not really any
defined 'precedence'. The firmware will setup the feedback monitor paths
to something that satisfies SDCA and Windows expectations.

We don't care about that in Linux, the firmware on the Intel DSP
probably isn't running the same algorithms for Linux, and we have ALSA
controls to configure those paths. So we patch the mixers back to their
silicon defaults and take over complete control of them.

The firmware only writes them during its power-up sequence so they
will only change when we are rebooting the firmware or coming out of
low-power standby, which is under the control of the driver. When that
happens regmap will re-apply the patch and then sync up the registers
again. The firmware won't touch them after boot, so we can avoid having
to mark them volatile (which would mean implementing our own manual
caching of the settings).

> 
>> Backport note:
>> This won't apply to kernels older than v6.6.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
>> ---
>>   sound/soc/codecs/cs35l56-shared.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
>> index 35789ffc63af..a812abf90836 100644
>> --- a/sound/soc/codecs/cs35l56-shared.c
>> +++ b/sound/soc/codecs/cs35l56-shared.c
>> @@ -12,6 +12,15 @@
>>   #include "cs35l56.h"
>>   
>>   static const struct reg_sequence cs35l56_patch[] = {
>> +	/*
>> +	 * Firmware can change these to non-defaults to satisfy SDCA.
>> +	 * Ensure that they are at known defaults.
>> +	 */
>> +	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
>> +	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
>> +	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
>> +	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
>> +
>>   	/* These are not reset by a soft-reset, so patch to defaults. */
>>   	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
>>   	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },

