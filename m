Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D3893970
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 11:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287D51939;
	Mon,  1 Apr 2024 11:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287D51939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711964134;
	bh=gOkdMufNrYUHI5wqynku6mgw73bfwiCTsJ3WOegpWGY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hWc5yr0Xa8Jfm58DsKxMdVMhEvMzr66BfsYXUxDE2DRP5u7RVPOqeyibuFRg1iyZU
	 2zTUHn3etUjBsvex9xTfo7oq9SXbqrgROft4oYD/C2a0q0PHGIy3x0Z+R+mVE6W6yl
	 jpVNyT41cs3Xd6YDkv+gFo8hEw+T3LliuOQwrRnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32759F8056F; Mon,  1 Apr 2024 11:35:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3FCFF8057D;
	Mon,  1 Apr 2024 11:35:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4132F80236; Mon,  1 Apr 2024 11:33:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A48C4F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 11:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48C4F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AE2aJNqg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4315ekd0020303;
	Mon, 1 Apr 2024 04:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=IS79sOATqoSucVXftmm3JIChsEbp2Y5YeWT6V7cQvMU=; b=
	AE2aJNqgxtLWDMIHbo9wr1d72n9q6S7IRl64ZV441sOYw6jDPwLh+9OkaL5m0+8g
	ei8qL+rPDCbbvvpbFYq5VkUlNjeg4o3OLFRRMuq5CPdmTGYM9/W6CB1ANhkHhf2e
	YR8eUF5qIVaYoEE1+2VCe1Oer5FIFDjEKRNoYbHLr1SzgflqjDSAmNCt/XCaWqYU
	qdCBCnfLC5OmTXPpHAAaGRKgot+LaLM7aVwC5xcLj5AOwnlJkfjc3m1kBCedCRYR
	dPyP28RhvEZS9Fqo3YtGyCM+CR+Mipkc3m0j1yQ/mAz+D6+Rdfd+048XXQ097Tfu
	piVA4+TOuoDy0q+SHNnFpg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x6g4xht6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 04:32:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Apr 2024
 10:32:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 1 Apr 2024 10:32:50 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EC522820243;
	Mon,  1 Apr 2024 09:32:49 +0000 (UTC)
Message-ID: <41d1aad9-2381-4d7b-b247-9d114c5c517f@opensource.cirrus.com>
Date: Mon, 1 Apr 2024 09:32:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ALSA: cirrus: Tidy up of firmware control read/write
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
 <87o7awnmdd.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87o7awnmdd.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x87jzAli0Me04_Yui-dnNvnewki0wu45
X-Proofpoint-GUID: x87jzAli0Me04_Yui-dnNvnewki0wu45
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TJCBSPOT5HAJJUUFVJ7ORZEC2DUYV52Y
X-Message-ID-Hash: TJCBSPOT5HAJJUUFVJ7ORZEC2DUYV52Y
X-MailFrom: prvs=1821bd3749=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJCBSPOT5HAJJUUFVJ7ORZEC2DUYV52Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/03/2024 08:40, Takashi Iwai wrote:
> On Mon, 25 Mar 2024 12:31:22 +0100,
> Richard Fitzgerald wrote:
>>
>> This set of patches factors out some repeated code to clean up
>> firmware control read/write functions, and removes some redundant
>> control notification code.
>>
>> Simon Trimmer (5):
>>    firmware: cs_dsp: Add locked wrappers for coeff read and write
>>    ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
>>    ALSA: hda: hda_cs_dsp_ctl: Use
>>      cs_dsp_coeff_lock_and_[read|write]_ctrl()
>>    ASoC: wm_adsp: Remove notification of driver write
>>    ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write
> 
> The patch 4 doesn't look cleanly applicable to my tree.
> Should it be applied via Mark's tree?
> 

Yes, it will need to go through Mark's tree.
Mark's for-next has one extra patch to wm_adsp.c that changes
the same function:

f193957b0fbb ("ASoC: wm_adsp: Fix missing mutex_lock in
wm_adsp_write_ctl()")

