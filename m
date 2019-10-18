Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0277DCD8E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2530F1674;
	Fri, 18 Oct 2019 20:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2530F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422176;
	bh=JiwDA5JLgfPyyLWEERn30pw95HrL6F9QY0cxdI7C+/Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=j3ldiFTx6qhS6vsofHmig88p/pR8nFqZaDAkpAR+EFsiWv7r1Sh4QlHlw10erL5Li
	 1ad0LHBPHmQlebIuDNnjk9RgXHbRzUQqxanlSr1vKmNMyATsZhLovBsQjgpItAcwI0
	 RncYsOoZCIwa9Q/1K+hpyUMOPsf6EhRBEO84Zm40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01321F80323;
	Fri, 18 Oct 2019 20:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD412F805FF; Fri, 18 Oct 2019 20:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F73F800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F73F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AZWBwilt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0/hveyck1dnXdr8iG9tezEBcpoCN7kE7Yiz6fCTLXEU=; b=AZWBwilt1rp2
 b+XMXncGixAdGZCAaJTPGfv2bOqPZ1PXBch+LrclgCliAiOmefxEW8v05AQmfzmqACqLyt2YuQE58
 gGCshQ4JSDwYHIbujbDH+vEMM3js1ol3nseCKGmTwogQF3fArvC1wza0zf7iRj5Efnz7kliQv9SVN
 3qx0w=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeQ-0004Eg-8Z; Fri, 18 Oct 2019 18:06:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 952482743259; Fri, 18 Oct 2019 19:06:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20191017213539.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
X-Patchwork-Hint: ignore
Message-Id: <20191018180657.952482743259@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:57 +0100 (BST)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, dgreid@google.com,
 robh+dt@kernel.org, tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 enric.balletbo@collabora.com, bleung@google.com,
 Benson Leung <bleung@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cros_ec_codec: read max DMIC gain from
	EC codec" to the asoc tree
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

   ASoC: cros_ec_codec: read max DMIC gain from EC codec

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

From f3e82ad43ca538a7e0db0f310e26c5e75db6ba18 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 17 Oct 2019 22:00:10 +0800
Subject: [PATCH] ASoC: cros_ec_codec: read max DMIC gain from EC codec

Read max DMIC gain from EC codec instead of DTS.  Also removes the
dt-binding of max-dmic-gain.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191017213539.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
 .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
 sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
 3 files changed, 73 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 1084f7f22eea..0ce9fafc78e2 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -1,4 +1,4 @@
-* Audio codec controlled by ChromeOS EC
+Audio codec controlled by ChromeOS EC
 
 Google's ChromeOS EC codec is a digital mic codec provided by the
 Embedded Controller (EC) and is controlled via a host-command interface.
@@ -9,7 +9,6 @@ Documentation/devicetree/bindings/mfd/cros-ec.txt).
 Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
-- max-dmic-gain: A number for maximum gain in dB on digital microphone.
 
 Example:
 
@@ -21,6 +20,5 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
-		max-dmic-gain = <43>;
 	};
 };
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 3ca0fa9e92a7..21db0d4d4025 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4530,30 +4530,53 @@ struct __ec_align4 ec_response_ec_codec_get_shm_addr {
 #define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
-	EC_CODEC_DMIC_SET_GAIN = 0x0,
-	EC_CODEC_DMIC_GET_GAIN = 0x1,
+	EC_CODEC_DMIC_GET_MAX_GAIN = 0x0,
+	EC_CODEC_DMIC_SET_GAIN_IDX = 0x1,
+	EC_CODEC_DMIC_GET_GAIN_IDX = 0x2,
 	EC_CODEC_DMIC_SUBCMD_COUNT,
 };
 
-struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
-	uint8_t left;
-	uint8_t right;
+enum ec_codec_dmic_channel {
+	EC_CODEC_DMIC_CHANNEL_0 = 0x0,
+	EC_CODEC_DMIC_CHANNEL_1 = 0x1,
+	EC_CODEC_DMIC_CHANNEL_2 = 0x2,
+	EC_CODEC_DMIC_CHANNEL_3 = 0x3,
+	EC_CODEC_DMIC_CHANNEL_4 = 0x4,
+	EC_CODEC_DMIC_CHANNEL_5 = 0x5,
+	EC_CODEC_DMIC_CHANNEL_6 = 0x6,
+	EC_CODEC_DMIC_CHANNEL_7 = 0x7,
+	EC_CODEC_DMIC_CHANNEL_COUNT,
+};
+
+struct __ec_align1 ec_param_ec_codec_dmic_set_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t gain;
 	uint8_t reserved[2];
 };
 
+struct __ec_align1 ec_param_ec_codec_dmic_get_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t reserved[3];
+};
+
 struct __ec_align4 ec_param_ec_codec_dmic {
 	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
 	uint8_t reserved[3];
 
 	union {
-		struct ec_param_ec_codec_dmic_set_gain
-				set_gain_param;
+		struct ec_param_ec_codec_dmic_set_gain_idx
+				set_gain_idx_param;
+		struct ec_param_ec_codec_dmic_get_gain_idx
+				get_gain_idx_param;
 	};
 };
 
-struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
-	uint8_t left;
-	uint8_t right;
+struct __ec_align1 ec_response_ec_codec_dmic_get_max_gain {
+	uint8_t max_gain;
+};
+
+struct __ec_align1 ec_response_ec_codec_dmic_get_gain_idx {
+	uint8_t gain;
 };
 
 /*****************************************************************************/
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index c19c7fe42e2e..3d4f9e82d6e9 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -65,18 +65,26 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct ec_param_ec_codec_dmic p;
-	struct ec_response_ec_codec_dmic_get_gain r;
+	struct ec_response_ec_codec_dmic_get_gain_idx r;
 	int ret;
 
-	p.cmd = EC_CODEC_DMIC_GET_GAIN;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
 	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
 		return ret;
+	ucontrol->value.integer.value[0] = r.gain;
 
-	ucontrol->value.integer.value[0] = r.left;
-	ucontrol->value.integer.value[1] = r.right;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0)
+		return ret;
+	ucontrol->value.integer.value[1] = r.gain;
 
 	return 0;
 }
@@ -94,15 +102,24 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	int left = ucontrol->value.integer.value[0];
 	int right = ucontrol->value.integer.value[1];
 	struct ec_param_ec_codec_dmic p;
+	int ret;
 
 	if (left > max_dmic_gain || right > max_dmic_gain)
 		return -EINVAL;
 
 	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
 
-	p.cmd = EC_CODEC_DMIC_SET_GAIN;
-	p.set_gain_param.left = left;
-	p.set_gain_param.right = right;
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
+	p.set_gain_idx_param.gain = left;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	p.set_gain_idx_param.gain = right;
 	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
@@ -125,19 +142,27 @@ static int dmic_probe(struct snd_soc_component *component)
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct device *dev = priv->dev;
-	int ret, val;
 	struct soc_mixer_control *control;
+	struct ec_param_ec_codec_dmic p;
+	struct ec_response_ec_codec_dmic_get_max_gain r;
+	int ret;
 
-	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
-	if (ret) {
-		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
-		return ret;
+	p.cmd = EC_CODEC_DMIC_GET_MAX_GAIN;
+
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0) {
+		dev_warn(dev, "get_max_gain() unsupported\n");
+		return 0;
 	}
 
+	dev_dbg(dev, "max gain = %d\n", r.max_gain);
+
 	control = (struct soc_mixer_control *)
 		dmic_controls[DMIC_CTL_GAIN].private_value;
-	control->max = val;
-	control->platform_max = val;
+	control->max = r.max_gain;
+	control->platform_max = r.max_gain;
 
 	return snd_soc_add_component_controls(component,
 			&dmic_controls[DMIC_CTL_GAIN], 1);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
