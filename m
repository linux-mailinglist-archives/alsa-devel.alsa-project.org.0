Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC2829AB8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 13:55:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05878E9D;
	Wed, 10 Jan 2024 13:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05878E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704891337;
	bh=PZABZvFu6YfewBVsfWRIsRfRTNc3fsB6tyPmtxoCWCw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WZvUFIVyG1M8CQQZabS/8LOF0NQ+ls0pawHrI/4iXPbUjUPSZi+/bSomks2MhdDVe
	 yXY42/NnxX61Tmro+5QobScaHUlR9VNiUA6YHAXWIp1GBZdHwxkAvwzkPs7ALsGcYp
	 OS9bRg6PWomKgckHxgzrHBjby67eWufyko7yn8B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CD6EF80246; Wed, 10 Jan 2024 13:55:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6B5F8057F;
	Wed, 10 Jan 2024 13:55:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110A2F80254; Tue,  9 Jan 2024 19:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 581DCF8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 19:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 581DCF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=erick.archer@gmx.com
 header.a=rsa-sha256 header.s=s31663417 header.b=B29xcGD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1704823897; x=1705428697; i=erick.archer@gmx.com;
	bh=PZABZvFu6YfewBVsfWRIsRfRTNc3fsB6tyPmtxoCWCw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=B29xcGD9pJnrAoiLFpmOkfTFB/SsYMSIyA5nwqm9eVATIxvpptcEVeM98ngs2bES
	 pD1uHMpJ5ljFpXEhGCPMExkAnOBH/dY0Wiw0EwtMovH+k7OJtMrfl5PyFPqH1M+1V
	 b6s8y/tIDgaJZCnBBQmu9kj1Ovinw7ZmvRoWVqKFEW6djOjOCsJep/kPOjqoiPx6K
	 tOn2YukORtnKB/zZJLFG3nLZnubmy2x+FMsAYD+Lgn5DP1bTf+mOkuSC4PQJmsAZ9
	 wmPHBXgJack0D08nkI51jCgot4RJyqgHL9iij66K8ZrY/xYs0bSVxqFHIZxd3dKwx
	 Z1qPyn23mPZFHVqoSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N33Ed-1rAqX60qfl-013JkH; Tue, 09 Jan 2024 19:11:37 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Erick Archer <erick.archer@gmx.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] ASoC: ti: j721e-evm: Use devm_kcalloc() instead of
 devm_kzalloc()
Date: Tue,  9 Jan 2024 19:11:01 +0100
Message-Id: <20240109181101.3806-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+FQsFrpfyWYIKyTGfUr8bMQdMIgv0XDftz8xSNidl484g0foWv3
 QsSRpMhc5PM5K1X/QVF3MPErICODTv70QT4510g408rqnzAbuoEQiZR1vcelqJuQF4iPOmT
 J3q307fdOBJKiUQoTeX1O6wQbN5NXKwMbEjbo1uixPcJDUbrk10gHSclH/F1e+qOExIpIUq
 BMNRsVYowKU35EuYzwL1w==
UI-OutboundReport: notjunk:1;M01:P0:HqM7Q25+xKA=;ZvHEBSr7KNi6TYu4C+KGhvAVlGP
 s4H5lD02JyV2eVDZIryDMPxkDN4wch7uGmKBucRuWBvCX5Km9GPVjpfyJ1+MDyPq9O5sEiDR5
 Co9Tvtz9GY8FisLl8famEPEwNTp50nsujR+9JS3NTNLmuBOlB0d0fdKrOt+M6qlPyxIiJMMEo
 rJ/o0NpJ4tu+E/aSLJ6sMI70KQPAaTSTRugOVtFLqC7D3M8mfFYEYS5Qsk2Hwax4UgeMNcDqN
 Y60c/TDS0GgxbmgxhWluzfpWIcNR0MmlHyhx1QL1NhuYeBBBWKdrfAHV7qJRmtGKe3VPdf5m8
 co/kioq+0lyGYTzRJ50/CPMvkcVTEc6sJKKGpF/5VQoL9N8LHJgyVQAm+GEL5RBVl0kg64BS9
 zmM3n41TymExB7k0851H3juNGz3APx10CTHTbC9uIa3cnkaKnQKDB0trKXpv+GOY9FKKjafBk
 +zqI9heJT2FKE2RTOmcM/91qiKS0Xq1zV+exknAnh/AeoJUAdgZOJMMkoEJJkgfJ4xvQTTyxi
 DIQpWvkIjuzySdtWl8Uv4gAdMhJTuGrblab2g+ExrpdJxNeb9L0TxDU9vC/XSGwMrE0NTUkCb
 vRGOk2rxZ88XOlJr7DXqLLiW6uIXEz4kTiwZNSJSLtbgJV3HM+giJrLRhqtNiTdcLzc2Xwczs
 7/JMc9NJT0vcjGevcBUbEgpx+lO2GHkuhvIgoeGyO+NevhzJPephji6vg3T7pXEmvuGVM2OTg
 WSgZ0AQsVp9XK0sviU3z/3NQIxtJKIO/VwAMgwSVfHhCCaTIxGspThmvovRSXBBuZVrXOcjY0
 rv2x77IOJRMU20Qiv9guHs1b29h35202a9Ov7C4S9nVr59yn1QBoCHew7Sg8zjchZ0ekYkmtn
 DUZq5E4n+0h5JcEjnD4e69Udeu/dYvxnPhUzMqbzVYG5rO0YUHnMPPv7NhbiJTJ9UIPbH8Xcm
 KkHCdL/Xd5Qc/5RPsv5zlcoGkPQ=
X-MailFrom: erick.archer@gmx.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2H3RZAODRB6UQW27NJQSZM5FUJYG4W23
X-Message-ID-Hash: 2H3RZAODRB6UQW27NJQSZM5FUJYG4W23
X-Mailman-Approved-At: Wed, 10 Jan 2024 12:55:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2H3RZAODRB6UQW27NJQSZM5FUJYG4W23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Link: https://github.com/KSPP/linux/issues/162
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
Changes in v2:
- Fix the commit title adding "j721e-evm"
=2D--
 sound/soc/ti/j721e-evm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index b4b158dc736e..d9d1e021f5b2 100644
=2D-- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -649,7 +649,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv=
, int *link_idx,
 	 * Link 2: McASP10 <- pcm3168a_1 ADC
 	 */
 	comp_count =3D 6;
-	compnent =3D devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
+	compnent =3D devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
 				GFP_KERNEL);
 	if (!compnent) {
 		ret =3D -ENOMEM;
@@ -763,7 +763,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv=
, int *link_idx,
 	 *		   \ pcm3168a_b ADC
 	 */
 	comp_count =3D 8;
-	compnent =3D devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
+	compnent =3D devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
 				GFP_KERNEL);
 	if (!compnent) {
 		ret =3D -ENOMEM;
=2D-
2.25.1

