Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FB100AD2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 18:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08E2168E;
	Mon, 18 Nov 2019 18:49:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08E2168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574099433;
	bh=BECzElPItFCor9H7wZoaflfbY7DhUWbXMd9ruVybO3k=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sTmTmjBQh00JnmlaqLVM19P1dRwJyIondCVigHX4tQ/uzC3zzBKtzUKtes0TQnb8s
	 YrqcMqdeicwD850C7n0ZoBmzWuHtnlEq5zrc7AN7Vg4v5Mo0AiWlRt318NHsQBVUwT
	 JGScSIdTmd+QfptOOvfQE++i2fKSZeJWAdJqoG50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D328F800FF;
	Mon, 18 Nov 2019 18:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88EA0F8013B; Mon, 18 Nov 2019 18:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 910E0F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 18:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910E0F800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE9C1FB;
 Mon, 18 Nov 2019 09:48:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 072AE3F703;
 Mon, 18 Nov 2019 09:48:41 -0800 (PST)
Date: Mon, 18 Nov 2019 17:48:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Li Xu <li.xu@cirrus.com>
In-Reply-To: <1573847653-17094-2-git-send-email-david.rhodes@cirrus.com>
Message-Id: <applied-1573847653-17094-2-git-send-email-david.rhodes@cirrus.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: wm_adsp: Expose mixer control API" to
	the asoc tree
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

   ASoC: wm_adsp: Expose mixer control API

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From eb65ccdb083639f8a9b6919c94d1df570396a9a1 Mon Sep 17 00:00:00 2001
From: Li Xu <li.xu@cirrus.com>
Date: Fri, 15 Nov 2019 13:54:13 -0600
Subject: [PATCH] ASoC: wm_adsp: Expose mixer control API

Expose mixer control API for reading and writing controls from the kernel.
This API can be used by ALSA kernel drivers with ADSP support to
read and write firmware-defined memory regions.

Signed-off-by: Li Xu <li.xu@cirrus.com>
Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/1573847653-17094-2-git-send-email-david.rhodes@cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 81 +++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/wm_adsp.h |  4 ++
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 9b8bb7bbe945..2a9b610f6d43 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -599,6 +599,9 @@ struct wm_coeff_ctl_ops {
 struct wm_coeff_ctl {
 	const char *name;
 	const char *fw_name;
+	/* Subname is needed to match with firmware */
+	const char *subname;
+	unsigned int subname_len;
 	struct wm_adsp_alg_region alg_region;
 	struct wm_coeff_ctl_ops ops;
 	struct wm_adsp *dsp;
@@ -1399,6 +1402,7 @@ static void wm_adsp_free_ctl_blk(struct wm_coeff_ctl *ctl)
 {
 	kfree(ctl->cache);
 	kfree(ctl->name);
+	kfree(ctl->subname);
 	kfree(ctl);
 }
 
@@ -1472,6 +1476,15 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 		ret = -ENOMEM;
 		goto err_ctl;
 	}
+	if (subname) {
+		ctl->subname_len = subname_len;
+		ctl->subname = kmemdup(subname,
+				       strlen(subname) + 1, GFP_KERNEL);
+		if (!ctl->subname) {
+			ret = -ENOMEM;
+			goto err_ctl_name;
+		}
+	}
 	ctl->enabled = 1;
 	ctl->set = 0;
 	ctl->ops.xget = wm_coeff_get;
@@ -1485,7 +1498,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 	ctl->cache = kzalloc(ctl->len, GFP_KERNEL);
 	if (!ctl->cache) {
 		ret = -ENOMEM;
-		goto err_ctl_name;
+		goto err_ctl_subname;
 	}
 
 	list_add(&ctl->list, &dsp->ctl_list);
@@ -1508,6 +1521,8 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 
 err_ctl_cache:
 	kfree(ctl->cache);
+err_ctl_subname:
+	kfree(ctl->subname);
 err_ctl_name:
 	kfree(ctl->name);
 err_ctl:
@@ -1995,6 +2010,70 @@ static int wm_adsp_load(struct wm_adsp *dsp)
 	return ret;
 }
 
+/*
+ * Find wm_coeff_ctl with input name as its subname
+ * If not found, return NULL
+ */
+static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
+					     const char *name, int type,
+					     unsigned int alg)
+{
+	struct wm_coeff_ctl *pos, *rslt = NULL;
+
+	list_for_each_entry(pos, &dsp->ctl_list, list) {
+		if (!pos->subname)
+			continue;
+		if (strncmp(pos->subname, name, pos->subname_len) == 0 &&
+				pos->alg_region.alg == alg &&
+				pos->alg_region.type == type) {
+			rslt = pos;
+			break;
+		}
+	}
+
+	return rslt;
+}
+
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
+		      unsigned int alg, void *buf, size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+	struct snd_kcontrol *kcontrol;
+	int ret;
+
+	ctl = wm_adsp_get_ctl(dsp, name, type, alg);
+	if (!ctl)
+		return -EINVAL;
+
+	if (len > ctl->len)
+		return -EINVAL;
+
+	ret = wm_coeff_write_control(ctl, buf, len);
+
+	kcontrol = snd_soc_card_get_kcontrol(dsp->component->card, ctl->name);
+	snd_ctl_notify(dsp->component->card->snd_card,
+		       SNDRV_CTL_EVENT_MASK_VALUE, &kcontrol->id);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
+
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
+		     unsigned int alg, void *buf, size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+
+	ctl = wm_adsp_get_ctl(dsp, name, type, alg);
+	if (!ctl)
+		return -EINVAL;
+
+	if (len > ctl->len)
+		return -EINVAL;
+
+	return wm_coeff_read_control(ctl, buf, len);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
+
 static void wm_adsp_ctl_fixup_base(struct wm_adsp *dsp,
 				  const struct wm_adsp_alg_region *alg_region)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index aa634ef6c9f5..4c481cf20275 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -201,5 +201,9 @@ int wm_adsp_compr_pointer(struct snd_compr_stream *stream,
 			  struct snd_compr_tstamp *tstamp);
 int wm_adsp_compr_copy(struct snd_compr_stream *stream,
 		       char __user *buf, size_t count);
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name,  int type,
+		      unsigned int alg, void *buf, size_t len);
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name,  int type,
+		      unsigned int alg, void *buf, size_t len);
 
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
