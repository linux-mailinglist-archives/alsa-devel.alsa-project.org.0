Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4FF769A77
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:10:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9514583A;
	Mon, 31 Jul 2023 17:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9514583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690816229;
	bh=3DWYlpzm301gOtSJGIxQod832HmRfMtkgQEHQm1ZthI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BndfX1THDOXMZIUbUhnSoGRAkmEj1HKTPhJp1zIeCcHrwyCoa1T3NgcHqPMnYzQl0
	 tsgxI//4bhin1NrySmq8rOgBuoG+xYFpyp3KtmQ6/zDeMidBP711P+Pz15OH869s1k
	 nSyMtpy8nJgwIsX2L5VMGP+EB5D7EVuvsto85f5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27091F80557; Mon, 31 Jul 2023 17:09:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3814F80548;
	Mon, 31 Jul 2023 17:09:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D863F80549; Mon, 31 Jul 2023 17:09:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9522EF80544
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9522EF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=p//P01Wv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36VDp2Qn022362;
	Mon, 31 Jul 2023 10:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Sgj8HRPTlGuwo3T
	29LBXapIwqz/RNdE/KoELg/AckWM=; b=p//P01Wve+x7MDXRKwrlVP+x3O5ZtpM
	Cm3/dGEzFUVzG0gOPhIMRfxii7DsQB83EG5PNMuYreV2UCq7KgbPoP2vurk7NGXd
	vWGq8KzIieYK1aLEPh7FteUtCD10FT6bxA+zU91UemvWerdxVZZvCuBqe5JJPbce
	UJYmr2zx/5ESE43n4XXX6E4Be9Kb0dxQzmnFgAUs9o6AxCiMqS/Pwc8z+TsWEYJ0
	+S8myoiDcXyVet1RsPkpmLNVC6u75GJ2PUWF1OHEPke04OlnccIEt9pM+m2qvBRa
	bLmx8ijIwiqu+oDJa3O/L4LWTTc0aXkIN7X38hNsFt4oFvdPEeAq3NA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sbtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 10:08:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 16:08:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 16:08:40 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 81B1045D;
	Mon, 31 Jul 2023 15:08:40 +0000 (UTC)
Date: Mon, 31 Jul 2023 15:08:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: wm8960: Make automatic the default clocking
 mode
Message-ID: <20230731150840.GO103419@ediswmail.ad.cirrus.com>
References: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
 <20230731-asoc-wm8960-clk-v1-2-69f9ffa2b10a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731-asoc-wm8960-clk-v1-2-69f9ffa2b10a@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: jqdVLszwbwFFuOD7Q_qAbKMDhDYEhfA4
X-Proofpoint-ORIG-GUID: jqdVLszwbwFFuOD7Q_qAbKMDhDYEhfA4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ECI66Q7YXRETYPIBX3HUZ7PMVHRWXLP7
X-Message-ID-Hash: ECI66Q7YXRETYPIBX3HUZ7PMVHRWXLP7
X-MailFrom: prvs=3576316b2c=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECI66Q7YXRETYPIBX3HUZ7PMVHRWXLP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 11:47:03AM +0100, Mark Brown wrote:
> The wm8960 driver supports an automatic clocking mode which will use the
> MCLK directly where possible and fall back to the PLL if there is no
> suitable configuration directly using the MCLK.  Clock 0 will be used by
> the generic cards when configuring things, currently this is a MCLK only
> mode but using AUTO mode would be more functional.  Since the driver
> still prefers to use MCLK directly where possible there should be no
> negative impact on systems which are able to use MCLK directly.
> 
> As far as I can see nothing is using the system clock as part of the
> ABI, the only reference I can see to a mode in a machine driver is the
> Freescale i.MX card which uses the automatic mode with an explicit in
> kernel call using the constant so will be unaffected.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
