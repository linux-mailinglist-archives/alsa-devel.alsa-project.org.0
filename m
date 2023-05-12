Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CE700C7F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4A7DEC;
	Fri, 12 May 2023 18:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4A7DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683907430;
	bh=Wr5ts+sPSiWGCRVhrcAMq8l2qTaux9qTemeK1/lSE5M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpIzIZvcLLc+NMJPQ31UlEXOMt1wumMjCnuE54s3KBmGog8DsgyE4HkURbtlNCw0F
	 S8EzwbcPUFsB/kyl6Ra9b4kzYzSuuZce9cP7jhm5tW0IHVXuN9GXDrx1rqb6DLr88z
	 2oeIhe94xbQ4FnErSG6+0JYd4tTmBlnWkIWOmcHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4382F8032D; Fri, 12 May 2023 18:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CA5F8032D;
	Fri, 12 May 2023 18:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F085F8052E; Fri, 12 May 2023 18:02:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3497BF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3497BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JStZksNP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CF338N001679;
	Fri, 12 May 2023 11:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=sxTNfTIyW/nEcDvx6yT+yObQ3uEy7YzQuDGF0VMrRAs=;
 b=JStZksNPNYMIMqczfGRO7suA6nUHCLyVAvjikIsNtGK3qRIujoBL8uvkontvfzxZWr74
 5FtZ/M4ek4dcfvpD47Vk7jy9nW0nrdwIOoYAfhL1Objhv64VvCLr4vGRGJ2rBaWkHfqC
 eo74uPqtgAHuO2RXdtv+R9Pf+f4twQDMIxKaAKmYablqQakylypjArbdj2iY70hpL4fJ
 6Pe0FNXVf0EtynUX4t2kU8JGKDT23dgjD6JZ8DFF5ybHqz8gwDFBHrgVvJ+/6IgGnVUC
 h+l8XA1yw9KrIEeD2sRjY4+f2j5QlwilDcmzZSRdkvErhTGCBLuwYhr0GdEWl/kNa0ZL 6A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7nb5pe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 11:02:27 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 11:02:24 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 11:02:24 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4000D11A8;
	Fri, 12 May 2023 16:02:24 +0000 (UTC)
Date: Fri, 12 May 2023 16:02:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Message-ID: <20230512160224.GK68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-2-ckeepax@opensource.cirrus.com>
 <0471f085-14bf-c159-9b92-62983af6c19a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0471f085-14bf-c159-9b92-62983af6c19a@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 4w6vreW3yXhaxD8tHcn7X6KMWwrZKHrP
X-Proofpoint-GUID: 4w6vreW3yXhaxD8tHcn7X6KMWwrZKHrP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6RHFWHAUPITH25YG2MJGS4OSWMWB7BB4
X-Message-ID-Hash: 6RHFWHAUPITH25YG2MJGS4OSWMWB7BB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RHFWHAUPITH25YG2MJGS4OSWMWB7BB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 08:45:51AM -0500, Pierre-Louis Bossart wrote:
> > @@ -1711,6 +1739,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
> >  				struct device *dev = &slave->dev;
> >  				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
> >  
> > +				if (slave->prop.use_domain_irq && slave->irq)
> > +					handle_nested_irq(slave->irq);
> > +
> 
> I am a bit lost here, I can understand that alerts would be handled by a
> dedicated handler, but here the code continues and will call the
> existing interrupt_callback.
> 
> Is this intentional? I wonder if there's a risk with two entities
> dealing with the same event and programming the same registers.
> Shouldn't there be some sort of 'either or' rule?
> 

I guess there is a risk of them "handling" the IRQ twice,
although it is hard to see why you would write the driver that
way. Also since they are sequencial the second would I guess
just see that no IRQs are pending.

The intention for calling both is that it facilitates using
the same IRQ handler for I2C and SoundWire. At least on the
Cirrus devices there are a bunch of chip specific registers
that need treated exactly the same on I2C and SoundWire, but
then a couple of extra registers that need handled in the
SoundWire case. This way the handling of those can be kept
completely in the SoundWire part of the code and not ifdef-ed
into the main IRQ path.

Thanks,
Charles
