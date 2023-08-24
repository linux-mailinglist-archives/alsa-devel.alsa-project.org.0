Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A5787577
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 18:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E8220C;
	Thu, 24 Aug 2023 18:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E8220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692894836;
	bh=hKGWz6i/h9Cf23s8/pZBaFc10Qdcje7xm2fp2fCkVFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L66Yl4tqjMhkF/U1kw+nC64Ir9phsPmf7a7zlBnhDtopXF978lbd0vgSdB5tmsxlL
	 wNfxjQQKGw8QTo0oP2RXZTBiwr1iKXBHln1Yq7GqAJ7DcjHdFmb+NOckMLWePDMzrC
	 dAHdMsk8UCl4Nca30pOn2XiLRLDpnH8P+wfSJCDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A60A9F8023B; Thu, 24 Aug 2023 18:33:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B6BF800F5;
	Thu, 24 Aug 2023 18:33:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8AC9F80158; Thu, 24 Aug 2023 18:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27481F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 18:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27481F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nFqLNEvP
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7751FF805;
	Thu, 24 Aug 2023 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692894771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsZa7pZKZNbOWTMTAuaVYbIB0/GSiNJq7wZvQfer+ls=;
	b=nFqLNEvPxHjcfURhNwgVrXak5QCYFYuY/xVoa2IdayasepT7+bAW6cycLkh5qxW2v/blqb
	tIm3mQ5Vd8ytwAOyuhV3ZZOGkBO2OUcbGr1ZxCrLKW+ptuNJt4wNaLv3Xiq43vbcUs4q7h
	vfD5hXaYwMqEzhVXe+iOUgiiyYBTQr5qnIFUytGfxXFyG5bPC9G49VMll2D7OxAI1LWeVR
	PjTqnx2eyDwQWulJUtPAco2jbccZtAXUjq6YsfYQFfCqo/PvOaqu9s7dedj24KU02U8dGc
	5/DxtsUwOk7cg6s2XKm6BNMJ58dM27YmcBy9wLVI0DkEMhSL4xig+IzZEYRZzw==
Date: Thu, 24 Aug 2023 18:32:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 20/28] wan: qmc_hdlc: Add runtime timeslots changes
 support
Message-ID: <20230824183245.26bea22a@bootlin.com>
In-Reply-To: <cbdcf645-f473-f10c-a76e-feb6316d2a47@wanadoo.fr>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<1364a0742fc76e7d275273dbbc4c97b008ec70a5.1692376361.git.christophe.leroy@csgroup.eu>
	<cbdcf645-f473-f10c-a76e-feb6316d2a47@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 2FRUBQKNT5J2YAIKHNMEOCIZZSHAA6PY
X-Message-ID-Hash: 2FRUBQKNT5J2YAIKHNMEOCIZZSHAA6PY
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FRUBQKNT5J2YAIKHNMEOCIZZSHAA6PY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Christophe,

On Mon, 21 Aug 2023 07:40:26 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Le 18/08/2023 à 18:39, Christophe Leroy a écrit :
> > From: Herve Codina <herve.codina@bootlin.com>
> > 
> > QMC channels support runtime timeslots changes but nothing is done at
> > the QMC HDLC driver to handle these changes.
> > 
> > Use existing IFACE ioctl in order to configure the timeslots to use.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---  
> 
> Hi,
> 
> a few nits below, should there be a v5.
> 
> >   drivers/net/wan/fsl_qmc_hdlc.c | 169 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 168 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> > index 4f84ac5fc63e..4b8cb5761fd1 100644
> > --- a/drivers/net/wan/fsl_qmc_hdlc.c
> > +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> > @@ -32,6 +32,7 @@ struct qmc_hdlc {
> >   	struct qmc_hdlc_desc tx_descs[8];
> >   	unsigned int tx_out;
> >   	struct qmc_hdlc_desc rx_descs[4];
> > +	u32 slot_map;
> >   };
> >   
> >   static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> > @@ -202,6 +203,162 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
> >   	return NETDEV_TX_OK;
> >   }
> >   
> > +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> > +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map = 0;  
> 
> This init looks useless.

Will be removed in the next iteration.

> 
> > +
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = 0;
> > +	map = slot_map;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (map & BIT_ULL(bit))
> > +				ts_mask |= BIT_ULL(i);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
> > +			map, ts_mask_avail, ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_info->tx_ts_mask = ts_mask;
> > +	ts_info->rx_ts_mask = ts_mask;
> > +	return 0;
> > +}
> > +
> > +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> > +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map = 0;  
> 
> This init looks useless.

Will be remove in the next iteration.

> 
> > +
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = ts_info->rx_ts_mask;
> > +	map = 0;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (ts_mask & BIT_ULL(i))
> > +				map |= BIT_ULL(bit);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (map >= BIT_ULL(32)) {
> > +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*slot_map = map;
> > +	return 0;
> > +}  
> 
> ...
> 
> > +static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
> > +{
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	te1_settings te1;
> > +
> > +	switch (ifs->type) {
> > +	case IF_GET_IFACE:
> > +		ifs->type = IF_IFACE_E1;
> > +		if (ifs->size < sizeof(te1)) {
> > +			if (!ifs->size)
> > +				return 0; /* only type requested */
> > +
> > +			ifs->size = sizeof(te1); /* data size wanted */
> > +			return -ENOBUFS;
> > +		}
> > +
> > +		memset(&te1, 0, sizeof(te1));
> > +
> > +		/* Update slot_map */
> > +		te1.slot_map = qmc_hdlc->slot_map;
> > +
> > +		if (copy_to_user(ifs->ifs_ifsu.te1, &te1,  sizeof(te1)))  
> 
>                                                           ~~
> Extra space.

Will be fixed in the next iteration.

> 
> > +			return -EFAULT;
> > +		return 0;
> > +
> > +	case IF_IFACE_E1:
> > +	case IF_IFACE_T1:
> > +		if (!capable(CAP_NET_ADMIN))
> > +			return -EPERM;
> > +
> > +		if (netdev->flags & IFF_UP)
> > +			return -EBUSY;
> > +
> > +		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
> > +			return -EFAULT;
> > +
> > +		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
> > +
> > +	default:
> > +		return hdlc_ioctl(netdev, ifs);
> > +	}
> > +}  
> 
> ...
> 

Thanks for the review,
Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
