Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633539CBD7
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 02:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABAE21673;
	Sun,  6 Jun 2021 02:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABAE21673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622939273;
	bh=tCrSqX/crYonbKc9wQZQ+JdHE/gGLgOKoQ/cOhLR4xw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ACzorpwr1uqsfl1LEhFq9hVGpPDNH4Tjx5jwI4TL7nOp//d1m1TFOwcBBIn16i4w7
	 82idofZtwdL9YvPSeqcVdeL7hB1LOQa0BzjvP3viCoLZ6vy065WuZWCGDRhXC1bb7q
	 ndPO4VVJMyFq4KUFVYX3eue8nxSdMVKqYivshSxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE45F80254;
	Sun,  6 Jun 2021 02:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB28F80253; Sun,  6 Jun 2021 02:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31241F80103
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 02:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31241F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TW0W/YSF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PaIu85df"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7B1EF1605;
 Sat,  5 Jun 2021 20:26:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 05 Jun 2021 20:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Nsy7FBok3E07qQqMA7OkliRXpBi
 ITK1Kz/IxExHgNs0=; b=TW0W/YSFl8div1hslQekdgqt4a6LydIpFQ7Tr6cf+k5
 AMOCFEs05NpDWYn5qyziC4+eByk8to6zjXGxuDPydN5okl2VogmsXDnlwgZP8BFn
 /Tfx3JZHz2P5mKvUvC1a4CMTK4+WkgpDZAZySj8G2npKtMAqrCW9kuNDL9CtnJGI
 uwwxQJNoF82zxBSbaKCslf90IabLQu/r26Arc/UHfNS3O4Aq9GQ4RxqoI4TUc+Kg
 WwDvZqWW1Jre7Ih8vwd0UnNZI5QgrmH22mwZuHbQ5w2fE8tjOILnBlHdrcRBAqWj
 PVfuq9yy3Kb5ZNVDlZS8/pcfP7AoRJSSRix8EWhsiog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Nsy7FB
 ok3E07qQqMA7OkliRXpBiITK1Kz/IxExHgNs0=; b=PaIu85dfGJ616V73AuMUmG
 Gkw3yKhfIkJFTrF/oAesuzal0vMgMZcWTJSm3ZxUlC31XcX26atX76ATzJphxuTx
 K8l3dUaVx0jhUwFa1aR9XmI48wFJ89i9bKJIfESJ5hdcz7VfXVB+JyqWM8aKTFpe
 3eozb9f7hZJq5X3UQBcwXQOk6O8WWzuKF9cGhqRTYIFGKWuQgQ/YAHvaw00HBIBd
 xaZiV1LUox+w9Pbo/VnfO+ZConNDN/Ir/y9Zaaja3nlvQbQO7BOn+S7cPWDiEaYt
 InesurtTnJYIqUFCagmKzCqEKGrw6AZUaNMVNY+4wyFqjJtuMLlhCNnPf0Db+wuA
 ==
X-ME-Sender: <xms:IBa8YI5_CSoXyRkuvPV2n2MF3Z1siatI1G5CmU59AQW5CPR-3Pzr7A>
 <xme:IBa8YJ7_gnFA5s8dq0WkvEf7zBJtuJLw9Di_rgLL7WUj0qMPppYPXYnUKwwtuDoXq
 3OSXpD8CT6H9JJuajU>
X-ME-Received: <xmr:IBa8YHcid6eRVaGllj1mFW7dKDK-fN7Me8XPFUfFlmUfemSE29GbTk7Tz9XkEst2ll400rFrhJoitwIEU8qMuej_HDQkFtBbzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:IBa8YNICSJNqzywXJ7oFOaIynIJeSLugxQ4q8vn48VhozvzxMFdFPA>
 <xmx:IBa8YMKjDVoJMp1G-uXrDIcGX18SkcqCehV80RzXbgZxg2gBRIEdWg>
 <xmx:IBa8YOyhrUx2rvJ54xc-IxbPzfa0q4c2OW_g2VjdKUkBccuDnqmfvQ>
 <xmx:IRa8YBG42ENDjlpflxIVBbK3lB8mbSB30UdQh7Rn4BVco__ZjWGKVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jun 2021 20:26:06 -0400 (EDT)
Date: Sun, 6 Jun 2021 09:26:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ALSA: firewire-lib: fix error codes for allocation failure
Message-ID: <20210606002604.GA4284@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <YLtyL4VoArwVLor1@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLtyL4VoArwVLor1@mwanda>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
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

Hi,

On Sat, Jun 05, 2021 at 03:46:39PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if kcalloc() fails.  Currently the code returns success.
> 
> Fixes: f9e5ecdfc2c2 ("ALSA: firewire-lib: add replay target to cache sequence of packet")
> Fixes: 6f24bb8a157c ("ALSA: firewire-lib: pool sequence of packet in IT context independently")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/amdtp-stream.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
> index 945597ffacc2..b37cec3cc579 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -1625,8 +1625,10 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
>  			s->ctx_data.tx.cache.tail = 0;
>  			s->ctx_data.tx.cache.descs = kcalloc(s->ctx_data.tx.cache.size,
>  						sizeof(*s->ctx_data.tx.cache.descs), GFP_KERNEL);
> -			if (!s->ctx_data.tx.cache.descs)
> +			if (!s->ctx_data.tx.cache.descs) {
> +				err = -ENOMEM;
>  				goto err_context;
> +			}
>  		}
>  	} else {
>  		static const struct {
> @@ -1643,8 +1645,10 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
>  		};
>  
>  		s->ctx_data.rx.seq.descs = kcalloc(queue_size, sizeof(*s->ctx_data.rx.seq.descs), GFP_KERNEL);
> -		if (!s->ctx_data.rx.seq.descs)
> +		if (!s->ctx_data.rx.seq.descs) {
> +			err = -ENOMEM;
>  			goto err_context;
> +		}
>  		s->ctx_data.rx.seq.size = queue_size;
>  		s->ctx_data.rx.seq.tail = 0;
>  		s->ctx_data.rx.seq.head = 0;
> -- 
> 2.30.2
 
Indeed... Nice to catch it.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto.
