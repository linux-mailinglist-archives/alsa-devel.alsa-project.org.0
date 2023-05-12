Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB1700D35
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A758DEF;
	Fri, 12 May 2023 18:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A758DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683909818;
	bh=j0HkD/gwk8BhLqwJwBVRBPKua9Kqw6Skf6SumRU1BYU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HO5i8IEPCNY4NrPZuCHHwB+5A5xm5s2ewPg+DqdxVPdjLlKEYy8eesAuX+s5O9kpQ
	 8IQ23CdmdZipT4aEE0nnnnelqEHB9a8JceNVjrPi/0oFaB+dy/sLtBHNiju84zGHkg
	 KJgpH2kSBYDY4M+OvFFMjGxgxR1HbqZAklg1PAt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEDBAF80542; Fri, 12 May 2023 18:42:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EA9F802E8;
	Fri, 12 May 2023 18:42:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0508FF8032D; Fri, 12 May 2023 18:42:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DEA6F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DEA6F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E7pvxMu4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C79TkL025224;
	Fri, 12 May 2023 11:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yhZyXr8lHG2UYQnMB5K/v8MOBZCb9ZrOdJC0YRmRGa8=;
 b=E7pvxMu46+f0qJDoI0tbWmk1ppaoaZxPwNujd4EJ1fjmkq3wiJ1VuBahzVHA+HPv7P7T
 8qm3v/DlrDNQbQXvLYCBV3uvlYGPzR/GF7yZXfjZej5A6y+Cdc7fhmjfsxcqF0MsuSGx
 268U2NEZe61O33H77dy6hWMmIEI2CAXD2mYDWaea2Cn9dX0iWVVLjihqnwJbGn+ZvHFw
 u4w1ePOkTA0NLasMz+YUxsO3GYJ51WiI27DYJxB2TL5Cykzdo4ni4JuYURsVPcZHRvjG
 879KQaoqoKuMLsyatT7CvUiu5tCjILTc0p/VECcyEVS4fueZdqinm0Gw4fcj1JCDbC6X 8Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46s1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 11:42:35 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 11:42:33 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 12 May 2023 11:42:33 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8527911A8;
	Fri, 12 May 2023 16:42:33 +0000 (UTC)
Date: Fri, 12 May 2023 16:42:33 +0000
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
Message-ID: <20230512164233.GN68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86mt29mt2m.wl-maz@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: MwewUnRTmgtD-wNGy1bTINuTAa_F_N5D
X-Proofpoint-GUID: MwewUnRTmgtD-wNGy1bTINuTAa_F_N5D
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 22MCA2LZQK4TKLQZKJKAUE6XZDKQLJ2R
X-Message-ID-Hash: 22MCA2LZQK4TKLQZKJKAUE6XZDKQLJ2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22MCA2LZQK4TKLQZKJKAUE6XZDKQLJ2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 05:07:45PM +0100, Marc Zyngier wrote:
> On Fri, 12 May 2023 16:39:33 +0100,
> Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > On Fri, May 12, 2023 at 04:10:05PM +0100, Marc Zyngier wrote:
> > > On Fri, 12 May 2023 13:28:35 +0100,
> > > Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > Is the objection here that regmap is making these calls for us,
> > rather than them being hard coded into this driver?
> 
> That's one of the reasons. Look at the existing irqchip drivers: they
> have nothing in common with yours. The regmap irqchip abstraction may
> be convenient for what you are doing, but the result isn't really an
> irqchip driver. It is something that is a small bit of a larger device
> and not an interrupt controller driver on its own. The irqchip
> subsystem is there for "first class" interrupt controllers.
> 

Thank you this is helpful. This device has GPIOs that other
devices might want to use for IRQs, so the chip is capable
of providing IRQ services to other devices in the system not
just itself. This is commonly used where external boosted
amps have their IRQs hooked up to the CODEC.

I guess if Mark doesn't mind I think the only internal bit of the
device that uses the IRQs is the CODEC driver so I could move the
IRQ handling in there, it does seem a little odd to me, but I
guess I don't have any problems with it.

> > Is the objection here the table mapping the register fields that
> > are provided as an IRQ on the device?
> 
> I'm referring to this sort of construct:
> 
> +	CS42L43_IRQ_REG(HP_STARTUP_DONE,			MSM),
> +	CS42L43_IRQ_REG(HP_SHUTDOWN_DONE,			MSM),
> +	CS42L43_IRQ_REG(HSDET_DONE,				MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_UNPLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_PLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_UNPLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_PLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_UNPLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_PLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_UNPLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_PLUG_PDET,			MSM),
> 
> Why isn't this described in firmware tables?

So we probably could do that for device tree systems, but getting
this into ACPI I think will be exceedingly difficult, and that is
likely the primary market for the device.

> Why doesn't it need to be
> carried as part of the driver? Is "CLASS_D_AMP" something an interrupt
> controller driver should care about?

Ah ok so I think I am starting to understand, if I might
paraphrase, your main objection here is that many of the IRQs are
fixed purpose signals originating inside the chip itself, rather
than external lines that can be hooked up for generic purposes.

I guess most "first class" IRQ controllers have a lot more
generic IRQs than they do fixed purpose ones. Where as we only
have the 3 GPIOs as generic purpose IRQ lines.

Thanks,
Charles
