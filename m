Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A54078A84F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 10:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1FBBC0;
	Mon, 28 Aug 2023 10:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1FBBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693212880;
	bh=KLZoEaHKD1buFSvUYkV2HwJi0UWJOOc+IKCDoWEXy3w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c6mFhvsHl4pXuJ4zbdn7P46hsMDgtMDWcK6EnGvRbuE8mytgnF1EfoKDbIVfxP8EQ
	 jIIl5RXQNOuJ0wlvr/+N22W0v3M2f4vIY8lB7EaMWQsw4VxHUahrXkFKOJqL1lb2oA
	 U8XpsSYr5ycitgE+fpkVdD3G6yY5IRDjMCS9fI7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03DCCF804F3; Mon, 28 Aug 2023 10:53:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A981DF80155;
	Mon, 28 Aug 2023 10:53:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80C7DF8025F; Mon, 28 Aug 2023 10:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43DECF800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 10:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DECF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n5x/V91Q
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S7sDWs012030;
	Mon, 28 Aug 2023 03:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=vAjenGYdHuZZJEU
	bEUMqaXJbVfF0yeOB5Hz5mpoyvZU=; b=n5x/V91QUPfXV1IPedZDySm41mUtEdQ
	CqzvwcX+pHiHI/lT+wTcUpqOa5NF3ciuJVdjWskWB2oyW4xjNFkW/Ow0CYDUoqeu
	upg4N3yMeRQWbL12CVVKppfsc1dtARcJGaHZmpOxteS7HNL0pEGOP9a6Ob3Ww20M
	vf5TOPkeVMp0s4WHC5L4LN7Ppd240og5KosIJZEpSVBuLCnMGZPuOWexOpJ2OvAC
	4MflN4Ccge8o/GzYBAzjKlSzkS9wqK+byd4YmMXvsUwAkWngTUu3zhz7mZ0XZObM
	Jb2AXhQ4Z4pyBdughDPhU6dyS9gybH94R8yQlaJPz0VjzWHeM1TiG0w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj1jg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 03:53:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:53:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 09:53:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BBCB357C;
	Mon, 28 Aug 2023 08:53:41 +0000 (UTC)
Date: Mon, 28 Aug 2023 08:53:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Uwe
 =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: wm8580: Simplify probe()
Message-ID: <20230828085341.GN103419@ediswmail.ad.cirrus.com>
References: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: lj7eekS1Xnr-2IXimGnsyfbWHnMSiPRU
X-Proofpoint-GUID: lj7eekS1Xnr-2IXimGnsyfbWHnMSiPRU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FEVXRUPHNHFR3VOLOOOO5JCLRKOXZF2J
X-Message-ID-Hash: FEVXRUPHNHFR3VOLOOOO5JCLRKOXZF2J
X-MailFrom: prvs=3604f52ce6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEVXRUPHNHFR3VOLOOOO5JCLRKOXZF2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 27, 2023 at 11:21:14AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
