Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE11EC80C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 05:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5392E1670;
	Wed,  3 Jun 2020 05:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5392E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591156372;
	bh=GoM0dlmFfNe+DI5LnBTXg1yfbFr3jS5pLVvRnx1Lol4=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=kt7MNns8aFd3yleGf8MbbRie6jUdflDRPNqap6jDIYddhgUigAaYubr1py1TgkLLj
	 i4djP4KGFegrwsEXYRkLLQCnIAva2X06dx+qiwCNgHRM4vMo2c4MKMNATl1GRACUJ1
	 sosrXm8sH191oxqV1Yn+mIpMPBaGb5a+eTnQbpxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FEB4F801F5;
	Wed,  3 Jun 2020 05:50:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B7AF80227; Wed,  3 Jun 2020 05:50:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 894E5F800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 05:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894E5F800BC
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0561A200CE0;
 Wed,  3 Jun 2020 05:50:15 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DA95200CDB;
 Wed,  3 Jun 2020 05:50:10 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6D883402B1;
 Wed,  3 Jun 2020 11:50:04 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 1/3] ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
Date: Wed,  3 Jun 2020 11:39:39 +0800
Message-Id: <ab1b83a56c71f4159a98e6da5602c2c36fe59f4d.1591155860.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Obtained with:
$ make W=1

sound/soc/fsl/fsl_easrc.c:967:5: warning: no previous prototype for function 'fsl_easrc_config_context' [-Wmissing-prototypes]
int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
    ^
sound/soc/fsl/fsl_easrc.c:967:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
^
static
sound/soc/fsl/fsl_easrc.c:1128:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_format' [-Wmissing-prototypes]
int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
    ^
sound/soc/fsl/fsl_easrc.c:1128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
^
static
sound/soc/fsl/fsl_easrc.c:1201:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_organziation' [-Wmissing-prototypes]
int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1245:5: warning: no previous prototype for function 'fsl_easrc_request_context' [-Wmissing-prototypes]
int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1290:6: warning: no previous prototype for function 'fsl_easrc_release_context' [-Wmissing-prototypes]
void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
     ^
sound/soc/fsl/fsl_easrc.c:1290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1317:5: warning: no previous prototype for function 'fsl_easrc_start_context' [-Wmissing-prototypes]
int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1335:5: warning: no previous prototype for function 'fsl_easrc_stop_context' [-Wmissing-prototypes]
int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1382:18: warning: no previous prototype for function 'fsl_easrc_get_dma_channel' [-Wmissing-prototypes]
struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
                 ^
sound/soc/fsl/fsl_easrc.c:1382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
^
static

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/soc/fsl/fsl_easrc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index c6b5eb2d2af7..f227308a50e2 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -964,7 +964,7 @@ static int fsl_easrc_release_slot(struct fsl_asrc *easrc, unsigned int ctx_id)
  *
  * Configure the register relate with context.
  */
-int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
+static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 {
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
@@ -1125,9 +1125,9 @@ static int fsl_easrc_process_format(struct fsl_asrc_pair *ctx,
 	return 0;
 }
 
-int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
-			     snd_pcm_format_t *in_raw_format,
-			     snd_pcm_format_t *out_raw_format)
+static int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
+				    snd_pcm_format_t *in_raw_format,
+				    snd_pcm_format_t *out_raw_format)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
@@ -1198,7 +1198,7 @@ int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
  * to conform with this format. Interleaving parameters are accessed
  * through the ASRC_CTRL_IN_ACCESSa and ASRC_CTRL_OUT_ACCESSa registers
  */
-int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct device *dev;
@@ -1242,7 +1242,7 @@ int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
  * Returns a negative number on error and >=0 as context id
  * on success
  */
-int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
+static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *easrc = ctx->asrc;
@@ -1287,7 +1287,7 @@ int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
  *
  * This funciton is mainly doing the revert thing in request context
  */
-void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
+static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
 	unsigned long lock_flags;
 	struct fsl_asrc *easrc;
@@ -1314,7 +1314,7 @@ void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
  *
  * Enable the DMA request and context
  */
-int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 
@@ -1332,7 +1332,7 @@ int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
  *
  * Disable the DMA request and context
  */
-int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	int val, i;
@@ -1379,8 +1379,8 @@ int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
 	return 0;
 }
 
-struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
-					   bool dir)
+static struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
+						  bool dir)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	enum asrc_pair_index index = ctx->index;
@@ -1391,7 +1391,6 @@ struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
 
 	return dma_request_slave_channel(&easrc->pdev->dev, name);
 };
-EXPORT_SYMBOL_GPL(fsl_easrc_get_dma_channel);
 
 static const unsigned int easrc_rates[] = {
 	8000, 11025, 12000, 16000,
-- 
2.21.0

