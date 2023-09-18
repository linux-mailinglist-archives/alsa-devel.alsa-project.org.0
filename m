Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A237A44C8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 10:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AEB1FC;
	Mon, 18 Sep 2023 10:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AEB1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695026023;
	bh=tPgCMb76jCTWr1rS1GibZD/G/u6ILE1QYNMTk6qFnT0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qprvENnPjgRY+9TGAQ/fPtPN60tyWIxUr/7DrCc+PK/UUOiFYlNZI1FWmb4d+w/4e
	 EJg/46REC0jzFNAUW1NTaBtyG6nhpusFCoL8rSKroU+h+yBZewy4TFNYWvFeCG89YX
	 BWrPYMGButvnamanknsMzLQJC25LEJiRaLM6e14A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64D3BF80567; Mon, 18 Sep 2023 10:32:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA080F8055A;
	Mon, 18 Sep 2023 10:32:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E963F8055B; Mon, 18 Sep 2023 10:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26871F80552
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 10:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26871F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=m7M9Ucu/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38I7O8XX001877;
	Mon, 18 Sep 2023 03:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=HsckZib0kFdqRd8
	2p0LZ8kH9k0yEhEP6k9JatP9VGes=; b=m7M9Ucu/STqmjERe1LoG4Xbu5nIM/k4
	YEhzWc147R16dKfspSF7QbKjyjXtjGFbqilfOJ/bEdaGO7ol3P/oShqD2TvjCtKR
	kt6TGurIW2BD4UPPUIJc277bh5/APPsSvBzKcf2FOMODkpBBRhZf7JK/VO+h/FP6
	S/VxspiY5D9LJVEReP+WpjB4c31UZA6pERILpH1UHlTgOvSyFpMmj3UYs813zd0C
	MXDTsgbVJ18Yu3MEFViDNgq8dlAB8yv58nBr9WktW0RJQeOKxXmka72DtpVP0TbS
	WiyfyjR0kX7bGR2OrGLxBwf5SKeT7BZqNGIbweRz2AISvnIks5SDWVw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shsk2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 03:32:09 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 18 Sep
 2023 09:32:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 18 Sep 2023 09:32:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31AF711AA;
	Mon, 18 Sep 2023 08:32:07 +0000 (UTC)
Date: Mon, 18 Sep 2023 08:32:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: John Watts <contact@jookia.org>
CC: <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] ASoC: wm8782: Use wlf,fsampen device tree property
Message-ID: <20230918083207.GW103419@ediswmail.ad.cirrus.com>
References: <20230917173726.1916439-1-contact@jookia.org>
 <20230917173726.1916439-3-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230917173726.1916439-3-contact@jookia.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: KkdlL0r5u1LbZqE6Pn15FkmZ0gVSsQWs
X-Proofpoint-ORIG-GUID: KkdlL0r5u1LbZqE6Pn15FkmZ0gVSsQWs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TP6B3FJEF74QP6A5DYUEWASDFQSH5DHP
X-Message-ID-Hash: TP6B3FJEF74QP6A5DYUEWASDFQSH5DHP
X-MailFrom: prvs=4625b791e1=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TP6B3FJEF74QP6A5DYUEWASDFQSH5DHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 03:37:25AM +1000, John Watts wrote:
> The wm8782 supports rates 96kHz and 192kHz as long as the hardware
> is configured properly. Allow this to be specified in the device tree.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
