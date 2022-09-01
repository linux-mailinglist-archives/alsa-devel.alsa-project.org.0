Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938E5A93E4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 12:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B691636;
	Thu,  1 Sep 2022 12:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B691636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662026865;
	bh=bbLz442SoxtdJa8cHzQDZPcOJ/kz07S6BEF8J467k0s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHFdecGrY1OGr8H2bTShg368XaY0paoSFmM34X2WKEVouaam5uSetAsFAUYqR3fIg
	 QKTA/Px6Pogzjf/XNOCqP5UAjBz+VOiqxBYGsROFtYTKg5NueR/IrIECXqya3qUHm8
	 f+f8VErmlWYNlR9YEIpsW8iQfHeUZj9RJvQsQkYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C3FF80236;
	Thu,  1 Sep 2022 12:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07928F8026D; Thu,  1 Sep 2022 12:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D359F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D359F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="QGEK8cVc"
X-UUID: e447045ac0af48e3a7de6c3143423295-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wZR/ww90URZqVVu7q0x3wb4fi/iMPn0m4CtLurivtCU=; 
 b=QGEK8cVcBzq2jw5WvRPZa8d+RMNYlQUZzJLCUJAk300pecH2EFFC2F7tl4Cift2VQ6xkaXm+2N+rpyhjOU+65kvmaroWNPoSduv6Oz/26YyLhh+Z/B6flZulH+eJDRe2kt4zeCHniPG+nxv7eHGWPlPNbSLu2D612LeItYBIV3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:29b3795f-2b83-4c16-88a6-d9c638d6bb8d, OB:0,
 L
 OB:10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Relea
 se_Ham,ACTION:release,TS:40
X-CID-INFO: VERSION:1.1.10, REQID:29b3795f-2b83-4c16-88a6-d9c638d6bb8d, OB:0,
 LOB
 :10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:40
X-CID-META: VersionHash:84eae18, CLOUDID:d687d020-1c20-48a5-82a0-25f9c331906d,
 C
 OID:742f3a144d18,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: e447045ac0af48e3a7de6c3143423295-20220901
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 685204100; Thu, 01 Sep 2022 18:06:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 18:06:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 1 Sep 2022 18:06:25 +0800
Message-ID: <204d18b345165560f23b3021dbdbc8e8e39c1674.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 1 Sep 2022 18:06:25 +0800
In-Reply-To: <8735dbh52h.wl-tiwai@suse.de>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
 <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
 <875yia87gu.wl-tiwai@suse.de>
 <737b992a1546486fa622c83831209f935e45ffd2.camel@mediatek.com>
 <871qsxxa6g.wl-tiwai@suse.de>
 <d161bc518a0313e807a6711150a5a259d93cae29.camel@mediatek.com>
 <87tu5sx2ih.wl-tiwai@suse.de>
 <f0ed9708c99cedd4c6c91c39e905dc7e03cc6bcb.camel@mediatek.com>
 <87k06owux0.wl-tiwai@suse.de>
 <5b47c3025fba9fd7b2156d1260962b1d67c1b2fa.camel@mediatek.com>
 <87sflcy1i8.wl-tiwai@suse.de>
 <09f0c52d86155fd6617eec59c341c6cdd4aa5059.camel@mediatek.com>
 <878rn3h6ra.wl-tiwai@suse.de> <8735dbh52h.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

I tested the patch and USB audio function works well.
(Start and stop playback more than 20 times with Samsung USB C
Earphone)

Thanks

On Thu, 2022-09-01 at 10:28 +0200, Takashi Iwai wrote:
> On Thu, 01 Sep 2022 09:51:37 +0200,
> Takashi Iwai wrote:
> > 
> > On Thu, 01 Sep 2022 07:50:40 +0200,
> > chihhao chen wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > The patch fixes this problem.
> > > I tried it with "Product: Samsung USB C Earphone" and missing
> > > sound
> > > problem cannot be reproduced.
> > 
> > OK, it's a good news.  I'm going to add more information to the
> > patch
> > description about the regression and submit the patch.
> 
> Could you check whether the below cleanup patch on top of the
> previous
> one doesn't break things?  I lightly tested on my devices and don't
> believe it would change the actual behavior, but just to be sure.
> 
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: usb-audio: Clean up endpoint setups at PCM
> prepare
> 
> This patch cleans up the superfluous checks and calls for setting up
> the endpoints at PCM prepare callback:
> 
> - Drop stop_endpoints() and sync_pending_stops() calls; the stream is
>   guaranteed to have been already stopped and synced at each PCM
>   prepare call by ALSA PCM core
> 
> - Call snd_usb_endpoint_prepare() unconditionally;
>   the check for endpoint->need_setup is done in
>   snd_pcm_hw_endpoint_prepare() itself
> 
> - Apply snd_usb_set_format_quirk() only when the endpoint is actually
>   set up (i.e. the return code from snd_usb_endpoint_prepare() > 0)
> 
> - Move a few lines back into snd_usb_pcm_prepare();
>   it's even easier to follow than a small useless function
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/pcm.c | 40 ++++++++++------------------------------
>  1 file changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index b604f7e95e82..4ed53a3dc922 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -433,35 +433,6 @@ static void close_endpoints(struct snd_usb_audio
> *chip,
>  	}
>  }
>  
> -static int configure_endpoints(struct snd_usb_audio *chip,
> -			       struct snd_usb_substream *subs)
> -{
> -	int err;
> -
> -	if (subs->data_endpoint->need_setup) {
> -		/* stop any running stream beforehand */
> -		if (stop_endpoints(subs, false))
> -			sync_pending_stops(subs);
> -		if (subs->sync_endpoint) {
> -			err = snd_usb_endpoint_prepare(chip, subs-
> >sync_endpoint);
> -			if (err < 0)
> -				return err;
> -		}
> -		err = snd_usb_endpoint_prepare(chip, subs-
> >data_endpoint);
> -		if (err < 0)
> -			return err;
> -		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> -	} else {
> -		if (subs->sync_endpoint) {
> -			err = snd_usb_endpoint_prepare(chip, subs-
> >sync_endpoint);
> -			if (err < 0)
> -				return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  /*
>   * hw_params callback
>   *
> @@ -640,9 +611,18 @@ static int snd_usb_pcm_prepare(struct
> snd_pcm_substream *substream)
>  		goto unlock;
>  	}
>  
> -	ret = configure_endpoints(chip, subs);
> +	if (subs->sync_endpoint) {
> +		ret = snd_usb_endpoint_prepare(chip, subs-
> >sync_endpoint);
> +		if (ret < 0)
> +			goto unlock;
> +	}
> +
> +	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
>  	if (ret < 0)
>  		goto unlock;
> +	else if (ret > 0)
> +		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> +	ret = 0;
>  
>  	/* reset the pointer */
>  	subs->buffer_bytes = frames_to_bytes(runtime, runtime-
> >buffer_size);

