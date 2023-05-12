Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05758700C14
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41EAA4A;
	Fri, 12 May 2023 17:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41EAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683906036;
	bh=R594R7oTndWc+KHSK/mX1M5ppr3xIDoPTwy/mSiiffI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kYHXxiAiXSFdEQ2oLxMx8DiQmVCW09VpP1JwxcjkyvZEioK/OOFcmeu7bPY8DU95a
	 v2SmWdp2b/2j/1b0zz6E1xCe2XF8Rn+hOa1h5FZomurlUcJP5+Cg6C37w31PiA+wBH
	 GLGkemZMZBIAuESfeC50nNLhILfbuttrnfIzB+oA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 066B9F8053B; Fri, 12 May 2023 17:39:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2ACAF8032D;
	Fri, 12 May 2023 17:39:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E2FF8052E; Fri, 12 May 2023 17:39:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DD1D8F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD1D8F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VSxTmOPc
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C6NKCQ025572;
	Fri, 12 May 2023 10:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=i5XbaR6wPdyxlh8zyx4WloWXpUoR+C3CRfciBVzIAAs=;
 b=VSxTmOPcZi9NcVqInr/kQHhQNIfMCF5QHmB7Bw4nEUiK3PO6hqACcA24VWAhEQ5ckCvJ
 vVNoBw37XGbK8DS4HlUw4yn2BRIFQyzuaz1rwkLPGmo9nQQ72hXYfWPyNDOt4HfKme/D
 DocpJebHyGViChYywafHWk+GUqefttUFxHLhk5wWOeJx7gDWZnZJ+vkM8f4wY32KulJL
 AJscRRATFbQCGt1BPTa/gVfvBKfsqsKQkM4fREpmyuWmSlotJlOhl7j5XvWEEDq8MvDq
 T6o+UxzKU8UrhUDBha2nH+jZeSiUjxB8wNx/+058aymOUmtBOMfNYphvI99Li7qt+sfe FA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46nht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 10:39:35 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 10:39:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 12 May 2023 10:39:34 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E5FEB45;
	Fri, 12 May 2023 15:39:33 +0000 (UTC)
Date: Fri, 12 May 2023 15:39:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marc Zyngier <maz@kernel.org>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <linus.walleij@linaro.org>, <vkoul@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <20230512153933.GH68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86o7mpmvqq.wl-maz@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: sT1b3PRdlU9aj0kIsAk1JOooHdKdtXIK
X-Proofpoint-GUID: sT1b3PRdlU9aj0kIsAk1JOooHdKdtXIK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZPU6NNIXN5XQNTGJG2JIPDBQOFNVC7VV
X-Message-ID-Hash: ZPU6NNIXN5XQNTGJG2JIPDBQOFNVC7VV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPU6NNIXN5XQNTGJG2JIPDBQOFNVC7VV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 04:10:05PM +0100, Marc Zyngier wrote:
> On Fri, 12 May 2023 13:28:35 +0100,
> Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > 
> > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > for portable applications. It provides a high dynamic range, stereo
> > DAC for headphone output, two integrated Class D amplifiers for
> > loudspeakers, and two ADCs for wired headset microphone input or
> > stereo line input. PDM inputs are provided for digital microphones.
> > 
> > The IRQ chip provides IRQ functionality both to other parts of the
> > cs42l43 device and to external devices that wish to use its IRQs.
> 
> Sorry, but this isn't much of an interrupt controller driver. A modern
> interrupt controller driver is firmware-driven (DT or ACPI, pick your
> poison), uses irq domains, and uses the irqchip API.
> 

Apologies but I really need a little help clarifying the issues
here. I am totally happy to fix things up but might need a couple
pointers.

1) uses the irqchip API / uses irq domains

The driver does use both the irqchip API and domains, what
part of the IRQ API are we not using that we should be?

The driver registers an irq domain using
irq_domain_create_linear.  It requests its parent IRQ using
request_threaded_irq. It passes IRQs onto the devices requesting
IRQs from it using handle_nested_irq and irq_find_mapping.

Is the objection here that regmap is making these calls for us,
rather than them being hard coded into this driver?

2) driver is firmware-driven (DT or ACPI, pick your poison)

The irq chip has representation in firmware, in fact we have
tested this on both ACPI and DT. Other devices can request
IRQs from it through firmware, same as they can for any other
IRQ chip.

Is the objection here the table mapping the register fields that
are provided as an IRQ on the device?

Thanks kindly for your review and help,
Charles
