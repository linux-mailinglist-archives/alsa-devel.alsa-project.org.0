Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042391EBB1F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 14:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811301665;
	Tue,  2 Jun 2020 13:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811301665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591099230;
	bh=gC2vk0Pb00NEJSHQPqqexExqImVd4TR18xb6ohPnB6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqcKIxy+yQm/JnmXKwV/z26WU4H795OWj+T2oH7IstB34lpXxUUQIoa1TTMCgJNHf
	 t0hw+6RWPmLbkBdR4ALes5WH9x/BIEMliPyBMHUSKIWxYVvLnxsE8o0xtTH4+ejmc9
	 apcMHkC3fe+V8TOnc94LASIb/KPM9UWOT+pvvig0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F275F80272;
	Tue,  2 Jun 2020 13:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3610AF8013D; Tue,  2 Jun 2020 13:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62CA7F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 13:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62CA7F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="QpNkDy7B"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052Bq7Wd120971;
 Tue, 2 Jun 2020 11:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=aNv6a+hz4l28g6qWJSVKkz/V2Ftmd/MjF6txKFfaZjg=;
 b=QpNkDy7BTYR3eun59xAT7thNRgLIxrNmSq2DpH9MUJti5+RTwbxfh9tQikkZ4hy5g8SL
 jpLLt8/tCWg283CzUJuQb2C8vE9VdD3LF/sDtzRUq2m9k1RZHB3M7Av6mtmj/wLangdT
 mPrJIvttPcn7FrYpdPZd42CmqaZXUWhx6gJOX1e9Txy82xWc51BapAvuoUg0+vCuo0w2
 kd0bJgAG7HRACgzLskVH/P+KiRwKYnQwY/6gQggSmna8+bn2OiDNzg+NAjUhETyiOoAU
 DYOF92jHtAijnNuIiJpXt5reo4/H7+idAWttNTbcMn8D9L1ZwA0Rs1jz+KXmNw9mfmdp fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31dkrugnp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 11:58:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052BrxmZ020723;
 Tue, 2 Jun 2020 11:56:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 31dju19xwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 11:56:39 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 052BuPTJ008715;
 Tue, 2 Jun 2020 11:56:30 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 04:56:25 -0700
Date: Tue, 2 Jun 2020 14:56:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [RESEND PATCH v1 1/6] staging: greybus: audio: Update snd_jack
 FW usage as per new APIs
Message-ID: <20200602115617.GD30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=2 malwarescore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020084
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Jun 02, 2020 at 10:51:10AM +0530, Vaibhav Agarwal wrote:
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 08746c85dea6..ebf8484f0ae7 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -709,17 +709,29 @@ static struct snd_soc_dai_driver gbaudio_dai[] = {
>  };
>  
>  static int gbaudio_init_jack(struct gbaudio_module_info *module,
> -			     struct snd_soc_codec *codec)
> +			     struct snd_soc_card *card)
>  {
>  	int ret;
>  

No blank line please.

> +	struct snd_soc_jack *jack;

This code would be nicer without the "jack" pointer.  Just use
"module->headset_jack" directly so that it's easier to use grep on the
code.

> +	struct snd_soc_jack_pin *headset, *button;
> +
>  	if (!module->jack_mask)
>  		return 0;
>  
>  	snprintf(module->jack_name, NAME_SIZE, "GB %d Headset Jack",
>  		 module->dev_id);
> -	ret = snd_soc_jack_new(codec, module->jack_name, module->jack_mask,
> -			       &module->headset_jack);
> +
> +	headset = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
> +	if (!headset)
> +		return -ENOMEM;
> +
> +	headset->pin = module->jack_name;
> +	headset->mask = module->jack_mask;
> +	jack = &module->headset_jack;
> +
> +	ret = snd_soc_card_jack_new(card, module->jack_name, module->jack_mask,
> +				    jack, headset, 1);
>  	if (ret) {
>  		dev_err(module->dev, "Failed to create new jack\n");
>  		return ret;
> @@ -730,11 +742,21 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
>  
>  	snprintf(module->button_name, NAME_SIZE, "GB %d Button Jack",
>  		 module->dev_id);
> -	ret = snd_soc_jack_new(codec, module->button_name, module->button_mask,
> -			       &module->button_jack);
> +	button = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
                                           ^^^^^^^^^^^^^^^^
Use "sizeof(*button)".  It's the same size so it doesn't affect runtime.


> +	if (!button) {
> +		ret = -ENOMEM;
> +		goto free_headset;
> +	}

regards,
dan carpenter

