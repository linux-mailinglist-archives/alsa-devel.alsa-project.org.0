Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3C43944E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10061684;
	Mon, 25 Oct 2021 12:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10061684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159388;
	bh=qK5iPOmjw93v7J/DlgXDkrrP1qoXZgKLAitX+B6PZsg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htVb1N5FFURUR3K86KX7GhREFK6DM2E6OZD70geoZuuwMZLkLV3JhlBx+DdANBlXS
	 foQk/nFJRVEZnu+aky70WOmC9atjRv8Zfxw2Q7GrcBZw6M+3deZ5TjBg/1uSVZyAOg
	 ymhGs8KggbAiiR/D4Sm1r9liM4Ta2W7yAA2aiIcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D92AF80086;
	Mon, 25 Oct 2021 12:55:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7896CF8025A; Mon, 25 Oct 2021 12:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 587FDF80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 587FDF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CozR/jTt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P5dtBj030691; 
 Mon, 25 Oct 2021 05:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=cjYwfQqH/Is43LNJNlCp3uLzRogL3Jui6unlyge0cz0=;
 b=CozR/jTtWhIUTFaJjPy5CAUb/vcu8QXRgi4olOdL6BaIFxlx+97cd4nPVJse/t121GHt
 +dhqHtCrntvTN5voxPDUQQCFzSirzgIhHpwoVQVDTWOSRKF2yvz+4A9nsxhUI/cWPf6m
 nJFpaVW0Mkgk2iTFOB7mtpkGQfik0s04uAVhwCieVQo2/FHBJTZYHE/gDRZcSQvdQYe1
 GcKSYHI25D7XPnG8pbmmsWyN2aoX4Nsy/6FpWZYG7KWFP/DdRV1crhj3BFKqi8X1pjO3
 tBAlBvSiUazZDrJQXY94EePOlTF557iWzFzgU27CszJdLRKOdIThZBa4h5SroTXdbcMB 5w== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bw93g0wj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Oct 2021 05:54:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 25 Oct
 2021 11:54:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 25 Oct 2021 11:54:55 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D08F511D2;
 Mon, 25 Oct 2021 10:54:55 +0000 (UTC)
Date: Mon, 25 Oct 2021 10:54:55 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoc: wm8900: Drop empty spi_driver remove callback
Message-ID: <20211025105455.GE28292@ediswmail.ad.cirrus.com>
References: <20211020125726.22946-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020125726.22946-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: eE3CdP2WlQfdWOS_M00GbWM1YU-_16Lb
X-Proofpoint-ORIG-GUID: eE3CdP2WlQfdWOS_M00GbWM1YU-_16Lb
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

On Wed, Oct 20, 2021 at 02:57:26PM +0200, Uwe Kleine-König wrote:
> A driver with a remove callback that just returns 0 behaves identically
> to a driver with no remove callback at all. So simplify accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
