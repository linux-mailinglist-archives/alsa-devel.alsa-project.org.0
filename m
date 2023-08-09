Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA22776119
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 15:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214FCE95;
	Wed,  9 Aug 2023 15:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214FCE95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691588033;
	bh=o/OJeiJVg9zUfSN1lhLsibU5RgYErVv+qYbQX4ODvew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OhLWSSPH4ASclRM3wyg7Y2kid5YLDyyS/sckw6+6HdcLsUOwCEOeuF81c7ajblfJ9
	 YZj3TwlYys0ia3Z3zKjUI4BraFIGmy57ei4pOdREZ4ZED4MnYWfp/AJq/uYr9AJLpR
	 RAw2u2bUmE4uxlGgNf27EHCYBm8x/O8ftY0Y5AQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24BA8F80659; Wed,  9 Aug 2023 15:29:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8989CF80649;
	Wed,  9 Aug 2023 15:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE663F805F3; Wed,  9 Aug 2023 15:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04808F805C9
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 15:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04808F805C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikktVcFt
Received: by mail.gandi.net (Postfix) with ESMTPA id D2F1440019;
	Wed,  9 Aug 2023 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691587729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOo0k/wMBY56BL8sRl33GbOe3r47HZ+KueJO3uCtK6U=;
	b=ikktVcFtO5SqOw/ltOw/jkYsbHSGtXuArJ4Xuo7lRrLCe47gppNBco3SXZp0PcrYnIibXF
	WUPIz8nETN68zoIks/ScyiddoaVFrKmtpTjqKfw5TfEe73zPfVMhnvw9FD5zKkJ2IZLeJT
	CdRyLyrV/1poqU0aCmvBhDpZFID31GoXsOQ5137AmfVws8Rpi4bvW05OLP+IKOLopRRA1E
	AkwKIFtHNX2X6m+BRhkb5COOoc09NNORD7B+Yt2YvhhmscrTVByQ35tWcdH9OrQRvuQj83
	cab/Y5iBKJ8lHhnBiTN2nP3XOOHvy1LyjSlT3PN+G0yYVUcMfF82JDRKTOnmDQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 20/28] wan: qmc_hdlc: Add runtime timeslots changes support
Date: Wed,  9 Aug 2023 15:27:47 +0200
Message-ID: <20230809132757.2470544-21-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809132757.2470544-1-herve.codina@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: SOSSSDNP7NGE6RUBZONDRG5OYN7G6A5Y
X-Message-ID-Hash: SOSSSDNP7NGE6RUBZONDRG5OYN7G6A5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOSSSDNP7NGE6RUBZONDRG5OYN7G6A5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

QMC channels support runtime timeslots changes but nothing is done at
the QMC HDLC driver to handle these changes.

Use existing IFACE ioctl in order to configure the timeslots to use.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/wan/fsl_qmc_hdlc.c | 169 ++++++++++++++++++++++++++++++++-
 1 file changed, 168 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index 4f84ac5fc63e..4b8cb5761fd1 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -32,6 +32,7 @@ struct qmc_hdlc {
 	struct qmc_hdlc_desc tx_descs[8];
 	unsigned int tx_out;
 	struct qmc_hdlc_desc rx_descs[4];
+	u32 slot_map;
 };
 
 static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
@@ -202,6 +203,162 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
 	return NETDEV_TX_OK;
 }
 
+static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
+				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
+{
+	u64 ts_mask_avail;
+	unsigned int bit;
+	unsigned int i;
+	u64 ts_mask;
+	u64 map = 0;
+
+	/* Tx and Rx masks must be identical */
+	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
+		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
+		return -EINVAL;
+	}
+
+	ts_mask_avail = ts_info->rx_ts_mask_avail;
+	ts_mask = 0;
+	map = slot_map;
+	bit = 0;
+	for (i = 0; i < 64; i++) {
+		if (ts_mask_avail & BIT_ULL(i)) {
+			if (map & BIT_ULL(bit))
+				ts_mask |= BIT_ULL(i);
+			bit++;
+		}
+	}
+
+	if (hweight64(ts_mask) != hweight64(map)) {
+		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
+			map, ts_mask_avail, ts_mask);
+		return -EINVAL;
+	}
+
+	ts_info->tx_ts_mask = ts_mask;
+	ts_info->rx_ts_mask = ts_mask;
+	return 0;
+}
+
+static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
+				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
+{
+	u64 ts_mask_avail;
+	unsigned int bit;
+	unsigned int i;
+	u64 ts_mask;
+	u64 map = 0;
+
+	/* Tx and Rx masks must be identical */
+	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
+		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
+		return -EINVAL;
+	}
+	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
+		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
+		return -EINVAL;
+	}
+
+	ts_mask_avail = ts_info->rx_ts_mask_avail;
+	ts_mask = ts_info->rx_ts_mask;
+	map = 0;
+	bit = 0;
+	for (i = 0; i < 64; i++) {
+		if (ts_mask_avail & BIT_ULL(i)) {
+			if (ts_mask & BIT_ULL(i))
+				map |= BIT_ULL(bit);
+			bit++;
+		}
+	}
+
+	if (hweight64(ts_mask) != hweight64(map)) {
+		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
+			ts_mask_avail, ts_mask, map);
+		return -EINVAL;
+	}
+
+	if (map >= BIT_ULL(32)) {
+		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
+			ts_mask_avail, ts_mask, map);
+		return -EINVAL;
+	}
+
+	*slot_map = map;
+	return 0;
+}
+
+static int qmc_hdlc_set_iface(struct qmc_hdlc *qmc_hdlc, int if_iface, const te1_settings *te1)
+{
+	struct qmc_chan_ts_info ts_info;
+	int ret;
+
+	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
+		return ret;
+	}
+	ret = qmc_hdlc_xlate_slot_map(qmc_hdlc, te1->slot_map, &ts_info);
+	if (ret)
+		return ret;
+
+	ret = qmc_chan_set_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "set QMC channel ts info failed %d\n", ret);
+		return ret;
+	}
+
+	qmc_hdlc->slot_map = te1->slot_map;
+
+	return 0;
+}
+
+static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	te1_settings te1;
+
+	switch (ifs->type) {
+	case IF_GET_IFACE:
+		ifs->type = IF_IFACE_E1;
+		if (ifs->size < sizeof(te1)) {
+			if (!ifs->size)
+				return 0; /* only type requested */
+
+			ifs->size = sizeof(te1); /* data size wanted */
+			return -ENOBUFS;
+		}
+
+		memset(&te1, 0, sizeof(te1));
+
+		/* Update slot_map */
+		te1.slot_map = qmc_hdlc->slot_map;
+
+		if (copy_to_user(ifs->ifs_ifsu.te1, &te1,  sizeof(te1)))
+			return -EFAULT;
+		return 0;
+
+	case IF_IFACE_E1:
+	case IF_IFACE_T1:
+		if (!capable(CAP_NET_ADMIN))
+			return -EPERM;
+
+		if (netdev->flags & IFF_UP)
+			return -EBUSY;
+
+		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
+			return -EFAULT;
+
+		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
+
+	default:
+		return hdlc_ioctl(netdev, ifs);
+	}
+}
+
 static int qmc_hdlc_open(struct net_device *netdev)
 {
 	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
@@ -328,13 +485,14 @@ static const struct net_device_ops qmc_hdlc_netdev_ops = {
 	.ndo_open       = qmc_hdlc_open,
 	.ndo_stop       = qmc_hdlc_close,
 	.ndo_start_xmit = hdlc_start_xmit,
-	.ndo_siocwandev	= hdlc_ioctl,
+	.ndo_siocwandev = qmc_hdlc_ioctl,
 };
 
 static int qmc_hdlc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct qmc_hdlc *qmc_hdlc;
+	struct qmc_chan_ts_info ts_info;
 	struct qmc_chan_info info;
 	hdlc_device *hdlc;
 	int ret;
@@ -364,6 +522,15 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
+		return ret;
+	}
+	ret = qmc_hdlc_xlate_ts_info(qmc_hdlc, &ts_info, &qmc_hdlc->slot_map);
+	if (ret)
+		return ret;
+
 	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
 	if (!qmc_hdlc->netdev) {
 		dev_err(qmc_hdlc->dev, "failed to alloc hdlc dev\n");
-- 
2.41.0

