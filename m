Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A297A44BE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 10:32:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C8B3E;
	Mon, 18 Sep 2023 10:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C8B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695025972;
	bh=dMtE2HzbLQfncxD4oVJHoBpp9yjjzH+n6+HMUgT87J8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T61vB6obo1zFGxnyuyHe51/FIKZ56dlBuRCkQfgvnziWUg6qGnMkgCWV0yYGtnea5
	 MZfLOFygCegUW6/mkNudJ2jJu5uLYY1woZRGeUQlLLnN+/B4mVUjJ8opubVz6AUsJs
	 LdNxdr306NeR3IJM2mhKufJRnwtm2cPk6q5iYDqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEC4DF801F5; Mon, 18 Sep 2023 10:32:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8789CF801D5;
	Mon, 18 Sep 2023 10:32:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90FD3F801F5; Mon, 18 Sep 2023 10:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B5C5F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 10:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B5C5F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DJ8z/cRm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38I4SDOo011029;
	Mon, 18 Sep 2023 03:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=SXnGouhKU9giKLo
	p5w4uYodidnQQJlKtrkLKl4wy8BA=; b=DJ8z/cRmK0XPcVjFWnfxxb4h7xNx5xY
	XGuYWUtqjOcNKZ5lrTfHQvgk8eTeRXkDg8FcaPMgjSLDv75YCwoHeB+0iJUttp+Y
	fRCF289CBvj+zB4UnKmdoQJF9o61oK0t+6a4G0iTjmno2o+A4Do24vxwd/RzlIiT
	xfk1LKI5ig20plUSyzRmLr7qmmE1CWz/Dwy6mMz7tpUSF5xhQXD8HTZJmqFZmDnv
	tFmib55Hys2pTO7zjVfmUwqoseRwga50plyIyIn4oP/jq2xXjqAMnOkclJniGsQ7
	1R7HK4r+D50Bds73QpWwbidneGfGvFlmn8OXzKN3nKHpZMst+smQhKg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry232k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 03:31:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 18 Sep
 2023 09:31:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 18 Sep 2023 09:31:40 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3ADA43563;
	Mon, 18 Sep 2023 08:31:40 +0000 (UTC)
Date: Mon, 18 Sep 2023 08:31:40 +0000
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
Subject: Re: [PATCH v3 1/3] ASoC: wm8782: Constrain maximum audio rate at
 runtime
Message-ID: <20230918083140.GV103419@ediswmail.ad.cirrus.com>
References: <20230917173726.1916439-1-contact@jookia.org>
 <20230917173726.1916439-2-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230917173726.1916439-2-contact@jookia.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: b2Vlsqie4lg6Mnt0x56Mb5Y7c1QzJ9tY
X-Proofpoint-ORIG-GUID: b2Vlsqie4lg6Mnt0x56Mb5Y7c1QzJ9tY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XCD6VGLZQEEPCG5BRTCJKCXOVKODKAKQ
X-Message-ID-Hash: XCD6VGLZQEEPCG5BRTCJKCXOVKODKAKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCD6VGLZQEEPCG5BRTCJKCXOVKODKAKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 03:37:24AM +1000, John Watts wrote:
> The wm8782 supports up to 192kHz audio when pins are set correctly.
> Instead of hardcoding which rates are supported constrain them at
> runtime based on a max_rate variable.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
