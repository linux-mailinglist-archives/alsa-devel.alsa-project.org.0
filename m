Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B095DD70D
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Oct 2019 09:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8995A1654;
	Sat, 19 Oct 2019 09:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8995A1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571468748;
	bh=XpQrnQInqpNvbZ/I5AxJFSVYpRqbJqMSh1pKj7DZoHE=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQdekdC+u/qpq2nZ/9+q0WSpKhzrpvxMpDnRIsKmpUA4/dOtKwDPrlMC6HYawOFKx
	 jIXS07QMC9oX5SmThwexE3gkwbD1fCMu3F2ufpvr5uCUS14NBF0dsAfy02Iie0kzMg
	 hfEq5qZnTa/+G/D8PNZpgzIF3OBX0bRB4hixJxp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E91CF80600;
	Sat, 19 Oct 2019 09:03:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05CDAF805FE; Sat, 19 Oct 2019 09:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D1FF80528
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 09:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D1FF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="uZ+OzvRW"
Received: by mail-qk1-x74a.google.com with SMTP id s14so7846907qkg.12
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 00:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=G5L881cZs9ekMPYtRm/ifzqrFF4J5TJW5mGCjvfWHcI=;
 b=uZ+OzvRWHPS6pBuDPRlztqi5AQ1mCn0MkfJZRWhb4RHpLFirPWeX13NomXrf1dvdNU
 PHIXm4Vkjc96JzMQevrno+sIic3G2F/b9HsK190edNzwDv3+SmAkVi5dcWwNA84jIq3A
 4EEE1m7s+AQeeBNI/c0P78waBKRma66+K4QxxKkhybJxtiu9YzrEkJR/fGImUz9PMZRc
 0lS8Ix9hD9HMdyHcBgS2a77rFFPROGUd1g1M0mJSFZuegpknY/MkpqnjfQ8eVGZ8Xecc
 GfXZXV4I74h8FK4Ad4icBaPQGRjhmtWatz0KKt/Y9EHEEJlvb+CtKzuVQUPMgbAMVkiV
 BwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=G5L881cZs9ekMPYtRm/ifzqrFF4J5TJW5mGCjvfWHcI=;
 b=ea6slTRi4BSBfOryBUjtASRHHyGB5T4+GagOC2TD7GZqS6HFUMzRGrMCdVTfO5msKp
 FTxaKG8+v0jFoejQ4V8U8Rld44r8Pn3w9B+b9XKDgMDmA3ysY0ToxqO7jYrC/PM04pAV
 AcxFQobAUS6CICDOA0OowdGMRqFs7O7yULO6x3+BW2ayPgOeX6xnlAou5CPBFfZuD8ol
 nH4fc4OnJPnX+EChRpzXr7eUgUoQTnnwVs3+QECoiYqgRpXF7+5+GailkjMl67RqtHCD
 LDEcQCaESapDWO0qEpAYTk6idZmYU0t5LLQQZwVR/6YjGFs8UWEWMz3CmMJtXtmkI6Un
 vSEA==
X-Gm-Message-State: APjAAAUSnUnyqiDJ3A7Vl7UnrwEeQdnwqaTWVb10+pFO7uGX+PGKMpLu
 evgQPBgKG5WEn+5SzB88tL6HlmfTh0dv
X-Google-Smtp-Source: APXvYqzuHQ78MNLgZLuR9ZZtlSRfpINVkmCon7v3jAa6hbjO/yer2gxMQOaCCMF5BYyOvYpl4Uomrs2m5r9T
X-Received: by 2002:ac8:2dda:: with SMTP id q26mr3531700qta.100.1571468594209; 
 Sat, 19 Oct 2019 00:03:14 -0700 (PDT)
Date: Sat, 19 Oct 2019 15:02:51 +0800
In-Reply-To: <20191019070254.23870-1-tzungbi@google.com>
Message-Id: <20191019143504.1.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
Mime-Version: 1.0
References: <20191019070254.23870-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v5 1/4] ASoC: cros_ec_codec: support WoV
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

1. Get EC codec's capabilities.
2. Get and set SHM address if any.
3. Transmit language model to EC codec if needed.
4. Start to read audio data from EC codec if receives host event.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec_trace.c       |   1 +
 .../linux/platform_data/cros_ec_commands.h    |  69 ++
 sound/soc/codecs/Kconfig                      |   2 +
 sound/soc/codecs/cros_ec_codec.c              | 700 +++++++++++++++++-
 4 files changed, 770 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 2ea0d4e0d54d..5af1d66d9eca 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -101,6 +101,7 @@
 	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC_WOV), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
 	TRACE_SYMBOL(EC_CMD_GET_PANIC_INFO), \
 	TRACE_SYMBOL(EC_CMD_ACPI_READ), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 21db0d4d4025..69210881ebac 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -556,6 +556,9 @@ enum host_event_code {
 	/* Keyboard recovery combo with hardware reinitialization */
 	EC_HOST_EVENT_KEYBOARD_RECOVERY_HW_REINIT = 30,
 
+	/* WoV */
+	EC_HOST_EVENT_WOV = 31,
+
 	/*
 	 * The high bit of the event mask is not used as a host event code.  If
 	 * it reads back as set, then the entire event mask should be
@@ -4477,10 +4480,14 @@ enum ec_codec_subcmd {
 };
 
 enum ec_codec_cap {
+	EC_CODEC_CAP_WOV_AUDIO_SHM = 0,
+	EC_CODEC_CAP_WOV_LANG_SHM = 1,
 	EC_CODEC_CAP_LAST = 32,
 };
 
 enum ec_codec_shm_id {
+	EC_CODEC_SHM_ID_WOV_AUDIO = 0x0,
+	EC_CODEC_SHM_ID_WOV_LANG = 0x1,
 	EC_CODEC_SHM_ID_LAST,
 };
 
@@ -4641,6 +4648,68 @@ struct __ec_align4 ec_param_ec_codec_i2s_rx {
 	};
 };
 
+/*****************************************************************************/
+/* Commands for WoV on audio codec. */
+
+#define EC_CMD_EC_CODEC_WOV 0x00BF
+
+enum ec_codec_wov_subcmd {
+	EC_CODEC_WOV_SET_LANG = 0x0,
+	EC_CODEC_WOV_SET_LANG_SHM = 0x1,
+	EC_CODEC_WOV_GET_LANG = 0x2,
+	EC_CODEC_WOV_ENABLE = 0x3,
+	EC_CODEC_WOV_DISABLE = 0x4,
+	EC_CODEC_WOV_READ_AUDIO = 0x5,
+	EC_CODEC_WOV_READ_AUDIO_SHM = 0x6,
+	EC_CODEC_WOV_SUBCMD_COUNT,
+};
+
+/*
+ * @hash is SHA256 of the whole language model.
+ * @total_len indicates the length of whole language model.
+ * @offset is the cursor from the beginning of the model.
+ * @buf is the packet buffer.
+ * @len denotes how many bytes in the buf.
+ */
+struct __ec_align4 ec_param_ec_codec_wov_set_lang {
+	uint8_t hash[32];
+	uint32_t total_len;
+	uint32_t offset;
+	uint8_t buf[128];
+	uint32_t len;
+};
+
+struct __ec_align4 ec_param_ec_codec_wov_set_lang_shm {
+	uint8_t hash[32];
+	uint32_t total_len;
+};
+
+struct __ec_align4 ec_param_ec_codec_wov {
+	uint8_t cmd; /* enum ec_codec_wov_subcmd */
+	uint8_t reserved[3];
+
+	union {
+		struct ec_param_ec_codec_wov_set_lang
+				set_lang_param;
+		struct ec_param_ec_codec_wov_set_lang_shm
+				set_lang_shm_param;
+	};
+};
+
+struct __ec_align4 ec_response_ec_codec_wov_get_lang {
+	uint8_t hash[32];
+};
+
+struct __ec_align4 ec_response_ec_codec_wov_read_audio {
+	uint8_t buf[128];
+	uint32_t len;
+};
+
+struct __ec_align4 ec_response_ec_codec_wov_read_audio_shm {
+	uint32_t offset;
+	uint32_t len;
+};
+
 /*****************************************************************************/
 /* System commands */
 
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5a706102db04..1a4b084cc90d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -509,6 +509,8 @@ config SND_SOC_CQ0093VC
 config SND_SOC_CROS_EC_CODEC
 	tristate "codec driver for ChromeOS EC"
 	depends on CROS_EC
+	select CRYPTO
+	select CRYPTO_SHA256
 	help
 	  If you say yes here you will get support for the
 	  ChromeOS Embedded Controller's Audio Codec.
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 3d4f9e82d6e9..dd14caf9091a 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -8,10 +8,16 @@
  * EC for audio function.
  */
 
+#include <crypto/hash.h>
+#include <crypto/sha.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
@@ -23,8 +29,45 @@
 struct cros_ec_codec_priv {
 	struct device *dev;
 	struct cros_ec_device *ec_device;
+
+	/* common */
+	uint32_t ec_capabilities;
+
+	uint64_t ec_shm_addr;
+	uint32_t ec_shm_len;
+
+	uint64_t ap_shm_phys_addr;
+	uint32_t ap_shm_len;
+	uint64_t ap_shm_addr;
+	uint64_t ap_shm_last_alloc;
+
+	/* DMIC */
+	atomic_t dmic_probed;
+
+	/* WoV */
+	bool wov_enabled;
+	uint8_t *wov_audio_shm_p;
+	uint32_t wov_audio_shm_len;
+	uint8_t wov_audio_shm_type;
+	uint8_t *wov_lang_shm_p;
+	uint32_t wov_lang_shm_len;
+	uint8_t wov_lang_shm_type;
+
+	struct mutex wov_dma_lock;
+	uint8_t wov_buf[64000];
+	uint32_t wov_rp, wov_wp;
+	size_t wov_dma_offset;
+	bool wov_burst_read;
+	struct snd_pcm_substream *wov_substream;
+	struct delayed_work wov_copy_work;
+	struct notifier_block wov_notifier;
 };
 
+static int ec_codec_capable(struct cros_ec_codec_priv *priv, uint8_t cap)
+{
+	return priv->ec_capabilities & BIT(cap);
+}
+
 static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 				uint8_t *out, size_t outsize,
 				uint8_t *in, size_t insize)
@@ -57,6 +100,41 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 	return ret;
 }
 
+static int calculate_sha256(struct cros_ec_codec_priv *priv,
+			    uint8_t *buf, uint32_t size, uint8_t *digest)
+{
+	struct crypto_shash *tfm;
+
+	tfm = crypto_alloc_shash("sha256", CRYPTO_ALG_TYPE_SHASH, 0);
+	if (IS_ERR(tfm)) {
+		dev_err(priv->dev, "can't alloc shash\n");
+		return PTR_ERR(tfm);
+	}
+
+	{
+		SHASH_DESC_ON_STACK(desc, tfm);
+
+		desc->tfm = tfm;
+
+		crypto_shash_digest(desc, buf, size, digest);
+		shash_desc_zero(desc);
+	}
+
+	crypto_free_shash(tfm);
+
+#ifdef DEBUG
+	{
+		char digest_str[65];
+
+		bin2hex(digest_str, digest, 32);
+		digest_str[64] = 0;
+		dev_dbg(priv->dev, "hash=%s\n", digest_str);
+	}
+#endif
+
+	return 0;
+}
+
 static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
@@ -147,6 +225,9 @@ static int dmic_probe(struct snd_soc_component *component)
 	struct ec_response_ec_codec_dmic_get_max_gain r;
 	int ret;
 
+	if (!atomic_add_unless(&priv->dmic_probed, 1, 1))
+		return 0;
+
 	p.cmd = EC_CODEC_DMIC_GET_MAX_GAIN;
 
 	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
@@ -324,23 +405,638 @@ static const struct snd_soc_component_driver i2s_rx_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(i2s_rx_dapm_routes),
 };
 
+static void *wov_map_shm(struct cros_ec_codec_priv *priv,
+			 uint8_t shm_id, uint32_t *len, uint8_t *type)
+{
+	struct ec_param_ec_codec p;
+	struct ec_response_ec_codec_get_shm_addr r;
+	uint32_t req, offset;
+
+	p.cmd = EC_CODEC_GET_SHM_ADDR;
+	p.get_shm_addr_param.shm_id = shm_id;
+	if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+				 (uint8_t *)&p, sizeof(p),
+				 (uint8_t *)&r, sizeof(r)) < 0) {
+		dev_err(priv->dev, "failed to EC_CODEC_GET_SHM_ADDR\n");
+		return NULL;
+	}
+
+	dev_dbg(priv->dev, "phys_addr=%#llx, len=%#x\n", r.phys_addr, r.len);
+
+	*len = r.len;
+	*type = r.type;
+
+	switch (r.type) {
+	case EC_CODEC_SHM_TYPE_EC_RAM:
+		return (void __force *)devm_ioremap_wc(priv->dev,
+				r.phys_addr + priv->ec_shm_addr, r.len);
+	case EC_CODEC_SHM_TYPE_SYSTEM_RAM:
+		if (r.phys_addr) {
+			dev_err(priv->dev, "unknown status\n");
+			return NULL;
+		}
+
+		req = round_up(r.len, PAGE_SIZE);
+		dev_dbg(priv->dev, "round up from %u to %u\n", r.len, req);
+
+		if (priv->ap_shm_last_alloc + req >
+		    priv->ap_shm_phys_addr + priv->ap_shm_len) {
+			dev_err(priv->dev, "insufficient space for AP SHM\n");
+			return NULL;
+		}
+
+		dev_dbg(priv->dev, "alloc AP SHM addr=%#llx, len=%#x\n",
+			priv->ap_shm_last_alloc, req);
+
+		p.cmd = EC_CODEC_SET_SHM_ADDR;
+		p.set_shm_addr_param.phys_addr = priv->ap_shm_last_alloc;
+		p.set_shm_addr_param.len = req;
+		p.set_shm_addr_param.shm_id = shm_id;
+		if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+					 (uint8_t *)&p, sizeof(p),
+					 NULL, 0) < 0) {
+			dev_err(priv->dev, "failed to EC_CODEC_SET_SHM_ADDR\n");
+			return NULL;
+		}
+
+		/*
+		 * Note: EC codec only requests for `r.len' but we allocate
+		 * round up PAGE_SIZE `req'.
+		 */
+		offset = priv->ap_shm_last_alloc - priv->ap_shm_phys_addr;
+		priv->ap_shm_last_alloc += req;
+
+		return (void *)(uintptr_t)(priv->ap_shm_addr + offset);
+	default:
+		return NULL;
+	}
+}
+
+static bool wov_queue_full(struct cros_ec_codec_priv *priv)
+{
+	return ((priv->wov_wp + 1) % sizeof(priv->wov_buf)) == priv->wov_rp;
+}
+
+static size_t wov_queue_size(struct cros_ec_codec_priv *priv)
+{
+	if (priv->wov_wp >= priv->wov_rp)
+		return priv->wov_wp - priv->wov_rp;
+	else
+		return sizeof(priv->wov_buf) - priv->wov_rp + priv->wov_wp;
+}
+
+static void wov_queue_dequeue(struct cros_ec_codec_priv *priv, size_t len)
+{
+	struct snd_pcm_runtime *runtime = priv->wov_substream->runtime;
+	size_t req;
+
+	while (len) {
+		req = min(len, runtime->dma_bytes - priv->wov_dma_offset);
+		if (priv->wov_wp >= priv->wov_rp)
+			req = min(req, (size_t)priv->wov_wp - priv->wov_rp);
+		else
+			req = min(req, sizeof(priv->wov_buf) - priv->wov_rp);
+
+		memcpy(runtime->dma_area + priv->wov_dma_offset,
+		       priv->wov_buf + priv->wov_rp, req);
+
+		priv->wov_dma_offset += req;
+		if (priv->wov_dma_offset == runtime->dma_bytes)
+			priv->wov_dma_offset = 0;
+
+		priv->wov_rp += req;
+		if (priv->wov_rp == sizeof(priv->wov_buf))
+			priv->wov_rp = 0;
+
+		len -= req;
+	}
+
+	snd_pcm_period_elapsed(priv->wov_substream);
+}
+
+static void wov_queue_try_dequeue(struct cros_ec_codec_priv *priv)
+{
+	size_t period_bytes = snd_pcm_lib_period_bytes(priv->wov_substream);
+
+	while (period_bytes && wov_queue_size(priv) >= period_bytes) {
+		wov_queue_dequeue(priv, period_bytes);
+		period_bytes = snd_pcm_lib_period_bytes(priv->wov_substream);
+	}
+}
+
+static void wov_queue_enqueue(struct cros_ec_codec_priv *priv,
+			      uint8_t *addr, size_t len, bool iomem)
+{
+	size_t req;
+
+	while (len) {
+		if (wov_queue_full(priv)) {
+			wov_queue_try_dequeue(priv);
+
+			if (wov_queue_full(priv)) {
+				dev_err(priv->dev, "overrun detected\n");
+				return;
+			}
+		}
+
+		if (priv->wov_wp >= priv->wov_rp)
+			req = sizeof(priv->wov_buf) - priv->wov_wp;
+		else
+			/* Note: waste 1-byte to differentiate full and empty */
+			req = priv->wov_rp - priv->wov_wp - 1;
+		req = min(req, len);
+
+		if (iomem)
+			memcpy_fromio(priv->wov_buf + priv->wov_wp,
+				      (void __force __iomem *)addr, req);
+		else
+			memcpy(priv->wov_buf + priv->wov_wp, addr, req);
+
+		priv->wov_wp += req;
+		if (priv->wov_wp == sizeof(priv->wov_buf))
+			priv->wov_wp = 0;
+
+		addr += req;
+		len -= req;
+	}
+
+	wov_queue_try_dequeue(priv);
+}
+
+static int wov_read_audio_shm(struct cros_ec_codec_priv *priv)
+{
+	struct ec_param_ec_codec_wov p;
+	struct ec_response_ec_codec_wov_read_audio_shm r;
+	int ret;
+
+	p.cmd = EC_CODEC_WOV_READ_AUDIO_SHM;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret) {
+		dev_err(priv->dev, "failed to EC_CODEC_WOV_READ_AUDIO_SHM\n");
+		return ret;
+	}
+
+	if (!r.len)
+		dev_dbg(priv->dev, "no data, sleep\n");
+	else
+		wov_queue_enqueue(priv, priv->wov_audio_shm_p + r.offset, r.len,
+			priv->wov_audio_shm_type == EC_CODEC_SHM_TYPE_EC_RAM);
+	return -EAGAIN;
+}
+
+static int wov_read_audio(struct cros_ec_codec_priv *priv)
+{
+	struct ec_param_ec_codec_wov p;
+	struct ec_response_ec_codec_wov_read_audio r;
+	int remain = priv->wov_burst_read ? 16000 : 320;
+	int ret;
+
+	while (remain >= 0) {
+		p.cmd = EC_CODEC_WOV_READ_AUDIO;
+		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+					   (uint8_t *)&p, sizeof(p),
+					   (uint8_t *)&r, sizeof(r));
+		if (ret) {
+			dev_err(priv->dev,
+				"failed to EC_CODEC_WOV_READ_AUDIO\n");
+			return ret;
+		}
+
+		if (!r.len) {
+			dev_dbg(priv->dev, "no data, sleep\n");
+			priv->wov_burst_read = false;
+			break;
+		}
+
+		wov_queue_enqueue(priv, r.buf, r.len, false);
+		remain -= r.len;
+	}
+
+	return -EAGAIN;
+}
+
+static void wov_copy_work(struct work_struct *w)
+{
+	struct cros_ec_codec_priv *priv =
+		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
+	int ret;
+
+	mutex_lock(&priv->wov_dma_lock);
+	if (!priv->wov_substream) {
+		dev_warn(priv->dev, "no pcm substream\n");
+		goto leave;
+	}
+
+	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
+		ret = wov_read_audio_shm(priv);
+	else
+		ret = wov_read_audio(priv);
+
+	if (ret == -EAGAIN)
+		schedule_delayed_work(&priv->wov_copy_work,
+				      msecs_to_jiffies(10));
+	else if (ret)
+		dev_err(priv->dev, "failed to read audio data\n");
+leave:
+	mutex_unlock(&priv->wov_dma_lock);
+}
+
+static int wov_enable_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct cros_ec_codec_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->wov_enabled;
+	return 0;
+}
+
+static int wov_enable_put(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct cros_ec_codec_priv *priv = snd_soc_component_get_drvdata(c);
+	int enabled = ucontrol->value.integer.value[0];
+	struct ec_param_ec_codec_wov p;
+	int ret;
+
+	if (priv->wov_enabled != enabled) {
+		if (enabled)
+			p.cmd = EC_CODEC_WOV_ENABLE;
+		else
+			p.cmd = EC_CODEC_WOV_DISABLE;
+
+		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+					   (uint8_t *)&p, sizeof(p), NULL, 0);
+		if (ret) {
+			dev_err(priv->dev, "failed to %s wov\n",
+				enabled ? "enable" : "disable");
+			return ret;
+		}
+
+		priv->wov_enabled = enabled;
+	}
+
+	return 0;
+}
+
+static int wov_set_lang_shm(struct cros_ec_codec_priv *priv,
+			    uint8_t *buf, size_t size, uint8_t *digest)
+{
+	struct ec_param_ec_codec_wov p;
+	struct ec_param_ec_codec_wov_set_lang_shm *pp = &p.set_lang_shm_param;
+	int ret;
+
+	if (size > priv->wov_lang_shm_len) {
+		dev_err(priv->dev, "no enough SHM size: %d\n",
+			priv->wov_lang_shm_len);
+		return -EIO;
+	}
+
+	switch (priv->wov_lang_shm_type) {
+	case EC_CODEC_SHM_TYPE_EC_RAM:
+		memcpy_toio((void __force __iomem *)priv->wov_lang_shm_p,
+			    buf, size);
+		memset_io((void __force __iomem *)priv->wov_lang_shm_p + size,
+			  0, priv->wov_lang_shm_len - size);
+		break;
+	case EC_CODEC_SHM_TYPE_SYSTEM_RAM:
+		memcpy(priv->wov_lang_shm_p, buf, size);
+		memset(priv->wov_lang_shm_p + size, 0,
+		       priv->wov_lang_shm_len - size);
+
+		/* make sure write to memory before calling host command */
+		wmb();
+		break;
+	}
+
+	p.cmd = EC_CODEC_WOV_SET_LANG_SHM;
+	memcpy(pp->hash, digest, SHA256_DIGEST_SIZE);
+	pp->total_len = size;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret) {
+		dev_err(priv->dev, "failed to EC_CODEC_WOV_SET_LANG_SHM\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wov_set_lang(struct cros_ec_codec_priv *priv,
+			uint8_t *buf, size_t size, uint8_t *digest)
+{
+	struct ec_param_ec_codec_wov p;
+	struct ec_param_ec_codec_wov_set_lang *pp = &p.set_lang_param;
+	size_t i, req;
+	int ret;
+
+	for (i = 0; i < size; i += req) {
+		req = min(size - i, ARRAY_SIZE(pp->buf));
+
+		p.cmd = EC_CODEC_WOV_SET_LANG;
+		memcpy(pp->hash, digest, SHA256_DIGEST_SIZE);
+		pp->total_len = size;
+		pp->offset = i;
+		memcpy(pp->buf, buf + i, req);
+		pp->len = req;
+		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+					   (uint8_t *)&p, sizeof(p), NULL, 0);
+		if (ret) {
+			dev_err(priv->dev, "failed to EC_CODEC_WOV_SET_LANG\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int wov_hotword_model_put(struct snd_kcontrol *kcontrol,
+				 const unsigned int __user *bytes,
+				 unsigned int size)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct ec_param_ec_codec_wov p;
+	struct ec_response_ec_codec_wov_get_lang r;
+	uint8_t digest[SHA256_DIGEST_SIZE];
+	uint8_t *buf;
+	int ret;
+
+	/* Skips the TLV header. */
+	bytes += 2;
+	size -= 8;
+
+	dev_dbg(priv->dev, "%s: size=%d\n", __func__, size);
+
+	buf = memdup_user(bytes, size);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = calculate_sha256(priv, buf, size, digest);
+	if (ret)
+		goto leave;
+
+	p.cmd = EC_CODEC_WOV_GET_LANG;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret)
+		goto leave;
+
+	if (memcmp(digest, r.hash, SHA256_DIGEST_SIZE) == 0) {
+		dev_dbg(priv->dev, "not updated");
+		goto leave;
+	}
+
+	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_LANG_SHM))
+		ret = wov_set_lang_shm(priv, buf, size, digest);
+	else
+		ret = wov_set_lang(priv, buf, size, digest);
+
+leave:
+	kfree(buf);
+	return ret;
+}
+
+static struct snd_kcontrol_new wov_controls[] = {
+	SOC_SINGLE_BOOL_EXT("Wake-on-Voice Switch", 0,
+			    wov_enable_get, wov_enable_put),
+	SND_SOC_BYTES_TLV("Hotword Model", 0x11000, NULL,
+			  wov_hotword_model_put),
+};
+
+static struct snd_soc_dai_driver wov_dai_driver = {
+	.name = "Wake on Voice",
+	.capture = {
+		.stream_name = "WoV Capture",
+		.channels_min = 1,
+		.channels_max = 1,
+		.rates = SNDRV_PCM_RATE_16000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
+static int wov_host_event(struct notifier_block *nb,
+			  unsigned long queued_during_suspend, void *notify)
+{
+	struct cros_ec_codec_priv *priv =
+		container_of(nb, struct cros_ec_codec_priv, wov_notifier);
+	u32 host_event;
+
+	dev_dbg(priv->dev, "%s\n", __func__);
+
+	host_event = cros_ec_get_host_event(priv->ec_device);
+	if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_WOV)) {
+		schedule_delayed_work(&priv->wov_copy_work, 0);
+		return NOTIFY_OK;
+	} else {
+		return NOTIFY_DONE;
+	}
+}
+
+static int wov_probe(struct snd_soc_component *component)
+{
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	int ret;
+
+	mutex_init(&priv->wov_dma_lock);
+	INIT_DELAYED_WORK(&priv->wov_copy_work, wov_copy_work);
+
+	priv->wov_notifier.notifier_call = wov_host_event;
+	ret = blocking_notifier_chain_register(
+			&priv->ec_device->event_notifier, &priv->wov_notifier);
+	if (ret)
+		return ret;
+
+	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_LANG_SHM)) {
+		priv->wov_lang_shm_p = wov_map_shm(priv,
+				EC_CODEC_SHM_ID_WOV_LANG,
+				&priv->wov_lang_shm_len,
+				&priv->wov_lang_shm_type);
+		if (!priv->wov_lang_shm_p)
+			return -EFAULT;
+	}
+
+	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM)) {
+		priv->wov_audio_shm_p = wov_map_shm(priv,
+				EC_CODEC_SHM_ID_WOV_AUDIO,
+				&priv->wov_audio_shm_len,
+				&priv->wov_audio_shm_type);
+		if (!priv->wov_audio_shm_p)
+			return -EFAULT;
+	}
+
+	return dmic_probe(component);
+}
+
+static void wov_remove(struct snd_soc_component *component)
+{
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+
+	blocking_notifier_chain_unregister(
+			&priv->ec_device->event_notifier, &priv->wov_notifier);
+}
+
+static int wov_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
+{
+	static const struct snd_pcm_hardware hw_param = {
+		.info = SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_MMAP_VALID,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.rates = SNDRV_PCM_RATE_16000,
+		.channels_min = 1,
+		.channels_max = 1,
+		.period_bytes_min = PAGE_SIZE,
+		.period_bytes_max = 0x20000 / 8,
+		.periods_min = 8,
+		.periods_max = 8,
+		.buffer_bytes_max = 0x20000,
+	};
+
+	return snd_soc_set_runtime_hwparams(substream, &hw_param);
+}
+
+static int wov_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hw_params)
+{
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+
+	mutex_lock(&priv->wov_dma_lock);
+	priv->wov_substream = substream;
+	priv->wov_rp = priv->wov_wp = 0;
+	priv->wov_dma_offset = 0;
+	priv->wov_burst_read = true;
+	mutex_unlock(&priv->wov_dma_lock);
+
+	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
+			params_buffer_bytes(hw_params));
+}
+
+static int wov_pcm_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+
+	mutex_lock(&priv->wov_dma_lock);
+	wov_queue_dequeue(priv, wov_queue_size(priv));
+	priv->wov_substream = NULL;
+	mutex_unlock(&priv->wov_dma_lock);
+
+	cancel_delayed_work_sync(&priv->wov_copy_work);
+
+	return snd_pcm_lib_free_vmalloc_buffer(substream);
+}
+
+static snd_pcm_uframes_t wov_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+
+	return bytes_to_frames(runtime, priv->wov_dma_offset);
+}
+
+static struct page *wov_pcm_page(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 unsigned long offset)
+{
+	return snd_pcm_lib_get_vmalloc_page(substream, offset);
+}
+
+static const struct snd_soc_component_driver wov_component_driver = {
+	.probe		= wov_probe,
+	.remove		= wov_remove,
+	.controls	= wov_controls,
+	.num_controls	= ARRAY_SIZE(wov_controls),
+	.open		= wov_pcm_open,
+	.hw_params	= wov_pcm_hw_params,
+	.hw_free	= wov_pcm_hw_free,
+	.pointer	= wov_pcm_pointer,
+	.page		= wov_pcm_page,
+};
+
 static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct cros_ec_device *ec_device = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_codec_priv *priv;
+	struct ec_param_ec_codec p;
+	struct ec_response_ec_codec_get_capabilities r;
+	int ret;
+#ifdef CONFIG_OF
+	struct device_node *node;
+	struct resource res;
+	u64 ec_shm_size;
+	const __be32 *regaddr_p;
+#endif
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+#ifdef CONFIG_OF
+	regaddr_p = of_get_address(dev->of_node, 0, &ec_shm_size, NULL);
+	if (regaddr_p) {
+		priv->ec_shm_addr = of_read_number(regaddr_p, 2);
+		priv->ec_shm_len = ec_shm_size;
+
+		dev_dbg(dev, "ec_shm_addr=%#llx len=%#x\n",
+			priv->ec_shm_addr, priv->ec_shm_len);
+	}
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (node) {
+		ret = of_address_to_resource(node, 0, &res);
+		if (!ret) {
+			priv->ap_shm_phys_addr = res.start;
+			priv->ap_shm_len = resource_size(&res);
+			priv->ap_shm_addr =
+				(uint64_t)(uintptr_t)devm_ioremap_wc(
+					dev, priv->ap_shm_phys_addr,
+					priv->ap_shm_len);
+			priv->ap_shm_last_alloc = priv->ap_shm_phys_addr;
+
+			dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
+				priv->ap_shm_phys_addr, priv->ap_shm_len);
+		}
+	}
+#endif
+
 	priv->dev = dev;
 	priv->ec_device = ec_device;
+	atomic_set(&priv->dmic_probed, 0);
+
+	p.cmd = EC_CODEC_GET_CAPABILITIES;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret) {
+		dev_err(dev, "failed to EC_CODEC_GET_CAPABILITIES\n");
+		return ret;
+	}
+	priv->ec_capabilities = r.capabilities;
 
 	platform_set_drvdata(pdev, priv);
 
-	return devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-					       &i2s_rx_dai_driver, 1);
+	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
+					      &i2s_rx_dai_driver, 1);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_component(dev, &wov_component_driver,
+					       &wov_dai_driver, 1);
 }
 
 #ifdef CONFIG_OF
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
