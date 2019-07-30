Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D87A877
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8F5617EA;
	Tue, 30 Jul 2019 14:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8F5617EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564489781;
	bh=PmDwWyTHig6QsjvbAxRS7tt+d7yJd6FM4HFpuYJkfwY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1Kb5hy5D/TlX4dI3uADv7umB7GtFHlrgJKG13+i1fHMiPQZfMT9EplBX5K1fhV5q
	 DhD19f2xMieVXmuub4nO2K4UX1dGKKkN4dw0mCXsIWP7xCqUlZuH7YVRGcZcKZtkqw
	 cWuoENp6B8MsQu0OyTJh+CrmyDJvMvuJ+YfJ5/jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E0EF80482;
	Tue, 30 Jul 2019 14:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B98F804CA; Tue, 30 Jul 2019 14:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD4FF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD4FF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WW27iPvG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6UCPbL5001281; Tue, 30 Jul 2019 07:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=pY3zCtDyo2UN0OhyrBjrLt7xNrI8TidRHw7Z/SoxObk=;
 b=WW27iPvGmca6/6RHRPK/lJRXcfi9WBFDVrdgvCdTiffzT8wuSG8QbF93YWX6sM7gm1aq
 rvpkB0RxNVL+b7GpnujcaK32Kteg6fClR0Ik/f9eCLdM8kPxXgw2hzyVcC1jKb1QAPSw
 kN8JUdfsG8nvjCfb0x1JXjoCzLx1NfLRD2zNacySmbjzuri1mf5R38vl3D567POpqX1K
 899bLpgZsM+k90VVHSeCO1ciXdm7oeeLyYkW7sgkDMVV3Ei3hd86ZgJpokbq2UhkLfVH
 gOfzSnkdTom8LBMlCkgYRTj/WkgS9dCubfnBs+MRjQwSPumnfduWbI6PvbtymZzPFSZy ag== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2u0k1qvkeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Jul 2019 07:27:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 30 Jul
 2019 13:27:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 30 Jul 2019 13:27:48 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B7C512A1;
 Tue, 30 Jul 2019 13:27:48 +0100 (BST)
Date: Tue, 30 Jul 2019 13:27:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730122748.GF54126@ediswmail.ad.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-2-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730120937.16271-2-thomas.preston@codethink.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907300130
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Marco Felsch <m.felsch@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 Nate Case <ncase@tesla.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Annaliese McDermond <nh6z@nh6z.net>, Rob Duncan <rduncan@tesla.com>,
 Patrick Glaser <pglaser@tesla.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 1/3] dt-bindings: ASoC: Add TDA7802
	amplifier
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

On Tue, Jul 30, 2019 at 01:09:35PM +0100, Thomas Preston wrote:
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Rob Duncan <rduncan@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>  .../devicetree/bindings/sound/tda7802.txt     | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tda7802.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/tda7802.txt b/Documentation/devicetree/bindings/sound/tda7802.txt
> new file mode 100644
> index 000000000000..f80aaf4f1ba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tda7802.txt
> @@ -0,0 +1,26 @@
> +ST TDA7802 audio processor
> +
> +This device supports I2C only.
> +
> +Required properties:
> +
> +- compatible : "st,tda7802"
> +- reg : the I2C address of the device
> +- enable-supply : a regulator spec for the PLLen pin
> +
> +Optional properties:
> +
> +- st,gain-ch13 : gain for channels 1 and 3 (range: 1-4)
> +- st,gain-ch24 : gain for channels 2 and 3 (range: 1-4)

I wouldn't have expected the gains to be available as a device
tree setting.

> +- st,diagnostic-mode-ch13 : diagnotic mode for channels 1 and 3
> +                            values: "Speaker" (default), "Booster"
> +- st,diagnostic-mode-ch24 : diagnotic mode for channels 2 and 4
> +                            values: "Speaker" (default), "Booster"
> +
> +Example:
> +
> +amp: tda7802@6c {
> +	compatible = "st,tda7802";
> +	reg = <0x6c>;
> +	enable-supply = <&amp_enable_reg>;
> +};
> -- 
> 2.21.0
> 

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
