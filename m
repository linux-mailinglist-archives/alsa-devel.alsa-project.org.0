Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54596309651
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 16:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD409175F;
	Sat, 30 Jan 2021 16:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD409175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612021335;
	bh=Rn1JwvfIJ8+emT53N0pWz2SeYzr13rjKVdYE3RSQaM8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mrxic/X8Cru4tGotCROym29/vgyHEWa8j8WCpL3lQJ4BjJVOkOjMZkL47UdcBUeHL
	 tU0dRrNfuOX2q5cnQW+QzDwwChF94DdO+ZcHNXY+4KIdwG2rUShJEmSHZRk9VAFuE0
	 Yv/p7f2ekoX9hR1VCpsxFH3rB2dAq4dKCx0CgJiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E5CF801D8;
	Sat, 30 Jan 2021 16:40:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AB8F8015B; Sat, 30 Jan 2021 16:40:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9463AF80143
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9463AF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ML+vAnMg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10UFcP5g019246; Sat, 30 Jan 2021 09:40:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/lnEmValmQ7Y9KsRET+FL5rf0WEEAzclRUoqWcNcwAs=;
 b=ML+vAnMghRRPyPTuzLQn8Agh7DkJmjsaUfqbdNVt0u1LmQPS3Qss7cslGxEfUpwJAbuI
 AIbxrW8vOc3cTDSu8/RHtpDRTWXio9/eW27JVMEarVzF1d8ec09kAB6f3SAtNTejkwOh
 zX/EvpE0M70pqLAardP9ofehrINY/oWtztbupLGYUbtOyrNNXrO0JtvAYlnPriN2kk5W
 Vym5Occd993B/dYpZH3y3rHJw2L/ZS9LIHUB4QHRomtY2huBJ4oLAwLKLFbdEUjKNlGY
 J9+x5f2o3gFFf19m9topJifSC/2tamH3JfUM9zgRmN1GRcDIpKxrjQuHinNq7JFJGYNq FQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36d4rtg6c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 30 Jan 2021 09:40:37 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 30 Jan
 2021 15:40:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sat, 30 Jan 2021 15:40:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 95EEC11CC;
 Sat, 30 Jan 2021 15:40:35 +0000 (UTC)
Date: Sat, 30 Jan 2021 15:40:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 13/13] ASoC: Intel: bytcr_wm5102: Add jack detect
 support
Message-ID: <20210130154035.GX106851@ediswmail.ad.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121720.79863-1-hdegoede@redhat.com>
 <20210123121720.79863-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123121720.79863-4-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101300086
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Sat, Jan 23, 2021 at 01:17:20PM +0100, Hans de Goede wrote:
> Add jack detect support by creating a jack and calling
> snd_soc_component_set_jack to register the created jack
> with the codec.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> +static struct snd_soc_jack_pin byt_wm5102_pins[] = {
> +	{
> +		.pin	= "Headphone",
> +		.mask	= SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin	= "Headset Mic",
> +		.mask	= SND_JACK_MICROPHONE,
> +	},
> +};
> +

This patch looks fine to me, but I did have one small question.
What is the thinking behind punting this to the machine driver?

I guess you can not register it if there is no jack present
on the board, or if you have multiple jacks name them
meaningfully. Although I sort of feel like those applied to
the old extcon approach that just internally registered all
the interfaces.

But to be clear not asking for any changes just more about trying
to refine my understanding of things.

Thanks,
Charles
