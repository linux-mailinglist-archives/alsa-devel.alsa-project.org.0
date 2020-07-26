Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFEC22DEC0
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 13:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE9F1697;
	Sun, 26 Jul 2020 13:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE9F1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595763745;
	bh=4hdAcZePNBj18K3RhQYnDwKuthplAr7kREReNad/OoY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrJHyhZh2kJydgTvrDTWOvhQTclMjaHvibQwUstdeFK028ZXkCuqdBqZ5UB3eezNa
	 jGSzGlqJmsPThnemxZmJC1lpVyeVIe07CZ0vRgBchHg1QNz0HZNrIRVJLrzhbQQUBF
	 9wEy8mW6DGWIHxLuc6On5+58ChtbXNDpL8b5yCZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8631FF80227;
	Sun, 26 Jul 2020 13:40:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F0EEF8013C; Sun, 26 Jul 2020 13:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1464F8013C
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 13:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1464F8013C
X-IronPort-AV: E=Sophos;i="5.75,398,1589234400"; d="scan'208";a="355309543"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 26 Jul 2020 13:39:47 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/7] ASoC: Intel: drop unnecessary list_empty
Date: Sun, 26 Jul 2020 12:58:26 +0200
Message-Id: <1595761112-11003-2-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

list_for_each_entry_safe is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

Note that list_for_each_entry_safe is defined in terms of
list_first_entry, which indicates that it should not be used on an
empty list.  But in list_for_each_entry_safe, the element obtained by
list_first_entry is not really accessed, only the address of its
list_head field is compared to the address of the list head, so the
list_first_entry is safe.

The semantic patch that makes this change is as follows (with another
variant for the no brace case): (http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_entry_safe;
statement S;
identifier i,j;
@@
-if (!(list_empty(x))) {
   list_for_each_entry_safe(i,j,x,...) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/intel/atom/sst/sst_loader.c  |   10 ++++------
 sound/soc/intel/skylake/skl-pcm.c      |    8 +++-----
 sound/soc/intel/skylake/skl-topology.c |    5 ++---
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index 8ad0ca7..fc91a30 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -276,12 +276,10 @@ void sst_memcpy_free_resources(struct intel_sst_drv *sst_drv_ctx)
 	struct sst_memcpy_list *listnode, *tmplistnode;
 
 	/* Free the list */
-	if (!list_empty(&sst_drv_ctx->memcpy_list)) {
-		list_for_each_entry_safe(listnode, tmplistnode,
-				&sst_drv_ctx->memcpy_list, memcpylist) {
-			list_del(&listnode->memcpylist);
-			kfree(listnode);
-		}
+	list_for_each_entry_safe(listnode, tmplistnode,
+				 &sst_drv_ctx->memcpy_list, memcpylist) {
+		list_del(&listnode->memcpylist);
+		kfree(listnode);
 	}
 }
 
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 89dcccd..9e15b06 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1509,11 +1509,9 @@ int skl_platform_unregister(struct device *dev)
 	struct skl_dev *skl = bus_to_skl(bus);
 	struct skl_module_deferred_bind *modules, *tmp;
 
-	if (!list_empty(&skl->bind_list)) {
-		list_for_each_entry_safe(modules, tmp, &skl->bind_list, node) {
-			list_del(&modules->node);
-			kfree(modules);
-		}
+	list_for_each_entry_safe(modules, tmp, &skl->bind_list, node) {
+		list_del(&modules->node);
+		kfree(modules);
 	}
 
 	kfree(skl->dais);
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b9aab47..b7d2d97 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3773,9 +3773,8 @@ void skl_tplg_exit(struct snd_soc_component *component, struct hdac_bus *bus)
 	struct skl_dev *skl = bus_to_skl(bus);
 	struct skl_pipeline *ppl, *tmp;
 
-	if (!list_empty(&skl->ppl_list))
-		list_for_each_entry_safe(ppl, tmp, &skl->ppl_list, node)
-			list_del(&ppl->node);
+	list_for_each_entry_safe(ppl, tmp, &skl->ppl_list, node)
+		list_del(&ppl->node);
 
 	/* clean up topology */
 	snd_soc_tplg_component_remove(component, SND_SOC_TPLG_INDEX_ALL);

