Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918176B82F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501C83E7;
	Tue,  1 Aug 2023 17:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501C83E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690902171;
	bh=aEx++5ZStYjeR5ZjZMNxNmR+5jWzNH9PPrI3Jp4NvQo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YCutjK0ARBXVupBNAxwnmwz8rs3NPeXXP1MeLfkuVJByV6Wmo0If+mC7TDQYlSekt
	 Njanpf8F0SWSgc/B6RZFugcJzjIhx1db7ltSCNrfKvfTXntc5f/qn4K8Uk6ys9QDB/
	 JAG1cRvl7toRdeSdf7KEwqISkG1gCwbYoKPse9A8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92124F801D5; Tue,  1 Aug 2023 17:01:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B69EF8016D;
	Tue,  1 Aug 2023 17:01:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84AD1F801D5; Tue,  1 Aug 2023 16:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FE17F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FE17F80149
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFd9H64BSzNmYd;
	Tue,  1 Aug 2023 22:41:55 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 22:45:21 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] ALSA: usb-audio: Remove unused function declaration
Date: Tue, 1 Aug 2023 22:45:12 +0800
Message-ID: <20230801144512.18716-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Message-ID-Hash: BHO5JNXOMHRCJ6OUQUQNJ2G7HIM2IDDX
X-Message-ID-Hash: BHO5JNXOMHRCJ6OUQUQNJ2G7HIM2IDDX
X-MailFrom: yuehaibing@huawei.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHO5JNXOMHRCJ6OUQUQNJ2G7HIM2IDDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 68e67f40b734 ("ALSA: snd-usb: move calls to usb_set_interface")
leave this unused declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 sound/usb/endpoint.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index c09f68ce08b1..ba70f52f6860 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -44,7 +44,6 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending);
 void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep);
-int  snd_usb_endpoint_activate(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_free_all(struct snd_usb_audio *chip);
 
-- 
2.34.1

