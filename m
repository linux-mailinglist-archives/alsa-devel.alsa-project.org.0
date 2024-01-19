Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98961832932
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EBC0741;
	Fri, 19 Jan 2024 12:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EBC0741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705665018;
	bh=s9L1qJwsp4OAkf5SryxRyzJmBumOjZ70oxKuHDq5NsA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HOZWEwlYrltRlbqnYgQgRnORhpj9hPtFZ7CtOiY50y8Wea/WUSiTpiK9mUNP1hYsZ
	 RtHFVuosjK4fq3N5aIjYsLU/86HPyFx+y5INXE3ZSy0SRCnltZLYMXYFeY3P/WTKxq
	 5sPTtGtADoB+tQ9kmWVzmytKhxPpH0gdSX7Qnyd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7025FF80568; Fri, 19 Jan 2024 12:49:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09825F8057D;
	Fri, 19 Jan 2024 12:49:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62FF4F801F5; Fri, 19 Jan 2024 12:49:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9745F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9745F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CNGj36zX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAUOEC006784;
	Fri, 19 Jan 2024 05:49:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=7HmR5LukPFENdAY
	Knf4Yvibno9UDj7vaugDLawgj4Rw=; b=CNGj36zXSShnUf0vSbvu+L4Eh3M/acH
	vAwqfSbGuDdUaflB+OkBh/clU8F511tKAI1vJh6BzZgs829EmjHjj9MrbiX25WmA
	pElomK/vEAgdm35tcl9wPHe4GDowVdLnomVz7IFUDeTym7GhnmqtOD4BMHgfZNjZ
	qEg7gJ74QX0AFICSLNW+0TIN1/K+4NdGsd58+HJbtfzlqpWFj/QkfzCDXyLcyGE2
	OSIssmpIUFzprG8q7ucyTVikkqXLQkpADlRA9xJUzoBE3SZuBoYVSgPDF4Zhi4IE
	tIhriXygpoP+JOOrYqZDVx9SFJ5XZDM/+yF9je+/ToXPQcIwHdAO2jw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vkqtn8ne8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 05:49:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 19 Jan
 2024 11:49:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 19 Jan 2024 11:49:17 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4C11A15B9;
	Fri, 19 Jan 2024 11:49:17 +0000 (UTC)
Date: Fri, 19 Jan 2024 11:49:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linus.walleij@linaro.org>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 5/6] spi: cs42l43: Add SPI controller support
Message-ID: <20240119114917.GB16899@ediswmail.ad.cirrus.com>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-6-ckeepax@opensource.cirrus.com>
 <ZalahZkCrBm-BXwz@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZalahZkCrBm-BXwz@surfacebook.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ohyvYjG1e8LtKWvMGVOYufhV_Sssc_Ns
X-Proofpoint-GUID: ohyvYjG1e8LtKWvMGVOYufhV_Sssc_Ns
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FMBSTZDDAXKUWC26OXOXC65V6UOWF6K2
X-Message-ID-Hash: FMBSTZDDAXKUWC26OXOXC65V6UOWF6K2
X-MailFrom: prvs=87486f32de=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMBSTZDDAXKUWC26OXOXC65V6UOWF6K2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 18, 2024 at 07:06:13PM +0200, andy.shevchenko@gmail.com wrote:
> Fri, Aug 04, 2023 at 11:46:01AM +0100, Charles Keepax kirjoitti:
> > +		while (buf < block) {
> > +			const u8 *word = min(buf + sizeof(u32), block);
> > +			int pad = (buf + sizeof(u32)) - word;
> > +
> > +			while (buf < word) {
> > +				val >>= BITS_PER_BYTE;
> > +				val |= FIELD_PREP(GENMASK(31, 24), *buf);
> > +
> > +				buf++;
> > +			}
> 
> Is this a reinvented way of get_unaligned_*() APIs?
> 
> > +			val >>= pad * BITS_PER_BYTE;
> > +
> > +			regmap_write(regmap, CS42L43_TX_DATA, val);
> > +		}
> 
> ...
> 
> > +			while (buf < word) {
> > +				*buf = FIELD_GET(GENMASK(7, 0), val);
> > +
> > +				val >>= BITS_PER_BYTE;
> > +				buf++;
> > +			}
> 
> put_unaligned_*() ?
> 

Alas as it has been a while I have forgetten the exact context
here and this one will take a little more time. I will try to
find some spare time to work out if that would actual do the same
thing, I have a vague feeling there was something here.

> ...
> 
> > +	if (is_of_node(fwnode))
> > +		fwnode = fwnode_get_named_child_node(fwnode, "spi");
> 
> You can actually drop these is_of_node() tests and use another variable. In
> ACPI there can't be child node in small letters.
> 

is_of_node feels pretty clear what the intent is, rather than
relying on nodes not existing etc.

> But main problem here (and in another driver where the similar is used) that
> you bumped reference count for fwnode. I haven't seen where you drop it back.
> Have you tested rmmod/modprobe in a loop?
> 

Yeah it should drop the reference will add that.

> > +	devm_pm_runtime_enable(priv->dev);
> 
> No error check? Why?

Happy to add one.

> > +	ret = devm_spi_register_controller(priv->dev, priv->ctlr);
> > +	if (ret) {
> > +		pm_runtime_disable(priv->dev);
> 
> Ah! Are you sure you properly simulated faults when testing this code?

This one has already been fixed.

Thanks,
Charles
