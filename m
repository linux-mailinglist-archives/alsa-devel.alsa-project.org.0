Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6E58392
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 15:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02DC3166F;
	Thu, 27 Jun 2019 15:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02DC3166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561642453;
	bh=SQr6l8imd92ixIJprKly+HkSiyX3swQHzGWShcKuKI0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A8HNayTZ02q/3v9GIa478uwqcXPmihBHgsOmPkdjTIuTy39ubV8ujsEWhNCyjBJhQ
	 XEFEdi2j5Fe8w4hay2Xh1qUGGbIaOW68LAN1S/lNyGxe2HzRyyufHzSOeknAdihS0d
	 /++RhEzWua0a8wb4MqhzxuIWskC0eOLZjtazSPPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5F2F896F0;
	Thu, 27 Jun 2019 15:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D790F896F6; Thu, 27 Jun 2019 15:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A625BF806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 15:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A625BF806F0
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgUVU-0004av-RA; Thu, 27 Jun 2019 13:32:08 +0000
From: Colin King <colin.king@canonical.com>
To: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Thu, 27 Jun 2019 14:32:08 +0100
Message-Id: <20190627133208.9550-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH][next] ASoC: topology: fix memory leaks on sm,
	se and sbe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

Currently when a kstrdup fails the error exit paths don't free
the allocations for sm, se and sbe.  This can be fixed by assigning
kc[i].private_value to these before doing the ksrtdup so that the error
exit path will be able to free these objects.

Addresses-Coverity: ("Resource leak")
Fixes: 9f90af3a9952 ("ASoC: topology: Consolidate and fix asoc_tplg_dapm_widget_*_create flow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index fc1f1d6f9e92..dc463f1a9e24 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1326,10 +1326,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		dev_dbg(tplg->dev, " adding DAPM widget mixer control %s at %d\n",
 			mc->hdr.name, i);
 
+		kc[i].private_value = (long)sm;
 		kc[i].name = kstrdup(mc->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_sm;
-		kc[i].private_value = (long)sm;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 		kc[i].access = mc->hdr.access;
 
@@ -1412,10 +1412,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
 			ec->hdr.name);
 
+		kc[i].private_value = (long)se;
 		kc[i].name = kstrdup(ec->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_se;
-		kc[i].private_value = (long)se;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 		kc[i].access = ec->hdr.access;
 
@@ -1524,10 +1524,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 			"ASoC: adding bytes kcontrol %s with access 0x%x\n",
 			be->hdr.name, be->hdr.access);
 
+		kc[i].private_value = (long)sbe;
 		kc[i].name = kstrdup(be->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_sbe;
-		kc[i].private_value = (long)sbe;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 		kc[i].access = be->hdr.access;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
