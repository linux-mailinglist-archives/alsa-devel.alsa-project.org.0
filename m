Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23C571FC38
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 10:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C1F20C;
	Fri,  2 Jun 2023 10:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C1F20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685695191;
	bh=s5EVH4S+f52mJ3zYCWnpPAoXxh33mCN2oAgx8yzlZzU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mRiyMrJqpTvxjiLGqHI257zHmi2rfik1KeZud0rRUbPtObA2HJdXx/emabK+Wj54m
	 fk50frQxN2X0EQNjzlaBiGsDE7ZHbHTFPn581XcmSQclIDXtvy6TeoDo7NKDY3C0gn
	 hmV3nSs3QtJ1VbwWob9i7GGySx24d55OjaQ+OH0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20F0BF80149; Fri,  2 Jun 2023 10:38:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2B5F80132;
	Fri,  2 Jun 2023 10:38:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5EEDF80149; Fri,  2 Jun 2023 10:38:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 35C41F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 10:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C41F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hZo2EPAH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35273kMd018220;
	Fri, 2 Jun 2023 03:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=gXsHwXIkqIMPI+sU77tOM2/Q0dJ8eT8YqESfqpSpNww=;
 b=hZo2EPAHqAvS4bLxSPIRXIKHFOF/bnglY6aTEYtUhpLFUbZoi4imV2Mipf/XwqwJ0uP7
 SJWKMUkNQPp9ZCfD/H0bParGBbagDNJSCMdsHos6X3skgDrOQoq5wDqENjNLR2wBRslg
 ZgBQHn4u1caoSDCgYkQ3vSHv9w4FkwmBnW38idiXaL1qHdMYnpsvZ24h+FTQ9ENmejPd
 dmb8pd47QMgCQ7H+4Yg9QkIqaOTeqXJKF7J1wGk18ni6ap69qNcRb/+AnhwbuAA13R5G
 xkBnO6IEFueqGcx1EpHNYc9wNl5xWBDAp4iN479/PTHbeN0xgAsivCLlaavERFBEcASL mQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90y5s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 03:38:12 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 2 Jun
 2023 09:38:10 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 09:38:10 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 57E8715A4;
	Fri,  2 Jun 2023 08:38:10 +0000 (UTC)
Date: Fri, 2 Jun 2023 08:38:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 4/4] soundwire: stream: Tidy do_bank_switch error messages
Message-ID: <20230602083810.GK68926@ediswmail.ad.cirrus.com>
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
 <20230601161622.1808135-4-ckeepax@opensource.cirrus.com>
 <4e90380f-b328-5806-4305-0a794cadc550@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4e90380f-b328-5806-4305-0a794cadc550@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8C9lHObPsMRu1WPHQ1nYgXrAnLxE34WY
X-Proofpoint-ORIG-GUID: 8C9lHObPsMRu1WPHQ1nYgXrAnLxE34WY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LLHKZ6KICOFTZ2PAO7GUYT7JZWJD7VUX
X-Message-ID-Hash: LLHKZ6KICOFTZ2PAO7GUYT7JZWJD7VUX
X-MailFrom: prvs=1517dd3c90=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLHKZ6KICOFTZ2PAO7GUYT7JZWJD7VUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 01, 2023 at 11:34:10AM -0500, Pierre-Louis Bossart wrote:
> On 6/1/23 11:16, Charles Keepax wrote:
> > Every error path in do_bank_switch prints an error message so there is no
> > need for the callers to also print error messages. Indeed in multi-master
> > cases these extra messages are confusing because they print out against a
> > random bus device whereas the do_bank_switch messages print against the bus
> > that actually failed.
> 
> Errm, what?
> 
> There is no way to know which bus failed in multi-master mode, and the
> 'stream' can span multiple buses so the use of pr_err was intentional.

Apologies this is the commit message not quite keeping pace with
the code base. Originally when I wrote the patch the error
message after do_bank_switch were a "dev_err(bus->dev", that was
then fixed up in commit d014688eb373 ("soundwire: stream: remove
bus->dev from logs on multiple buses").

> There's just no other way to report issues, and I don't see why one
> would remove such logs and fail silently.
> 
> I just don't get what you are trying to address.
>

The current code would say produce something like:

Bank switch failed: -5
_sdw_prepare_stream: do_bank_switch failed: -5

I am sensing you are keen to keep both error messages, so fair
enough I will drop that. Although worth noting originally before
that patch I mention above this would have been:

Bank switch failed: -5
do_bank_switch failed: -5

Which is really what I was attempting to address, that is clearly
redundant. Now with the addition of the function in the print I
guess it is slightly less redundant.

> > This also allows clean up of a couple of if's and variable initialisations
> > that were only there to silence potentially uninitialised variable
> > warnings on the bus variable.
> 
> That should be a separate patch IMHO.
> 

I will trim the patch down to leave the duplicate error messages
and just remove those bits.

Thanks,
Charles
