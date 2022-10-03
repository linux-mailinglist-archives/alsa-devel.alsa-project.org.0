Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C29835F2EA7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614AF2113;
	Mon,  3 Oct 2022 12:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614AF2113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664791960;
	bh=UXR58j7+XfGM08i6tAoB29i0OONnhVnnJV5zPwDCwLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b5XdTlzYmh1dm+W8GLuU3c3HkDTF8fbz2NlURAjuby0vL8sYS9QWJLY5aT5qIQg+F
	 CLHpCJRzmQi0dOVnhTWa9cIaqXLo8Z1B7sdF1lBG5gPWc2xPWNVa1rcbRrN32dww0n
	 xfoIvA4nZ8lOp5/PmOj1Wi8zl8kC8A78fkzqEp58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FA9F804E4;
	Mon,  3 Oct 2022 12:11:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 525A7F804D1; Mon,  3 Oct 2022 12:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5628DF800B5
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5628DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dvS5GR1e"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2933mfth015208;
 Mon, 3 Oct 2022 05:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=BLrL6cQ0hdXKIhChelZBHREsS2bYKLFiECIZnKsuyiA=;
 b=dvS5GR1eSzs/pIIF1CU7glrkYyeqmp12EpsL4b2Jrp0krw8YARuqW80Em9SJ1JMLkdSd
 7A5cb7TyG6nZUvzOgNCdnBF1YYcWzLYaAFIMg37XR7gysAifige1dB7IJ6bzTvT6csoL
 G7ILjmm+qPJd545h88myane9LXp3v04h23M2c4hrDp3jGJH72yEproZEvejyK+tbNges
 jdC/i2GKq9JW17weIZ4SmIW2m7ruQUAfVK6dVLiAPLRvAzDeIsGj1sthObFA91jvLvjI
 crkUwNn1BatGRcbFxBFybORH4tRMRMJBQuh4yQPjIP5gBAhIseecnKLoPHcCrTpAOC6Y Fg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jxjy321pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:11:24 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:11:22 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 3 Oct 2022 05:11:22 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2AC6F475;
 Mon,  3 Oct 2022 10:11:22 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:11:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH v2 2/3] ASoC: wm8961: add support for devicetree
Message-ID: <20221003101122.GZ92394@ediswmail.ad.cirrus.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
 <20221003032414.248326-3-doug@schmorgal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221003032414.248326-3-doug@schmorgal.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: r7iQw3NSaPSIxmPf1TqWG5XbDpO7jJ3Y
X-Proofpoint-ORIG-GUID: r7iQw3NSaPSIxmPf1TqWG5XbDpO7jJ3Y
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Sun, Oct 02, 2022 at 08:24:13PM -0700, Doug Brown wrote:
> Add support for devicetree to the WM8961 driver so it can be used with
> modern DT-based kernels.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
