Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBC8B98AA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 12:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262D9E80;
	Thu,  2 May 2024 12:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262D9E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714645123;
	bh=sbIV7C29RJ+T1lX+E8sZCLiaBYd2zk0Nq7Q0l2njHYc=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tac/Fwl8Pe28a40pqIiCMPe2oe3IbyvXLzcH6//9eRcGENbutHciqJrSWwsHxhCJ1
	 u3HKL8I+R/v1oU6BZT9XOHUd+t24ksTK1HtF+L0Aq1n9Q1/uBKcD3ueGm+WAWM8FHG
	 j3B2BMoAOptqc48lpocWE3N3cDR/rDwYsWSFbPS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 948E5F805A0; Thu,  2 May 2024 12:18:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3C1F8057F;
	Thu,  2 May 2024 12:18:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10776F8028D; Thu,  2 May 2024 12:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6212F8025D
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 12:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6212F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EE2eePhF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4426QJF9029883;
	Thu, 2 May 2024 05:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=JdCKGuzvpPEqIMdCQbeQSVDZQ5P0ciLsz3huW76jYp8=; b=
	EE2eePhFPzsI7/YYwR5McN4859a9PNTQSg9lbQsFwtzusPmyb/B93xdyjYka+m9D
	Rh4rZpxJW6mwC+QACdnwDHdSjIqKeTGLsh0+zjlAi6q5eGhyi1dWBLN6lbDZ8aD1
	3U6Blx67/CVKVc0YOP/2W4oJU0+VPqAAAWn7P7EdMSTaJM4QlvIl8lf49H0TEf85
	4ZtwdNOKYcPK8UvtNyKE62Rz1rREPEI3vLs5EzqhBy5xB26FqKr4K5hR69tL46p+
	F8RF6tAP2qLpjo8cfNnTLcuhA4z/KPWJSBxxWVSbnGg1y2RaKO6vOuMkEvcSq1kq
	BmkiNk50xLSJmCnpYakrwQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xv0e8gaw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 05:17:50 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 11:17:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 2 May 2024 11:17:48 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.64.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5FC71820244;
	Thu,  2 May 2024 10:17:48 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Takashi Iwai' <tiwai@suse.de>,
        'Richard Fitzgerald'
	<rf@opensource.cirrus.com>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240501111755.21231-1-simont@opensource.cirrus.com>
	<87ttjgk6ph.wl-tiwai@suse.de>
	<a9345d24-af36-42b4-9139-0701a0dbe1a3@opensource.cirrus.com>
 <87h6fgk0ba.wl-tiwai@suse.de>
In-Reply-To: <87h6fgk0ba.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
 background
Date: Thu, 2 May 2024 11:17:48 +0100
Message-ID: <001401da9c79$fb9f2de0$f2dd89a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQBvb2ocE+GAzujRRIysQCID0b/eEwD72286AkBBwPkCXIFon7QtT9tg
X-Proofpoint-ORIG-GUID: 5tfCnV5rEW5f9pYu0v8QANcb2UyW5qKv
X-Proofpoint-GUID: 5tfCnV5rEW5f9pYu0v8QANcb2UyW5qKv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QL65EQJ3G65WLVIJWVSWOUUE5SGCM37U
X-Message-ID-Hash: QL65EQJ3G65WLVIJWVSWOUUE5SGCM37U
X-MailFrom: prvs=2852a4bc4b=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL65EQJ3G65WLVIJWVSWOUUE5SGCM37U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, May 2, 2024 10:53 AM
> To: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Simon Trimmer <simont@opensource.cirrus.com>; tiwai@suse.com; linux-
> sound@vger.kernel.org; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; patches@opensource.cirrus.com
> Subject: Re: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
> background
> 
> On Thu, 02 May 2024 11:21:36 +0200,
> Richard Fitzgerald wrote:
> >
> > On 02/05/2024 08:34, Takashi Iwai wrote:
> > > On Wed, 01 May 2024 13:17:55 +0200,
> > > Simon Trimmer wrote:
> > >> @@ -964,6 +1011,14 @@ int cs35l56_hda_common_probe(struct
> cs35l56_hda *cs35l56, int hid, int id)
> > >>   	mutex_init(&cs35l56->base.irq_lock);
> > >>   	dev_set_drvdata(cs35l56->base.dev, cs35l56);
> > >>   +	cs35l56->dsp_wq =
> > >> create_singlethread_workqueue("cs35l56-dsp");
> > >> +	if (!cs35l56->dsp_wq) {
> > >> +		ret = -ENOMEM;
> > >> +		goto err;
> > >> +	}
> > >
> > > Do we really need a dedicated workqueue?  In most usages, simple
> > > schedule_work*() works fine and is recommended.
> > >
> >
> > On a slow I2C bus with 4 amps this work could take over 2 seconds.
> > That seems too long to be blocking a global system queue. We use a
> > dedicated queue in the ASoC driver.
> >
> > Also if we queue work on an ordered (single-threaded) system queue the
> > firmware won't be downloaded to multiple amps in parallel, so we don't
> > get the best use of the available bus bandwidth.
> 
> OK, that sounds like a sensible argument.
> 
> But the patch has no call of a queue destructor.  Won't it leak
> resources?

Oops that's a good spot - I missed that and will send a v2

Cheers,
-Simon

