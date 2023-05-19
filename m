Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA57092FB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27E074C;
	Fri, 19 May 2023 11:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27E074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488334;
	bh=7tgUJQwXgV++BHHyib1FNtLzZf90VNqR1/M2Ynbzb9U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fBR0BmzUN7aP2HDvb/r5hbIwUsGxrxJ3EA4SACbuxSmi8EUzUTI7MnHcYJ8xGZRX6
	 oYTQ1GiT2exabM3+hlA82q9wk9Id5oTRXtTfy0R4AnNuptVElHDIyfTbc+qkC7uy+U
	 n5kiviaMG/x+Orv6r/AGmV/foXWaIMYygPTcJi0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97FC3F80557; Fri, 19 May 2023 11:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13781F8025A;
	Fri, 19 May 2023 11:24:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1250F8053D; Fri, 19 May 2023 11:24:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 77586F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77586F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=S2KVVdJm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34J8avZD027124;
	Fri, 19 May 2023 04:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=Lj8uAFjxCnrls2KQSGxc7f2MX/UDnvhG2wQcOtyDCOw=;
 b=S2KVVdJmdHng3w9Hp7cbJMoY88VJakVPsqSLXrUO9w4tEsKUhznLwBtuWXfHGh5qaUm5
 mUts8DQUijd4zefb3qsJL5Ogg+JOfr9qDnb94txG0+mK4qXh2fa6oqzht76wFeH2LGG6
 MyJIkFCR7RaQJ3gTNVYObUoi/K8CzieVmwoL4F6y5H97SBWbLk357e5U6ulolPm0Mc8K
 IqK0GHJ4N6sE8G3KURSY7DLCWkZzE/cjvTi41Fn8jk8XLh8UTE6naIGM2EiTvxEsNfNC
 aw7ZHXOkgk/dO9VD6JvOAyokq7RlqaVboEhBJjvPEecf/bRJ93/tS68h3QRAwdmyMcQk 4w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qj7y180rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 04:24:27 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 19 May
 2023 04:24:25 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 May 2023 04:24:25 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0B66CB38;
	Fri, 19 May 2023 09:24:25 +0000 (UTC)
Date: Fri, 19 May 2023 09:24:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <20230519092425.GA68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-7-ckeepax@opensource.cirrus.com>
 <73438e58-bd96-818d-1f43-5681b0d1a1de@linaro.org>
 <20230518102442.GZ68926@ediswmail.ad.cirrus.com>
 <650012a3-b455-8be5-fd6d-d0775e718e6a@linux.intel.com>
 <049c2470-536a-1b1c-9828-7acb4d483309@opensource.cirrus.com>
 <3fd73def-4765-d43c-4c2c-e0fb0e2e0516@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fd73def-4765-d43c-4c2c-e0fb0e2e0516@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: UZNsi0zSqoCKwhpogjcObBxZtv6JtPfq
X-Proofpoint-ORIG-GUID: UZNsi0zSqoCKwhpogjcObBxZtv6JtPfq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M3VMJNZZFFPJQV5BB6PWLGWQCBBFRZP5
X-Message-ID-Hash: M3VMJNZZFFPJQV5BB6PWLGWQCBBFRZP5
X-MailFrom: prvs=050350912c=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3VMJNZZFFPJQV5BB6PWLGWQCBBFRZP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 18, 2023 at 11:47:12AM -0500, Pierre-Louis Bossart wrote:
> On 5/18/23 11:15, Richard Fitzgerald wrote:
> > On 18/05/2023 16:16, Pierre-Louis Bossart wrote:
> >>>>> +    ret = devm_mfd_add_devices(cs42l43->dev, PLATFORM_DEVID_NONE,
> >>>>> +                   cs42l43_devs, ARRAY_SIZE(cs42l43_devs),
> >>>>
> >>>> I don't why adding devices is not in probe. They use the same regmap
> >>>> right? So there will be no problem in probing them from MFD probe.
> >>>
> >>> Well except SoundWire is a bit of a special boy, the hardware is
> >>> not necessarily available in probe, the hardware is only available
> >>> at some point later when the device attaches. Doing it this way all
> >>> of the attaching (and various detach/attach cycles the device needs
> >>> during configuration) are over by the time the child drivers bind, so
> >>> they don't all need special code to handle that.
> >>
> >> if the devices are added in the probe, then the regmap needs to be moved
> >> to cache-only and another special API would be needed to tell the MFD
> >> framework to turn the regmap cache-only off.
> >>
> >> But if it's the same regmap, the regmap cache is handled in the
> >> SoundWire update_status callback so maybe  Krzysztof's proposal does
> >> work?
> > 
> > But you still can't access the hardware in probe(). So you'd have all
> > the child drivers probing but not able to talk to the hardware. The
> > child drivers would have to hook into the update_status() somehow so
> > they know when the peripheral has enumerated.
> > It's simpler to add them after the hardware has enumerated - they will
> > be able to access the hardware in their probe().
> 
> It depends on what you mean by 'access the hardware'. If the only
> interface is regmap and regmap is in cache-only, then the child drivers
> could "access the hardware" without anything happening until after
> regmap is no longer cache-only.
> 
> But yeah, I realize it's a long shot.

Yeah, its never just the regmap. Take the sound driver for example,
when the sound driver binds all the components will be inplace
and a soundcard will be created. This means the user could then
start an audio stream before any hardware is actually available,
various bits of the audio bring up rely on timing or reading state
so won't work in cache-only. Yeah you could add work arounds for
these problems as they arise, but you will end up with a lot of them.

I would flip this around and ask, what is the problem with adding
the child devices once the device has completed initialisation?
As far as I can see it looks like a choice between moving one
function call with no obvious downside, against loads lines of
various work arounds in each of the child drivers for whatever
subsystem specific problems are caused by the device not actually
being available.

Thanks,
Charles
