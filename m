Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677173355F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 18:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8985C82C;
	Fri, 16 Jun 2023 18:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8985C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686931393;
	bh=9ZuYQx5DjH9/5+pUBop8NU0EvDx6ZyqZ2A7pzKf5+nc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=inQfKBljIBqysBSvSs/aaEav/wFWDVP0no5RbAOppfpFTbKxCfZ+5ISopebR4BfX9
	 PZMq/f3BZP3VVk4srCqiUKhEvltwb5Xbmm5PleRlzzj/MjqdHwbKuax/QHoikD69WA
	 T7ccw17FS+84MMTUTNkpLNRCuw9iO2lCObpD0cT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA86CF80533; Fri, 16 Jun 2023 18:02:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C9F4F80132;
	Fri, 16 Jun 2023 18:02:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD5AAF80149; Fri, 16 Jun 2023 18:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EFA9F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 18:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFA9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Gh3KuXRD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GBVHcm018156;
	Fri, 16 Jun 2023 11:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=aM4qTlg66psxyt7MvUaMTfjlMOxNt1M83BDXPCVlrdE=;
 b=Gh3KuXRDek8q+xUxmtZtD1eBuOoymuBv7/v6TC3Q3rw9DjPFyFWQfxvt14FXP35N7ocU
 IJzdxdCW/niSf4ilGW4rwaXVqv8impUnXd41HsmIyLPn5/O+qevvEWZma6Qc8YUbULUg
 +2zO0FYvO7g3USZ4F4bnEjct8yrT/3exot0scjSqDSHq6bBzS+1MugdrLA/3ZjZZq0XI
 /vKqk/l8UENa4vl3YPGB80AG19ukpvTAoAjkCO6jKUI2Sd6+N1p7Qo/jr6HRCPDduKMt
 ETh9dJ+cdkEROG/CtJ44Mn1KG+2wSP9c8CHiZnK8XeY39bJKr0VG82wZPKhjNYH8rmCS uw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3r4pk0ejjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:01:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 16 Jun
 2023 17:01:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 16 Jun 2023 17:01:56 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEE3615A4;
	Fri, 16 Jun 2023 16:01:56 +0000 (UTC)
Date: Fri, 16 Jun 2023 16:01:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lee@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Message-ID: <20230616160156.GT68926@ediswmail.ad.cirrus.com>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-2-ckeepax@opensource.cirrus.com>
 <ZIuNXQIB3j6YjYa7@surfacebook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZIuNXQIB3j6YjYa7@surfacebook>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: g_ZbuS0378fNogebm1OeP16CyalPar6e
X-Proofpoint-GUID: g_ZbuS0378fNogebm1OeP16CyalPar6e
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WMMD6NXYVISGJEE3ASFR5UFBB4XKOCTY
X-Message-ID-Hash: WMMD6NXYVISGJEE3ASFR5UFBB4XKOCTY
X-MailFrom: prvs=1531175dad=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMMD6NXYVISGJEE3ASFR5UFBB4XKOCTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 16, 2023 at 01:14:53AM +0300, andy.shevchenko@gmail.com wrote:
> Mon, Jun 05, 2023 at 01:54:59PM +0100, Charles Keepax kirjoitti:
> > From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > +	bus->irq_chip.name = dev_name(bus->dev);
> > +	bus->domain = irq_domain_add_linear(NULL, SDW_MAX_DEVICES, &sdw_domain_ops, bus);
> 
> I'm wondering why you are not using existing fwnode, if any
> (e.g. from parent device).

I think that is just an oversight, I will fixup for the next
version.

Thanks,
Charles
