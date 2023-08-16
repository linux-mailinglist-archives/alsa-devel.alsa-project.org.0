Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CD77E74A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 19:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D3D207;
	Wed, 16 Aug 2023 19:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D3D207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692205875;
	bh=8Ow1Volm0+OOf7tMsVwapmxKzW7+QazLbVfQIP2L/ZU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbJePO3xo4D2Hlw30tim7QdAxnKE2Rlnj9DgkSfD5gx2rE6ufF+XhRFQMilQeD1b7
	 k6tS0lxt0upGrC3hBgKWQKuqgUgFZHdxS3BK7IRX58vNKL/HW10kPi/1VZnNBH5rXM
	 nIuGIKi/pVSXOJbqui4rbzKrbvgzPIGjl3phYWU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C04FF801EB; Wed, 16 Aug 2023 19:10:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0571EF8016A;
	Wed, 16 Aug 2023 19:10:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91A73F8016D; Wed, 16 Aug 2023 19:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD356F800D1
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 19:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD356F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=B7T396nG
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G5L6WC023417;
	Wed, 16 Aug 2023 12:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=k8FECQ69+aGbUYRS1sMlaMZF2LSEprEh6aORDIpMYDE=; b=
	B7T396nGMgUfrBrpw2IxC3nlxp4rF013Mbif+T4X6UT3OnnJjJ7yhz8s9ti7Kl97
	UbC/Bbie+jDZy0CNiVZh6Mlbq5NKStH58s39iUuG7DXtwG7pOc48cxMuOAi/8ArE
	64Ex26LHU2p8iqWm4bFL/bfbclP3RLvyrRsCC27j/w6MB9riu1pR3dxGTQrp1Eeo
	SLvm+Q1sIXumFHJ17qKIRb1nPHIyXyl2o+jprARO0h9V5yU28f1Ousx4UzwVUytm
	qXBQhiBY/AxO+o/n4C/cutIi1sFphztPcyOFtyYIWoj9hkXfPilktW1CneS7n52V
	vapFIelVsQKYHKUviFrQZw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3se8kqw9dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:09:55 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 16 Aug
 2023 18:09:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 16 Aug 2023 18:09:53 +0100
Received: from [198.61.65.68] (EDIN4L06LR3.ad.cirrus.com [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C31E53563;
	Wed, 16 Aug 2023 17:09:52 +0000 (UTC)
Message-ID: <b244708a-414e-1f56-61a0-7c183f8ff45e@opensource.cirrus.com>
Date: Wed, 16 Aug 2023 18:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] ASoC: cs35l56: Read firmware uuid from a device
 property instead of _SUB
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
References: <20230816164906.42-1-rf@opensource.cirrus.com>
 <20230816164906.42-3-rf@opensource.cirrus.com>
 <c3e42efc-9ddc-4788-85f7-cfa350d75d43@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c3e42efc-9ddc-4788-85f7-cfa350d75d43@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4vGE2lD6PzOIbC-5BV0ze471vjVGr2eN
X-Proofpoint-GUID: 4vGE2lD6PzOIbC-5BV0ze471vjVGr2eN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GUQC6GNTGRX5B7DGUHQMZ6CAZHFIZ6J2
X-Message-ID-Hash: GUQC6GNTGRX5B7DGUHQMZ6CAZHFIZ6J2
X-MailFrom: prvs=35925e949a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUQC6GNTGRX5B7DGUHQMZ6CAZHFIZ6J2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/8/23 18:03, Mark Brown wrote:
> On Wed, Aug 16, 2023 at 05:49:06PM +0100, Richard Fitzgerald wrote:
>> From: Maciej Strozek <mstrozek@opensource.cirrus.com>
>>
>> Use a device property "cirrus,firmware-uid" to get the unique firmware
>> identifier instead of using ACPI _SUB.
>>
>> There will not usually be a _SUB in Soundwire nodes. The ACPI can use a
>> _DSD section for custom properties.
>>
>> There is also a need to support instantiating this driver using software
>> nodes. This is for systems where the CS35L56 is a back-end device and the
>> ACPI refers only to the front-end audio device - there will not be any ACPI
>> references to CS35L56.
> 
> Are there any existing systems (or might there be given that the driver
> is in released kernels already) which rely on _SUB?

No. Nothing has been released with CS35L56.
