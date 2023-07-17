Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B33756737
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 17:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775C0DEB;
	Mon, 17 Jul 2023 17:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775C0DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689606729;
	bh=qostQREGiYRhqFCjPrkWmhQ4idrHPWGzhRlpw2KWWFQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z7a8nZ13qDB3+8hikXyZUl2UkS5BbidcHabmVO8+3isa04XA5Nzd+srrzwj77tlh7
	 24Ub6AVZhMw8NQTjmgGY65g9PxaWtkCXPJKUw1eNB+Z3AZo1if68AoYNDHXqriUkg/
	 O/dwFcpnMspoSduc8/yWFk5rd6jZZ/PQU4SEB29o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99251F80535; Mon, 17 Jul 2023 17:10:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E93D5F8027B;
	Mon, 17 Jul 2023 17:10:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC6EF8047D; Mon, 17 Jul 2023 11:53:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 22A96F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 11:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A96F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FYkhSLj2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36H5oWhv024979;
	Mon, 17 Jul 2023 04:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=6lLcMdE7NiLfYmz
	f5rN6MtAOjyshk3EubvQ+zTuLmNs=; b=FYkhSLj2mADwEQ1rtSlFG1Tqo170qOz
	+D04Rc4fTCOhLdGWqKDU84c/zKLSY9gk+H8wHuCl+DhbYb/OrP3SZkxlE8QT/212
	ffZNsLuLkJrKm0qhTk4YIRVYEkkcBz4UA0c4hzex03jOXXquQ5rz2maZK02zZGtz
	X7Ldx764gj4SkZ1OtuPc0omYEZIbEDrvhAeRRaKhdrHtuqm0KSj7DoDKNeo8Xvsi
	O8BDnKUZj/CI2MW4019GxNWySORM4N5uoqiP3tqeTVzcOA6tDwA0wOr/6QFOtZRT
	6RBm+nS5zK6Dpj09/e5oF3GVeCs2Op/h/CvK+6cnzClrJbrhAvfTRrg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gsw03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 04:52:55 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 10:52:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 17 Jul 2023 10:52:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E84A475;
	Mon, 17 Jul 2023 09:52:54 +0000 (UTC)
Date: Mon, 17 Jul 2023 09:52:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Frank Li <Frank.Li@nxp.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vladimir
 Oltean <olteanv@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?=
	<khalasa@piap.pl>,
        Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>,
        "open list:WOLFSON MICROELECTRONICS
 DRIVERS" <patches@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
        open list
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/1] ASoC: codec: wm8960: add additional probe check for
 codec identification
Message-ID: <20230717095254.GA103419@ediswmail.ad.cirrus.com>
References: <20230713222513.1636591-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713222513.1636591-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: dVkVXtwqOw-GMPTnfGpvGuJ4O8g7sUG6
X-Proofpoint-GUID: dVkVXtwqOw-GMPTnfGpvGuJ4O8g7sUG6
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=2562f215d3=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: JMYK4EQRMFGEWCPIX6LCSL3DRAYVD27Z
X-Message-ID-Hash: JMYK4EQRMFGEWCPIX6LCSL3DRAYVD27Z
X-Mailman-Approved-At: Mon, 17 Jul 2023 15:10:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMYK4EQRMFGEWCPIX6LCSL3DRAYVD27Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 06:25:12PM -0400, Frank Li wrote:
> The wm8960 codec is not readable, resulting in a NACK for address 0x3d (8-bit).
> This can partially indicate it. For example: wm8962 codec use the same address
> but is readable. This additional probe check will help prevent loading the wm8960
> module incorrectly on wm8962 hardware.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Seems reasonable to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
