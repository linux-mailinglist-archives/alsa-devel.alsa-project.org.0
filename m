Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C09B6CED1F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 17:39:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A471E9;
	Wed, 29 Mar 2023 17:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A471E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680104349;
	bh=ae3Gsf8ZZgEJQYRKRJ1T9OYlHkM7FTSpggnjr0/tnrw=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=bDFGjywFEVt+qgzE4+6/UThQcWpXAuzVom/0iokP9QNDTjePqsK46nSEck66o8n4K
	 6lgCMhNKPhs3sH7YfFf1UspXTC/6AtWIqofPB8koZdZL4ifSZFQtBGyoYUmMtRszWL
	 pGRQGgGPXHqmkqJBSL8lMwjsEG4303023+IE6I3s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C1AF8024E;
	Wed, 29 Mar 2023 17:38:19 +0200 (CEST)
Date: Wed, 29 Mar 2023 16:38:07 +0100
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
To: Jianhua Lu <lujianhua000@gmail.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
 <20230329140524.GU68926@ediswmail.ad.cirrus.com> <ZCRNRhI3+6jUbqvy@Gentoo>
In-Reply-To: <ZCRNRhI3+6jUbqvy@Gentoo>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSS2VPV4NUML36P4B2O6DWMFK67PZJ35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168010429890.26.8313999940354105292@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42267F80272; Wed, 29 Mar 2023 17:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39DA6F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39DA6F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ptz/49+K
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32T9DfOv021397;
	Wed, 29 Mar 2023 10:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=gquVTUvHedpHcdq5AeqiVp3y34dsTEeVrnOo0Yqlu7c=;
 b=ptz/49+KmM8VdXSGhmnQfUcyrszhHBjZslOfE4fVZyaBu0oGQk7/e/WBjbNX9r/eo9UN
 swETDuMBeM+2a5yU0vA3NdkDLbYBXyp2M12HNs9w6ISua/AOUzX1MuVEpe3hsxfGgoFH
 3FwZekUJc9bVBbeVpZZlfw+6rsh28HJVW9iKvZ9rQAhpJmv/kEVYigcDEkd3mnx7S6eV
 2LAbX1Hdf6RC6PpQzeDb4vrdXuJE5uq/X0gRA6VQ0Vee/Q75qieWX2IiHQUJGqKGs/NS
 mAwNv30FX0TtjLw1X/kRM/UEaIuesEUgndwnuWonp3/fBo4kAcRv7XCF9pKX/MGvy7cD iA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pmjghgk5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 10:38:09 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 29 Mar
 2023 10:38:08 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 10:38:08 -0500
Received: from [198.61.65.23] (EDIN4L06LR3.ad.cirrus.com [198.61.65.23])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07FE5B38;
	Wed, 29 Mar 2023 15:38:06 +0000 (UTC)
Message-ID: <51cdc8df-9472-a604-3cca-ebaa7ae5d899@opensource.cirrus.com>
Date: Wed, 29 Mar 2023 16:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
 <20230329140524.GU68926@ediswmail.ad.cirrus.com> <ZCRNRhI3+6jUbqvy@Gentoo>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ZCRNRhI3+6jUbqvy@Gentoo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oqzieBcBoMJu0JrbVmSUGjtJEtY2GhHN
X-Proofpoint-ORIG-GUID: oqzieBcBoMJu0JrbVmSUGjtJEtY2GhHN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WSS2VPV4NUML36P4B2O6DWMFK67PZJ35
X-Message-ID-Hash: WSS2VPV4NUML36P4B2O6DWMFK67PZJ35
X-MailFrom: prvs=9452efeff7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSS2VPV4NUML36P4B2O6DWMFK67PZJ35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/3/23 15:37, Jianhua Lu wrote:
> On Wed, Mar 29, 2023 at 02:05:24PM +0000, Charles Keepax wrote:
>>
>> This direction seems slightly problematic, especially in the
>> context of amps (which I presume this relates to, please let know
>> if that is wrong). It would probably be better to be fixing
>> things up such that the amp in question sets system_name when
>> registered through DT. Generally speaking the idea is the amp
> I also consider setting system_name when registered by DT, but I don't
> known setting what name to it. Card name or something else?

It just has to be a unique string.
The normal process is that Cirrus would release the firmware with the
correct name for the platform, so the system-name matches the string in
those release firmware files.

Do you have an official firmware for your platform?

>> tuning is going to be specific to the enclosure/speaker involved,
>> so a generic tuning for say left amps doesn't really make a lot
>> of sense.
> I don't known about amp tuning much, my need just is loading firmware for
> more than 1 speaker amp at the platform using fdt.
> 
> One of the both way is good to me.
>>
>> Thanks,
>> Charles
