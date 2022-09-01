Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F075A8DAC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 07:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859EB15F9;
	Thu,  1 Sep 2022 07:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859EB15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662011520;
	bh=VToOtGZkWEKnScy2ZZ1IOUdUf/GFJ43GAbEBgO3Gq9k=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgTVkQUrOM6dmOIE2MA1b4hWy3R0/7rtRp7ivb0mvu/Drwqazq5hAIWjgU51ukbxM
	 ZeMuDwuxd9Vr54VY3bFso27E/pnXQpRNAj1fGNHTovgTp9ZDPd4h8YmC42feeN64lA
	 ag0q1WZF92BUIYRHU7qzoxio5Ys5ys43m9RNhA4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E342DF8026D;
	Thu,  1 Sep 2022 07:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DB3EF8026A; Thu,  1 Sep 2022 07:50:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7888F80128
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 07:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7888F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="HVjiu8HL"
X-UUID: d5e033cdd3684ef6a8a3a349e2dfb0a3-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3jwDwtX6F4rCwwUhi3QMvUmpST09gQMZ/BQ960QPQHw=; 
 b=HVjiu8HLF1X8G/hZFpXavsP9Zz9/H0A4Y1dC/9MS7Hf8rbvnDnP45AtLTYeRl8ohNKwWyNPC5eUYocFCQlRi81vs25lJ+ijfgov+cGl1YMiB/7Ib2E+WNS3tEIn5KoEI1kuZRDo6CXXbmvBMfjsYbHysV4NBBtHvt6euUBN06Pg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:5436e5da-3934-4055-b6ee-58da15a073b1, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:40
X-CID-INFO: VERSION:1.1.10, REQID:5436e5da-3934-4055-b6ee-58da15a073b1, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:40
X-CID-META: VersionHash:84eae18, CLOUDID:f728c720-1c20-48a5-82a0-25f9c331906d,
 C
 OID:0e48f824e4cf,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: d5e033cdd3684ef6a8a3a349e2dfb0a3-20220901
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 974378437; Thu, 01 Sep 2022 13:50:42 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 13:50:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 1 Sep 2022 13:50:41 +0800
Message-ID: <09f0c52d86155fd6617eec59c341c6cdd4aa5059.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 1 Sep 2022 13:50:40 +0800
In-Reply-To: <87sflcy1i8.wl-tiwai@suse.de>
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

The patch fixes this problem.
I tried it with "Product: Samsung USB C Earphone" and missing sound
problem cannot be reproduced.

Thanks

On Wed, 2022-08-31 at 15:40 +0200, Takashi Iwai wrote:
> On Wed, 31 Aug 2022 15:16:39 +0200,
> chihhao chen wrote:
> > 
> > Hi Takashi,
> > 
> > Yes no error reported and data on USB bus is also complete. (Use
> > USB
> > analyzer to collect packets on bus and check these data.)
> 
> Hm, then it has something to do with the device firmware side...
> 
> > I added delay right after find_substream_format() in
> > snd_usb_hw_params() as follows
> > 1. first time call snd_usb_hw_params(), do nothing
> > 2. second time call snd_usb_hw_params(), delay 150ms after
> > find_substream_format()
> > 
> > I tried to set snd_usb_use_vmalloc false but this problem still
> > happened.
> 
> OK, thanks.
> 
> On the second thought, it's good to split the existing endpoint setup
> to two parts, and apply the setups involving with the buffer
> allocation at hw_params while the USB interface setup is done at
> prepare.  It'll reduce the unnecessary buffer re-allocation, too, so
> I
> had such a change in my mind and already cooked some time ago.
> 
> Could you try the patch below?  If this actually helps for your use
> case, we should put more information about the good side-effect, too.
> 
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: usb-audio: Split endpoint setups for hw_params
> and
>  prepare
> 
> One of the former changes for the endpoint management was the more
> consistent setup of endpoints at hw_params.
> snd_usb_endpoint_configure() is a single function that does the full
> setup, and it's called from both PCM hw_params and prepare callbacks.
> Although the EP setup at the prepare phase is usually skipped (by
> checking need_setup flag), it may be still effective in some cases
> like suspend/resume that requires the interface setup again. 
> 
> As it's a full and single setup, the invocation of
> snd_usb_endpoint_configure() includes not only the USB interface
> setup
> but also the buffer release and allocation.  OTOH, doing the buffer
> release and re-allocation at PCM prepare phase is rather superfluous,
> and better to be only in the hw_params phase.
> 
> For those optimizations, this patch splits the endpoint setup to two
> phases: snd_usb_endpoint_set_params() and snd_usb_endpoint_prepare(),
> to be called from hw_params and from prepare, respectively.
> 
> This changes the operation slightly, effectively moving the USB
> interface setup again to PCM prepare stage instead of hw_params
> stage, while the buffer allocation and such initializations are still
> done at hw_params stage.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/endpoint.c | 23 +++++++++--------------
>  sound/usb/endpoint.h |  6 ++++--
>  sound/usb/pcm.c      | 14 ++++++++++----
>  3 files changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 0d7b73bf7945..a42f2ce19455 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -758,7 +758,8 @@ bool snd_usb_endpoint_compatible(struct
> snd_usb_audio *chip,
>   * The endpoint needs to be closed via snd_usb_endpoint_close()
> later.
>   *
>   * Note that this function doesn't configure the endpoint.  The
> substream
> - * needs to set it up later via snd_usb_endpoint_configure().
> + * needs to set it up later via snd_usb_endpoint_set_params() and
> + * snd_usb_endpoint_prepare().
>   */
>  struct snd_usb_endpoint *
>  snd_usb_endpoint_open(struct snd_usb_audio *chip,
> @@ -1290,12 +1291,13 @@ static int sync_ep_set_params(struct
> snd_usb_endpoint *ep)
>  /*
>   * snd_usb_endpoint_set_params: configure an snd_usb_endpoint
>   *
> + * It's called either from hw_params callback.
>   * Determine the number of URBs to be used on this endpoint.
>   * An endpoint must be configured before it can be started.
>   * An endpoint that is already running can not be reconfigured.
>   */
> -static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
> -				       struct snd_usb_endpoint *ep)
> +int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
> +				struct snd_usb_endpoint *ep)
>  {
>  	const struct audioformat *fmt = ep->cur_audiofmt;
>  	int err;
> @@ -1378,18 +1380,18 @@ static int init_sample_rate(struct
> snd_usb_audio *chip,
>  }
>  
>  /*
> - * snd_usb_endpoint_configure: Configure the endpoint
> + * snd_usb_endpoint_prepare: Prepare the endpoint
>   *
>   * This function sets up the EP to be fully usable state.
> - * It's called either from hw_params or prepare callback.
> + * It's called either from prepare callback.
>   * The function checks need_setup flag, and performs nothing unless
> needed,
>   * so it's safe to call this multiple times.
>   *
>   * This returns zero if unchanged, 1 if the configuration has
> changed,
>   * or a negative error code.
>   */
> -int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
> -			       struct snd_usb_endpoint *ep)
> +int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
> +			     struct snd_usb_endpoint *ep)
>  {
>  	bool iface_first;
>  	int err = 0;
> @@ -1410,9 +1412,6 @@ int snd_usb_endpoint_configure(struct
> snd_usb_audio *chip,
>  			if (err < 0)
>  				goto unlock;
>  		}
> -		err = snd_usb_endpoint_set_params(chip, ep);
> -		if (err < 0)
> -			goto unlock;
>  		goto done;
>  	}
>  
> @@ -1440,10 +1439,6 @@ int snd_usb_endpoint_configure(struct
> snd_usb_audio *chip,
>  	if (err < 0)
>  		goto unlock;
>  
> -	err = snd_usb_endpoint_set_params(chip, ep);
> -	if (err < 0)
> -		goto unlock;
> -
>  	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
>  	if (err < 0)
>  		goto unlock;
> diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
> index 6a9af04cf175..e67ea28faa54 100644
> --- a/sound/usb/endpoint.h
> +++ b/sound/usb/endpoint.h
> @@ -17,8 +17,10 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
>  		      bool is_sync_ep);
>  void snd_usb_endpoint_close(struct snd_usb_audio *chip,
>  			    struct snd_usb_endpoint *ep);
> -int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
> -			       struct snd_usb_endpoint *ep);
> +int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
> +				struct snd_usb_endpoint *ep);
> +int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
> +			     struct snd_usb_endpoint *ep);
>  int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int
> clock);
>  
>  bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index d45d1d7e6664..b604f7e95e82 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -443,17 +443,17 @@ static int configure_endpoints(struct
> snd_usb_audio *chip,
>  		if (stop_endpoints(subs, false))
>  			sync_pending_stops(subs);
>  		if (subs->sync_endpoint) {
> -			err = snd_usb_endpoint_configure(chip, subs-
> >sync_endpoint);
> +			err = snd_usb_endpoint_prepare(chip, subs-
> >sync_endpoint);
>  			if (err < 0)
>  				return err;
>  		}
> -		err = snd_usb_endpoint_configure(chip, subs-
> >data_endpoint);
> +		err = snd_usb_endpoint_prepare(chip, subs-
> >data_endpoint);
>  		if (err < 0)
>  			return err;
>  		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
>  	} else {
>  		if (subs->sync_endpoint) {
> -			err = snd_usb_endpoint_configure(chip, subs-
> >sync_endpoint);
> +			err = snd_usb_endpoint_prepare(chip, subs-
> >sync_endpoint);
>  			if (err < 0)
>  				return err;
>  		}
> @@ -551,7 +551,13 @@ static int snd_usb_hw_params(struct
> snd_pcm_substream *substream,
>  	subs->cur_audiofmt = fmt;
>  	mutex_unlock(&chip->mutex);
>  
> -	ret = configure_endpoints(chip, subs);
> +	if (subs->sync_endpoint) {
> +		ret = snd_usb_endpoint_set_params(chip, subs-
> >sync_endpoint);
> +		if (ret < 0)
> +			goto unlock;
> +	}
> +
> +	ret = snd_usb_endpoint_set_params(chip, subs->data_endpoint);
>  
>   unlock:
>  	if (ret < 0)

