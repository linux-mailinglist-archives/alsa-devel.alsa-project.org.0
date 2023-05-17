Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD67064F1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 12:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63DB31F7;
	Wed, 17 May 2023 12:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63DB31F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684318449;
	bh=1uU4ZUJTX21bQmhZtsjWxyW+VP6UbBbwzTiOaVxfGoE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DEyd1E54z7kZWpKu/16aHJKBnifU/i53v8qFLFvhOXhlh/sdBVWYI7jIx7kZAZ5kV
	 MKlGbrAZHoa4FnQ6NfliYF2MA5QzlyBMKEPZQloNyR/oAJNVwXhVdipmgK740fPbIT
	 5uD6sKcZ/aN4OyIVq25mLFXffn5uIxBmqunG5sMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E027FF8024E; Wed, 17 May 2023 12:13:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 829A5F8025A;
	Wed, 17 May 2023 12:13:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14CEF80272; Wed, 17 May 2023 12:13:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B3BBF8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 12:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B3BBF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P9lZtHUZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34H6sFqA004446;
	Wed, 17 May 2023 05:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=Xpb1EWBMfi+Jisb8QnCvI2wmKB3bYLxwbNbSZLNIp3M=;
 b=P9lZtHUZVwbkmZDE5vVygaoxtsyGAnba+uL/acfYiQBVvTk4+IkqJ2tg01ycyBQHocRU
 6dZNsVaypvtbrKVudMv67oGzLxMwzWzP/2hdsNmMwAPwHdbcpZt6W4L8ZB92tMG65hza
 NCp/K2MblSmvnAMKfKZFuUCb0PS3vzQLufVxQiK0XSJQ6EZbDow3UrhIFL5nMlV3DetT
 q2D+xV+2SxcVEIjPTkpriFZ12whLcPQ41yiUzGL+KDest4tL6DOAZFpRnX8wkyfICsWR
 4LXUZ+17daG1kJZhWiYt6PgJPMWmW9ZlUoGIpqrQ0wKYbKey+jBKw8DL42xXhFpweczb OA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymwq4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 05:13:02 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 17 May
 2023 05:13:01 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 05:13:01 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3234311CA;
	Wed, 17 May 2023 10:13:01 +0000 (UTC)
Date: Wed, 17 May 2023 10:13:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Message-ID: <20230517101301.GV68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <ZF6RMqElYZVMpWRt@surfacebook>
 <20230515101350.GS68926@ediswmail.ad.cirrus.com>
 <CAHp75Vcizrucc-2KFdFNeHNrxCzz4GwX1OzZYyjPH7P9RgnKYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAHp75Vcizrucc-2KFdFNeHNrxCzz4GwX1OzZYyjPH7P9RgnKYQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: E83zWdV2Sk2QsBLUBUii7rBv6xNydwdo
X-Proofpoint-ORIG-GUID: E83zWdV2Sk2QsBLUBUii7rBv6xNydwdo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SID2U7X6HCN4U2JALOMKBY6JFZQ3TWOF
X-Message-ID-Hash: SID2U7X6HCN4U2JALOMKBY6JFZQ3TWOF
X-MailFrom: prvs=050130d673=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SID2U7X6HCN4U2JALOMKBY6JFZQ3TWOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 16, 2023 at 10:03:45PM +0300, Andy Shevchenko wrote:
> On Mon, May 15, 2023 at 1:13 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Fri, May 12, 2023 at 10:19:14PM +0300, andy.shevchenko@gmail.com wrote:
> > > Fri, May 12, 2023 at 01:28:36PM +0100, Charles Keepax kirjoitti:
> > > > +   if (!of_property_read_bool(dev_of_node(cs42l43->dev), "gpio-ranges")) {
> > > > +           ret = gpiochip_add_pin_range(&priv->gpio_chip, priv->gpio_chip.label,
> > > > +                                        0, 0, CS42L43_NUM_GPIOS);
> > > > +           if (ret) {
> > > > +                   dev_err(priv->dev, "Failed to add GPIO pin range: %d\n", ret);
> > > > +                   goto err_pm;
> > > > +           }
> > > > +   }
> > >
> > > Besides the fact that we have a callback for this, why GPIO library can't
> > > handle this for you already?
> >
> > Apologies but I am not quite sure I follow you, in the device
> > tree case this will be handled by the GPIO library. But for ACPI
> > this information does not exist so has to be called manually, the
> > library does not necessarily know which values to call with,
> > although admittedly our case is trivial but not all are.
> 
> Why can't the firmware provide this information? _DSD() is a part of
> ACPI v5.1 IIRC.
> 

I am very very far from confident we can guarantee that will be
present in the ACPI. The ACPI is typically made for and by the
Windows side.

> Although it might require moving some code from gpiolib-of.c to
> gpiolib.c with replacing OF APIs with agnostic ones.
> 

I really think if we want to start doing things that way on ACPI
platforms someone with a little more clout than us needs to start
doing it first. If Intel or someone was doing it that way it
might give us a little more levelage to push it as being the
"correct" way to do it.

I will switch to the callback, but really don't think we can rely
on this being in DSD yet.

> 
> > > > +static int cs42l43_pin_remove(struct platform_device *pdev)
> > > > +{
> > > > +   pm_runtime_disable(&pdev->dev);
> > >
> > > This is simply wrong order because it's a mix of non-devm_*() followed by
> > > devm_*() calls in the probe.
> > >
> >
> > I had missed there are now devm_pm_runtime calls, I will switch
> > to that. But I would like to understand the wrong order, remove
> > will be called before the devm bits are destroyed and it seems
> > reasonable to disable the pm_runtime before destroying the
> > pinctrl device. What exactly would run in the wrong order here?
> 
> At the ->remove() stage after this call an IRQ can be fired (or on SMP
> systems any other APIs can be called), for example. So, would it be a
> problem to service it with PM disabled?
> 
> But in any case the shuffling ordering like this is prone to subtle
> bugs. I prefer to have strict ordering if there is nothing preventing
> from doing that way.

Yeah happy enough to use devm_ here, just didn't know it existed
and wanted to better understand your concerns as I was having
difficulty seeing the issue.

Thanks,
Charles
