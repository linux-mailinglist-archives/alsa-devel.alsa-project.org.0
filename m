Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DB65F997
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 03:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4033D12E8A;
	Fri,  6 Jan 2023 03:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4033D12E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672972367;
	bh=/kHGzveP311F6J0gYSAjENitbyO/IWQK6G1lE4AvKgs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q46vG+6aa4cGdMksIKv9XizHHhT2IS+68bWBMwQeXOvzGgGWJppAfo/VG8ULWrYkr
	 Zwi5x3NDGIehO/j/A+BOp/gb6Yvg2TY3BICd2u5ERlxHSXbnmAZ1mIKK0ailDEa5EO
	 TBzddaxESkz5prCOD2lwdJUgnicr5dx6feEce420=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC291F8022B;
	Fri,  6 Jan 2023 03:31:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F943F804AA; Fri,  6 Jan 2023 03:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5718F8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 03:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5718F8022B
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VYxvtnS_1672972279; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VYxvtnS_1672972279) by smtp.aliyun-inc.com;
 Fri, 06 Jan 2023 10:31:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: amd: ps: Make acp63_fill_platform_dev_info static
Date: Fri,  6 Jan 2023 10:31:16 +0800
Message-Id: <20230106023116.117404-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This symbol is not used outside of pci-ps.c, so marks it static.

sound/soc/amd/ps/pci-ps.c:170:6: warning: no previous prototype for ‘acp63_fill_platform_dev_info’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3640
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/amd/ps/pci-ps.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..570736e1b5e8 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -167,10 +167,10 @@ static void get_acp63_device_config(u32 config, struct pci_dev *pci,
 	}
 }
 
-void acp63_fill_platform_dev_info(struct platform_device_info *pdevinfo, struct device *parent,
-				  struct fwnode_handle *fw_node, char *name, unsigned int id,
-				  const struct resource *res, unsigned int num_res,
-				  const void *data, size_t size_data)
+static void acp63_fill_platform_dev_info(struct platform_device_info *pdevinfo,
+					 struct device *parent, struct fwnode_handle *fw_node,
+					 char *name, unsigned int id, const struct resource *res,
+					 unsigned int num_res, const void *data, size_t size_data)
 {
 	pdevinfo->name = name;
 	pdevinfo->id = id;
-- 
2.20.1.7.g153144c

