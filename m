Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173AC33B022
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 11:41:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA8E1779;
	Mon, 15 Mar 2021 11:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA8E1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615804883;
	bh=Uyt6dgshgP24UDwthHKY5wiMbQ7H8i9aHozjHvLd+1o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkdXIg3fB29MwlH/EFomFZ+ea7fTWZJGfLJmjBWUYYaA0dcfX5i7bqVXv9kw//Cq/
	 pGOJS1tTVmOiY2+EFOiN0Vh3r15E2fYFRZrNGedOIrzIKJHVPs5G7dhAzN4AVq5uxy
	 lIrRe3I5Z/ZeUh+IBNRsRcT5dWrYs2yfHmKOTTP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB9DF8013F;
	Mon, 15 Mar 2021 11:39:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76463F80171; Mon, 15 Mar 2021 11:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6868AF8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 11:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6868AF8013F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 420AA1F45CDA
Subject: Re: [PATCH 04/23] ASoC: cros_ec_codec: remove null pointer
 dereference warning
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
 <20210312182246.5153-5-pierre-louis.bossart@linux.intel.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <dd3fd255-4397-80d6-2114-3b37b5be5c08@collabora.com>
Date: Mon, 15 Mar 2021 11:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312182246.5153-5-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, Guenter Roeck <groeck@chromium.org>,
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

Hi Pierre-Louis,

Thank you for you patch.

On 12/3/21 19:22, Pierre-Louis Bossart wrote:
> Cppcheck complains of a possible issue:
> 
> sound/soc/codecs/cros_ec_codec.c:98:10: warning: Possible null pointer
> dereference: in [nullPointer]
>   memcpy(in, msg->data, insize);
>          ^
> sound/soc/codecs/cros_ec_codec.c:162:34: note: Calling function
> 'send_ec_host_command', 5th argument 'NULL' value is 0
>        (uint8_t *)&p, sizeof(p), NULL, 0);
>                                  ^
> sound/soc/codecs/cros_ec_codec.c:98:10: note: Null pointer dereference
>   memcpy(in, msg->data, insize);
>          ^
> 
> In practice the access to the pointer is protected by another
> argument, but this is likely to fool other static analysis tools. Add
> a test to avoid doing the memcpy if the pointer is NULL or the size is
> zero.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Looks good to me, so

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>  sound/soc/codecs/cros_ec_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index c4772f82485a..a201d652aca2 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -94,7 +94,7 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
>  	if (ret < 0)
>  		goto error;
>  
> -	if (insize)
> +	if (in && insize)
>  		memcpy(in, msg->data, insize);
>  
>  	ret = 0;
> 
