Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC29213694
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25DC16D0;
	Fri,  3 Jul 2020 10:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25DC16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593765619;
	bh=jrBspJC2WXk1X2/EEawRdXBfqnG9gfKlprvVsYBqqQ0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4H8c8UqwmIEbGKvIJpfUMmJ8BDlXD1eVy7wghUwPYOKNOA5rzP6Ni1btY6TDMA2R
	 H1bMt7Igiulssms5ja/4XThd6SJEeDiElv40ljYcCgSS5HK1i1mUg62zjCJ9kPeDRi
	 wchWc9v6jzA2s5981oqDmCGYCZcRcBufvXYqO4Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D04B7F8020C;
	Fri,  3 Jul 2020 10:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7717F80217; Fri,  3 Jul 2020 10:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9472F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9472F800E2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 820C12A62F6
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
Date: Fri, 3 Jul 2020 10:38:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703071913.2358882-1-yuhsuan@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Hi Yu-Hsuan,

Thank you for your patch

On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> Log results of failed EC commands to identify a problem more easily.
> 
> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the result
> has already been checked in this function. The wrapper is not needed.
> 

Nack, we did an effort to remove all public users of cros_ec_cmd_xfer() in
favour of cros_ec_cmd_xfer_status() and you are reintroducing again. You can do
the same but using cros_ec_cmd_xfer_status(). In fact, your patch will not build
on top of the upcoming changes.

> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 8d45c628e988e..a4ab62f59efa6 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
>  	if (outsize)
>  		memcpy(msg->data, out, outsize);
>  
> -	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
> +	ret = cros_ec_cmd_xfer(ec_dev, msg);
>  	if (ret < 0)
>  		goto error;
>  
> +	if (msg->result != EC_RES_SUCCESS) {
> +		dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> +			msg->result);
> +		ret = -EPROTO;
> +		goto error;
> +	}
> +
>  	if (insize)
>  		memcpy(in, msg->data, insize);
>  
> 
