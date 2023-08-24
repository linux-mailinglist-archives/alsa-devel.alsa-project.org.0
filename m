Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31B786C11
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 11:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DF2845;
	Thu, 24 Aug 2023 11:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DF2845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692869678;
	bh=NfKMK29NTaMPO5N6uvEXV29RRM9fVEXRf98uOuEoX8M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LJKi5jDlaFEq+acE87Oq8YCqAEAxGSnsFxTMU+2IvmyMBXYTyiNwfveE+Kxe7m9zs
	 ABxbWO+5zzD7lUnECxAq0CBAvQuqNUCvC2FAwMOSVw0Mo44d8EQSLCoUjzgySDo0kb
	 Jst00psQWJSqbtFWhCkbR0XB96+XTUDE8gs/55oM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C3F9F80074; Thu, 24 Aug 2023 11:33:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C542DF800F5;
	Thu, 24 Aug 2023 11:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5867F80158; Thu, 24 Aug 2023 11:33:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DB8AF80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 11:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB8AF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Sr/2pF9o
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37O6ESXF003405;
	Thu, 24 Aug 2023 04:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=kWpJQzDGwAnlfgn
	+sTybVAJr4ABpT7SvjKUSqMojvI4=; b=Sr/2pF9oPs9sPzgX32ihC+lqkVYp9ET
	vzY17wJ1ReH8AEJz21Q6miuDKNoj0HA4BFEz3DRzZenLsDG3HCcyETWrnRyUwKxO
	dQZvp07dD6PlEwjyqQEagUoq4PRJIcIo7kxDb64XrDW8cFUlFh0c8aiIB7YPYATx
	W6f3K6uQb4EPy+CXHNj34WU0Mk/oD1u3/27UhL4IVQFAWUie2wjBonJ0kD2KHDOF
	Nc6+hFHHfQZ0H19z7MVb2W91reg9EdzZv+93ggtn2qnvH4aCcM8vt3OfBAO8KeEc
	1rDXEPielKhwDAY2Dbod2lsMRcjg5qORe6oWER9wUA+BFKtHWwdGfLA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sp1rbg5yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 04:33:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 24 Aug
 2023 10:33:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Thu, 24 Aug 2023 10:33:28 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 25B5A11CD;
	Thu, 24 Aug 2023 09:33:28 +0000 (UTC)
Date: Thu, 24 Aug 2023 09:33:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Message-ID: <20230824093328.GH103419@ediswmail.ad.cirrus.com>
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
 <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
 <20230823163935.GG103419@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823163935.GG103419@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ijve-2W7oAiZH0bdG5PFHwyFGejKWbU6
X-Proofpoint-GUID: ijve-2W7oAiZH0bdG5PFHwyFGejKWbU6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M65C74OSIDJCO6XC4GK5LQO5S56CXO3M
X-Message-ID-Hash: M65C74OSIDJCO6XC4GK5LQO5S56CXO3M
X-MailFrom: prvs=3600b2e858=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M65C74OSIDJCO6XC4GK5LQO5S56CXO3M/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 04:39:35PM +0000, Charles Keepax wrote:
> On Wed, Aug 23, 2023 at 05:19:31PM +0100, Mark Brown wrote:
> > On Wed, Aug 23, 2023 at 03:49:58PM +0000, Charles Keepax wrote:
> > > On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
> > > > Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
> > > > added an additional local params in __soc_pmc_hw_params, for the
> > > > CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
> > > > bytes) and keeping two local copies of it makes the stack frame for
> > > > __soc_pcm_hw_params really large. As the two copies are only used
> > > > sequentially combine these into a single local variable to shrink the
> > > > stack frame.
> > 
> > > Hmm... this might need a little more thought its not clear why this
> > > should change the frame size and it only seems to change the frame
> > > size on the ARM cross compiler I am using, not x86.
> > 
> > Isn't that just going to be a function of the compiler being smart
> > enough to work out that there aren't overlapping uses of the two
> > variables and they can share stack space?  There's no reason not to help
> > it figure that out.
> 
> Yeah I think my only concern here was I no longer was certain I
> understood what was happening. I don't think the patch can do any
> harm, well except for the names being slightly less clear in the
> code. It is starting to look like the mostly comes down to the
> compiler being smart enough, although both were GCC in my case
> so the difference is still a little surprising to me.
> 

Ah ok I see what is going on here, it depends on if you have
-Os or -O2 set. -O2 will merge the two variables and give a
smaller stack frame, -Os does not.

I would be inclined to say merge the patch, since it does help
if some is trying to size optimise their kernel, but I don't
feel strongly. Also I could respin to put this in the commit
message if people prefer?

Thanks,
Charles
