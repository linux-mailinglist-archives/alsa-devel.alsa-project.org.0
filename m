Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AD71FC3D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 10:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C56207;
	Fri,  2 Jun 2023 10:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C56207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685695290;
	bh=kWWbDmaNDYKkmbZIbYZWA0s/rYZpNtl0eZpJsh6DakE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kzx9MWEHpatJuNgKvnP6EbLj4kMi7e5DedLaFWDiwHP0mUz2WW/90wJMNYHutRneq
	 DszsRbq65DU4edbc8WGW4mC022l1Cs5bj+PwdIb3JhC50rEDKlsinPSMp+dsnplHE2
	 MZOHOe7yw1yn6zgqep+QRCKnOAo51Y8Z6FhsEoTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E06F800C1; Fri,  2 Jun 2023 10:40:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B57BBF80149;
	Fri,  2 Jun 2023 10:40:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22B2EF80149; Fri,  2 Jun 2023 10:40:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CFC6F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 10:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CFC6F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=X1TcL9ZZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3526wiZD012031;
	Fri, 2 Jun 2023 03:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=w1yToQ4xYtRWD93hY3+RgYhmhFxNDQN6QX6WBdFeg9I=;
 b=X1TcL9ZZ0xw6K+GbJHWrxLNu8ELMBgSBhbAWVuv6fHSzUnD/voJn4imIpTECK3O7fIW4
 pxGRNCUWYypgBFff0c3UelcawYusjMen+s4ph08Gc+vI83QfirjKDGMNTGhEkZEl9m9Q
 E582mEFDwfAH4WlGbf44yKxvTj1c+f4dDPYCZDfZv0L7HI7jwQ3YcgZo98MT1gNxVuKV
 V+jbIh1VXPLOq8eVyqINJMWsJXljbQHFijrwqPiQ4t1VXtf8PQtgZWRyZg2Y8rKfTDuo
 zUi6pMajVwSXNvWJKFjLfVajemQvHm353uLJe0UyWTaYlQ6Nf9TBfpIBwQ0tirP7Yqm0 KQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90y5tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 03:40:30 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 2 Jun
 2023 09:40:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 2 Jun 2023 09:40:28 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0573311AA;
	Fri,  2 Jun 2023 08:40:28 +0000 (UTC)
Date: Fri, 2 Jun 2023 08:40:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 3/4] soundwire: stream: Remove unnecessary gotos
Message-ID: <20230602084028.GL68926@ediswmail.ad.cirrus.com>
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
 <20230601161622.1808135-3-ckeepax@opensource.cirrus.com>
 <40d09b30-3323-f438-0f12-bc322ee389e9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <40d09b30-3323-f438-0f12-bc322ee389e9@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: sQvX313UjsnuWXd-PJKU6jNIu23NB9DA
X-Proofpoint-ORIG-GUID: sQvX313UjsnuWXd-PJKU6jNIu23NB9DA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NGALCIVTQHZKOUT5E26QUO77XFBOKAFO
X-Message-ID-Hash: NGALCIVTQHZKOUT5E26QUO77XFBOKAFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGALCIVTQHZKOUT5E26QUO77XFBOKAFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 01, 2023 at 11:37:33AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 6/1/23 11:16, Charles Keepax wrote:
> > There is a lot of code using gotos to skip small sections of code, this
> > is a fairly dubious use of a goto, especially when the level of
> > intentation is really low. Most of this code doesn't even breach 80
> > characters when naively shifted over.
> > 
> > Simplify the code a bit, by replacing these unnecessary gotos with
> > simple ifs.
> 
> it's probably ok but far from simple to review with the inverted states
> for variables. I don't have the time and energy to revisit this...
> 
> I would err on the side of if it ain't broke don't fix it here.
> 

The current code is pretty oddly written, as you say it does work
through. I will try splitting the patch into separate patches for
inverting the varible and dropping the goto's. That should make
review slightly easier and both changes make the code clearer in
their own right anyway.

Thanks,
Charles
