Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7641C8005
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 04:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BE917D8;
	Thu,  7 May 2020 04:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BE917D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588818769;
	bh=Tpb7HTgpgBdGyb7boouzvuA+xp1UDNie914qOfl+ceM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nOVBgddRB2x8/WsTEhJtIZzIOrCIEXz2ITDqnWgM69uHD/CYyOzbuikb5Zv+dpJ4Q
	 KS0jDIr33M96d58yQ+SShfkkWWDap/0CCnpWzxQAEcVAqyLwU224IIxPXPPX7/EHDx
	 9zcspGp7UJ+GmaM9g+FN2ht60HNGfiW6S3bv5pyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A52CF800AD;
	Thu,  7 May 2020 04:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CC5F8015F; Thu,  7 May 2020 04:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 088B5F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 04:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088B5F800AD
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2A5C5E98BD8581AE56CA;
 Thu,  7 May 2020 10:30:49 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 10:30:43 +0800
From: ChenTao <chentao107@huawei.com>
To: <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH -next] soc: fsl_asrc: Make some functions static
Date: Thu, 7 May 2020 10:29:59 +0800
Message-ID: <20200507022959.183739-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org, chentao107@huawei.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

Fix the following warning:

sound/soc/fsl/fsl_asrc.c:157:5: warning:
symbol 'fsl_asrc_request_pair' was not declared. Should it be static?
sound/soc/fsl/fsl_asrc.c:200:6: warning:
symbol 'fsl_asrc_release_pair' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: ChenTao <chentao107@huawei.com>
---
 sound/soc/fsl/fsl_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 067a54ab554f..432936039de4 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -154,7 +154,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
  * while pair A and pair C are comparatively independent.
  */
-int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
+static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
@@ -197,7 +197,7 @@ int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
  *
  * It clears the resource from asrc and releases the occupied channels.
  */
-void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
+static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-- 
2.22.0

