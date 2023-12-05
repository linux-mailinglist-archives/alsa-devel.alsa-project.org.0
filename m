Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4C80588A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:24:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58491E7E;
	Tue,  5 Dec 2023 16:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58491E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701789896;
	bh=3X8GjzfgDf3o4iT/NE36c+1ElL9LcAE1S4eX7SMtaZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxQX0wjZXCHV5uTIomzQMxBwAng0X9nh0NKjEVgYhKjmPxD32CZBUEx2e77inF+2B
	 WRMYEgiGCU2kFOTTAEdBXaAHaG+cd8ulxNfCgkTJ7QmkYQue5lutfxyHlxHBnITqH5
	 eVyXHHOwBu+CfUw8xbBlsz9ICHxIfocZh8TuDClk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1EE8F80727; Tue,  5 Dec 2023 16:22:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51984F80737;
	Tue,  5 Dec 2023 16:22:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 812BDF80578; Tue,  5 Dec 2023 16:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 394F0F8024E
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394F0F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mCnGrQ06
Received: by mail.gandi.net (Postfix) with ESMTPA id 34AB34001F;
	Tue,  5 Dec 2023 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSfFIo0PTo+iFIfEoPmWha/vh5mQYCTVDevXwJNb2wI=;
	b=mCnGrQ06qMroufrsKXriV266bj5yqAb/KYTe8dE5jT5weO/LnHKF+FRUWCYL9KbeEffvS4
	/OqaUtEeiQ7h+c4u3Y3sGTnpWy5wIz3ml7NCm0fmeeMqdiFEXof9uoN2P6kmhVOGqMyU6l
	7n7nddoMkrYboCcUS9hW8CReJtttap9vxtY3rnPBHmyZVcDIXwKP5ejYfA2GwOAowGyOkj
	Fsl9IYu0/qHjyJ/x5LXrIAqWYAOBlqsiI6vVsmUgMpX8N3h9cJCurlLwcJHRwix6pC21Lw
	mqETpKcFXVgbjK4GA3LJiIlQavDjq7vKMfl4JVl6aTF/sVP7kVDmm5ExXqL1pA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 14/17] soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
Date: Tue,  5 Dec 2023 16:21:11 +0100
Message-ID: <20231205152116.122512-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: A5WENBFJIAVH3ET6KNAVB7A2BEUHPHZU
X-Message-ID-Hash: A5WENBFJIAVH3ET6KNAVB7A2BEUHPHZU
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A5WENBFJIAVH3ET6KNAVB7A2BEUHPHZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to support runtime timeslot route changes, some operations will
be different according the routing table used (common Rx and Tx table or
one table for Rx and one for Tx).

The is_tsa_64rxtx flag is introduced to avoid extra computation to
determine the table format each time we need it.
It is set once at initialization.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 5ca4120779f8..e651b3bba1ca 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -216,6 +216,7 @@ struct qmc {
 	u16 __iomem *int_curr;
 	dma_addr_t int_dma_addr;
 	size_t int_size;
+	bool is_tsa_64rxtx;
 	struct list_head chan_head;
 	struct qmc_chan *chans[64];
 };
@@ -696,7 +697,7 @@ static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 	 * Setup one common 64 entries table or two 32 entries (one for Tx
 	 * and one for Tx) according to assigned TS numbers.
 	 */
-	if (info.nb_tx_ts > 32 || info.nb_rx_ts > 32)
+	if (chan->qmc->is_tsa_64rxtx)
 		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
 
 	ret = qmc_chan_setup_tsa_32rx(chan, &info, enable);
@@ -1053,6 +1054,7 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 	 * Everything was previously checked, Tx and Rx related stuffs are
 	 * identical -> Used Rx related stuff to build the table
 	 */
+	qmc->is_tsa_64rxtx = true;
 
 	/* Invalidate all entries */
 	for (i = 0; i < 64; i++)
@@ -1081,6 +1083,7 @@ static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 	 * Use a Tx 32 entries table and a Rx 32 entries table.
 	 * Everything was previously checked.
 	 */
+	qmc->is_tsa_64rxtx = false;
 
 	/* Invalidate all entries */
 	for (i = 0; i < 32; i++) {
-- 
2.43.0

