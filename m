Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A769186E55
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 16:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FC2118C9;
	Mon, 16 Mar 2020 16:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FC2118C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584371563;
	bh=RJVuQijp0Trv5fSYJoNU1v+VwlZG/JNGeS3CFtfNOZ0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AURfNYc9GYD6DF/KSyj5IiFBrNXhu7Q6+LlsL0Q4F69daepbAs4aZuZxtBqhG+86G
	 bAElTKISr+0c3guZnXbzUMNxYrJqPIVXgH6FXpTzSuAD0ntjGcsA9UmwNBKB0VyNI1
	 9+1C9PdVnUYcNOZv/7l2LaBU4DFYu5iAe7JSFPbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD9DF80162;
	Mon, 16 Mar 2020 16:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C91D9F8015B; Mon, 16 Mar 2020 16:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F28F80058;
 Mon, 16 Mar 2020 16:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F28F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="b++ZZHJy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=39LiRtTwaomtR/iSIbjqK3NVuP51oEa0UEvTzpvix7o=; b=b++ZZHJygdwGe30+6G737zQFC0
 63BUd9Ka3v7yI6kkr0xVVXCoK8Y3G1NWgjvefBtQ0/wbiC4x9FuJfA9y5wpNGLzOJdpRtdBBfKGC3
 5Wu6L2F8Wa36xCbgMcItOqdOpaEJJDZ+NZG6Gi83+Ew8Gedgh6z7haPpq4IU8wsbry5YNw/fFBEw7
 OlnAdh9enfZjC0bbjXxm4er1N8yIONcNhXMmpR9q39Vmg1Cpzhntkpx4HqC85v6nJulVri7K638VY
 Ucw2yEnyUu0uED6R5IJB2tnzjWCrq3JIU1fJbrbVe5O6iRxx1ZWmWHM2uGH9vrj0CWFU0adC5xOzc
 72c65vqg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jDrOD-0006uo-Ix; Mon, 16 Mar 2020 16:10:49 +0100
Received: from [93.104.121.61] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jDrOD-000FXy-4l; Mon, 16 Mar 2020 16:10:49 +0100
Subject: Re: [PATCH v2 2/2] ASoC: fsl: Add generic CPU DAI driver
To: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, peter.ujfalusi@ti.com, broonie@kernel.org,
 linux-imx@nxp.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
 <20200306111353.12906-3-daniel.baluta@oss.nxp.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <e00e3fe1-7e87-e9c5-7c53-50ac6fa991e7@metafoo.de>
Date: Mon, 16 Mar 2020 16:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306111353.12906-3-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25753/Mon Mar 16 14:05:55 2020)
Cc: Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On 3/6/20 12:13 PM, Daniel Baluta wrote:
> +static int fsl_dai_probe(struct platform_device *pdev)
> +{
> [...]
> +	ret = of_property_read_u32(np, "fsl,dai-index", &dai_index);
> +	if (ret) {
> +		dev_err(&pdev->dev, "dai-index missing or invalid\n");
> +		return ret;
> +	}
Maybe this can follow a more standard approach using DT aliases. Just 
like we assign IDs to things like SPI or I2C masters.
> +
> +	fsl_dai.name = dai_name;
This breaks as soon as there is more than one DAI in the system since 
you are sharing a global struct between them.
[...]
