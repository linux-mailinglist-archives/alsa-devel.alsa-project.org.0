Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20740481257
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 12:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9A41758;
	Wed, 29 Dec 2021 12:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9A41758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640778910;
	bh=I9eox5J4qO+63iiFqIySoQ/xtlEdKbiNBRxjvggKSuk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cx00/S6+26ygRopRUHzgx3WgRLUeJN9b433wsPWS8LaEu9AIC8eTRzuYYrn6nC5PL
	 fIL8zids4kTS5dHHzMEFgduPN11zai5Q9Zhw+lEAI66fKbVnyDvtMvyi+TFBoOfOds
	 p84+rI7Jx5gvUiRYs99rHRt4/neJS0NUwyD1oEcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D967F800F8;
	Wed, 29 Dec 2021 12:54:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954EEF801EC; Wed, 29 Dec 2021 12:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B0AF800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 12:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B0AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KMxN5GVt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BTBRlhj001503;
 Wed, 29 Dec 2021 05:53:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=7Qa8V9K8D+0Yt6kcaD6qmRxQyyObzIT8CK7c5EoWk0Y=;
 b=KMxN5GVtwf3vp5DP6YMzRnuzhGICsG3UZuqHShPgLVHFa9Qse4ZsTMvS1Xc4vuF05SXt
 TTDMMSfpvjUpxnKc+ac3u4k/SxYm0YU83wCNo2z8OFVIx1v7PdqMUpPYhwLPkJORfPbe
 cvHSL7XRBjOHakP8YwGqgAY1Z2CGKTUp9iWunYGr1mBel5eU9g9k/cv2ipGTFa2lN2PJ
 uWBczYhVtYSEAnbugvRJfegrqkG3sut90nQp8bb2hMf2XupVTwbt73BrXFDtyJhzzRf+
 rYfRf8kLj0vOjmLfwzqyFeTCKDK0TEDTjPB1ctX/1CgCTPBBfwuW/d8tv79VtxrIXrZ0 VQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3d7c57207n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Dec 2021 05:53:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 11:53:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 29 Dec 2021 11:53:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 04D5E11C7;
 Wed, 29 Dec 2021 11:53:53 +0000 (UTC)
Date: Wed, 29 Dec 2021 11:53:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
Message-ID: <20211229115352.GA18506@ediswmail.ad.cirrus.com>
References: <20211229114457.4101989-1-festevam@gmail.com>
 <20211229114457.4101989-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211229114457.4101989-2-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: LtaPpNIO7WFlZIDI-C2tNQITJFrm-vE7
X-Proofpoint-GUID: LtaPpNIO7WFlZIDI-C2tNQITJFrm-vE7
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Paul.Handrigan@cirrus.com, james.schulman@cirrus.com
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

On Wed, Dec 29, 2021 at 08:44:56AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, the reset_gpio polarity handling is done backwards.
> 
> The gpiod API takes the logic value of the GPIO, not the physical one.
> 
> As per the CS4265 datasheet:
> 
> "When RESET is low, the CS4265 enters a low-power mode and all
> internal states are reset"
> 
> If a devicetree describes reset_gpio as active-low, the correct behaviour
> would be to retrieve the GPIO and put in its active state (GPIOD_OUT_HIGH)
> and then move it to its inactive state so that it can be operational
> (logic level 0).
> 
> Fix it accordingly.
> 
> Fixes: fb6f806967f6 ("ASoC: Add support for the CS4265 CODEC")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Newly introduced patch.
> 
>  sound/soc/codecs/cs4265.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
> index b89002189a2b..294fa7ac16cb 100644
> --- a/sound/soc/codecs/cs4265.c
> +++ b/sound/soc/codecs/cs4265.c
> @@ -590,13 +590,13 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
>  	}
>  
>  	cs4265->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
> -		"reset", GPIOD_OUT_LOW);
> +		"reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(cs4265->reset_gpio))
>  		return PTR_ERR(cs4265->reset_gpio);
>  
>  	if (cs4265->reset_gpio) {
>  		mdelay(1);
> -		gpiod_set_value_cansleep(cs4265->reset_gpio, 1);
> +		gpiod_set_value_cansleep(cs4265->reset_gpio, 0);

Hmm... I might defer to Mark on this one. I totally agree your
new code is more correct, however, I would have a slight worry
about existing device trees not correctly specifying the GPIO. As
in if existing systems had been specifying the GPIO correctly
they are presumably currently broken. But I am not sure what the
obvious solution would be, and I don't really have a good feel
for how widely used this part is.

Thanks,
Charles
