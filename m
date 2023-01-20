Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D2675490
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 13:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E47531F1;
	Fri, 20 Jan 2023 13:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E47531F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674217982;
	bh=qHlpnuZc/1TU4LoeJdx4/XW/ITx0Lff/PERzrx3Vhk8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DlcFVNvqVNsJZUUBi8H4qhJtQ2xqhdVWStcR8sijcLeUi1seFEnpUNJLTJolgb9jS
	 91ZjnOR1IMII+LHqtiCKFAbonMOxQHObPPHpBkQ/IP9RJ/gH+4QSQzLFhg3YlavB2a
	 wz4phKRBD/eZTPTyZl/B25exi+cYgJjjgfnaViJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55113F800F0;
	Fri, 20 Jan 2023 13:32:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5AC1F8024D; Fri, 20 Jan 2023 13:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A2E5F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 13:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A2E5F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Om3QHFd7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KBhexR013434; Fri, 20 Jan 2023 06:31:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=ISvx4QPRI255I7DbCcL2cdTfvRFtbsUPzekrvWHQ+0k=;
 b=Om3QHFd7YBZM5pgGz0DkO728Rxk972BYum+K1mr7NtM7gtKqPLiEz/XC7mwLPZCQ+9Ni
 8JTJwpQHfEJ5u1qteezgPotZK6Fq4kE75AW/BJEriCCtZvLceTy6Uvax+g3Hel08UCPR
 EcG70RN/2r2pgGnuH7vuAAa7iAowQXzGfgbteasMEAKPhlSgthukS8A1CeXzkpM7HjlM
 f0Ba1PNRPS8/PBLDNsiLJCMJPoQmP0ZmF3gX/ThmrQdBqJA9wm5PAetE33zHXGlQwW3x
 fsZKIrvm4UTLhODdmbZqBksMXeXlcMwfIY5NFlzOqvfAdBXhR9x9d7svW8JkZ9dUtOom 8g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3n3tp6hwt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 06:31:55 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 20 Jan
 2023 06:31:53 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Fri, 20 Jan 2023 06:31:53 -0600
Received: from [198.61.64.248] (EDIN4L06LR3.ad.cirrus.com [198.61.64.248])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3F6562A1;
 Fri, 20 Jan 2023 12:31:53 +0000 (UTC)
Message-ID: <a082e0c9-64de-3e27-5889-0207944aac85@opensource.cirrus.com>
Date: Fri, 20 Jan 2023 12:31:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] ASoC: cs42l42: Add Soundwire support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-7-sbinding@opensource.cirrus.com>
 <33130336-b2ce-330e-fdec-166eee977e13@linux.intel.com>
 <418f6b73-b5ac-8d87-a856-3413ec103f91@opensource.cirrus.com>
 <6ea1b85f-22e2-8744-9638-6321a5a21acf@linux.intel.com>
 <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
 <c45d34ba-1aee-16aa-1ccf-79c43c8c4ed4@linux.intel.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c45d34ba-1aee-16aa-1ccf-79c43c8c4ed4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wxr_x9Qw8jM7HfxAM-NY7ZLJPgiRK8ao
X-Proofpoint-GUID: wxr_x9Qw8jM7HfxAM-NY7ZLJPgiRK8ao
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 19/1/23 16:27, Pierre-Louis Bossart wrote:
> 
>>> You lost me here. Are you saying the soundwire bus clock is only known
>>> in the prepare stage?
>>>
>>
>> hw_params() doesn't know the Soundwire bus clock so it can't do the
>> check. We need to wait until we have both the sample rate and the
>> chosen SWIRE_CLK.
> 
> Yes, makes sense. I forgot that all the stream management and bandwidth
> allocation takes place in the prepare stage at the dailink level, and
> the dai prepare happens after that. Thanks for the clarification.

Also, this isn't validating the params passed by the application.
The application cannot pass us "bad" params that would cause pll_config
to fail.

The only way the pll_config could fail is if the SoundWire core code
chose a SWIRE_CLK that CS42L42 cannot support. This should never happen
and if it does it means there's an error in the ACPI or the machine
driver.
