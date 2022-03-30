Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37834EC0C7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A485718A8;
	Wed, 30 Mar 2022 13:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A485718A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641156;
	bh=yPQlBLQGEvHpOmVboz3fBeiBvatZ09xFfJx8JBLUUOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3L5YsraeY2Q+upuPzZ+F1ilEpM1J2ydjBmKqcq3aGbwFBRw9finzc0ZBbroPg/Uq
	 F9fBUkjh2Cp6Bov+WUIJYUo+fd7MTLGfFM0mrz7Xtve0vsWmD5bD+JCcfKDBnWqTEd
	 UEH+wP3z9CFWEFddTzClOTfLwV9Q0R1aJJ1VdkZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96AE5F8057D;
	Wed, 30 Mar 2022 13:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FCCBF8057D; Wed, 30 Mar 2022 13:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3725AF80528
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3725AF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eREUXjID"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 24B63CE1921;
 Wed, 30 Mar 2022 11:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C028C3410F;
 Wed, 30 Mar 2022 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640890;
 bh=yPQlBLQGEvHpOmVboz3fBeiBvatZ09xFfJx8JBLUUOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eREUXjIDNpU33bJAEQnwHyNFXTaOXrvpy9Gw0GMZqevwI6bt1DGJhHEtFa+Nor+Ok
 0Kh7i4/SdayfBmfcbJ4rCIS6Pot3oafZLu2ohnWI+CVA19C2ZQvoamQEDPOShqafO2
 MTbCWkqAFDaR4T9a41n5moRljLJzUt68wOZro+pn+RyfZQRqrVkZeQSQpavvSJN72K
 n96fjbdu1vPbwqQiKZR6qpfPc4BDXy6uqdBrjye116FxTe8KEUW6iZN6A6RlGCtE2b
 yBvVthUs6n0y3pn6tBCBVRYXdulMBlgJAvYe9wQzHPo2Mbk++VgMReyigOIhy5K7Jc
 I7r8g6kNIKh4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 54/66] ALSA: intel-nhlt: add helper to detect SSP
 link mask
Date: Wed, 30 Mar 2022 07:46:33 -0400
Message-Id: <20220330114646.1669334-54-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 0c470db0399e17310ed2ba54dd1c25cfa16ce0d3 ]

The NHLT information can be used to figure out which SSPs are enabled
in a platform.

The 'SSP' link type is too broad for machine drivers, since it can
cover the Bluetooth sideband and the analog audio codec connections,
so this helper exposes a parameter to filter with the device
type (DEVICE_I2S refers to analog audio codec in NHLT parlance).

The helper returns a mask, since more than one SSP may be used for
analog audio, e.g. the NHLT spec describes the use of SSP0 for
amplifiers and SSP1 for headset codec. Note that if more than one bit
is set, it's impossible to determine which SSP is connected to what
external component. Additional platform-specific information based on
e.g. DMI quirks would still be required in the machine driver to
configure the relevant dailinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20220308192610.392950-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/intel-nhlt.h | 22 +++++++++++++++-------
 sound/hda/intel-nhlt.c     | 22 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 089a760d36eb..6fb2d5e378fd 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -18,6 +18,13 @@ enum nhlt_link_type {
 	NHLT_LINK_INVALID
 };
 
+enum nhlt_device_type {
+	NHLT_DEVICE_BT = 0,
+	NHLT_DEVICE_DMIC = 1,
+	NHLT_DEVICE_I2S = 4,
+	NHLT_DEVICE_INVALID
+};
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
 
 struct wav_fmt {
@@ -41,13 +48,6 @@ struct wav_fmt_ext {
 	u8 sub_fmt[16];
 } __packed;
 
-enum nhlt_device_type {
-	NHLT_DEVICE_BT = 0,
-	NHLT_DEVICE_DMIC = 1,
-	NHLT_DEVICE_I2S = 4,
-	NHLT_DEVICE_INVALID
-};
-
 struct nhlt_specific_cfg {
 	u32 size;
 	u8 caps[];
@@ -133,6 +133,9 @@ void intel_nhlt_free(struct nhlt_acpi_table *addr);
 int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
 
 bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type);
+
+int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type);
+
 struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
@@ -163,6 +166,11 @@ static inline bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt,
 	return false;
 }
 
+static inline int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
+{
+	return 0;
+}
+
 static inline struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 128476aa7c61..4063da378283 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -130,6 +130,28 @@ bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type)
 }
 EXPORT_SYMBOL(intel_nhlt_has_endpoint_type);
 
+int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
+{
+	struct nhlt_endpoint *epnt;
+	int ssp_mask = 0;
+	int i;
+
+	if (!nhlt || (device_type != NHLT_DEVICE_BT && device_type != NHLT_DEVICE_I2S))
+		return 0;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		if (epnt->linktype == NHLT_LINK_SSP && epnt->device_type == device_type) {
+			/* for SSP the virtual bus id is the SSP port */
+			ssp_mask |= BIT(epnt->virtual_bus_id);
+		}
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return ssp_mask;
+}
+EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);
+
 static struct nhlt_specific_cfg *
 nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
 		      u32 rate, u8 vbps, u8 bps)
-- 
2.34.1

