Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7C717A7B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 10:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A303206;
	Wed, 31 May 2023 10:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A303206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685522732;
	bh=uSZTQR21tFdhqB75t5iObKBLnbtw7huc1oUqbhTxFdE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p37d+RAEBKBO6vFV7uX9E9Fwj3XQIWTXgV9WnlgjGw9HAmLuHV1mMK+HPEthYJtBD
	 d2/fEIMEzhjjb/i9VwxwR+4bNPeej1amWTUQEpT3LnKv3FE/QKOnvVP/GqgzOz+8Hh
	 7vpwGcRJ38YbNf3ItyLgt2okCQt7jy48pSGc9Khg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27B20F8026A; Wed, 31 May 2023 10:44:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA07BF8026A;
	Wed, 31 May 2023 10:44:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3AC3F8042F; Wed, 31 May 2023 10:44:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6598F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 10:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6598F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Tq2BGP/E
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V8FgUk001519;
	Wed, 31 May 2023 03:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=vJJUQXuP1zJPj3ce0A9Wr6NYnYeBp+whmXdzJL+iqvE=;
 b=Tq2BGP/EtFPwlJticgRSv7MW+TGJEG7Q2x5c1/K1jq5eAWwDL9sEGOtUh0CjRCwYZQIc
 ZxauFkDT2zNBtTLhcNK2PLTSnlqXOLHnB6cl5/QFDhs9MXUvLaVED4AJfhuiTWEodkyY
 A3PRSJIJ3OewTA2IqRbmKSbkNnIsZTCPi6oimHjiiwL2VXfsamIpFdSG22Ajij6ET/4J
 C2d5GrUhYn+CGEx1M071xT3ZxRJMxsJnjzBL8IAQ61MdS7ZO4qPf6qnh62w+Y0BcUro8
 1sqXF1PXkNbs/+bx3eJrR+b3M5YYgJQ+yJt9FUgj+//+mjTfqnKbA0SnmDywbXQUoygS 7Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90v70y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 03:44:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 31 May
 2023 09:44:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 31 May 2023 09:44:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E867B468;
	Wed, 31 May 2023 08:44:28 +0000 (UTC)
Date: Wed, 31 May 2023 08:44:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lee@kernel.org"
	<lee@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "sanyog.r.kale@intel.com" <sanyog.r.kale@intel.com>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH v2 5/6] spi: cs42l43: Add SPI controller support
Message-ID: <20230531084428.GG68926@ediswmail.ad.cirrus.com>
References: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
 <20230530122112.1314458-6-ckeepax@opensource.cirrus.com>
 <BN7PR12MB28024FF756EFAE44E1713FBDDC489@BN7PR12MB2802.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <BN7PR12MB28024FF756EFAE44E1713FBDDC489@BN7PR12MB2802.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LiPE974ipEMDMTzP39xGZ1i43uYQChdU
X-Proofpoint-ORIG-GUID: LiPE974ipEMDMTzP39xGZ1i43uYQChdU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NWQZ4LP23HEM3UT7EIW5E3GWVUOTHM7E
X-Message-ID-Hash: NWQZ4LP23HEM3UT7EIW5E3GWVUOTHM7E
X-MailFrom: prvs=151547ecba=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWQZ4LP23HEM3UT7EIW5E3GWVUOTHM7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 31, 2023 at 05:26:46AM +0000, Mahapatra, Amit Kumar wrote:
> > +       if (spi->chip_select == 0)
> 
> New set/get APIs for accessing spi->chip_select were introduced by
> https://github.com/torvalds/linux/commit/303feb3cc06ac0665d0ee9c1414941200e60e8a3
> please use these APIs instead of accessing spi->chip_select directly.
> 
> > +       /* select another internal CS, which doesn't exist, so CS 0 is not used */
> > +       if (spi->cs_gpiod)
> 
> Same here for spi->cs_gpio
> 

Thanks, I will get these fixed up for v3.

Thanks,
Charles
