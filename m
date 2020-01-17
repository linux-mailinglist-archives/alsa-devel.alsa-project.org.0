Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D161F140E65
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 797E91754;
	Fri, 17 Jan 2020 16:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 797E91754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276585;
	bh=DJnkFrFaueeJK2+P0TY4neLR1uyeuvUAlF1NBD553WA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GsgXV96sJbvNO56IXSRJ4elPVaVOWnQz5Fh2K0M7wyXkX+qks+4CHhvVGUiaWo3DL
	 ApdU1FgeST3uaYDUT/32WaAGOOlLCKwjIw/PPfG9LZGj0LhrnRsbV8adPK8XEhm5m8
	 SWqkAj4Y5yCMugcP5mrL4ekykuQ5dk1Tpa2JiL2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E77AAF80316;
	Fri, 17 Jan 2020 16:46:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E472F8014B; Fri, 17 Jan 2020 16:44:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40FC6F80272
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40FC6F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uURExAX8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dV0fjoYY7tLWGhUV1CdLE/kwDSlyncCacWZYqWOsxx0=; b=uURExAX8+Deo
 XG37ZaxnAVlIROX9TiXKHjFt55QgZQYpNp3Bv/kJ/kQBvn54FNRUc2Q9kS/IozzJ1EQ+9v824kTQ1
 f3Z6GqvRUfdNmtt2mFrLSPKafELQ3p+/u+H/2TzofWGkOuUf/2NWVaFzfa38lNvcufgDy8+AnpRl8
 9i3m0=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnB-0006sb-Ap; Fri, 17 Jan 2020 15:44:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 07E21D02BD9; Fri, 17 Jan 2020 15:44:13 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200114161841.451-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:13 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, Mark Brown <broonie@kernel.org>,
 li.xu@cirrus.com
Subject: [alsa-devel] Applied "ASoC: wm_adsp: Correct cache handling of new
	kernel control API" to the asoc tree
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

   ASoC: wm_adsp: Correct cache handling of new kernel control API

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

From 73ecf1a673d3502dff1445f06675aba65ff20ce7 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Tue, 14 Jan 2020 16:18:38 +0000
Subject: [PATCH] ASoC: wm_adsp: Correct cache handling of new kernel control
 API

The recently added API that exposes firmware mixer controls to the
kernel is missing cache handling and all writes bypass the cache, this
obviously causes the cache to get out of sync with the hardware. Factor
out the cache handling into two new helper functions and call those from
both the normal ALSA control handlers and the new kernel API.

Fixes: eb65ccdb0836 ("ASoC: wm_adsp: Expose mixer control API")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200114161841.451-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 98 ++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 2a9b610f6d43..d3d32b501aca 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1030,8 +1030,8 @@ static int wm_coeff_write_acked_control(struct wm_coeff_ctl *ctl,
 	return -ETIMEDOUT;
 }
 
-static int wm_coeff_write_control(struct wm_coeff_ctl *ctl,
-				  const void *buf, size_t len)
+static int wm_coeff_write_ctrl_raw(struct wm_coeff_ctl *ctl,
+				   const void *buf, size_t len)
 {
 	struct wm_adsp *dsp = ctl->dsp;
 	void *scratch;
@@ -1061,6 +1061,23 @@ static int wm_coeff_write_control(struct wm_coeff_ctl *ctl,
 	return 0;
 }
 
+static int wm_coeff_write_ctrl(struct wm_coeff_ctl *ctl,
+			       const void *buf, size_t len)
+{
+	int ret = 0;
+
+	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
+		ret = -EPERM;
+	else if (buf != ctl->cache)
+		memcpy(ctl->cache, buf, len);
+
+	ctl->set = 1;
+	if (ctl->enabled && ctl->dsp->running)
+		ret = wm_coeff_write_ctrl_raw(ctl, buf, len);
+
+	return ret;
+}
+
 static int wm_coeff_put(struct snd_kcontrol *kctl,
 			struct snd_ctl_elem_value *ucontrol)
 {
@@ -1071,16 +1088,7 @@ static int wm_coeff_put(struct snd_kcontrol *kctl,
 	int ret = 0;
 
 	mutex_lock(&ctl->dsp->pwr_lock);
-
-	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
-		ret = -EPERM;
-	else
-		memcpy(ctl->cache, p, ctl->len);
-
-	ctl->set = 1;
-	if (ctl->enabled && ctl->dsp->running)
-		ret = wm_coeff_write_control(ctl, p, ctl->len);
-
+	ret = wm_coeff_write_ctrl(ctl, p, ctl->len);
 	mutex_unlock(&ctl->dsp->pwr_lock);
 
 	return ret;
@@ -1096,15 +1104,10 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&ctl->dsp->pwr_lock);
 
-	if (copy_from_user(ctl->cache, bytes, size)) {
+	if (copy_from_user(ctl->cache, bytes, size))
 		ret = -EFAULT;
-	} else {
-		ctl->set = 1;
-		if (ctl->enabled && ctl->dsp->running)
-			ret = wm_coeff_write_control(ctl, ctl->cache, size);
-		else if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
-			ret = -EPERM;
-	}
+	else
+		ret = wm_coeff_write_ctrl(ctl, ctl->cache, size);
 
 	mutex_unlock(&ctl->dsp->pwr_lock);
 
@@ -1135,8 +1138,8 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	return ret;
 }
 
-static int wm_coeff_read_control(struct wm_coeff_ctl *ctl,
-				 void *buf, size_t len)
+static int wm_coeff_read_ctrl_raw(struct wm_coeff_ctl *ctl,
+				  void *buf, size_t len)
 {
 	struct wm_adsp *dsp = ctl->dsp;
 	void *scratch;
@@ -1166,29 +1169,37 @@ static int wm_coeff_read_control(struct wm_coeff_ctl *ctl,
 	return 0;
 }
 
-static int wm_coeff_get(struct snd_kcontrol *kctl,
-			struct snd_ctl_elem_value *ucontrol)
+static int wm_coeff_read_ctrl(struct wm_coeff_ctl *ctl, void *buf, size_t len)
 {
-	struct soc_bytes_ext *bytes_ext =
-		(struct soc_bytes_ext *)kctl->private_value;
-	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
-	char *p = ucontrol->value.bytes.data;
 	int ret = 0;
 
-	mutex_lock(&ctl->dsp->pwr_lock);
-
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		if (ctl->enabled && ctl->dsp->running)
-			ret = wm_coeff_read_control(ctl, p, ctl->len);
+			return wm_coeff_read_ctrl_raw(ctl, buf, len);
 		else
-			ret = -EPERM;
+			return -EPERM;
 	} else {
 		if (!ctl->flags && ctl->enabled && ctl->dsp->running)
-			ret = wm_coeff_read_control(ctl, ctl->cache, ctl->len);
+			ret = wm_coeff_read_ctrl_raw(ctl, ctl->cache, ctl->len);
 
-		memcpy(p, ctl->cache, ctl->len);
+		if (buf != ctl->cache)
+			memcpy(buf, ctl->cache, len);
 	}
 
+	return ret;
+}
+
+static int wm_coeff_get(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *)kctl->private_value;
+	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	char *p = ucontrol->value.bytes.data;
+	int ret;
+
+	mutex_lock(&ctl->dsp->pwr_lock);
+	ret = wm_coeff_read_ctrl(ctl, p, ctl->len);
 	mutex_unlock(&ctl->dsp->pwr_lock);
 
 	return ret;
@@ -1204,15 +1215,7 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&ctl->dsp->pwr_lock);
 
-	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
-		if (ctl->enabled && ctl->dsp->running)
-			ret = wm_coeff_read_control(ctl, ctl->cache, size);
-		else
-			ret = -EPERM;
-	} else {
-		if (!ctl->flags && ctl->enabled && ctl->dsp->running)
-			ret = wm_coeff_read_control(ctl, ctl->cache, size);
-	}
+	ret = wm_coeff_read_ctrl_raw(ctl, ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, ctl->cache, size))
 		ret = -EFAULT;
@@ -1340,7 +1343,7 @@ static int wm_coeff_init_control_caches(struct wm_adsp *dsp)
 		 * created so we don't need to do anything.
 		 */
 		if (!ctl->flags || (ctl->flags & WMFW_CTL_FLAG_READABLE)) {
-			ret = wm_coeff_read_control(ctl, ctl->cache, ctl->len);
+			ret = wm_coeff_read_ctrl_raw(ctl, ctl->cache, ctl->len);
 			if (ret < 0)
 				return ret;
 		}
@@ -1358,7 +1361,8 @@ static int wm_coeff_sync_controls(struct wm_adsp *dsp)
 		if (!ctl->enabled)
 			continue;
 		if (ctl->set && !(ctl->flags & WMFW_CTL_FLAG_VOLATILE)) {
-			ret = wm_coeff_write_control(ctl, ctl->cache, ctl->len);
+			ret = wm_coeff_write_ctrl_raw(ctl, ctl->cache,
+						      ctl->len);
 			if (ret < 0)
 				return ret;
 		}
@@ -2048,7 +2052,7 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (len > ctl->len)
 		return -EINVAL;
 
-	ret = wm_coeff_write_control(ctl, buf, len);
+	ret = wm_coeff_write_ctrl(ctl, buf, len);
 
 	kcontrol = snd_soc_card_get_kcontrol(dsp->component->card, ctl->name);
 	snd_ctl_notify(dsp->component->card->snd_card,
@@ -2070,7 +2074,7 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (len > ctl->len)
 		return -EINVAL;
 
-	return wm_coeff_read_control(ctl, buf, len);
+	return wm_coeff_read_ctrl(ctl, buf, len);
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
