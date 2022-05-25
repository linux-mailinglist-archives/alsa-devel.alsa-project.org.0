Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E6533A58
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 12:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3BBB1660;
	Wed, 25 May 2022 11:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3BBB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653472841;
	bh=Mh1nSl6WJ8LJu4xj2T5ewIoTYUb7slkafvam6+3FQNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYdqTsOwWLmGzVM9yRbjtrfK4RnlYnI2uhh0oZhWhTAGhZkdoPFvNxDeBhZIw4Tb/
	 93nnVoIqjMivY826td1NCSh+d+jSx2XZHDQ7CGcoHujQyY0reoq04wEh5SlbWmA+a/
	 l+ZvF8S7NTe16T+pxFINhys6EGMLMzJsCbdK0Wvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54948F80100;
	Wed, 25 May 2022 11:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC92DF80116; Wed, 25 May 2022 11:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3873EF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 11:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3873EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ocif9DCK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P7t8Ev013744;
 Wed, 25 May 2022 04:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=Wu6xqJQ5HBDrW935bDYRhJqL/NEwWcUrslwqDjFR3Cs=;
 b=ocif9DCKxlw9JvycZiAI8XHjlyrvCzzvc5GBwe/MI/3DBi1Yug3U6jief/C/IZcK0GAu
 92s9PDoWX/+lME0V47d0GjdeoCxNH4+1zMCFxl/UEpttwZkBhJlL9lv8h+BIIKO4yF1a
 KGk8juOkQe5+zpuEAkDtsOYt0XFgQcGWlVOP+T4oGv31jRuJ/EDMzozdNaMaJ2IyKb+0
 kcw3bnowk8bWdoYstaMSFxgvcMofdfDkyLfn6ntmUBPnyxytWzJmIbUmWWDTCoY7ozNK
 Ot/V46ZS+/G3PknnUQ62iUY0msihqsnQs7CmSENQTaFmtsVR0nknNLsy4taeDGyPEwdM LQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u20qy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 04:59:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 10:59:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 25 May 2022 10:59:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 488F511D1;
 Wed, 25 May 2022 09:59:18 +0000 (UTC)
Date: Wed, 25 May 2022 09:59:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] ASoC: cs35l45: Make cs35l45_remove() return void
Message-ID: <20220525095918.GN38351@ediswmail.ad.cirrus.com>
References: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
 <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 6f-68QPUPNXzgFHqgfX06OXhzHy40Ay9
X-Proofpoint-GUID: 6f-68QPUPNXzgFHqgfX06OXhzHy40Ay9
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, James Schulman <james.schulman@cirrus.com>
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

On Fri, May 20, 2022 at 07:33:49PM +0200, Uwe Kleine-König wrote:
> cs35l45_remove() always returns zero. Make it return no value which
> makes it easier to see in the callers that there is no error to handle.
> 
> Also the return value of i2c driver remove callbacks is ignored anyway.
> This prepares making i2c remove callbacks return void, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
