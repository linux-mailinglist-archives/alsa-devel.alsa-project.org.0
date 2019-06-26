Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666D567CE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FEDD1685;
	Wed, 26 Jun 2019 13:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FEDD1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561549199;
	bh=Spr54r8oZxbMUbRK+JkXEjA9odED8seeMpDwiIR3kbU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=l8ireWSmFSaxlZjZn8N1PcBDGrr6hJ4eOP+zZyQJYIVbG0sLe3PQhPuAhOMawe0y8
	 OQO6ajcqtS3BAVNutd5wHEsoDUGJ8vTdDn56TZfS3NO7SAD2EMQ6/k3V5qJDzy6M8N
	 qYvVLhu916OMsNTacE8rTRkP9DXd53AYD81ylsrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2456BF89757;
	Wed, 26 Jun 2019 13:33:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 642E4F8972F; Wed, 26 Jun 2019 13:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01FAF896CC
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01FAF896CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VJhpgF/D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qEjEgksLlMMIOq5PIg2XtE8U7QX+SJUnlG+Ii63uk9c=; b=VJhpgF/DlZQi
 GenQPE5WC0uALJkznHeivhw3Feu/xRXQuU0X4Dyt7/n2B6R2NnaoioDgVdFUu6JK16le+TRf0X9vM
 ELSp+lomSQOqNQCqhep2Iq4itDq5A+Vt9JjZN/x3Y/sA1KmiImvrBBnC57AUHiA1bsnjOLKaG0tVY
 Ny9WM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AP-0007n3-2f; Wed, 26 Jun 2019 11:32:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 83D0B44004F; Wed, 26 Jun 2019 12:32:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kamil Lulko <kamilx.lulko@intel.com>
In-Reply-To: <20190613190436.20156-8-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113244.83D0B44004F@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Strip T and L from TLV
	IPCs" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: Skylake: Strip T and L from TLV IPCs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a8cd7066f0422f378902770034ddac1720d0e032 Mon Sep 17 00:00:00 2001
From: Kamil Lulko <kamilx.lulko@intel.com>
Date: Thu, 13 Jun 2019 21:04:36 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Strip T and L from TLV IPCs

cAVS modules do not require Type and Length header within the
set_module_params IPC. This is also true for Vendor modules. The
userspace (like tinymix) always appends this header to TLV controls
which are used for set_module_params. Simply assume this header is
always present in the payload and omit it from the IPC.

Signed-off-by: Kamil Lulko <kamilx.lulko@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-topology.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 99825dda34af..c353eb14ce36 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1492,22 +1492,18 @@ static int skl_tplg_tlv_control_set(struct snd_kcontrol *kcontrol,
 	struct skl *skl = get_skl_ctx(w->dapm->dev);
 
 	if (ac->params) {
+		/*
+		 * Widget data is expected to be stripped of T and L
+		 */
+		size -= 2 * sizeof(unsigned int);
+		data += 2;
+
 		if (size > ac->max)
 			return -EINVAL;
-
 		ac->size = size;
-		/*
-		 * if the param_is is of type Vendor, firmware expects actual
-		 * parameter id and size from the control.
-		 */
-		if (ac->param_id == SKL_PARAM_VENDOR_ID) {
-			if (copy_from_user(ac->params, data, size))
-				return -EFAULT;
-		} else {
-			if (copy_from_user(ac->params,
-					   data + 2, size))
-				return -EFAULT;
-		}
+
+		if (copy_from_user(ac->params, data, size))
+			return -EFAULT;
 
 		if (w->power)
 			return skl_set_module_params(skl->skl_sst,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
