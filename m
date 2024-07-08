Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5792A58A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 17:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A94857;
	Mon,  8 Jul 2024 17:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A94857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720452207;
	bh=h2njFu7TIEqrPdpwvjFWiI7tGVMwAAs6ckdpT7Is0tg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XI7IcO6JJhXFl4Lo+ySWl9M5LDlysLgaAk3UEup7sCKyuJaGnsgeDfsSP9W36TBJT
	 tf/wYTr3rhDqZjAVqKIu2kdY95R9vBPbcBt5V9YgM9An8r5OdBTM8p4WaC3+PSY+av
	 Ptg2fwyvoT+1vGLSH22gZs2hribh7ftRQnJ6PNDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB67AF805B4; Mon,  8 Jul 2024 17:22:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3C68F80587;
	Mon,  8 Jul 2024 17:22:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E7AF801F5; Mon,  8 Jul 2024 17:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DD37F800FA
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 17:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD37F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NpY2jbAh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4687FtcM021773;
	Mon, 8 Jul 2024 10:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qkDw+gdhuVNaP7dtZkKOvbQQm2hXZrgeSjCzU4o42SM=; b=
	NpY2jbAhljbmxh+Whldsp/+pbGX/MngLOYpFAhyGttlgXu40dxAMTy4IVa4cnGgu
	Cy5lL2hG2sQdk3YWJ8cEfioYYAG+16kA6h5nEc2h1FSoAMnkqzonsmR7g8RgGBtV
	Sffe5OPIxW7vOgvzln9lMuTC2vkzKt4nVe+Cq5r917WyFzjRTq1fr40b/IFBTKTo
	V6vTJlRSv3T1P8CMh45hBD9Blyfe0mt+6SFapUotmUIQdmlGxHCDtYqcwpTdGHBp
	yR5jRBbTHoDHGD/oucGmLNLRzf3QqJ5z3nE7sCv0uF/+mLfw2yzL+jXlWndrs0Ou
	YBcKxclhZ1hiESAiehLAFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4072bj9ndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 10:22:47 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:22:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Jul 2024 16:22:46 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0CF91820244;
	Mon,  8 Jul 2024 15:22:46 +0000 (UTC)
Message-ID: <27d74268-53ff-4248-8d3d-71948ffcf68b@opensource.cirrus.com>
Date: Mon, 8 Jul 2024 16:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw
 files
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240708144855.385332-1-rf@opensource.cirrus.com>
 <de44f274-4e02-4c66-b784-41031e99c33e@opensource.cirrus.com>
 <91fc7cb3-6a00-4b3b-abed-a3a41b191912@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <91fc7cb3-6a00-4b3b-abed-a3a41b191912@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C5Xpfo28h2Z8MSXKe7cFaebQnU94j1ko
X-Proofpoint-GUID: C5Xpfo28h2Z8MSXKe7cFaebQnU94j1ko
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TFPZYV3IAH7YYUCZ4UHPJ7MCQIIMP4TK
X-Message-ID-Hash: TFPZYV3IAH7YYUCZ4UHPJ7MCQIIMP4TK
X-MailFrom: prvs=4919130c1b=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFPZYV3IAH7YYUCZ4UHPJ7MCQIIMP4TK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/07/2024 16:05, Mark Brown wrote:
> On Mon, Jul 08, 2024 at 04:00:07PM +0100, Richard Fitzgerald wrote:
> 
>> Don't take this. It applies to 6.11 but not to 6.10.
>> I'll try to sort out one that applies to new and old code, or
>> send separate 6.11 and backport versions.
> 
>> Sorry about that.
> 
> git seemed to be able to figure out the context for 6.10 (I apply
> everything with am -3).

Oh, I read this just after I'd sent a V2. You can ignore my V2 if you've
got it to apply (it's the same patch but with a couple of conflicting
lines dropped from the context)
