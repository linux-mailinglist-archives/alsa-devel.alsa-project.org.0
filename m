Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC246BCA8B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 10:16:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0F11158;
	Thu, 16 Mar 2023 10:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0F11158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678958212;
	bh=/+xXH8V05RGFZmJUZ3c3d1u7wkeeF21PoRV3rdHpG14=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=pQnmracIXzoU3wq1PtUZjdJ4CgHmcJuWFwpm+U2xcZFFq/55YJ3vD0V2AXuHVOf8C
	 UV4kP8ajBMiuAK5oJZWLarOztnI2zZ0pEcLup/uMjOPdW9krLHOgntB4WmDjuZHr+a
	 cjIbbGppkD8s86ZavBj+QXCZmJmSYwqLZynptu6s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FDDF8032D;
	Thu, 16 Mar 2023 10:16:01 +0100 (CET)
Date: Thu, 16 Mar 2023 09:15:50 +0000
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 044/173] ASoC: codecs: cs47l35: Convert to platform
 remove callback returning void
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-45-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-45-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3POHCTKN2BM5BANMXOID54S2QLKTPQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167895815972.26.16654456400910512538@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 170EEF80527; Thu, 16 Mar 2023 10:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19180F80425
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 10:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19180F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LjPdf+yL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G6Q4sd002995;
	Thu, 16 Mar 2023 04:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=sFaq3waBsWnAbTk9s7R7RrgkICjTFcLJDKSFXwWQG6A=;
 b=LjPdf+yLlodlHDhp2YDKXrN+rVwVXHqPEI0ogbO0X7qb/0rG5QoXDSueUQBXQE6I+UEK
 oARnImSHnJIRFhOL+9EIooz36BvN2AZ8gb2lRfuveNeYQkWN1phqS4GTEBMvEILzM6qC
 7Elsdn93ZVq9sIPlbAUgXCejUSM6huE4knmJs1li0ab+Y9QLGi9J0oII3AhnlmfHyly6
 FsnZWkZpvFTzO43o85QVlCC9fgtY3SwwGj49EGAmDwmkYw5DTkd9/wS7EUnOat/PVDZE
 QMfR3/R9igXLdVqZ/eJmCI5hBhGGCy91TsPkRHd/enU1XOnr6dxf8avhMfUgbqbcIH46 lQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pbs3b8axn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 04:15:52 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 16 Mar
 2023 04:15:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 04:15:50 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8F9CA45;
	Thu, 16 Mar 2023 09:15:50 +0000 (UTC)
Date: Thu, 16 Mar 2023 09:15:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 044/173] ASoC: codecs: cs47l35: Convert to platform
 remove callback returning void
Message-ID: <20230316091550.GZ68926@ediswmail.ad.cirrus.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-45-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315150745.67084-45-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: rD30md_x1t3l2HTFcUXLAhOrM-30ZGZA
X-Proofpoint-ORIG-GUID: rD30md_x1t3l2HTFcUXLAhOrM-30ZGZA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: T3POHCTKN2BM5BANMXOID54S2QLKTPQ4
X-Message-ID-Hash: T3POHCTKN2BM5BANMXOID54S2QLKTPQ4
X-MailFrom: prvs=843980a8d3=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3POHCTKN2BM5BANMXOID54S2QLKTPQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 15, 2023 at 04:05:36PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
