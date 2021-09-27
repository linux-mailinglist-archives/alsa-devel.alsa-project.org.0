Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB341923E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 12:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD68167A;
	Mon, 27 Sep 2021 12:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD68167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632738714;
	bh=TC/UWkHIZmg3a1d7UnMvZIon/9VJpd8xqODBMercj/4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C60sMYR9RLXP71ihgwotIR5X9Z0pExMTRcicGSH1m+O0zPCtX15ffX3HBSnyMG92P
	 8RRXfISDi+RwMZoBNorY6xqQHlX05y6RlSNKlqvIyJfkFOLLDavVB2Tqw2wiT5WqCj
	 x0jfjRzmYaKblYXuz7wGpIEk6FSRjWVwTD6TfrT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92F5F80227;
	Mon, 27 Sep 2021 12:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26AB3F8026D; Mon, 27 Sep 2021 12:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97F93F802C4
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 12:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F93F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Nc1ZCD+Q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R5VmC8014488; 
 Mon, 27 Sep 2021 05:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=FRJouVbd/qqTQZ9lTF/sMzBW1B4pIoOYcLmRmUZMPBE=;
 b=Nc1ZCD+QGRW5WKlonXa4WG5ZYP6sOeI4N7RkIF5hfMqFMkc2wFr1IriL7shGR6idgILm
 cgp8UkflVVQ6vpMevGDwlqEwYzm3k+kZ28DTY4T8R7zf+xQpszpRLl5+znELIsjre76D
 N8DiY8tT29RmnqrsVcdmVTQmwBVrOmGf9IrSey/UEyJOiFwuA/IR0uAQM38CQHr7dDoG
 0E56FMaRKPWTpoklu+CDu4MCKmEt3AzoTkg1y69MCt/ZJOJijzfs4bC9ofrELZnJ8Srq
 /l9wrRy/4MXnMjXOcChOQs5UTUNZdn7oOnoRAQQ8R56OVOJP+aAanCRUxpZbdWhpN4A0 nw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3barbh8t6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Sep 2021 05:29:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 27 Sep
 2021 11:29:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 27 Sep 2021 11:29:50 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 11B13B10;
 Mon, 27 Sep 2021 10:29:50 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:29:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs4341: Add SPI device ID table
Message-ID: <20210927102950.GF9223@ediswmail.ad.cirrus.com>
References: <20210924194844.45974-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210924194844.45974-1-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 6sbBsaRO8EoHJZSBGJItRc4Rotf4q0Gg
X-Proofpoint-ORIG-GUID: 6sbBsaRO8EoHJZSBGJItRc4Rotf4q0Gg
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, Sep 24, 2021 at 08:48:44PM +0100, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding SPI IDs for parts that
> only have a compatible listed.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: patches@opensource.cirrus.com
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
