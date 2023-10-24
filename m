Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2357D4ABA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 10:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25BB085D;
	Tue, 24 Oct 2023 10:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25BB085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698137091;
	bh=fD909NFQ+rsorgxnWh4e3dLIPhy87UaBz6jSuTiAkDc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ENvd/fvvFBuOj3P4yQZWdKCGcGPvi1etCvQYIAAkHl1v5IW7bCK8ZwPfZg9mX4Cny
	 4U93IXKwoPbjhk6+jHgKYd7p8zm8hs5u9yOvMnOaLJxxVZ/JLNKWBG51qpNsFexPcs
	 1SiPUzMre+sp2KNCTyiwaAA0QbcKl3wPpL6GqGO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F996F8024E; Tue, 24 Oct 2023 10:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5495EF8012B;
	Tue, 24 Oct 2023 10:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56A43F80165; Tue, 24 Oct 2023 10:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AE5DF8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 10:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE5DF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=klo3qsM2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39O8M8ss000656;
	Tue, 24 Oct 2023 03:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=HY02qgiumNjSlbaPurNATKMmNJREQ0HiVkUwIgtcU8M=; b=
	klo3qsM2mOcsqLIgR4RnE0eQN+TXkHzxShdV1PVw1LljU3poqLWHLeAgEfFuZsn2
	tTUZ5piP6cst2WP5vcTQYKUqMCI8vAto7CrO8oQhStbRw0zGdA0nIkWpkAvBNeju
	Kbn6pcrONAjzQEdLYIYZ8bFrlLlgJpqbmlfQmq5z43E1Q11n3hwKcnhDuGBGwjMj
	G2p+rJ00uW38G0L5+9J8ULSW+Y9IgUKxetOvSmIVd2q3p3+OnOFKPcz0ptpRrR0F
	V1ljQEUCkcsC6p8xnveU1cnuPpSDOMuK3yTmwdH9UZcLYF03zXeDrrhHzaVUEtJ1
	C8g6pKzbeV2XlZhFi2qOEg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tvb2j3fh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 03:43:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 24 Oct
 2023 09:43:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 24 Oct 2023 09:43:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4301B2A1;
	Tue, 24 Oct 2023 08:43:16 +0000 (UTC)
Date: Tue, 24 Oct 2023 08:43:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH 2/7] ASoC: cs42l43: Convert to platform remove callback
 returning void
Message-ID: <20231024084316.GV103419@ediswmail.ad.cirrus.com>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
 <20231013221945.1489203-11-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013221945.1489203-11-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: CNiNGVfp2uYCF9yDk9bso4315t8UXLNO
X-Proofpoint-ORIG-GUID: CNiNGVfp2uYCF9yDk9bso4315t8UXLNO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PZVHREUSWSHVHXXXUZGKYOMG5T6YECJZ
X-Message-ID-Hash: PZVHREUSWSHVHXXXUZGKYOMG5T6YECJZ
X-MailFrom: prvs=5661862d4a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZVHREUSWSHVHXXXUZGKYOMG5T6YECJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Oct 14, 2023 at 12:19:48AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
