Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDC52EE73
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 16:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC631726;
	Fri, 20 May 2022 16:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC631726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653058131;
	bh=b68KXZUVu3SGTjjSrhCuTzEkz35nIBb7ammXL0RBaws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6dTmYPRez0IIzO7a31MPQVvOJODAjvSVLHCbE3KCIrYQqaPaX3yAO4EDvL/CaD0L
	 3o27NWIwde/b/MDxygQossMnwTNzZZPTp37e/yn6/J01O5IUclyG+vwg1S+9Zr+rza
	 hKDQqk3SRbrpw+IWymICXYbD3FbMWmvqrZb/IgwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12765F800F0;
	Fri, 20 May 2022 16:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB51F8019D; Fri, 20 May 2022 16:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5897F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 16:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5897F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Zl8ng1Sh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KAsMns029811;
 Fri, 20 May 2022 09:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=9G7MacAVgc3hVWA+1VLb4m7aeMTgVwtgmSsPxNyBxcU=;
 b=Zl8ng1Sh/2bSTr+nS2/DTojLx5Y2oLAejwr+UpHdffWyYJWceIWdcXqupo+NM32DemJl
 BqpCI1ly31o3ic/0WxxwBYyAVTrgHQdnuCmfTrUMaGN0Zz1bJgOXdClmzAzL/979odN0
 i4k3EMaJ1oP7ejxl2G6BZd45vKuXLk6S7iU7z87vtjo7ciZ5ZpgUanugvrb6qcuQIfER
 ogkQSDwRGHMnw9BMUdr3Mg1HCJbkFU/lfxeXbUmvgtJWzxEQFlIxFR7hOqI7r7ypt3QO
 lV47EgVe7dnA78H1WwJ2Znj9X+SiADoaL+IKzAhUacgjIYLfHookksUzmylGDvHNNbv9 tA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upgh9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 09:47:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 15:47:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 15:47:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5887A11D1;
 Fri, 20 May 2022 14:47:38 +0000 (UTC)
Date: Fri, 20 May 2022 14:47:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: cs35l45: Make bmc150_magn_remove() return void
Message-ID: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
References: <20220520135740.770801-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520135740.770801-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 97VwuyJ1trIla8lCMrkqG70btkD_-3d1
X-Proofpoint-ORIG-GUID: 97VwuyJ1trIla8lCMrkqG70btkD_-3d1
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

On Fri, May 20, 2022 at 03:57:40PM +0200, Uwe Kleine-König wrote:
> cs35l45_remove() always returns zero. Make it return no value which
> makes it easier to see in the callers that there is no error to handle.
> 
> Also the return value of i2c driver remove callbacks is ignored anyway.
> This prepares making i2c remove callbacks return void, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

The subject line needs fixed up but otherwise I think the patch
looks good.

Thanks,
Charles
