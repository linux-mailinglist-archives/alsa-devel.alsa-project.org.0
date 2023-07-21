Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BC75CAC6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 16:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E4E1FC;
	Fri, 21 Jul 2023 16:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E4E1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689951408;
	bh=veJZttLsurwBukR0SLjVHwwPjDTFP7IBtu4e0jNuVeM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VUiiZfyhS/PsAi75GlijqWmLJ6Fado+UINrKkuoll2kdAYRRkvdSmu3HzxKao/zt6
	 1Mv90WkeWtOP2kh4VyhYGpwTXCG7iTt4VuyUSt6cf9fooHK/JIJlm7PdEZTiW2WTXk
	 oqZk5jvRXfZyoXeN9IB0lezf0gR1O+kbRk5sa/zA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02169F80535; Fri, 21 Jul 2023 16:55:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A3CF8032D;
	Fri, 21 Jul 2023 16:55:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26EAFF8047D; Fri, 21 Jul 2023 16:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9446CF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9446CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AG/tQst/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LAlJaa017947;
	Fri, 21 Jul 2023 09:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=fm0PC/h1Bdjaglgy/tAgY3THccpxAMC73jYzvsx4GBQ=; b=
	AG/tQst/aC/Bsv0e2ntGdXzpOLG2M6ZgIxzSHa+ZpAzVm+4iBdwLvin5ovWU6olY
	e9ySMIVPDcPgbcecayFU3HjgLeDi5wTSKWk42n1eZu/e/KnzVW8nR1t1ZK7gx8Vt
	3qck0bpjFfa86lscMKpBexHK+/T3h4g+24XIqHfK4NTju9b/zEaceRdYfbZIlxLm
	Dbfe3CptkU1n2/k3WfnGnPyeNtck9Idgn9QafIxQt30ZXptkQm8K+JJJM5b/pjrx
	thBe3cgwDurDFbul3AGCGZ0PChW3M2yltVyv4emZMaOEIUZTpDj3Gny6utwrumvD
	PXn1Kd52xc8dlP8zs/s5Hw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gynky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 09:55:45 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 15:55:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 15:55:43 +0100
Received: from [198.61.64.111] (LONN2DGDQ73.ad.cirrus.com [198.61.64.111])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 67F2815B6;
	Fri, 21 Jul 2023 14:55:43 +0000 (UTC)
Message-ID: <bf6b5496-bcf9-771d-5921-fe137fa3bec0@opensource.cirrus.com>
Date: Fri, 21 Jul 2023 15:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 10/11] ALSA: hda: cs35l41: Add device_link between HDA
 and cs35l41_hda
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
 <20230720133147.1294337-11-sbinding@opensource.cirrus.com>
 <87v8eeiryp.wl-tiwai@suse.de>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <87v8eeiryp.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XG9VxISCNLKkoye17qVd4h_iWv6Pq1dp
X-Proofpoint-GUID: XG9VxISCNLKkoye17qVd4h_iWv6Pq1dp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NSJNXD5ATPTQXICDXXWPRFCJUJEOEC3N
X-Message-ID-Hash: NSJNXD5ATPTQXICDXXWPRFCJUJEOEC3N
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSJNXD5ATPTQXICDXXWPRFCJUJEOEC3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 20/07/2023 15:21, Takashi Iwai wrote:
> On Thu, 20 Jul 2023 15:31:46 +0200,
> Stefan Binding wrote:
>> To ensure consistency between the HDA core and the CS35L41 HDA
>> driver, add a device_link between them. This ensures that the
>> HDA core will suspend first, and resume second, meaning the
>> amp driver will not miss any events from the playback hook from
>> the HDA core during system suspend and resume.
>>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>> ---
>>   sound/pci/hda/cs35l41_hda.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
>> index 70aa819cfbd64..175378cdf9dfa 100644
>> --- a/sound/pci/hda/cs35l41_hda.c
>> +++ b/sound/pci/hda/cs35l41_hda.c
>> @@ -1063,6 +1063,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>>   {
>>   	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
>>   	struct hda_component *comps = master_data;
>> +	unsigned int sleep_flags;
>>   	int ret = 0;
>>   
>>   	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
>> @@ -1102,6 +1103,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>>   
>>   	mutex_unlock(&cs35l41->fw_mutex);
>>   
>> +	sleep_flags = lock_system_sleep();
>> +	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
>> +		dev_warn(dev, "Unable to create device link\n");
>> +	unlock_system_sleep(sleep_flags);
> Is lock_system_sleep() mandatory for device_link_add()?  The function
> takes its rw lock for the race, I suppose.

I believe this is mandatory, to ensure we don't try to add the device 
link during a suspend/resume transition.
Its probably unlikely that that would occur during the component bind, 
but just in case.

Thanks,

Stefan

>
>
> thanks,
>
> Takashi
