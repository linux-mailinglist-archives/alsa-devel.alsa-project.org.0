Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A901734F3F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 11:12:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6B783A;
	Mon, 19 Jun 2023 11:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6B783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687165938;
	bh=VcRWrPDfbH2b18l9Ztu99D67jFCBm/wwhGux0yb6a2Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TVdO8PIySQ+nxVI0ixtUfTLbETZxieIaxXZJ3dmJS6bbjORbEHllJknk2XW+Ivf25
	 MpDfwFQcegKlBZkX8RU6/hmEmwA4ceuOCkstkQ/lXIX0+9vmQYX1XOzmZcUsUDioca
	 T4wxqZCFkXS07G1+ndJJ7Gepb3jvyWl29Tnso3jw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B8DFF80301; Mon, 19 Jun 2023 11:11:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7EB5F80132;
	Mon, 19 Jun 2023 11:11:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACDC0F80217; Mon, 19 Jun 2023 11:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 951B3F80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 11:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951B3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ogSP1REF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35J5mUm5002763;
	Mon, 19 Jun 2023 04:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=5JH2u79XU9FJBiZZx7sz7hvI5PJVGOsuiD1Cda2B7+Q=;
 b=ogSP1REFwha/p5MoyXtk6djzYSizjnb5XoG/UTXcqMzLIJ1RO4fM6vz2X8rvr35wplCv
 19lg6w7mXd8juNLp/dvaplzDvq351QoqOkCQmO8rGZnSyGvJaQbDLoEXNO5LZ/8keR1Q
 wu+j7FV086RP5bxowLDtX4wlTuuajMGo7BZf4+IwtDL29IpPW+lacXfntP102f8By5vE
 IU0IIWkXoTZXrIocDqgBMq/jQPTKb1OffOp8hYoSjmDaUPOl1TcRVDkzPSZBNcSG5hrc
 gcudmalxuL4DzlP83GeQF5B5BsyY2JQT6VApdaQM4cMFRKorfyBOZwXfhz7m3PtsuFCz eg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r998mhsfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 04:11:02 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 19 Jun
 2023 10:11:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Jun 2023 10:11:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 84E4011AA;
	Mon, 19 Jun 2023 09:11:00 +0000 (UTC)
Date: Mon, 19 Jun 2023 09:11:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linus.walleij@linaro.org>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
        <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <20230619091100.GV68926@ediswmail.ad.cirrus.com>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-4-ckeepax@opensource.cirrus.com>
 <20230615171124.GL3635807@google.com>
 <20230616083404.GR68926@ediswmail.ad.cirrus.com>
 <20230619083005.GN3635807@google.com>
 <20230619085244.GU68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230619085244.GU68926@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: JbY1FYWJr3mYykaI4Vkm_JGdmIMtrazk
X-Proofpoint-ORIG-GUID: JbY1FYWJr3mYykaI4Vkm_JGdmIMtrazk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2IG2BR6WRULI4HPJHACU7GQFPS5NLQB5
X-Message-ID-Hash: 2IG2BR6WRULI4HPJHACU7GQFPS5NLQB5
X-MailFrom: prvs=153447c1f4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IG2BR6WRULI4HPJHACU7GQFPS5NLQB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 19, 2023 at 08:52:44AM +0000, Charles Keepax wrote:
> On Mon, Jun 19, 2023 at 09:30:05AM +0100, Lee Jones wrote:
> > On Fri, 16 Jun 2023, Charles Keepax wrote:
> > > On Thu, Jun 15, 2023 at 06:11:24PM +0100, Lee Jones wrote:
> > > > On Mon, 05 Jun 2023, Charles Keepax wrote:
> > Can you have a little think for another way to solve this please?
> > 
> 
> I will have another go at it, if memory serves the vague options
> were:
> 
> 1) this approach
> 2) some sort of horrible #include to put the defaults array in
> both modules, although I would really prefer to avoid this one.
> 3) dynamically allocate the regmap_configs so those two fields
> can be filled in with non-static data.
> 
> If I fail to come up with an option 4 would you prefer 1 or 3?
> Well or 2 but I really would prefer not to do 2.
> 

Well or just leave both in actually I guess perhaps that is
simplest.

Thanks,
Charles
