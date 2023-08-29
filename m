Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A578C1F2
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 12:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A7E1F2;
	Tue, 29 Aug 2023 12:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A7E1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693303578;
	bh=tDuGpPu4F3qUaOAGAFkhMZqn56EfH79+MmJdtuRfKas=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=utxvIzH5E0DFov8CexJSaPACP+Rxfvj3R861ZV1B+SegDreTdI1XIPqDAbbujGWS9
	 HQCCkrl4s+clQAq9CXyzssgGp7RHHlU91xHz9Dq1J1lRaPCobIe5AhjuWtsspw/hSO
	 rFPTnJLSvEcRQBcLxX/6AzHPlcz0iGPh62qXRDVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6CCCF8055A; Tue, 29 Aug 2023 12:04:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 843A6F80527;
	Tue, 29 Aug 2023 12:04:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00178F80536; Tue, 29 Aug 2023 12:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DA5BF8032D
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 12:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA5BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JavZNAvo
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37T6exKV018289;
	Tue, 29 Aug 2023 05:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=/8KaQMAgqsXHbnZ
	VKpnstEf5sWpQ+uUAV9RcOHPg7Qg=; b=JavZNAvojy4Z2DyXqYcAZLzsjO6M5Ni
	s2bjqlUnA+YoR/k/alRs2yLwNBH41gRChp7GYAKXYbM+xhc4JPkpRNoIEuim6/ES
	4CSLY3AlKRF19X6Qhpt+y+ibMaOe9FDPUiMkoY0YafcP+iboFkc+nwVtTefGlqny
	ehkaaK1g4O0m3Wwo02H0iqUydD/1qbbe9X3TBKMxI9gH7Fyi31tuJu52UEZUxnGU
	Zfuvrsz9m/mVsHTGq4CaNhKjNqpI+erAnDeJZVXnvKCSK56l2N6NgzlTY+wtgb6S
	GTWKUgAxjS1wAf22QkLKAFDjq7MyO+KppI4vAlBe0YuosJwQlr8C8gQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesybbj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 05:04:41 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 11:04:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 29 Aug 2023 11:04:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA7A211AA;
	Tue, 29 Aug 2023 10:04:38 +0000 (UTC)
Date: Tue, 29 Aug 2023 10:04:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>
Subject: Re: [PATCH 2/7] ASoC: cs35l45: Fix "Dead assigment" warning
Message-ID: <20230829100438.GQ103419@ediswmail.ad.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-2-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230828170525.335671-2-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: UDJBV15sSFOlm9g95F4y57geD7o5qRiC
X-Proofpoint-GUID: UDJBV15sSFOlm9g95F4y57geD7o5qRiC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NK2EJ7BRDBZEZTPZ5PDQAHAX2PQ35KPW
X-Message-ID-Hash: NK2EJ7BRDBZEZTPZ5PDQAHAX2PQ35KPW
X-MailFrom: prvs=4605abc1a5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NK2EJ7BRDBZEZTPZ5PDQAHAX2PQ35KPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 12:05:20PM -0500, Vlad Karpovich wrote:
> Value stored to 'ret' is never read. Remove it.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
