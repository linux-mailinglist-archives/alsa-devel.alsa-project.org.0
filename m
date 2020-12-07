Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A532D0E02
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 11:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FBD1758;
	Mon,  7 Dec 2020 11:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FBD1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607336997;
	bh=6Q0WVCoQMTBf3UO/CVtXbsOxarSaWbtHV1qOEmQjJOI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtSKvCZoLtpgkWq96mGBKUlxzlX3KBCheu+S/myORCMipZ5LIrgFo7VKYsVh4Nhku
	 pQXqIW1UlleA13vZuurvk0pqEkS2AtW4M4OfO5VWr7M/qZeEW98kKECAqPZE+k68qZ
	 4YOU1ZIObC/LDb7Kl4A8AJnZWi2ojOtLh2PDlfjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C5F0F80217;
	Mon,  7 Dec 2020 11:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BB5CF8020D; Mon,  7 Dec 2020 11:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C504F801D8
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 11:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C504F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aOOduUhP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B7AS8LC006807; Mon, 7 Dec 2020 04:28:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JUbfJjz4AGPwf9hQdds0f883dZueNLcW4UKMQzpl9l8=;
 b=aOOduUhPJ8venksBSXuuai+y1pi/0ejpzlmTStUYFP70X9VX6GCsfth9Ycxz5/wnY79b
 rCG5JkZQ0hVAgjyMaISOc3MSFQ94FrGJMvvoMgWFQL3whn+8ph72zztFKjUw3O9ny9DW
 9evmSY3pExUeCn1ulGxNYdm5Pe9Eyl1671Q0+8SHNE1KbbOzADUY+Po8pcKb1kdS+tmt
 0WXd2cw9WJmAB6WkSsNu9PFhfLNmlscRCTHpHV0/Kf3x9I8EU7l0name1nABP4+tPY8V
 X1EQSv3ym1rd+ywCVFnf+a91a793XKgEavlxx210HPcRBjzfbdL3EnLXuasb7zPMeToO WQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3588g79s8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 07 Dec 2020 04:28:08 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 7 Dec 2020
 10:28:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 7 Dec 2020 10:28:05 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D6EA145;
 Mon,  7 Dec 2020 10:28:05 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:28:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Lukas F. Hartmann" <lukas@mntre.com>
Subject: Re: wm8960: add DAC Slope switch
Message-ID: <20201207102805.GH10899@ediswmail.ad.cirrus.com>
References: <20201124172313.981552-1-lukas@mntre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201124172313.981552-1-lukas@mntre.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=711 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070066
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Nov 24, 2020 at 06:23:13PM +0100, Lukas F. Hartmann wrote:
> The WM8960 DAC has a "DAC Slope" switch that can toggle between two
> different output filter curves. This patch adds support for it.
> 
> Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
> ---
> +static int wm8960_put_dacslope(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
> +	unsigned int val = ucontrol->value.integer.value[0];
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	wm8960->dacslope = val;
> +
> +	return snd_soc_component_update_bits(component, WM8960_DACCTL1,
> +				   0x2, val<<1);

Is the DAC Slope switch not in DACCTL2?

Thanks,
Charles
