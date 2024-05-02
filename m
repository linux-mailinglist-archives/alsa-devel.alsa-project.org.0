Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8508B9643
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 10:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A24E85;
	Thu,  2 May 2024 10:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A24E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714637940;
	bh=OsPDvE3Lc6w3KXCcRc+fZ2cjA8Mhoib7g1iA5Vr9FoA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M8jWIzLfKRr0ONIPfXrwPj9tqHGGDPXNM6Uk2Y2rvs4/pzbYzTa3VacZjgJDJbVLw
	 znRUm+09vOzfljD9ywGF6OUP46DML0t6fb/IJpmTDPXP0ZAc0ud0eXc/91YIO980XJ
	 1yvdw/GzEAn7G7IwT99OBotIuYnncrKP6ddZzaWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79628F8057E; Thu,  2 May 2024 10:18:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F103F8003A;
	Thu,  2 May 2024 10:18:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19C82F80266; Thu,  2 May 2024 10:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C8B3F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 10:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C8B3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nh7BA6x1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4425jDSB017800;
	Thu, 2 May 2024 03:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=EhWtohCGUIZ/Xrs
	7gzkRSrh00jig+0JIKfHJVexSxuE=; b=nh7BA6x1vW4FSvjCjnWDe9HfSSwZM9R
	zYs75gPDPPv4UqASOTqALlq3POj1T9sBiPAB5ke27j78uFdcsw5JDYsv4BK47h1F
	GU3c+DG1MWcmNtAXY7siGmOESWjr+RBAtwb4S6ynT1jkMBpy3ExMirsls9Gp3237
	iz8qTZ99lIr06a+tsdDU0e+BGa+8jQSUqzwSWpA/oesISuXMPPw3kLWjw+QnVLHq
	t15zyEacoYqqB8felAhx7FkjP47ghFRs7ZVhy8BfwEg7YKSexKNXA4zku35h9kUZ
	cP6ErkVwCTDJjOtEGcB0TMXLjjDDyUtZFpjXC/ibo/UwZg+/spTaxFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xrxry5fdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 03:18:08 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 09:18:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 2 May 2024 09:18:05 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 5F4CD820244;
	Thu,  2 May 2024 08:18:05 +0000 (UTC)
Date: Thu, 2 May 2024 08:18:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        <patches@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 0/4] ASoC: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-ID: <ZjNMPOOFg9myFSz3@opensource.cirrus.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: eedWidXVslVxbzPC805TxwhRqVampm1s
X-Proofpoint-GUID: eedWidXVslVxbzPC805TxwhRqVampm1s
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X5XGPZAIR5JSIYMHDMIPX3AVB4RVONYC
X-Message-ID-Hash: X5XGPZAIR5JSIYMHDMIPX3AVB4RVONYC
X-MailFrom: prvs=2852ff8dd7=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5XGPZAIR5JSIYMHDMIPX3AVB4RVONYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 30, 2024 at 01:54:33PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> This is part of a tree-wide series. The rest of the patches can be found here
> (some parts may still be WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, I audit them before sending. This is why I
> will send series step by step. Build bot is happy with these patches, though.
> No functional changes intended.
> 
> Wolfram Sang (4):
>   ASoC: codecs: wm8962: use 'time_left' variable with
>     wait_for_completion_timeout()
>   ASoC: codecs: wm8993: use 'time_left' variable with
>     wait_for_completion_timeout()
>   ASoC: codecs: wm8994: use 'time_left' variable with
>     wait_for_completion_timeout()
>   ASoC: codecs: wm8996: use 'time_left' variable with
>     wait_for_completion_timeout()
> 
>  sound/soc/codecs/wm8962.c | 12 ++++++------
>  sound/soc/codecs/wm8993.c | 12 ++++++------
>  sound/soc/codecs/wm8994.c |  8 ++++----
>  sound/soc/codecs/wm8996.c | 14 +++++++-------
>  4 files changed, 23 insertions(+), 23 deletions(-)
> 

All look good to me.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
