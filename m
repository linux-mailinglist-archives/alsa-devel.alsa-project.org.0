Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C386B5BAEE6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622E11692;
	Fri, 16 Sep 2022 16:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622E11692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663337125;
	bh=+wNCTLO6qI3FRod277mO67c+g4SZS3O8D3yKY0dytxg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bCtwa39x/Gdujx/sBaS77YXuCXWFhq1hN5C0EYRa2HjXin+s4E8XSHd4GyyG6RGbb
	 BhDwqZMaqloPmaLPSRjreIawNg4B3ZYYcLJy26ouGtx/uQkBi7gHB8NSr+CUp7loqE
	 xpPtmRYbpMfbc4l0V7f6XrWSltx8QOppchK5uqTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8826F8024C;
	Fri, 16 Sep 2022 16:04:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237C1F8024C; Fri, 16 Sep 2022 16:04:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D64EEF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D64EEF8024C
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MTbLD2hmgzlVvJ;
 Fri, 16 Sep 2022 22:00:04 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 22:04:05 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 16 Sep
 2022 22:04:04 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ALSA: ppc: Switch to use for_each_child_of_node() macro
Date: Fri, 16 Sep 2022 22:11:08 +0800
Message-ID: <20220916141108.683080-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: tiwai@suse.com
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

Use for_each_child_of_node() macro instead of open coding it.
No functional change.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/ppc/tumbler.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index c65e74d7cd0a..f3f8ad7c3df8 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1060,8 +1060,7 @@ static struct device_node *find_audio_device(const char *name)
 	if (! gpiop)
 		return NULL;
   
-	for (np = of_get_next_child(gpiop, NULL); np;
-			np = of_get_next_child(gpiop, np)) {
+	for_each_child_of_node(gpiop, np) {
 		const char *property = of_get_property(np, "audio-gpio", NULL);
 		if (property && strcmp(property, name) == 0)
 			break;
@@ -1080,8 +1079,7 @@ static struct device_node *find_compatible_audio_device(const char *name)
 	if (!gpiop)
 		return NULL;
   
-	for (np = of_get_next_child(gpiop, NULL); np;
-			np = of_get_next_child(gpiop, np)) {
+	for_each_child_of_node(gpiop, np) {
 		if (of_device_is_compatible(np, name))
 			break;
 	}  
-- 
2.25.1

