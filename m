Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE10610DF0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 11:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE4B288B;
	Fri, 28 Oct 2022 11:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE4B288B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666951018;
	bh=Omhzpive90q/07PBpah3AFImepRCaZx1iNdUHUEipJ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAFVmZe0EOrENzl2cjvWX/6MbmtadpyotYaw25j4CjhABlAEmrciLQYzHqqIiRCm+
	 HYemRroFuTMFv0alZx0IuiJD//9mnw9WB0NaTiHpkSf+iNno0jasFROPWNS/bq2zGP
	 e9KRLoDlEB3GVESGxgDhZMHF01s/+ezuWtxSiZOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96412F804BD;
	Fri, 28 Oct 2022 11:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84014F8025A; Fri, 28 Oct 2022 11:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEB81F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 11:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB81F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OdwJ6B/x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S81dOv008832; Fri, 28 Oct 2022 04:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=mLLlKGaSg8bfJMwpwLDRI2y+lZnMRSiCP58wvZJft5w=;
 b=OdwJ6B/x5AElXSUaPjRCW3vGA8sNpMltLoCxHHXamjHlgD7t0EnO80PEc5RRI9RVjIxP
 RoVOo9dx3VXsEsQBRxQj5KwWmjEBj1smHvtKWAj4YT7PwjT4foz5PvPWaIG0TX9Ob9H/
 INcImWicjStgg6he6OTSkEWsjyXSvMF1PEtWhOBSvtxIlvYqlcmpk89upj7+Bodq6DKZ
 sBwKBSNnMb8XnfzTdsosNgSc6dh2TUBO2UNoWdpt0cUd07R/+amIR4MpId32jqtL8PSb
 fFIMcZQIixTBfuigmcXAR/8UMXybm0LXuSXciyMfD68Ih+a/BIWvthhpSHAsh8Vi2FT0 fw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kfajn270j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:55:56 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 28 Oct
 2022 04:55:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 28 Oct 2022 04:55:54 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9E00C478;
 Fri, 28 Oct 2022 09:55:54 +0000 (UTC)
Date: Fri, 28 Oct 2022 09:55:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Peter Bergin <peter@berginkonsult.se>
Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c.c: add module device table for of
Message-ID: <20221028095554.GG92394@ediswmail.ad.cirrus.com>
References: <20221027115057.442925-1-peter@berginkonsult.se>
 <20221028075045.493191-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221028075045.493191-1-peter@berginkonsult.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: gw3o-ik66YAcJDoBPu-y-Idi4u5gg213
X-Proofpoint-ORIG-GUID: gw3o-ik66YAcJDoBPu-y-Idi4u5gg213
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, broonie@kernel.org, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

On Fri, Oct 28, 2022 at 09:50:44AM +0200, Peter Bergin wrote:
> Matching of device in cs42xx8_i2c_probe() is coded with inspiration
> from tlv320aic32x4-i2c.c.
> ---
> +	if (i2c->dev.of_node) {
> +		const struct of_device_id *oid;
> +
> +		oid = of_match_node(cs42xx8_of_match, i2c->dev.of_node);
> +		if (!oid)
> +			goto err_not_found;
> +		drvdata = (struct cs42xx8_driver_data *)oid->data;
> +	} else {
> +		const struct i2c_device_id *id;
> +
> +		id = i2c_match_id(cs42xx8_i2c_id, i2c);
> +		if (!id)
> +			goto err_not_found;
> +		drvdata = (struct cs42xx8_driver_data *)id->driver_data;
> +	}

Be worth noting a little more explicitly in the commit message
you updated this logic as part of the move. I would even be
tempted to put it as a separate patch personally.

> +static const struct cs42xx8_driver_data cs42448_data = {
> +	.name = "cs42448",
> +	.num_adcs = 3,
> +};
> +
> +static const struct cs42xx8_driver_data cs42888_data = {
> +	.name = "cs42888",
> +	.num_adcs = 2,
> +};

It is probably better to leave these two structures exported from
the primary module. These devices could technically have SPI
support added in the future and it might as well reuse these same
data structures.

Thanks,
Charles
