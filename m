Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B4642C7A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C50417A7;
	Mon,  5 Dec 2022 17:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C50417A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670256283;
	bh=mqFOwbVppYAcW5Cn5xUKN/wnrwuAAExaAVEWq0H9axM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7a99NTqDXyRLZlL8GtiVAdprx0I9Mqnii4VoCLgMkM6uL3dqtPOSf/GxO44Z4Mxw
	 jpdUTXiPNkm3B5q/KgJKYXRKASm8yaErSuTbd2EX97493qIDoGy4iyPyutXyHaqEg0
	 QXSvJIvwhgP1i/hIYxE8XvQILf7Rl7QK4AOhMXIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A77F8047C;
	Mon,  5 Dec 2022 17:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77470F80236; Mon,  5 Dec 2022 17:03:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B6DF800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B6DF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="ANi23Bga"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5497B81134;
 Mon,  5 Dec 2022 16:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8930C433D6;
 Mon,  5 Dec 2022 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670256220;
 bh=mqFOwbVppYAcW5Cn5xUKN/wnrwuAAExaAVEWq0H9axM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANi23BgakNxd3FkjR7VfG4ohH47l8+R8mpEFenDtWCftg3MQQ6IopoRzje2nL+HiQ
 W/V3GUTObsYx+ERHGuN5QFLT8PU+TPVzYsCpUcCRWon3OTurNp0CBC//sQKoJd8wn0
 kpdJ4IXJQ8tNES9c4Tr4Ag8Zvf352rtyo6Fh3oJ0=
Date: Mon, 5 Dec 2022 17:03:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 5/6] ac97: make remove callback of ac97 driver void
 returned
Message-ID: <Y44WWZW5AK2q9s0q@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org,
 linux-hyperv@vger.kernel.org, mpe@ellerman.id.au, haiyangz@microsoft.com,
 linuxppc-dev@lists.ozlabs.org, decui@microsoft.com,
 alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org,
 christophe.leroy@csgroup.eu, bgoswami@quicinc.com,
 xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com,
 robert.jarzmik@free.fr, roger.pau@citrix.com
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

On Mon, Dec 05, 2022 at 11:36:43PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for ac97 bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  drivers/mfd/wm97xx-core.c  | 4 +---
>  include/sound/ac97/codec.h | 6 +++---
>  sound/ac97/bus.c           | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
> index 9a2331eb1bfa..663acbb1854c 100644
> --- a/drivers/mfd/wm97xx-core.c
> +++ b/drivers/mfd/wm97xx-core.c
> @@ -319,13 +319,11 @@ static int wm97xx_ac97_probe(struct ac97_codec_device *adev)
>  	return ret;
>  }
>  
> -static int wm97xx_ac97_remove(struct ac97_codec_device *adev)
> +static void wm97xx_ac97_remove(struct ac97_codec_device *adev)
>  {
>  	struct wm97xx_priv *wm97xx = ac97_get_drvdata(adev);
>  
>  	snd_ac97_compat_release(wm97xx->ac97);
> -
> -	return 0;
>  }
>  
>  static const struct ac97_id wm97xx_ac97_ids[] = {
> diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
> index 9792d25fa369..a26e9e0082f6 100644
> --- a/include/sound/ac97/codec.h
> +++ b/include/sound/ac97/codec.h
> @@ -62,9 +62,9 @@ struct ac97_codec_device {
>   */
>  struct ac97_codec_driver {
>  	struct device_driver	driver;
> -	int			(*probe)(struct ac97_codec_device *);
> -	int			(*remove)(struct ac97_codec_device *);
> -	void			(*shutdown)(struct ac97_codec_device *);
> +	int			(*probe)(struct ac97_codec_device *dev);

Why did you change this line?

> +	void			(*remove)(struct ac97_codec_device *dev);
> +	void			(*shutdown)(struct ac97_codec_device *dev);

And this line?

Don't change things that you don't describe in your changelog and that
are not needed for your change.

thanks,

greg k-h
