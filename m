Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA87A8E3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C4417D7;
	Tue, 30 Jul 2019 14:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C4417D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564490631;
	bh=aQExswWfSaVdE2e0ogBUmTn5sMXEEUGya/3nZIboPCY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzKLFkYtkblcoOzn8DPZ8jtUop3XqJpxdzFasNPFwRE8MdzpfPnphTY2HLwIwsgPB
	 3aOPLuojUeCgdA7b3mQ/gABPOz9dzDSXIGgaALwMFofNcy2rcujzD8S3BQcHZedVSa
	 jLHzDBXFgcnmshqW2gjdFPBj66QMZQ2SRQ8TZ+UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6F3F804CA;
	Tue, 30 Jul 2019 14:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 690E8F804CA; Tue, 30 Jul 2019 14:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 579EBF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579EBF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GW2kU84g"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6UCdccW014128; Tue, 30 Jul 2019 07:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Mrlv2PUoXkr+l4StNndTN+CgAg0kqXB7QvANfqsxeW8=;
 b=GW2kU84gJK5qWGjsOQ7EeUFRdlFcMil2qW3Ek5Fhfnco/Em5PxE//NTo5GGTK+/gK9ZR
 ihSHrZf1eb/GTA6ysppLmDUG6fPRK/Nv8D3iaIIzq78fc1tzqSzm8mJrEFlKd6GmkjIH
 wA+f90IYjd8Spj/1ZT5SWcc6RKQ3GPQFqES/m4qqXQZQbh+16xZu0bbmTocKcMuAGuai
 Yom15pOpF/ix7Rz1h4DwFjQcdtUwxsJjsgQWQe9MyxxoegbuTQwPmSGf4G++f759KQLk
 Q8MYW5+MnT0zTRe++1Mxiv9AFI3BZo5NXXLlaxURpnRvaCLHvBasZOEkmeEz3Rs0snx/ Cg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2u0k1qvm0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Jul 2019 07:42:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 30 Jul
 2019 13:41:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 30 Jul 2019 13:41:58 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91F4645;
 Tue, 30 Jul 2019 13:41:58 +0100 (BST)
Date: Tue, 30 Jul 2019 13:41:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730124158.GH54126@ediswmail.ad.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730120937.16271-4-thomas.preston@codethink.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907300133
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Marco Felsch <m.felsch@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Annaliese McDermond <nh6z@nh6z.net>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
	diagnostic routine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 30, 2019 at 01:09:37PM +0100, Thomas Preston wrote:
> Add a debugfs device node which initiates the turn-on diagnostic routine
> feature of the TDA7802 amplifier. The four status registers (one per
> channel) are returned.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
> Changes since v1:
> - Rename speaker-test to (turn-on) diagnostics
> - Move turn-on diagnostic to debugfs as there is no standard ALSA
>   interface for this kind of routine.
> 
>  sound/soc/codecs/tda7802.c | 186 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> +static int tda7802_bulk_update(struct regmap *map, struct reg_update *update,
> +		size_t update_count)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < update_count; i++) {
> +		err = regmap_update_bits(map, update[i].reg, update[i].mask,
> +				update[i].val);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return i;
> +}

This could probably be removed using regmap_multi_reg_write.

> +static int tda7802_probe(struct snd_soc_component *component)
> +{
> +	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = &tda7802->i2c->dev;
> +	int err;
> +
> +	tda7802->debugfs = debugfs_create_dir(dev_name(dev), NULL);
> +	if (IS_ERR_OR_NULL(tda7802->debugfs)) {
> +		dev_info(dev,
> +			"Failed to create debugfs node, err %ld\n",
> +			PTR_ERR(tda7802->debugfs));
> +		return 0;
> +	}
> +
> +	mutex_init(&tda7802->diagnostic_mutex);
> +	err = debugfs_create_file("diagnostic", 0444, tda7802->debugfs, tda7802,
> +			&tda7802_diagnostic_fops);
> +	if (err < 0) {
> +		dev_err(dev,
> +			"debugfs: Failed to create diagnostic node, err %d\n",
> +			err);
> +		goto cleanup_diagnostic;
> +	}

You shouldn't be failing the driver probe if debugfs fails, it
should be purely optional.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
