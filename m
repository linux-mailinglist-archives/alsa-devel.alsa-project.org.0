Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C672F7C9936
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Oct 2023 15:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D26B209;
	Sun, 15 Oct 2023 15:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D26B209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697377586;
	bh=LKohZblb+4Nfe37bgBE2mPB6PqvsaNPG2Hp2olGZHVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rHQi/Kvo3GOOzmPS8nO2JMyuXn300L0yCqA8nYor4NZVvLxTrrAALRIMxHd2i4U13
	 iswUDRqm92rwd0Y5W6D8KIS4FDEmII7pHLEG1rJrm2SfrJA2dKl2lkJ7P/4dg2m4oB
	 gQtZSR4pRGq93Dd7UpAgPJs1Bv0VEc5LvIVpjuA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4490BF80536; Sun, 15 Oct 2023 15:45:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE23DF80236;
	Sun, 15 Oct 2023 15:45:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0EEFF80310; Sat, 14 Oct 2023 19:29:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12F48F8015B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 19:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F48F8015B
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id 53B811C072B;
	Sat, 14 Oct 2023 19:28:52 +0200 (CEST)
Received: from fluffy-mammal.fritz.box
 (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
	by srv01.abscue.de (Postfix) with ESMTPSA id 058F31C072C;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 3/3] ASoC: qcom: q6afe: remove "port already open" error
Date: Sat, 14 Oct 2023 19:26:24 +0200
Message-Id: <20231014172624.75301-4-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231014172624.75301-1-otto.pflueger@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IPOGW7GAYAFKX3PSMCZPUPIRQ62NVA6T
X-Message-ID-Hash: IPOGW7GAYAFKX3PSMCZPUPIRQ62NVA6T
X-Mailman-Approved-At: Sun, 15 Oct 2023 13:43:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPOGW7GAYAFKX3PSMCZPUPIRQ62NVA6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The clock fallback for older firmware versions now represents a use case
for having multiple references to a port. Stop logging an error when a
port is requested more than once because this does not indicate a problem
anymore and causes unnecessary spam in dmesg.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 87bdf741e5f6..d60c7b48e118 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1647,10 +1647,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 
 	/* if port is multiple times bind/unbind before callback finishes */
 	port = q6afe_find_port(afe, id);
-	if (port) {
-		dev_err(dev, "AFE Port already open\n");
+	if (port)
 		return port;
-	}
 
 	port_id = port_maps[id].port_id;
 
-- 
2.39.2
