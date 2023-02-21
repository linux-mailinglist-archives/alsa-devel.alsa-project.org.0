Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A269E60D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1ACE78;
	Tue, 21 Feb 2023 18:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1ACE78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677000824;
	bh=zBxHkP+hvW6AWKVa8LA4w9LQ2wLrKtOlm6w8MAFozeg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O8LMOz2m3Gjc7sUa1f8IuUfkVaI29od6nDqV64d8EjAKQv6sk7N6dZfeabz/q3+95
	 0iPKrUnpuCDbAVttVsKDPt27VgpvAXaPMhFQ5NahU3kmw9c8LRweGeTzuXdr9PMWo8
	 iocvOIFE09wf7sQvtmmg94rR44VlKDjahAS2QH0o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E608F80266;
	Tue, 21 Feb 2023 18:32:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89819F802DB; Tue, 21 Feb 2023 18:32:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADEE5F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 18:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADEE5F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ND6TD4YS
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LHHCpN001620;
	Tue, 21 Feb 2023 11:32:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=F5cvvJRatafBqTwx32dIEwFmS8aJ+gUQ6Rca0B7hmA8=;
 b=ND6TD4YSedTxkcfyGqz339oiV+f2E7arGN6xLhBlMgOZNbJI7Kqw4bO+eM4BHw2Bi3ls
 4HmqDkaSvLvyruoR9GSFq7appC/JU2cvfVev/oTd37TE6/acKxtDILVSUsBB5YYAZx5A
 mZ84GG+nkz8OXDwuJ4fymTdT+XqsmTDtnz3hWJDEdKZBI+eExSppX1WT4DhKv4gNaakd
 fvpwbssZl4BESqZnjLmftWPlCbz0wQBdsyHOnCYjEJDaYzOiIzoe6uWNoBM0Ckxg7tfE
 +ge82rkuSzqj36qVNCLmtqjmRuhUsl7/utC8VVK3J3G731pTF7H5xpfQaIveKOrZ3lgb Hw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nvmnqrxx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 11:32:39 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Tue, 21 Feb
 2023 11:32:38 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Tue, 21 Feb 2023 11:32:38 -0600
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 284A62A1;
	Tue, 21 Feb 2023 17:32:38 +0000 (UTC)
Message-ID: <f3d70939-49e5-1da2-c104-11b370888d7c@opensource.cirrus.com>
Date: Tue, 21 Feb 2023 17:32:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 09/10] ASoC: Intel: sof_sdw: Add support for Cirrus Logic
 CS35L56
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <broonie@kernel.org>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
 <20230217161410.915202-10-rf@opensource.cirrus.com>
 <dfebabad-4777-b5e3-8f58-1301faf97f7e@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <dfebabad-4777-b5e3-8f58-1301faf97f7e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P6t7Rne8EnBr7gnQsE8ZR_6kWCm8dPW7
X-Proofpoint-GUID: P6t7Rne8EnBr7gnQsE8ZR_6kWCm8dPW7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7R4FB6QWGO2OOHVZND6GOV4MRNHSJ5RV
X-Message-ID-Hash: 7R4FB6QWGO2OOHVZND6GOV4MRNHSJ5RV
X-MailFrom: prvs=74166771c0=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7R4FB6QWGO2OOHVZND6GOV4MRNHSJ5RV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/02/2023 16:49, Pierre-Louis Bossart wrote:
> 
>> +static int cs35l56_init_multiple(struct snd_soc_pcm_runtime *rtd, int count)
>> +{
>> +	struct snd_soc_card *card = rtd->card;
>> +	struct snd_soc_dai *codec_dai;
>> +	int i, ret;
>> +
>> +	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
>> +					  "%s hs:cs35l56",
> 
> the string is wrong here, this is an amplifier so it should be
> amp:cs35l56 or spk:cs36l56 (not sure which of the two we ended-up using).
> 

Will change it.

>> +					  card->components);
>> +	if (!card->components)
>> +		return -ENOMEM;
>> +
>> +	ret = snd_soc_dapm_new_controls(&card->dapm,
>> +					cs35l56_sof_widgets, ARRAY_SIZE(cs35l56_sof_widgets));
>> +	if (ret) {
>> +		dev_err(card->dev, "Widgets add failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l56_sof_map, count);
>> +	if (ret) {
>> +		dev_err(card->dev, "Map add %d failed: %d\n", count, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Enable one feedback TX per amp on different slots */
>> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 1 << i, 4, 16);
> 
> TDM slots? Not getting how this would work with SoundWire?
> 

Strictly speaking Soundwire is TDM (the frame time is divided up into
slots for each sample...).

The problem is if you have N amps on the dailink all feeding back audio
on the same bus. Their DP slots are all programmed to the same positions
in the frame, same as for the playback. So you have 4 amps all trying to
send 6 audio channels in the same positions in the frame and you'll just
get a ton of bus clash interrupts.

So we use the set_tdm_slot() like we do with I2S TDM to set which slots
are active for each amp.

I can't see that there's any obvious "generic" way that the manager code
can automatically figure out how many channels to enable on each amp and
what order to map them, so we do it here. Just as with I2S TDM - you
have many slots and many codecs but the machine driver has to tell it
how to map those.

>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
