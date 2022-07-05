Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBE5665BD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 11:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E611705;
	Tue,  5 Jul 2022 11:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E611705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657011661;
	bh=pynbEHUPHdeLISP7oe9YfRMtbGSHbbrEjUJG5n1LBfw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fb7lim69idMwdE7Uv4H6KnPy26RN7MJCs1Jj40kAFBrGdqaxwAo0eDUUTEfu4CECP
	 9DHrihxKkZdo0tX3oBqtzeYgrnVyXhiLEUg0l4uwfCDGq658OaMNYqJU0Qv+XSp5/Z
	 yktniURy9SCj15u2vMnmenb4I3cSpBlvZ1dC/Gi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5280DF8012A;
	Tue,  5 Jul 2022 10:59:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D62F8014E; Tue,  5 Jul 2022 02:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B5EF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 02:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B5EF8012A
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LcPHm34RyzkWSm;
 Tue,  5 Jul 2022 08:51:16 +0800 (CST)
Received: from dggphis33418.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 5 Jul 2022 08:53:15 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH] ASoC: codecs: wsa883x: fix warning
 using-module-alias-sdw.cocci
Date: Tue, 5 Jul 2022 08:53:15 +0800
Message-ID: <20220705005315.663920-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 05 Jul 2022 10:59:17 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/soc/codecs/wsa883x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 40c7d64a9c41..f346abe8b18a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1491,6 +1491,8 @@ static const struct sdw_device_id wsa883x_swr_id[] = {
 	{},
 };
 
+MODULE_DEVICE_TABLE(sdw, wsa883x_swr_id);
+
 static struct sdw_driver wsa883x_codec_driver = {
 	.driver = {
 		.name = "wsa883x-codec",
-- 
2.25.1

