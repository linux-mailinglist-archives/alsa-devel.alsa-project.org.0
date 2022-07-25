Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5057F965
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 08:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F09415C2;
	Mon, 25 Jul 2022 08:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F09415C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658730514;
	bh=3/8+Ab0XNi6QKfyElDxG4egDmLpUkNURjxV4cLNde8k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qVubaHYfF2rkkh0yAcrj09PtuUx1lsVxr1QU+c68IiRieP7W5e4wW2roAVorTHvBh
	 8nZQyHPNMjKBPTULwiy8y14fJwGlnVx9lCfIZ5+GHsQkwhj6XdiQD5u6PP9HeqCHTU
	 q0uoNkgXrMWcZPMNF2CSlIQjeMfdcHCl5YSfYVUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F6DDF80566;
	Mon, 25 Jul 2022 08:25:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 759F0F80128; Mon, 25 Jul 2022 04:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F42DF80128
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 04:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F42DF80128
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Lrkdf58wgz923g;
 Mon, 25 Jul 2022 10:34:30 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 10:38:17 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Jul
 2022 10:38:16 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
 <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <sbinding@opensource.cirrus.com>,
 <vitalyr@opensource.cirrus.com>
Subject: [PATCH -next] ALSA: hda: cs35l41: Fix build error unused-function
Date: Mon, 25 Jul 2022 10:36:11 +0800
Message-ID: <20220725023611.57055-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:25:50 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Ren Zhijie <renzhijie2@huawei.com>, linux-kernel@vger.kernel.org,
 arnd@arndb.de
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

If CONFIG_PM_SLEEP is not set,
make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:

sound/pci/hda/cs35l41_hda.c:583:12: error: ‘cs35l41_runtime_resume’ defined but not used [-Werror=unused-function]
 static int cs35l41_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~
sound/pci/hda/cs35l41_hda.c:565:12: error: ‘cs35l41_runtime_suspend’ defined but not used [-Werror=unused-function]
 static int cs35l41_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [sound/pci/hda/cs35l41_hda.o] Error 1

commit 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros,
deprecate old ones"), add new marco RUNTIME_PM_OPS to fix this unused-function problem.

Fixes: 1873ebd30cc8 ("ALSA: hda: cs35l41: Support Hibernation during Suspend")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 sound/pci/hda/cs35l41_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 28798d5c1cf1..93cf039abb02 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1439,7 +1439,7 @@ void cs35l41_hda_remove(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 
 const struct dev_pm_ops cs35l41_hda_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
+	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, SND_HDA_SCODEC_CS35L41);
 
-- 
2.17.1

