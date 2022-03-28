Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8D4E919C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 11:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5661753;
	Mon, 28 Mar 2022 11:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5661753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648460535;
	bh=1Ryw3lrX5C0drtXcPv5JPWPQ2i2MhI6e7xkDbV4EUhU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/ClFM9OrrwR1JU1wk2yTcMlVol9BxFmwbH3MKujNLX7Lll9aXFCXFlyfpzbbA8Wz
	 W/vUw0+GGkXpIpOlSI0JoPJkpbnErkpjDnoUUvPyIzbLw36rbCYGcVBxrXEg4zos14
	 4Y/JamRONachKDzpCNk5OxewuDJ/LLFlcVrhGlEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC7DF800FA;
	Mon, 28 Mar 2022 11:41:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1638F804CF; Mon, 28 Mar 2022 11:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 911B3F80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 11:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911B3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ml9lNJ6Q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AHq2030601;
 Mon, 28 Mar 2022 04:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=k+KvFRV9XtLBVAPXFdNjChxgxfRZJVq8NHSeqtG5GO8=;
 b=Ml9lNJ6QuR/8qhIMdI7MimU8WPV8m7OdMNgLs89aWRMrlneR8SFwPcvqlnecQrdNiC7Q
 uBb8PfBSIJGtkoLlXSqlxdR24ZpVUDGKR9w9/zdqhB9FdjSS7efJD4CAWBpsuYyRnFJ8
 y6HZ0iwpXKCx4fKN3EIINO7FmG1wmbdvov3x+vV4uZPsBZXKDF5hU+LyK18yA4iXGntL
 S68gNNGWLtZeBLZs4yZenshKcz4RotwGa1JDTtNfA+6NoyG0b5hYnchF0BFg+NAxm6yI
 V+WeasmiLBIjWYBG8MdL3N5c0HVL5JtRhCr64/yX3D2k0IObwswVrar6k2cWwWLc1mLR Jg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081ag2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 04:40:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 10:40:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 10:40:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 809AF46A;
 Mon, 28 Mar 2022 09:40:47 +0000 (UTC)
Date: Mon, 28 Mar 2022 09:40:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 4/7] ASoC: wm8731: Factor our MCLK and mutex
 initialisation
Message-ID: <20220328094047.GX38351@ediswmail.ad.cirrus.com>
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-5-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220325153121.1598494-5-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: HKwspA8PzbaAnYpimNzqbV3k1wWojoOU
X-Proofpoint-GUID: HKwspA8PzbaAnYpimNzqbV3k1wWojoOU
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

On Fri, Mar 25, 2022 at 03:31:18PM +0000, Mark Brown wrote:
> The code for initialising the MCLK and mutex is identical in the I2C and SPI
> probe functions so just move this out into wm8731_init().
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
