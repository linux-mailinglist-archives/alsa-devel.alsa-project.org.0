Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EA700C5F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DE8BC0;
	Fri, 12 May 2023 17:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DE8BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683906928;
	bh=2GgGPprDbgdJXqpTg+9oZiZ/OC4EMYTmdjaEYb7NRso=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPu4kG5SVN01OjtxLlz1UvDQ4W8mJT2cMKOg9oMEg+jSmQV6ukF2069eF+fUAPYhj
	 ryYTCmUu2leMt5wzXDbIu8XybRselwhIAX9aJ5bev2zHRKLu9+dNNG5FHSrpThyu3I
	 YmOUIVnTk35T6+XY1IGunzgBB1TLMhII8Yg4VhKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F58F80544; Fri, 12 May 2023 17:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41546F8032D;
	Fri, 12 May 2023 17:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C613DF8052E; Fri, 12 May 2023 17:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42EDCF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42EDCF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NKySjRrw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C79ThA025224;
	Fri, 12 May 2023 10:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zl0ldLfzh9j85o71T2rHSTrpljoM4oRRhLiS/QXwhMs=;
 b=NKySjRrwLqm+/5pZx7vGGCkOW6LP3lhWkpqomELhGp1pzylYkI578P03FIcBTC+ZeRS1
 NRmi72qTXHrdr63vNtXxPNw730wk/zYARU+ZIb/D5GQiOOtqRPRZ4WMW3Ml4veIZcOxs
 Tbe1FluJ3PtPhGvsK+mKbiGNE945p+sDcdJCELogNoUc4NI34hQV/cPCTVBmdn6fW12u
 u1ZrN2UFq0X3lC4FiBdLISrnuClQXOGlv4/mESGDh878RlxdMDY9udHlYFENrYWlAcYr
 Rxc9rotgAUNWMVKsvh5Uj8GiFVohT6JQZRmfNxE5S+JP66h8FcQWDg6Etr1pbc9Jb/4j 6w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46p7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 10:54:28 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 10:54:26 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 10:54:26 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4FE3715A4;
	Fri, 12 May 2023 15:54:26 +0000 (UTC)
Date: Fri, 12 May 2023 15:54:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
Message-ID: <20230512155426.GJ68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <9591999e-9d7f-2a4a-29df-d9c42dfa736b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9591999e-9d7f-2a4a-29df-d9c42dfa736b@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: s1HRT0A_ILzyFaLSvekFY9YR-tkABoSi
X-Proofpoint-GUID: s1HRT0A_ILzyFaLSvekFY9YR-tkABoSi
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PYBFWZKNL7DT5BPNA653YSGDTIINQTHZ
X-Message-ID-Hash: PYBFWZKNL7DT5BPNA653YSGDTIINQTHZ
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYBFWZKNL7DT5BPNA653YSGDTIINQTHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 05:30:37PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2023 14:28, Charles Keepax wrote:
> > +	priv->gpio_chip.fwnode = dev_fwnode(cs42l43->dev);
> > +
> > +	if (is_of_node(dev_fwnode(cs42l43->dev))) {
> > +		device_set_node(priv->dev,
> > +				fwnode_get_named_child_node(dev_fwnode(cs42l43->dev),
> > +							    "pinctrl"));
> 
> That's something unusual. It seems you want to bind to a DT node because
> you miss compatible in DT node?
> 

Kinda, I don't really want to add multiple compatibles for the
device. This is just a CODEC device, even in device tree it
seems a little weird to have multiple compatibles for a single
I2C device. On ACPI I am pretty sure it would be considered flat
out right wrong. The fact Linux supports the device using multiple
drivers is seemed to be a Linux implementation detail, rather than
describing the hardware.

The original (internal) version of the patches just had a single
firmware node, but the DT schema would not verify because the
node is both a pinctrl node and a spi node. And the pinctrl
schema requires the node to be called "pinctrl" and the spi
requires it to be called "spi", it is impossible to satisfy both.

Any advice/guidance you had on this one would be greatly
appreciated?

> > +	} else {
> > +		device_set_node(priv->dev, dev_fwnode(cs42l43->dev));
> > +	}
> > +
> > +	pm_runtime_enable(priv->dev);
> > +	pm_runtime_idle(priv->dev);
> > +
> 
> > +MODULE_DESCRIPTION("CS42L43 Pinctrl Driver");
> > +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:cs42l43-pinctrl");
> 
> Same comment, so I guess you have this pattern everywhere.

Yeah this is not problem to fix up, I was just unaware using the
id_table was preferrable for MFD components, there are a lot of
devices doing it both ways.

Thanks,
Charles
