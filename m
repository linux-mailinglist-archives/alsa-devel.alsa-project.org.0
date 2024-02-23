Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C71228618B6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:03:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52465A4A;
	Fri, 23 Feb 2024 18:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52465A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708707793;
	bh=MLId+vpL1GJSYnk9r4V10bG6KRC9aNji3+0kQGieFqg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oS9LsTgrMEl4aeLdMNcsmzREieqG4DwhAKi3PezOpW7pROHqsaQVkyfwQQmjNL7c0
	 xLWK5w8/KgHD9wLw+YdZnfevImgpw2OSZn4P2hAwm3QuuOil0eDQYh0joiBVruf72P
	 i7tti7TYpvYMzY0zooz70FiWKCx2FYZINGB0IrSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E71DF80571; Fri, 23 Feb 2024 18:02:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEACF8058C;
	Fri, 23 Feb 2024 18:02:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 551D9F80496; Fri, 23 Feb 2024 18:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9964F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9964F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bWlCKrvA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6HREp027836;
	Fri, 23 Feb 2024 11:02:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=x/AtCItlvRqeTztsKy5EsHh5og0itw6wNDcPMUzLjho=; b=
	bWlCKrvAeBVO4Ssmi/QxqKGTXiqcqBTnYxBFp3Gb7KV51QPwLvmCu1Choq/DX837
	1gsatA9mcK2riPDaBdjbNdNoJwv4tD7mTeQZh0FeZ3vhWZQDpCbi7ciylpaNW2Le
	Tm0/hRthSKWXkTy//LaLAt6Qgpmb+FCNptV/+gFbwQELQXmviypneXUPWV5RW0DP
	dASxgw5iFWmHA+6CBEBbb6ejlpC0gFW0NpFy0+woJCD/qmigeNd8sffXxbEa8HRq
	AnboIH7irKiwAKU6aUPMlASwci6ttZ4TPG5J0W6ZOJ1gFFyC8OJC7xgAesjHyPar
	F2DHavGgqai6nSHlrYomKA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207mbqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 11:02:05 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 17:02:03 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 23 Feb 2024 17:02:03 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6F06F820243;
	Fri, 23 Feb 2024 17:02:03 +0000 (UTC)
Message-ID: <956f2b88-8b52-45b3-a27d-fa8e75a02642@opensource.cirrus.com>
Date: Fri, 23 Feb 2024 17:02:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: cs-amp-lib: Add KUnit test for calibration
 helpers
Content-Language: en-GB
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
 <20240223153910.2063698-7-rf@opensource.cirrus.com>
 <ZdjMIVYp7Qb/Tt9d@finisterre.sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ZdjMIVYp7Qb/Tt9d@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CnArif1KVPkqp-jNYyI0ptCu1_Z1L7YN
X-Proofpoint-ORIG-GUID: CnArif1KVPkqp-jNYyI0ptCu1_Z1L7YN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ROTEWBBEXSA53KQZ3CMX5G3BUWNHB7AV
X-Message-ID-Hash: ROTEWBBEXSA53KQZ3CMX5G3BUWNHB7AV
X-MailFrom: prvs=97835e8ec7=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROTEWBBEXSA53KQZ3CMX5G3BUWNHB7AV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/02/2024 16:47, Mark Brown wrote:
> On Fri, Feb 23, 2024 at 03:39:10PM +0000, Richard Fitzgerald wrote:
> 
>> +config SND_SOC_CS_AMP_LIB_TEST
>> +	tristate "KUnit test for Cirrus Logic cs-amp-lib"
>> +	depends on ACPI || COMPILE_TEST || KUNIT
> 
> Should this not depend unconditionally on KUNIT rather than KUNIT or
> some other stuff?  ie
> 
> 	depends on ACPI || COMPILE_TEST
> 	depends on KUNIT
> 
> or equivalent.
> 

Now I look at it again, it's not correct. It's the ACPI || COMPILE_TEST
that is bogus.

>> +#define TYPESAFE_ACTIVATE_STATIC_STUB_PTR(test, fn_ptr, replacement_fn)		\
>> +	do {									\
>> +		typecheck_fn(typeof(fn_ptr), replacement_fn);			\
>> +		__kunit_activate_static_stub(test, fn_ptr, replacement_fn);	\
>> +	} while (0)
> 
> Should this be somewhere more generic in the kunit headers?

Damn, I meant to change this. I did a patch a while ago to fix
kunit_activate_static_stub() so that it worked but it takes a really
long time for kunit patches to end up in the mainline kernel. Hence this
was a temporary workaround. I noticed my fix has gone in at last but I
forgot to remove this workaround.

Can you skip this patch and take the others (assuming you are happy with
them) and I'll fixup and resubmit this test later.
