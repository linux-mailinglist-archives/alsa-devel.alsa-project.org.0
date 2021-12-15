Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EE4754E4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 10:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EAC18B7;
	Wed, 15 Dec 2021 10:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EAC18B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639559509;
	bh=BccsCNZFRF0CsfI4WzBKH2m0axY1DoB/ywm47nAS/9o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z48vE0LbEowvP/ZUscM0aU3OfKDoGTUePo6vykEencSko1CfkwXbreufaiz46hlma
	 aybmOHXAk3zdLcvyqj8Yqq0vJLWvk55JLY2YzlVRisKZedC5I1d/oLOU6olFsJR3Zc
	 1sagG2yJC1z38A5nD+Y+8r//mi+QNHXPIiZ9oEoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEC7F800EE;
	Wed, 15 Dec 2021 10:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EDEF805B0; Wed, 15 Dec 2021 10:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDE58F805AE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 10:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE58F805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QXRKjPHc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF6WFxZ014899;
 Wed, 15 Dec 2021 03:10:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yy0VBhIF+bsMnDA1PIVgbA1mUC91n6W7msOhRQXWw64=;
 b=QXRKjPHcMwa08ts72RJJrvGapn2gc58v6OFBHBTv1zdDzanZBNoYUVBaMSiLQGLVfKSJ
 J1p+oi/pk9J1yj9wf63yxCdcnUOPvevj3Xyg8vLqlL7qF9gIlpKUOaRjz0exEDXYjCLA
 E8EvDYQyY0kOEZW0x5GNxSDJKZ//fpwBhARrc1xspd7nSP1gVVKOh1QVncMjCITUZtBX
 Ouv30c+aSKvAeZx5UOHhxxwlDht5NDfm8HroBBf1Cx8C7ZfvBq+J0WUbBYt4YeWqCgxo
 9PAVMBSO1/nsQ3MoPO/y+eT8qWKqoWWIaPv5p+InCr/M56/WE5lT3DlLASqMgpGLsD0g IA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cxe2f229j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Dec 2021 03:10:33 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 09:10:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 15 Dec 2021 09:10:32 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3755745A;
 Wed, 15 Dec 2021 09:10:31 +0000 (UTC)
Date: Wed, 15 Dec 2021 09:10:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v4 03/10] ASoC: cs35l41: Move power initializations to
 reg_sequence
Message-ID: <20211215091031.GS18506@ediswmail.ad.cirrus.com>
References: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
 <20211214135959.1317949-4-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211214135959.1317949-4-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: xRcMeJr2XL4GQrasakDpaujII0yveUqZ
X-Proofpoint-GUID: xRcMeJr2XL4GQrasakDpaujII0yveUqZ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>
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

On Tue, Dec 14, 2021 at 01:59:52PM +0000, Lucas Tanure wrote:
> +	{ CS35L41_PWR_CTRL2,		 0x00000000 },
> +	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
>  };
> -	ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> -				 CS35L41_AMP_EN_MASK, 0);
> -	if (ret < 0) {
> -		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed: %d\n", ret);
> -		goto err;
> -	}
> -
> -	ret = regmap_update_bits(cs35l41->regmap, CS35L41_AMP_GAIN_CTRL,
> -				 CS35L41_AMP_GAIN_PCM_MASK, 0);
> -	if (ret < 0) {
> -		dev_err(cs35l41->dev, "Write CS35L41_AMP_GAIN_CTRL failed: %d\n", ret);
> -		goto err;
> -	}

Sorry for not spotting earlier but just noticed these two writes
are update bits, so you shouldn't just be setting the values to
zero in the patch you just want to clear the relevant bit.

Thanks,
Charles
