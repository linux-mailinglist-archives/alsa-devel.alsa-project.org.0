Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4446CA0CB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 12:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3AF822;
	Mon, 27 Mar 2023 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3AF822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679911481;
	bh=osgDFVGVq3nwwj7hzxpm/QZMZhpDo3Hun1jpxMn5coI=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=TiMT0aUC1jtHTq/D6+ZOsOHUdfjVpW+GdgmhyVrxnIv6SiYc3gIqj/MM54o5qQ1kH
	 SwHIe2xTADHLXUaN9wI+zF7x7o43qEPjBxo8vVw8p77bc75Xn9tmLxwI/uXU3PwILg
	 rPhXfE3IbU19eq2MIvh2V67oZm8xxi+QOKbJOjnc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0107AF8024E;
	Mon, 27 Mar 2023 12:03:51 +0200 (CEST)
Date: Mon, 27 Mar 2023 10:03:30 +0000
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 0/1] Implement DMIC support in WM8903
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230327083316.GR68926@ediswmail.ad.cirrus.com>
 <CAPVz0n3F7pR8_duOd3-mq6iqNEYxDJ8-6AQL4M_8T5rDwbntoA@mail.gmail.com>
In-Reply-To: 
 <CAPVz0n3F7pR8_duOd3-mq6iqNEYxDJ8-6AQL4M_8T5rDwbntoA@mail.gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFWJXEU2KUKRHFSLZH3PIUMAOCYOQAWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167991142981.26.11564418215040030820@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06490F80272; Mon, 27 Mar 2023 12:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 934D5F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 12:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 934D5F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RyA9bYw7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R6L4HU025278;
	Mon, 27 Mar 2023 05:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=hDVVkwfrl6Lw5P4jl0Rrjg6tnYAS9dYc2acS1B6pL8I=;
 b=RyA9bYw7I2pezNdjUxf72vjlyGKAB1ZdsL9BaIlWXE4cwf5Cj+gERd8i91t/ZJZ6sSW/
 fDzqlZxjh7EUCrT4/nUoAzj/T2DqRvJDsUkzMIP5sd1bpOoVYE5bHox5CWXbXs5wJah9
 QsjumW7dCLMzhmbR5RSSu920rVWybbasDSMz2oGgagQUnxZkAXP9fKsSk8UFMGaQ7LuH
 gRS6cZQMbOpm4U5ZKY+XI5ovFklzlU0a5NVj/reL6g36/reKcO1gxylO0gGMOpe+uJ5l
 Ct0PPm+T9qo8VxqFwbsCj1bHjr66cLw/sih1v3jFPjiUewuFWABKwT9inkcNNauzh/7x mw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3phwcntft0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 05:03:32 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 27 Mar
 2023 05:03:30 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 05:03:30 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B46911D4;
	Mon, 27 Mar 2023 10:03:30 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:03:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 0/1] Implement DMIC support in WM8903
Message-ID: <20230327100330.GS68926@ediswmail.ad.cirrus.com>
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230327083316.GR68926@ediswmail.ad.cirrus.com>
 <CAPVz0n3F7pR8_duOd3-mq6iqNEYxDJ8-6AQL4M_8T5rDwbntoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAPVz0n3F7pR8_duOd3-mq6iqNEYxDJ8-6AQL4M_8T5rDwbntoA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 1HBif04sUwnWmlm4N0bFFFJcPVp5HZHm
X-Proofpoint-GUID: 1HBif04sUwnWmlm4N0bFFFJcPVp5HZHm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TFWJXEU2KUKRHFSLZH3PIUMAOCYOQAWD
X-Message-ID-Hash: TFWJXEU2KUKRHFSLZH3PIUMAOCYOQAWD
X-MailFrom: prvs=845006f82f=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFWJXEU2KUKRHFSLZH3PIUMAOCYOQAWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 27, 2023 at 11:38:10AM +0300, Svyatoslav Ryhel wrote:
> пн, 27 бер. 2023 р. о 11:33 Charles Keepax <ckeepax@opensource.cirrus.com> пише:
> >
> > On Sat, Mar 25, 2023 at 10:36:42AM +0200, Svyatoslav Ryhel wrote:
> > > According to comments in wm8903, driver lacks DMIC support.
> >
> > Which comments? I am having some difficulty finding these?
> >
> 
> Lines 10-12
> 
> * TODO:
> * - TDM mode configuration.
> * - Digital microphone support.
> 

Oops... thanks, I think that comment should have been removed
in this patch:

commit 97945c46a23d ("ASoC: WM8903: Implement DMIC support")

Thanks,
Charles
