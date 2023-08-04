Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F376FF26
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 13:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979A47F8;
	Fri,  4 Aug 2023 12:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979A47F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691146838;
	bh=AQoGcnKiWJeOk1vNxwFxn7O4aowsWomIsOgr3bBXPVg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TSu43ip1GMxXSTEX/+iRxg/GdoXOZUEzbIZYQLCsuaEKdhJzULxzcMd0lURIEZVhT
	 qb7HVHNW7OVPDEWl8mNrkmmFfEz0o8K7r4P07jEVTxUwhYaSB3opAfdcfESJbrGvMN
	 f3U5X37ZlYKXgJIurpiPirIShUmgcF0YEbJeKgCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 106DAF802BE; Fri,  4 Aug 2023 12:59:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C64D5F801D5;
	Fri,  4 Aug 2023 12:59:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 441F4F8025A; Fri,  4 Aug 2023 12:59:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 344A7F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 12:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 344A7F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aA7RJGVk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3749w5IF019269;
	Fri, 4 Aug 2023 05:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=AQoGcnKiWJeOk1v
	NxwFxn7O4aowsWomIsOgr3bBXPVg=; b=aA7RJGVk8H6Kgi1Ne4DnCk5y2j6XIdR
	0P16NOlN1v4t3+3qKfHk+iwJncdxqZ3LbI/aHFBth9MGsNOxbT/tTk/dfbmXcQgD
	ZDge9KnJJ0vzGmkWeYRnJ5tPwUVUSaTGtw4LRpEW/NAzCGTxnt6hGxdTswaJZUcm
	1fusPBWxZjGyUIYvyoqNlrPVjED0lPyZly9z0wcYDhBOJcE2mZh8s1dK/BhalR3Z
	qGkEG12raVr2Zw2l336OuTRsPrlZR0exrWkMeU0SiF3xWriseriaoOhP8GyYvXZG
	C2w1eOmCi82jy918e14e3ghlFU264pdRuc2WalYuOTG1STFrWoA4n+w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jwmb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:59:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 11:59:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 4 Aug 2023 11:59:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CC3993563;
	Fri,  4 Aug 2023 10:59:29 +0000 (UTC)
Date: Fri, 4 Aug 2023 10:59:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, Baojun.Xu <jim_monkey@163.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <shumingf@realtek.com>,
        <herve.codina@bootlin.com>, <povik+lin@cutebit.org>,
        <ryans.lee@analog.com>, <sebastian.reichel@collabora.com>,
        <fido_max@inbox.ru>, <wangweidong.a@awinic.com>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <peeyush@ti.com>, <navada@ti.com>, <tiwai@suse.de>,
        <mengdong.lin@intel.com>, Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH v1 1/2] ASoC: tas2783: Add source files for tas2783
 soundwire driver
Message-ID: <20230804105929.GT103419@ediswmail.ad.cirrus.com>
References: <20230801141858.130745-1-jim_monkey@163.com>
 <35849737-dbff-4655-9062-5d5d0fd861df@sirena.org.uk>
 <c4b3e3d2-ab87-f9f5-95f9-7d572694b376@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4b3e3d2-ab87-f9f5-95f9-7d572694b376@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: YmlthsEdRQp4sKvm9Deb6oqLjrVA0xqK
X-Proofpoint-ORIG-GUID: YmlthsEdRQp4sKvm9Deb6oqLjrVA0xqK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UDEYT6QL37IEVWCXUKEF6ZARSOTH7TEW
X-Message-ID-Hash: UDEYT6QL37IEVWCXUKEF6ZARSOTH7TEW
X-MailFrom: prvs=3580138b0b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDEYT6QL37IEVWCXUKEF6ZARSOTH7TEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 02, 2023 at 02:19:14PM +0100, Richard Fitzgerald wrote:
> On 2/8/23 14:01, Mark Brown wrote:
> >On Tue, Aug 01, 2023 at 10:18:57PM +0800, Baojun.Xu wrote:
> The rt*-sdw.c or max*-sdw.c devices are a better starting point for a
> Soundwire codec driver.

One could also have a look at the patch chain I am working on for
cs42l43:

https://lore.kernel.org/all/20230804104602.395892-1-ckeepax@opensource.cirrus.com/

It is an MFD device which is a little more complex (and I
wouldn't recommend unless you really need it) but the basic
SoundWire code provides a pretty clean example, the chip doesn't
have too many oddities compared to cs35l56.

Thanks,
Charles
