Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475C83DDE8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 16:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7732F828;
	Fri, 26 Jan 2024 16:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7732F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706283945;
	bh=fqIG2jDZoTw9TE78+cnz0OxfSJ1D3qd3x/zWVd40lg4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gba18ATE1OJlA1JE65o2JAZ8KdGxRP6TsqXOZL/iOVzCV5riTJsV2mZhVMCt5H2QL
	 MvK7r7CZK5L0TEPeJ8s4Y0ysUF4eI2f2Z+wM9h/ALlJAAlmhc8M3vGr17+CpP08EhZ
	 T1mFLYiSMwIPiYtcEVJA6JymrXmEd0rEW5W0mh3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BBAF804F1; Fri, 26 Jan 2024 16:45:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F248BF80494;
	Fri, 26 Jan 2024 16:45:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F01F8028D; Fri, 26 Jan 2024 16:45:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DD62F800C1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 16:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD62F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ri8PJyjD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QAV94J011624;
	Fri, 26 Jan 2024 09:44:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=sTeLXv2n33njXj2pPXt/tcA9jUcN2EMferdUpNRom0c=; b=
	Ri8PJyjDWJtzg8CIzUcE0ikkQ1nqkbryUAHzfBf0llpykpe3ffSObCi+gVCBOvv6
	n4KEx4iA0veIgB0pKnPg46QOiXPpwp1sdzc8m6UXNWkWqlbI8G1t1Eon0Ty03z8i
	hV/AbhvL3gRKHCue5Dz3gOZUG8TEW6KPql4/3dkWH0fMEFFOsMlwlUy2tuHx4pR1
	1CHiHlvft8jpmqFbZun/9s4Ozy2otCZzE9zEBJf+4/kyPZEs5yESvpldsHurtgsj
	RPihom5z4+IZrHmXJIL1N6CbER9KTUBSsyxLdmrMujcbFLmd8hplYX0AjOZEeP38
	r8EtDkU9GnWU6VB5tJW4XQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhm3ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 09:44:51 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 15:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 26 Jan 2024 15:44:49 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 060D6820246;
	Fri, 26 Jan 2024 15:44:49 +0000 (UTC)
Message-ID: <0d2aee4d-edc4-4e6e-99c3-d548eb6d6e18@opensource.cirrus.com>
Date: Fri, 26 Jan 2024 15:44:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Support HP Models without _DSD
To: Takashi Iwai <tiwai@suse.de>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240126113007.4084-1-sbinding@opensource.cirrus.com>
 <87wmrwnn2n.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87wmrwnn2n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0A87Bz0BkaY1TQM-BuRqLl5iY_Dge84p
X-Proofpoint-GUID: 0A87Bz0BkaY1TQM-BuRqLl5iY_Dge84p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U5JS3JQW6TUJX5NKGR5VMRMZDEUCBVLG
X-Message-ID-Hash: U5JS3JQW6TUJX5NKGR5VMRMZDEUCBVLG
X-MailFrom: prvs=8755be56ea=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5JS3JQW6TUJX5NKGR5VMRMZDEUCBVLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/01/2024 15:14, Takashi Iwai wrote:
> On Fri, 26 Jan 2024 12:30:03 +0100,
> Stefan Binding wrote:
>>
>> Add Quirks and driver properties for Dell models.
>> Driver properties are required since these models do not have _DSD.
>> Some models require special handing for Speaker ID and cannot use
>> the configuration table to add properties.
>> Also fix an issue for Channel Index property, when set through the
>> configuration table, to use the same method as when loading _DSD
>> properties. This is needed for laptops with 4 amps where the
>> channels do not alternate.
>>
>> Stefan Binding (4):
>>    ALSA: hda: cs35l41: Set Channel Index correctly when system is missing
>>      _DSD
>>    ALSA: hda: cs35l41: Support additional HP Envy Models
>>    ALSA: hda: cs35l41: Support HP models without _DSD using dual Speaker
>>      ID
>>    ALSA: hda/realtek: Add quirks for various HP ENVY models
> 
> The last one conflicts with the latest for-next branch due to the
> recent change from Cirrus.  Could you rebase and resubmit?
> 

Yes, sorry. That's my fault for not syncing up with Stefan before
sending the other patch.

