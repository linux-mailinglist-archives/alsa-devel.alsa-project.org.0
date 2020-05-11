Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204941CE1E8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 19:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C172E15F9;
	Mon, 11 May 2020 19:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C172E15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589219047;
	bh=a3Iyd0AtJyoc/jnDu0wU+xUacgHz++uvOIDW/S793sI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hWNu2bpa3aSsGriD+yFb+h6dX5te9c6qNIBcWE3T+1imsReuU7e5L4UO+qQlrU3Dj
	 cc2ut/+EeNAN/cWUGM+rjhlL4CfzGvdvnRkxSmqsYCRcPamhp6tgzTctAJpy9Wn8Fr
	 yoTnc2Ib8mWzYvOUbeqlVtdUk4ldidPGdBdoPh3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D504FF801F2;
	Mon, 11 May 2020 19:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7772DF80157; Mon, 11 May 2020 19:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44010F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 19:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44010F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qeIHokrg"
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97DD52070B;
 Mon, 11 May 2020 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589218935;
 bh=a3Iyd0AtJyoc/jnDu0wU+xUacgHz++uvOIDW/S793sI=;
 h=Date:From:To:Cc:Subject:From;
 b=qeIHokrg81Z1PpYZkgeLSu43ScttAjHimGyFySHs1JaZipMJOdDVuxsk37D1z6OxC
 tYAXdXDKrjgLv/54g3h+wFPvjPlsmwMX0TtiIKxKyX8Tij3eU5FdehSvD83aHJNf8F
 2H13GhEvNX4lBB+icp38E9m7TN/zUo1KJzbLtBbY=
Date: Mon, 11 May 2020 12:46:47 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH RESEND] ASoC: Intel: Skylake: Replace zero-length array with
 flexible-array
Message-ID: <20200511174647.GA17318@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/intel/atom/sst-atom-controls.h |    2 +-
 sound/soc/intel/skylake/skl-i2s.h        |    2 +-
 sound/soc/intel/skylake/skl-topology.h   |    4 ++--
 sound/soc/intel/skylake/skl.h            |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.h b/sound/soc/intel/atom/sst-atom-controls.h
index 5356e954a732..620b48d2a064 100644
--- a/sound/soc/intel/atom/sst-atom-controls.h
+++ b/sound/soc/intel/atom/sst-atom-controls.h
@@ -410,7 +410,7 @@ struct sst_cmd_set_gain_dual {
 struct sst_cmd_set_params {
 	struct sst_destination_id dst;
 	u16 command_id;
-	char params[0];
+	char params[];
 } __packed;
 
 
diff --git a/sound/soc/intel/skylake/skl-i2s.h b/sound/soc/intel/skylake/skl-i2s.h
index d7c15873c0d4..dfce91e11be1 100644
--- a/sound/soc/intel/skylake/skl-i2s.h
+++ b/sound/soc/intel/skylake/skl-i2s.h
@@ -46,7 +46,7 @@ struct skl_i2s_config_mclk {
 struct skl_i2s_config_mclk_ext {
 	u32 mdivctrl;
 	u32 mdivr_count;
-	u32 mdivr[0];
+	u32 mdivr[];
 } __packed;
 
 struct skl_i2s_config_blob_signature {
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index e967800dbb62..d2cd8ef8e97f 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -119,7 +119,7 @@ struct skl_cpr_gtw_cfg {
 struct skl_dma_control {
 	u32 node_id;
 	u32 config_length;
-	u32 config_data[0];
+	u32 config_data[];
 } __packed;
 
 struct skl_cpr_cfg {
@@ -152,7 +152,7 @@ struct skl_up_down_mixer_cfg {
 
 struct skl_algo_cfg {
 	struct skl_base_cfg  base_cfg;
-	char params[0];
+	char params[];
 } __packed;
 
 struct skl_base_outfmt_cfg {
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 2bfbf59277c4..26057f38a014 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -49,7 +49,7 @@ struct skl_astate_param {
 
 struct skl_astate_config {
 	u32 count;
-	struct skl_astate_param astate_table[0];
+	struct skl_astate_param astate_table[];
 };
 
 struct skl_fw_config {

