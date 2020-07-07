Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADD2177AF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30499F6;
	Tue,  7 Jul 2020 21:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30499F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149315;
	bh=v1V/hPMjDZuqEnWjkEnwJ9xXcVKQY8I8Nv2dCWsl3UM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxRjBKSeOUmHEyVr5XzZnHUvxJye0y1rCM1TRy6rQ1mwPyXx8joImDT0ppvbZhX9z
	 lnb4OilXYeRAUMx6ZHswqBazW+DBwWzLz0iGdSI5ML6VooMxmfYmHeF73/NCxtjULU
	 7feir6IsoDk8Fe6G53mJvG5OGwMr+kIZRa5vq7fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D13BBF80340;
	Tue,  7 Jul 2020 21:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0F3CF80339; Tue,  7 Jul 2020 21:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73DBF80338
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73DBF80338
IronPort-SDR: LFOTS/yZPuB8dlbu/uK8Xf66/DWvIyk6Xim8U8ctto0cUJ64EaCU2HrfJbgzKOnlfSwGYYLL0I
 VdHsvz7hYMhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212631601"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="212631601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:07:02 -0700
IronPort-SDR: uL5tR80dB418WWFzJlg7O9sCb8t4JGvTNofYdBOUzbIVSRNlDA/Vvqoy5Zu/FVUXo6ieLRIQsy
 /N4ISy0ahv5g==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278702"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:07:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 13/13] ASoC: codecs: rt*: fix 'defined but not used' warning
Date: Tue,  7 Jul 2020 14:06:12 -0500
Message-Id: <20200707190612.97799-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warning when ACPI is not defined

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt274.c      | 2 ++
 sound/soc/codecs/rt286.c      | 2 ++
 sound/soc/codecs/rt298.c      | 2 ++
 sound/soc/codecs/rt5660.c     | 2 ++
 sound/soc/codecs/rt5677-spi.c | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index cbb5e176d11a..40a28fb4fd09 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1105,12 +1105,14 @@ static const struct i2c_device_id rt274_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt274_i2c_id);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt274_acpi_match[] = {
 	{ "10EC0274", 0 },
 	{ "INT34C2", 0 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, rt274_acpi_match);
+#endif
 
 static int rt274_i2c_probe(struct i2c_client *i2c,
 			   const struct i2c_device_id *id)
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 9593a9a27bf8..89b1c8b68004 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1079,11 +1079,13 @@ static const struct i2c_device_id rt286_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt286_i2c_id);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt286_acpi_match[] = {
 	{ "INT343A", 0 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, rt286_acpi_match);
+#endif
 
 static const struct dmi_system_id force_combo_jack_table[] = {
 	{
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 7fc7d6181630..dc0273a5a11f 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1145,11 +1145,13 @@ static const struct i2c_device_id rt298_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt298_i2c_id);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt298_acpi_match[] = {
 	{ "INT343A", 0 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, rt298_acpi_match);
+#endif
 
 static const struct dmi_system_id force_combo_jack_table[] = {
 	{
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 78371e51bc34..9e3813f7583d 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1241,12 +1241,14 @@ static const struct of_device_id rt5660_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rt5660_of_match);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5660_acpi_match[] = {
 	{ "10EC5660", 0 },
 	{ "10EC3277", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, rt5660_acpi_match);
+#endif
 
 static int rt5660_parse_dt(struct rt5660_priv *rt5660, struct device *dev)
 {
diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 7bfade8b3d6e..95ac12a5cc6b 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -614,11 +614,13 @@ static int rt5677_spi_probe(struct spi_device *spi)
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5677_spi_acpi_id[] = {
 	{ "RT5677AA", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
+#endif
 
 static struct spi_driver rt5677_spi_driver = {
 	.driver = {
-- 
2.25.1

