Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76985530B2B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 10:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0874516DA;
	Mon, 23 May 2022 10:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0874516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653296308;
	bh=cD9WWsa0FWaxEipWdHCAxXG0YsBfr62Dq6M12kFWUNg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ns45zI9Nkzk2FGWzY9BAdLuw1kSfzeoZmzoXMk3HhyTJBJhtaynC0Vgnkx6U1zD1H
	 3bbyQi4IQtL3YnQ6ikMHsKKHWsDiHPTdS5OVS7AaQBuYwsN4ykBV26cFAzUHd7k4zs
	 3+CRPsHXZMZjF0ZWkcvKih7Xdx5CF0otH4iO6Kbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68311F8025E;
	Mon, 23 May 2022 10:57:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA43AF80236; Mon, 23 May 2022 10:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA9C2F800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 10:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9C2F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="acl0MZxr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N7uIiu018876;
 Mon, 23 May 2022 03:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=/TCX8fhoTT6iH2OsD4FS8GJ0wZW/pGDAgsweaDrTmlQ=;
 b=acl0MZxrMK3tZHDiLYXvr4Un8HoOg7/k6buv8Iw3LcYyX3W0qOQVKRtXEEayLI0yL2oA
 ju0EWKdiv3Bz+VLEDbijdgn1VN9CTuBaas3hqoEhbcSvc099O7cW24x4jEJl1vU0tJ42
 ZGgZthtYEXR813OYtImz+0BlfnRl7PPVAw3ju+NJKbjxP2Myqvs8h/ZGCF4iwNVfHohI
 B5/n/rN7OnNsqk7t6TE1w8SBl68nSvup+u/trSX9IqLxRexxSAdw3euM4rAjhc3jSzyO
 i9CK6lTLb6yMgqtNXrZnlBF9xTW7KlyEQbhmLF3tPctD5Ythp4PZAWMHGn479cSsPCi1 TQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g6wg0hrap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 May 2022 03:57:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 09:57:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 23 May 2022 09:57:12 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7DFD0459;
 Mon, 23 May 2022 08:57:12 +0000 (UTC)
Subject: Re: [PATCH v2] ASoC: cs35l45: Make cs35l45_remove() return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "James
 Schulman" <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
 <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <73c4a0f0-b62b-9738-d60a-4ae5b6e37c86@opensource.cirrus.com>
Date: Mon, 23 May 2022 09:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dPiA9G40qORTamgUGvdvkwvJS0ubfl-R
X-Proofpoint-ORIG-GUID: dPiA9G40qORTamgUGvdvkwvJS0ubfl-R
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/05/2022 18:33, Uwe Kleine-König wrote:
> cs35l45_remove() always returns zero. Make it return no value which
> makes it easier to see in the callers that there is no error to handle.
> 
> Also the return value of i2c driver remove callbacks is ignored anyway.
> This prepares making i2c remove callbacks return void, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/soc/codecs/cs35l45-i2c.c | 4 +++-
>   sound/soc/codecs/cs35l45.c     | 4 +---
>   sound/soc/codecs/cs35l45.h     | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
