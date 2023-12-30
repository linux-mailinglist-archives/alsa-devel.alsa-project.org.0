Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D918221BB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:07:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB8CEBE;
	Tue,  2 Jan 2024 20:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB8CEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222462;
	bh=u7WEYwFbp8WO4ywu9idDiR/fdNbFoTLRfFpkjjH7uDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BjsAI6KyZJ7qTrMkj5N5aG03cEw5Aj+rcs5RfHkUGxV/IsW/R8cHVHbuE2oFx1thz
	 TRmR7CM+Z4VKvvjjfRMDhBbmCyC/uteUPq92Xlk6DhAUlbGP7Xa21TL34OcI747XhI
	 d/JBNhZ9fDUzir9kQ2LPIOesUA8JiKZB/2QeB3ig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 999D1F805DA; Tue,  2 Jan 2024 20:06:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A96F805E8;
	Tue,  2 Jan 2024 20:06:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD1EF8065A; Tue,  2 Jan 2024 19:59:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E45F7F80678
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45F7F80678
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071F09.00000000658F5FD0.0014D4B8;
 Sat, 30 Dec 2023 01:09:52 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 3/4] ALSA: hda/tas2781: add TAS2563 support for 14ARB7
Date: Sat, 30 Dec 2023 01:09:44 +0100
Message-ID: 
 <3b8d4c602e1a46922f53bc9afc8b705d55aa4872.1703891777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703891777.git.soyer@irl.hu>
References: <cover.1703891777.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: J3GHS4OPPBTVFHEYVUMBYCZOZOUOO3GX
X-Message-ID-Hash: J3GHS4OPPBTVFHEYVUMBYCZOZOUOO3GX
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3GHS4OPPBTVFHEYVUMBYCZOZOUOO3GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The INT8866 belongs to the Lenovo Yoga 7 Gen 7 AMD 14ARB7
laptop. It has two TAS2563 amplifier. Add the PNP ID
and calibration functions to handle them.

ACPI excerpt:

Scope (_SB.I2CD)
{
    Device (TAS)
    {
        Name (_HID, "INT8866")  // _HID: Hardware ID
        Name (_UID, Zero)  // _UID: Unique ID
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x004C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.I2CD",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                I2cSerialBusV2 (0x004D, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.I2CD",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                GpioInt (Edge, ActiveLow, SharedAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0020
                    }
             })
             Return (RBUF) /* \_SB_.I2CD.TAS_._CRS.RBUF */
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h         |  1 +
 sound/pci/hda/tas2781_hda_i2c.c | 87 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index dde9f8120d4c..0a86ab8d47b9 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -22,6 +22,7 @@
 #define TAS2781_DRV_VER			1
 #define SMARTAMP_MODULE_NAME		"tas2781"
 #define TAS2781_GLOBAL_ADDR	0x40
+#define TAS2563_GLOBAL_ADDR	0x48
 #define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
 	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |\
 	SNDRV_PCM_RATE_88200)
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 49477d17b07c..057688ca29bf 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -65,6 +65,24 @@ enum calib_data {
 	CALIB_MAX
 };
 
+#define TAS2563_MAX_CHANNELS	4
+
+#define TAS2563_CAL_POWER	TASDEVICE_REG(0, 0x0d, 0x3c)
+#define TAS2563_CAL_R0		TASDEVICE_REG(0, 0x0f, 0x34)
+#define TAS2563_CAL_INVR0	TASDEVICE_REG(0, 0x0f, 0x40)
+#define TAS2563_CAL_R0_LOW	TASDEVICE_REG(0, 0x0f, 0x48)
+#define TAS2563_CAL_TLIM	TASDEVICE_REG(0, 0x10, 0x14)
+#define TAS2563_CAL_N		5
+#define TAS2563_CAL_DATA_SIZE	4
+#define TAS2563_CAL_CH_SIZE	20
+#define TAS2563_CAL_ARRAY_SIZE	80
+
+static unsigned int cal_regs[TAS2563_CAL_N] = {
+	TAS2563_CAL_POWER, TAS2563_CAL_R0, TAS2563_CAL_INVR0,
+	TAS2563_CAL_R0_LOW, TAS2563_CAL_TLIM,
+};
+
+
 struct tas2781_hda {
 	struct device *dev;
 	struct tasdevice_priv *priv;
@@ -404,6 +422,69 @@ static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl = {
 	.put = tasdevice_config_put,
 };
 
+static void tas2563_apply_calib(struct tasdevice_priv *tas_priv)
+{
+	unsigned int data;
+	int offset = 0;
+	int ret;
+
+	for (int i = 0; i < tas_priv->ndev; i++) {
+		for (int j = 0; j < TAS2563_CAL_N; ++j) {
+			data = cpu_to_be32(
+				*(uint32_t *)&tas_priv->cali_data.data[offset]);
+			ret = tasdevice_dev_bulk_write(tas_priv, i, cal_regs[j],
+				(unsigned char *)&data, TAS2563_CAL_DATA_SIZE);
+			if (ret)
+				dev_err(tas_priv->dev,
+					"Error writing calib regs\n");
+			offset += TAS2563_CAL_DATA_SIZE;
+		}
+	}
+}
+
+static int tas2563_save_calibration(struct tasdevice_priv *tas_priv)
+{
+	static efi_guid_t efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc,
+		0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
+
+	static efi_char16_t *efi_vars[TAS2563_MAX_CHANNELS][TAS2563_CAL_N] = {
+		{ L"Power_1", L"R0_1", L"InvR0_1", L"R0_Low_1", L"TLim_1" },
+		{ L"Power_2", L"R0_2", L"InvR0_2", L"R0_Low_2", L"TLim_2" },
+		{ L"Power_3", L"R0_3", L"InvR0_3", L"R0_Low_3", L"TLim_3" },
+		{ L"Power_4", L"R0_4", L"InvR0_4", L"R0_Low_4", L"TLim_4" },
+	};
+
+	unsigned long max_size = TAS2563_CAL_DATA_SIZE;
+	unsigned int offset = 0;
+	efi_status_t status;
+	unsigned int attr;
+
+	tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
+			TAS2563_CAL_ARRAY_SIZE, GFP_KERNEL);
+	if (!tas_priv->cali_data.data)
+		return -ENOMEM;
+
+	for (int i = 0; i < tas_priv->ndev; ++i) {
+		for (int j = 0; j < TAS2563_CAL_N; ++j) {
+			status = efi.get_variable(efi_vars[i][j],
+				&efi_guid, &attr, &max_size,
+				&tas_priv->cali_data.data[offset]);
+			if (status != EFI_SUCCESS ||
+				max_size != TAS2563_CAL_DATA_SIZE) {
+				dev_warn(tas_priv->dev,
+				"Calibration data read failed %ld\n", status);
+				return -EINVAL;
+			}
+			offset += TAS2563_CAL_DATA_SIZE;
+		}
+	}
+
+	tas_priv->cali_data.total_sz = offset;
+	tasdevice_apply_calibration(tas_priv);
+
+	return 0;
+}
+
 static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 {
 	static const unsigned char page_array[CALIB_MAX] = {
@@ -700,6 +781,11 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		tas_hda->priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->apply_calibration = tas2781_apply_calib;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
+	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
+		device_name = "INT8866";
+		tas_hda->priv->save_calibration = tas2563_save_calibration;
+		tas_hda->priv->apply_calibration = tas2563_apply_calib;
+		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
 	} else
 		return -ENODEV;
 
@@ -849,6 +935,7 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
 
 static const struct acpi_device_id tas2781_acpi_hda_match[] = {
 	{"TIAS2781", 0 },
+	{"INT8866", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
-- 
2.43.0

