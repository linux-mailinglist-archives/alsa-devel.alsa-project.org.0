Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703325EF1DC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E45915DC;
	Thu, 29 Sep 2022 11:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E45915DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664443513;
	bh=PZQL3c1iET5TQBBPP47MtbbOmAshSwrNOSlBHz5G678=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUT3YmeHIUX8dzMglsGfAz4K1DT2QW5VGOoFjtsnosmwGXfNWuiIL87Q1mTwLsUvQ
	 1tcmjyiri8Xh/vKUSDr4/fLmLndMrjY0lmzOjM+KI+VBnl8wTkpeEiIfhYkkAIeKPM
	 HmUl8la/6m2vCFbf6O3xdnl+nC+Xz9br3+S6C3fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73283F803DD;
	Thu, 29 Sep 2022 11:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE11EF8023A; Thu, 29 Sep 2022 11:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 226D7F800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226D7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IwuYsUsF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T5hDdE019135;
 Thu, 29 Sep 2022 04:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3+eIESPhSfDOAhcMZBe90JtfuCUIc2I6FMg1htKHDso=;
 b=IwuYsUsFvcna3hu1YsNuAGe02VB1J8bgMKsvy7d5mjgzTb5op95aOB2TUruLRXMADK3G
 ePxIAdSwXMXxOGJt1Yq/YIfrIAa9kHt0lbcqeF27fruhgZtUsajPMxC8RXl5lM0geY93
 bzqy/w7f1Kvo7foR9T7SxcTuBTCNhvrh8tfhVlQ+K+9J7QwsYnzI2jYsjMLVRYrdEmMx
 7WlZH55m4Zl8NRtaw2HQkAgSvT4L9ns8KUIkPUydAWv2K3pY9DUj87F/y2FP8UXFyjwa
 atEwNrrJxBkDNyBkh6yxhXgoShO3iDUVKgVBQXgzA/YuSISv6WW7Ykm1oc2reBzC+Q3o tw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jsya2e0pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 04:24:05 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Thu, 29 Sep
 2022 04:24:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Thu, 29 Sep 2022 04:24:03 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B50973563;
 Thu, 29 Sep 2022 09:24:03 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:24:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
Subject: Re: wm8962 0-001a: ASoC: error at soc_component_read_no_lock on
 wm8962.0-001a: -16
Message-ID: <20220929092403.GU92394@ediswmail.ad.cirrus.com>
References: <MW5PR11MB57644C9D9797BB1F5B30B70795549@MW5PR11MB5764.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW5PR11MB57644C9D9797BB1F5B30B70795549@MW5PR11MB5764.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 1DUtl5DLHkTzgj4PUp7nnAeG_xc9n8He
X-Proofpoint-GUID: 1DUtl5DLHkTzgj4PUp7nnAeG_xc9n8He
X-Proofpoint-Spam-Reason: safe
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "steve@sk2.org" <steve@sk2.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "chi.minghao@zte.com.cn" <chi.minghao@zte.com.cn>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Sep 28, 2022 at 02:44:30AM +0000, Wang, Xiaolei wrote:
> Hi Jaroslav
> 
> When I tested the audio, I found that some registers in the
> codec of wm8962.c will fail to read in the mainline kernel. I
> found that wm8962_i2c_probe will enter runtime suspend after
> startup, but in the following program:
> 
> snd_soc_bind_card
>      snd_soc_dapm_new_widgets
>          soc_dapm_read
>              snd_soc_component_read(dapm->component, reg);
> 
> There is no runtime resume, which cannot perform normal
> reading and writing for volatile reg, because it has been
> switched to regcache only in the process of runtime suspend. I
> can't find the right place to resume, can you give me any
> advice?
> 

I think the first step would be could you clarify which register
is being read here? Reading a volatile register as part of
setting up the widgets does feel rather problematic.

Thanks,
Charles
