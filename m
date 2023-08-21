Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A078233F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 07:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF54836;
	Mon, 21 Aug 2023 07:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF54836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692596519;
	bh=sPFtF0lZnpHQTLS+xjbRJnDC8iBz5iUClYYfWOhAHEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwj960Dl6UUXmFAuOhyDSyVeHYpZdTNBHSv8qleY4Rdwj81e+RtnSl2oOO6bs2iKv
	 k9YuQhBIUglKvPhkKsYZqBRKPnBZYcAu0t2uuoWrB8LnbZ/QJ/xcViLE884xEFoOde
	 W7TPkvL+7HEtkRDu6GqHbTMFpxScy7zwGVjZX9Gk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 930AAF80510; Mon, 21 Aug 2023 07:40:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E75AF8014C;
	Mon, 21 Aug 2023 07:40:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DFA9F80199; Mon, 21 Aug 2023 07:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF4DFF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 07:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4DFF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=cvFmdh0X
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id XxeMq9U0KKn2vXxeMqn6t5; Mon, 21 Aug 2023 07:40:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1692596430;
	bh=sqsur9/V8lzNvOyY7Q4srq+nuW4UAVI2dRK9lKF30hA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cvFmdh0XQW7aXg4c8XmStHAD09SgGQWiPxaNPSHqhGE9G9ESooqQUAj/Bu3VbdI2t
	 yZAsrmqzNcdmNIA/fGtpzVLeeA6VCjI//mUluuFG7mLrX/MT3EGsNW1DDCITZVahii
	 4vKV97wUbaM1iTX/OOCL4l88UQHdJJvov2Ww5lRBZ93QzCSq1QmN3TviwKThJpeECs
	 HaZzt23zkQhAwTp6qvegwE4Y3I4ZQ805c3TIqm1CFEHXCSMdtWIsL/KUp3AuEHBrZW
	 YzOuRznLMok7PFSiI97jnNYIG9NGirRWEznZq1oXdx0wlKKUhbjmwts58tc6qegXdj
	 xmx5CZYxwKfKw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Aug 2023 07:40:30 +0200
X-ME-IP: 86.243.2.178
Message-ID: <cbdcf645-f473-f10c-a76e-feb6316d2a47@wanadoo.fr>
Date: Mon, 21 Aug 2023 07:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 20/28] wan: qmc_hdlc: Add runtime timeslots changes
 support
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <1364a0742fc76e7d275273dbbc4c97b008ec70a5.1692376361.git.christophe.leroy@csgroup.eu>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <1364a0742fc76e7d275273dbbc4c97b008ec70a5.1692376361.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LGHVMJ2OK2EKTS4IANFNLSXYFK7IRIJJ
X-Message-ID-Hash: LGHVMJ2OK2EKTS4IANFNLSXYFK7IRIJJ
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGHVMJ2OK2EKTS4IANFNLSXYFK7IRIJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 18/08/2023 à 18:39, Christophe Leroy a écrit :
> From: Herve Codina <herve.codina@bootlin.com>
> 
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
> 
> Use existing IFACE ioctl in order to configure the timeslots to use.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Hi,

a few nits below, should there be a v5.

>   drivers/net/wan/fsl_qmc_hdlc.c | 169 ++++++++++++++++++++++++++++++++-
>   1 file changed, 168 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> index 4f84ac5fc63e..4b8cb5761fd1 100644
> --- a/drivers/net/wan/fsl_qmc_hdlc.c
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -32,6 +32,7 @@ struct qmc_hdlc {
>   	struct qmc_hdlc_desc tx_descs[8];
>   	unsigned int tx_out;
>   	struct qmc_hdlc_desc rx_descs[4];
> +	u32 slot_map;
>   };
>   
>   static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> @@ -202,6 +203,162 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
>   	return NETDEV_TX_OK;
>   }
>   
> +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> +{
> +	u64 ts_mask_avail;
> +	unsigned int bit;
> +	unsigned int i;
> +	u64 ts_mask;
> +	u64 map = 0;

This init looks useless.

> +
> +	/* Tx and Rx masks must be identical */
> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +		return -EINVAL;
> +	}
> +
> +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> +	ts_mask = 0;
> +	map = slot_map;
> +	bit = 0;
> +	for (i = 0; i < 64; i++) {
> +		if (ts_mask_avail & BIT_ULL(i)) {
> +			if (map & BIT_ULL(bit))
> +				ts_mask |= BIT_ULL(i);
> +			bit++;
> +		}
> +	}
> +
> +	if (hweight64(ts_mask) != hweight64(map)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
> +			map, ts_mask_avail, ts_mask);
> +		return -EINVAL;
> +	}
> +
> +	ts_info->tx_ts_mask = ts_mask;
> +	ts_info->rx_ts_mask = ts_mask;
> +	return 0;
> +}
> +
> +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> +{
> +	u64 ts_mask_avail;
> +	unsigned int bit;
> +	unsigned int i;
> +	u64 ts_mask;
> +	u64 map = 0;

This init looks useless.

> +
> +	/* Tx and Rx masks must be identical */
> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +		return -EINVAL;
> +	}
> +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
> +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
> +		return -EINVAL;
> +	}
> +
> +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> +	ts_mask = ts_info->rx_ts_mask;
> +	map = 0;
> +	bit = 0;
> +	for (i = 0; i < 64; i++) {
> +		if (ts_mask_avail & BIT_ULL(i)) {
> +			if (ts_mask & BIT_ULL(i))
> +				map |= BIT_ULL(bit);
> +			bit++;
> +		}
> +	}
> +
> +	if (hweight64(ts_mask) != hweight64(map)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
> +			ts_mask_avail, ts_mask, map);
> +		return -EINVAL;
> +	}
> +
> +	if (map >= BIT_ULL(32)) {
> +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
> +			ts_mask_avail, ts_mask, map);
> +		return -EINVAL;
> +	}
> +
> +	*slot_map = map;
> +	return 0;
> +}

...

> +static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
> +{
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	te1_settings te1;
> +
> +	switch (ifs->type) {
> +	case IF_GET_IFACE:
> +		ifs->type = IF_IFACE_E1;
> +		if (ifs->size < sizeof(te1)) {
> +			if (!ifs->size)
> +				return 0; /* only type requested */
> +
> +			ifs->size = sizeof(te1); /* data size wanted */
> +			return -ENOBUFS;
> +		}
> +
> +		memset(&te1, 0, sizeof(te1));
> +
> +		/* Update slot_map */
> +		te1.slot_map = qmc_hdlc->slot_map;
> +
> +		if (copy_to_user(ifs->ifs_ifsu.te1, &te1,  sizeof(te1)))

                                                          ~~
Extra space.

> +			return -EFAULT;
> +		return 0;
> +
> +	case IF_IFACE_E1:
> +	case IF_IFACE_T1:
> +		if (!capable(CAP_NET_ADMIN))
> +			return -EPERM;
> +
> +		if (netdev->flags & IFF_UP)
> +			return -EBUSY;
> +
> +		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
> +			return -EFAULT;
> +
> +		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
> +
> +	default:
> +		return hdlc_ioctl(netdev, ifs);
> +	}
> +}

...

