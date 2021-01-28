Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCD307427
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 11:54:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3F016CB;
	Thu, 28 Jan 2021 11:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3F016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611831258;
	bh=zYNMBalMueyQr3/59A5SxfPw/FS0ixlUNvVwIB26+us=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UDi0Byq7R0FbKhtPwVpP5vxbQsc/NKNOeqQw6kDEeOBK80RCmw0YIZj4z2S682X95
	 mz4EHdANhB+cVUZL6WhLhACvwKiY+P8Ksx7Nulx99HLYYRhCP/Ya4ajz4Y/Z/F+Iu7
	 KIPzihNTUHtHBQofRh4SjfoG44BCkTgzNVM9UMgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF939F801D8;
	Thu, 28 Jan 2021 11:52:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A9FF8015B; Thu, 28 Jan 2021 11:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4AEF800BE
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 11:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4AEF800BE
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A29E71C0B8E; Thu, 28 Jan 2021 11:52:30 +0100 (CET)
Date: Thu, 28 Jan 2021 11:52:30 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCHv2] ASoC: audio-graph-card: Add audio mixer for Motorola mdm6600
Message-ID: <20210128105230.GA21134@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, phone-devel@vger.kernel.org,
 kuninori.morimoto.gx@renesas.com, tony@atomide.com,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 tiwai@suse.com, lgirdwood@gmail.com, peter.ujfalusi@ti.com,
 Sebastian Reichel <sre@kernel.org>, "Arthur D." <spinal.by@gmail.com>
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


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

motmdm.c handles audio configuration on "gsmtty2"; it needs to know
whether we are in call or not; that part is in motmdm-state.c and
listens on "gsmtty1".

To configure Alsamixer for voice calls do for example:
   =20
Speaker Right -> Voice
Call Noise Cancellation -> Unmute
Call Output -> Speakerphone
Call -> 100
Mic2 -> 40
Left -> Mic 2
Voice -> 55
Mic2 -> 40
Left -> Mic 2

Tony wrote original version using custom interface to n_gsm, Pavel
switched it to plain serdev and split it to two drivers to be easier
to debug and understand. Credit is Tony's, bugs are probably Pavel's.
   =20
Signed-off-by: Pavel Machek <pavel@ucw.cz>
Co-authored-by: Tony Lindgren <tony@atomide.com>

---

v2: fix compile error.

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba4eb54aafcb..94000ab3cf3e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -932,6 +932,14 @@ config SND_SOC_MAX9860
 	depends on I2C
 	select REGMAP_I2C
=20
+config SND_SOC_MOTMDM
+	tristate "Motorola Modem TS 27.010 Voice Call Codec"
+	depends on SERIAL_DEV_BUS
+	help
+	  Enable support for Motorola TS 27.010 serdev voice
+	  call codec driver for Motorola Mapphone series of
+	  devices such as Droid 4.
+
 config SND_SOC_MSM8916_WCD_ANALOG
 	tristate "Qualcomm MSM8916 WCD Analog Codec"
 	depends on SPMI || COMPILE_TEST
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d277f0366e09..f63022e0a292 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -128,6 +128,8 @@ snd-soc-max9850-objs :=3D max9850.o
 snd-soc-max9860-objs :=3D max9860.o
 snd-soc-mc13783-objs :=3D mc13783.o
 snd-soc-ml26124-objs :=3D ml26124.o
+snd-soc-motmdm-objs :=3D motmdm.o
+snd-soc-motmdm-state-objs :=3D motmdm-state.o
 snd-soc-msm8916-analog-objs :=3D msm8916-wcd-analog.o
 snd-soc-msm8916-digital-objs :=3D msm8916-wcd-digital.o
 snd-soc-mt6351-objs :=3D mt6351.o
@@ -443,6 +445,8 @@ obj-$(CONFIG_SND_SOC_MAX9850)	+=3D snd-soc-max9850.o
 obj-$(CONFIG_SND_SOC_MAX9860)	+=3D snd-soc-max9860.o
 obj-$(CONFIG_SND_SOC_MC13783)	+=3D snd-soc-mc13783.o
 obj-$(CONFIG_SND_SOC_ML26124)	+=3D snd-soc-ml26124.o
+obj-$(CONFIG_SND_SOC_MOTMDM)	+=3D snd-soc-motmdm.o
+obj-$(CONFIG_SND_SOC_MOTMDM)	+=3D snd-soc-motmdm-state.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=3Dsnd-soc-msm8916-analog.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=3Dsnd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+=3D snd-soc-mt6351.o
diff --git a/sound/soc/codecs/motmdm-state.c b/sound/soc/codecs/motmdm-stat=
e.c
new file mode 100644
index 000000000000..166de19be256
--- /dev/null
+++ b/sound/soc/codecs/motmdm-state.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Motorola Mapphone MDM6600 voice call audio support
+ * Copyright 2018 - 2020 Tony Lindgren <tony@atomide.com>
+ * Copyright 2020 - 2021 Pavel Machek <pavel@ucw.cz>
+ *
+ * Designed to provide notifications about voice call state to the
+ * motmdm.c driver. This one listens on "gsmtty1".
+ */
+
+#include <linux/init.h>
+#include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/serdev.h>
+
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#define MOTMDM_HEADER_LEN	5			/* U1234 */
+#define MOTMDM_AUDIO_MAX_LEN	128
+#define MOTMDM_VOICE_RESP_LEN	7			/* U1234~+CIEV=3D */
+
+struct motmdm_driver_data {
+	struct serdev_device *serdev;
+	unsigned char *buf;
+	size_t len;
+	spinlock_t lock;	/* enable/disabled lock */
+};
+
+static BLOCKING_NOTIFIER_HEAD(modem_state_chain_head);
+
+int register_modem_state_notifier(struct notifier_block *nb)
+{
+        return blocking_notifier_chain_register(&modem_state_chain_head, n=
b);
+}
+EXPORT_SYMBOL_GPL(register_modem_state_notifier);
+
+int unregister_modem_state_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&modem_state_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_modem_state_notifier);
+
+static int modem_state_notifier_call_chain(unsigned long val)
+{
+        int ret;
+        ret =3D __blocking_notifier_call_chain(&modem_state_chain_head, va=
l, NULL,
+					     -1, NULL);
+        return notifier_to_errno(ret);
+}
+
+/* Parses the voice call state from unsolicited notifications on dlci1 */
+static int motmdm_voice_get_state(struct motmdm_driver_data *ddata,
+				   const unsigned char *buf,
+				   size_t len)
+{
+	struct device *dev =3D &ddata->serdev->dev;
+	bool enable;
+	const unsigned char *state;
+
+	if (len < MOTMDM_HEADER_LEN + MOTMDM_VOICE_RESP_LEN + 5)
+		return 0;
+
+	/* We only care about the unsolicted messages */
+	if (buf[MOTMDM_HEADER_LEN] !=3D '~')
+		return 0;
+
+	if (strncmp(buf + MOTMDM_HEADER_LEN + 1, "+CIEV=3D", 6))
+		return len;
+
+	state =3D buf + MOTMDM_HEADER_LEN + MOTMDM_VOICE_RESP_LEN;
+	dev_info(dev, "%s: ciev=3D%5s\n", __func__, state);
+
+	if (!strncmp(state, "1,1,0", 5) ||	/* connecting */
+	    !strncmp(state, "1,4,0", 5) ||	/* incoming call */
+	    !strncmp(state, "1,2,0", 5))	/* connected */
+		enable =3D true;
+	else if (!strncmp(state, "1,0,0", 5) ||	/* disconnected */
+		!strncmp(state, "1,0,2", 5))	/* call failed */
+		enable =3D false;
+	else
+		return len;
+
+	modem_state_notifier_call_chain(enable);
+	return len;
+}
+
+static int voice_receive_data(struct serdev_device *serdev,
+			     const unsigned char *buf,
+			     size_t len)
+{
+        struct motmdm_driver_data *ddata =3D serdev_device_get_drvdata(ser=
dev);
+
+	if (len > MOTMDM_AUDIO_MAX_LEN)
+		len =3D MOTMDM_AUDIO_MAX_LEN;
+
+	if (len <=3D MOTMDM_HEADER_LEN)
+		return 0;
+
+	if (buf[MOTMDM_HEADER_LEN] =3D=3D '~')
+		motmdm_voice_get_state(ddata, buf, len);
+
+	return len;
+}
+
+static const struct serdev_device_ops voice_serdev_ops =3D {
+        .receive_buf    =3D voice_receive_data,
+        .write_wakeup   =3D serdev_device_write_wakeup,
+};
+
+static void motmdm_free_voice_serdev(struct motmdm_driver_data *ddata)
+{
+	serdev_device_close(ddata->serdev);
+}
+
+static int motmdm_soc_probe(struct serdev_device *serdev)
+{
+	struct device *dev =3D &serdev->dev;
+	struct motmdm_driver_data *ddata;
+	int error;
+
+	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->serdev =3D serdev;
+	spin_lock_init(&ddata->lock);
+	ddata->len =3D MOTMDM_AUDIO_MAX_LEN;
+
+	ddata->buf =3D devm_kzalloc(dev, ddata->len, GFP_KERNEL);
+	if (!ddata->buf)
+		return -ENOMEM;
+
+	serdev_device_set_drvdata(ddata->serdev, ddata);
+        serdev_device_set_client_ops(ddata->serdev, &voice_serdev_ops);
+
+        error =3D serdev_device_open(ddata->serdev);
+	return error;
+}
+
+static void motmdm_state_remove(struct serdev_device *serdev)
+{
+	struct motmdm_driver_data *ddata =3D serdev_device_get_drvdata(serdev);
+
+	motmdm_free_voice_serdev(ddata);
+}
+
+static int motmdm_state_probe(struct serdev_device *serdev)
+{
+	return motmdm_soc_probe(serdev);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id motmdm_of_match[] =3D {
+	{ .compatible =3D "motorola,mapphone-mdm6600-modem" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, motmdm_of_match);
+#endif
+
+static struct serdev_device_driver motmdm_state_driver =3D {
+	.driver	=3D {
+		.name		=3D "mot-mdm6600-modem",
+		.of_match_table	=3D of_match_ptr(motmdm_of_match),
+	},
+	.probe	=3D motmdm_state_probe,
+	.remove	=3D motmdm_state_remove,
+};
+module_serdev_device_driver(motmdm_state_driver);
+
+MODULE_ALIAS("platform:motmdm-state");
+MODULE_DESCRIPTION("Motorola Mapphone MDM6600 modem state driver");
+MODULE_AUTHOR("Pavel Machek <pavel@ucw.cz>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/motmdm.c b/sound/soc/codecs/motmdm.c
new file mode 100644
index 000000000000..0ee546133471
--- /dev/null
+++ b/sound/soc/codecs/motmdm.c
@@ -0,0 +1,688 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Motorola Mapphone MDM6600 voice call audio support
+ * Copyright 2018 - 2020 Tony Lindgren <tony@atomide.com>
+ * Copyright 2020 - 2021 Pavel Machek <pavel@ucw.cz>
+ *
+ * This one handles audio configuration on "gsmtty2"; it needs to know
+ * whether we are in call or not, and that part is in motmdm-state.c
+ * and listens on "gsmtty1".
+ */
+
+#include <linux/init.h>
+#include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/serdev.h>
+
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "motmdm-state.h"
+
+#define MOTMDM_HEADER_LEN	5			/* U1234 */
+
+#define MOTMDM_AUDIO_RESP_LEN	6			/* U1234+XXXX=3D */
+#define MOTMDM_AUDIO_MAX_LEN	128
+
+#define MOTMDM_VOICE_RESP_LEN	7			/* U1234~+CIEV=3D */
+
+struct motmdm_driver_data {
+	struct notifier_block notifier;
+	struct snd_soc_component *component;
+	struct snd_soc_dai *master_dai;
+	struct device *modem;
+	struct serdev_device *serdev;
+	struct regmap *regmap;
+	unsigned char *buf;
+	size_t len;
+	unsigned int parsed:1;
+	unsigned int enabled:1;
+	spinlock_t lock;	/* enable/disabled lock */
+	struct mutex mutex;	/* for sending commands */
+	wait_queue_head_t read_queue;
+
+	unsigned int dtmf_val;
+	unsigned int dtmf_en;
+};
+
+enum motmdm_cmd {
+	CMD_AT_EACC,
+	CMD_AT_CLVL,
+	CMD_AT_NREC,
+};
+
+const char * const motmd_read_fmt[] =3D {
+	[CMD_AT_EACC] =3D "AT+EACC?",
+	[CMD_AT_CLVL] =3D "AT+CLVL?",
+	[CMD_AT_NREC] =3D "AT+NREC?",
+};
+
+const char * const motmd_write_fmt[] =3D {
+	[CMD_AT_EACC] =3D "AT+EACC=3D%u,0",
+	[CMD_AT_CLVL] =3D "AT+CLVL=3D%u",
+	[CMD_AT_NREC] =3D "AT+NREC=3D%u",
+};
+
+/*
+ * Currently unconfigured additional inactive (error producing) options
+ * seem to be:
+ * "TTY Headset", "HCQ Headset", "VCQ Headset", "No-Mic Headset",
+ * "Handset Fluence Med", "Handset Fluence Low", "Car Dock", "Lapdock"
+ */
+static const char * const motmdm_out_mux_texts[] =3D {
+	"Handset", "Headset", "Speakerphone", "Bluetooth",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(motmdm_out_enum, motmdm_out_mux_texts);
+
+static const DECLARE_TLV_DB_SCALE(motmdm_gain_tlv, 0, 100, 0);
+
+int motmdm_send_command(struct motmdm_driver_data *ddata,
+			     const u8 *buf, int len)
+{
+	struct device *dev =3D ddata->component->dev;
+	const int timeout_ms =3D 1000;
+	unsigned char cmd[MOTMDM_AUDIO_MAX_LEN];
+	int ret, cmdlen;
+
+	cmdlen =3D len + 5 + 1;
+	if (cmdlen > MOTMDM_AUDIO_MAX_LEN)
+		return -EINVAL;
+
+	mutex_lock(&ddata->mutex);
+	memset(ddata->buf, 0, ddata->len);
+	ddata->parsed =3D false;
+	snprintf(cmd, cmdlen, "U%04li%s", jiffies % 10000, buf);
+
+	ret =3D serdev_device_write(ddata->serdev, cmd, cmdlen, MAX_SCHEDULE_TIME=
OUT);
+	if (ret < 0)
+		goto out_unlock;
+
+        serdev_device_wait_until_sent(ddata->serdev, 0);
+
+	ret =3D wait_event_timeout(ddata->read_queue, ddata->parsed,
+				 msecs_to_jiffies(timeout_ms));
+	if (ret =3D=3D 0) {
+		ret =3D -ETIMEDOUT;
+		goto out_unlock;
+	} else if (ret < 0) {
+		goto out_unlock;
+	}
+
+	if (strstr(ddata->buf, "ERROR")) {
+		dev_err(dev, "command %s error %s\n", cmd, ddata->buf);
+		ret =3D -EPIPE;
+	}
+
+	ret =3D len;
+
+out_unlock:
+	mutex_unlock(&ddata->mutex);
+	printk("send_command -- ret %d\n", ret);
+
+	return ret;
+}
+
+static int motmdm_read_reg(void *context, unsigned int reg,
+			   unsigned int *value)
+{
+	struct snd_soc_component *component =3D context;
+	struct motmdm_driver_data *ddata =3D snd_soc_component_get_drvdata(compon=
ent);
+	const unsigned char *cmd;
+	unsigned int val;
+	int error;
+
+	cmd =3D motmd_read_fmt[reg];
+	error =3D motmdm_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0) {
+		dev_err(component->dev, "%s: %s failed with %i\n",
+			__func__, cmd, error);
+
+		return error;
+	}
+
+	error =3D kstrtouint(ddata->buf + MOTMDM_AUDIO_RESP_LEN, 0, &val);
+	if (error)
+		return -ENODEV;
+
+	*value =3D val;
+
+	return error;
+}
+
+static int motmdm_write_reg(void *context, unsigned int reg,
+			    unsigned int value)
+{
+	struct snd_soc_component *component =3D context;
+	struct motmdm_driver_data *ddata =3D snd_soc_component_get_drvdata(compon=
ent);
+	const unsigned char *fmt, *cmd;
+	int error;
+
+	fmt =3D motmd_write_fmt[reg];
+	cmd =3D kasprintf(GFP_KERNEL, fmt, value);
+	if (!cmd) {
+		error =3D -ENOMEM;
+		goto free;
+	}
+
+	error =3D motmdm_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0)
+		dev_err(component->dev, "%s: %s failed with %i\n",
+			__func__, cmd, error);
+
+free:
+	kfree(cmd);
+
+	return error;
+}
+
+static const struct reg_default motmdm_reg_defaults[] =3D {
+	{ CMD_AT_EACC, 0x0 },
+	{ CMD_AT_CLVL, 0x0 },
+};
+
+static const struct regmap_config motmdm_regmap =3D {
+	.reg_bits =3D 32,
+	.reg_stride =3D 1,
+	.val_bits =3D 32,
+	.max_register =3D CMD_AT_NREC,
+	.reg_defaults =3D motmdm_reg_defaults,
+	.num_reg_defaults =3D ARRAY_SIZE(motmdm_reg_defaults),
+	.cache_type =3D REGCACHE_RBTREE,
+	.reg_read =3D motmdm_read_reg,
+	.reg_write =3D motmdm_write_reg,
+};
+
+static int motmdm_value_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol,
+			    enum motmdm_cmd reg,
+			    int cmd_base)
+{
+	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcontr=
ol);
+	struct motmdm_driver_data *ddata =3D snd_soc_component_get_drvdata(compon=
ent);
+	unsigned int val;
+	int error;
+
+	error =3D regmap_read(ddata->regmap, reg, &val);
+	if (error)
+		return error;
+
+	if (val >=3D cmd_base)
+		val -=3D cmd_base;
+
+	ucontrol->value.enumerated.item[0] =3D val;
+
+	return 0;
+}
+
+static int motmdm_value_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol,
+			    enum motmdm_cmd reg,
+			    int cmd_base)
+{
+	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcontr=
ol);
+	struct motmdm_driver_data *ddata =3D snd_soc_component_get_drvdata(compon=
ent);
+	int error;
+
+	error =3D regmap_write(ddata->regmap, reg,
+			     ucontrol->value.enumerated.item[0] + cmd_base);
+	if (error)
+		return error;
+
+	regcache_mark_dirty(ddata->regmap);
+
+	return error;
+}
+
+static int motmdm_audio_out_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_get(kcontrol, ucontrol, CMD_AT_EACC, 1);
+}
+
+static int motmdm_audio_out_put(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_put(kcontrol, ucontrol, CMD_AT_EACC, 1);
+}
+
+static int motmdm_gain_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_get(kcontrol, ucontrol, CMD_AT_CLVL, 0);
+}
+
+static int motmdm_gain_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_put(kcontrol, ucontrol, CMD_AT_CLVL, 0);
+}
+
+static int motmdm_noise_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_get(kcontrol, ucontrol, CMD_AT_NREC, 0);
+}
+
+static int motmdm_noise_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	return motmdm_value_put(kcontrol, ucontrol, CMD_AT_NREC, 0);
+}
+
+static const char * const motmdm_tonegen_dtmf_key_txt[] =3D {
+	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D",
+	"*", "#"
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(motmd_tonegen_dtmf_enum,
+				motmdm_tonegen_dtmf_key_txt);
+
+static int motmdm_dtmf_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =3D
+		snd_soc_kcontrol_component(kcontrol);
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] =3D ddata->dtmf_val;
+
+	return 0;
+}
+
+static int motmdm_dtmf_put(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =3D
+		snd_soc_kcontrol_component(kcontrol);
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+
+	ddata->dtmf_val =3D ucontrol->value.enumerated.item[0];
+
+	return 0;
+}
+
+static int motmdm_tonegen_dtmf_send_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =3D
+		snd_soc_kcontrol_component(kcontrol);
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] =3D ddata->dtmf_en;
+
+	return 0;
+}
+
+static int motmdm_tonegen_dtmf_send_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =3D
+		snd_soc_kcontrol_component(kcontrol);
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+	const unsigned char *cmd, *fmt =3D "AT+DTSE=3D%s,%i";
+	const char *tone =3D "";
+	int error;
+
+	if (!ddata->enabled)
+		return 0;
+
+	ddata->dtmf_en =3D ucontrol->value.enumerated.item[0];
+	if (ddata->dtmf_en)
+		tone =3D motmdm_tonegen_dtmf_key_txt[ddata->dtmf_val];
+
+	/* Value 0 enables tone generator, 1 disables it */
+	cmd =3D kasprintf(GFP_KERNEL, fmt, tone, !ddata->dtmf_en);
+
+	error =3D motmdm_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0) {
+		dev_err(component->dev, "%s: %s failed with %i\n",
+			__func__, cmd, error);
+		goto free;
+	}
+
+free:
+	kfree(cmd);
+
+	return error;
+}
+
+static int
+motmdm_enable_primary_dai(struct snd_soc_component *component)
+{
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+	int error;
+
+	if (!ddata->master_dai)
+		return -ENODEV;
+
+	error =3D snd_soc_dai_set_sysclk(ddata->master_dai, 1, 19200000,
+				       SND_SOC_CLOCK_OUT);
+	if (error)
+		return error;
+
+	error =3D snd_soc_dai_set_fmt(ddata->master_dai,
+				    SND_SOC_DAIFMT_I2S |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_CBM_CFM);
+	if (error)
+		return error;
+
+	error =3D snd_soc_dai_set_tdm_slot(ddata->master_dai, 0, 1, 1, 8);
+	if (error)
+		return error;
+
+	return error;
+}
+
+static int
+motmdm_disable_primary_dai(struct snd_soc_component *component)
+{
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+	int error;
+
+	if (!ddata->master_dai) {
+		return -ENODEV;
+	}
+
+	error =3D snd_soc_dai_set_sysclk(ddata->master_dai, 0, 26000000,
+				       SND_SOC_CLOCK_OUT);
+	if (error) {
+		return error;
+	}
+
+	error =3D snd_soc_dai_set_fmt(ddata->master_dai,
+				    SND_SOC_DAIFMT_CBM_CFM);
+	if (error) {
+		return error;
+	}
+
+	error =3D snd_soc_dai_set_tdm_slot(ddata->master_dai, 0, 0, 0, 48);
+	if (error) {
+		return error;
+	}
+
+	return error;
+}
+
+static int motmdm_find_primary_dai(struct snd_soc_component *component,
+	const char *name)
+{
+	struct motmdm_driver_data *ddata =3D
+		snd_soc_component_get_drvdata(component);
+	struct device_node *bitclkmaster =3D NULL, *framemaster =3D NULL;
+	struct device_node *ep, *master_ep, *master =3D NULL;
+	struct snd_soc_dai_link_component dlc =3D { 0 };
+	unsigned int daifmt;
+
+	ep =3D of_graph_get_next_endpoint(component->dev->of_node, NULL);
+	if (!ep)
+		return -ENODEV;
+
+	master_ep =3D of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!master_ep)
+		return -ENODEV;
+
+	daifmt =3D snd_soc_of_parse_daifmt(master_ep, NULL,
+					 &bitclkmaster, &framemaster);
+	of_node_put(master_ep);
+	if (bitclkmaster && framemaster)
+		master =3D of_graph_get_port_parent(bitclkmaster);
+	of_node_put(bitclkmaster);
+	of_node_put(framemaster);
+	if (!master)
+		return -ENODEV;
+
+	dlc.of_node =3D master;
+	dlc.dai_name =3D name;
+	ddata->master_dai =3D snd_soc_find_dai(&dlc);
+	of_node_put(master);
+	if (!ddata->master_dai)
+		return -EPROBE_DEFER;
+
+	dev_info(component->dev, "Master DAI is %s\n",
+		 dev_name(ddata->master_dai->dev));
+
+	return 0;
+}
+
+static int motmdm_parse_tdm(struct snd_soc_component *component)
+{
+	return motmdm_find_primary_dai(component, "cpcap-voice");
+}
+
+static const struct snd_kcontrol_new motmdm_snd_controls[] =3D {
+        SOC_ENUM_EXT("Call Output", motmdm_out_enum,
+                     motmdm_audio_out_get,
+                     motmdm_audio_out_put),
+        SOC_SINGLE_EXT_TLV("Call Volume",
+			   0, 0, 7, 0,
+			   motmdm_gain_get,
+			   motmdm_gain_put,
+			   motmdm_gain_tlv),
+	SOC_SINGLE_BOOL_EXT("Call Noise Cancellation", 0,
+			    motmdm_noise_get,
+			    motmdm_noise_put),
+	SOC_ENUM_EXT("Call DTMF", motmd_tonegen_dtmf_enum,
+		     motmdm_dtmf_get,
+		     motmdm_dtmf_put),
+	SOC_SINGLE_BOOL_EXT("Call DTMF Send", 0,
+			    motmdm_tonegen_dtmf_send_get,
+			    motmdm_tonegen_dtmf_send_put),
+};
+
+static struct snd_soc_dai_driver motmdm_dai[] =3D {
+	{
+		.name =3D "mdm-call",
+		.playback =3D {
+			.stream_name =3D "Voice Call Playback",
+			.channels_min =3D 1,
+			.channels_max =3D 2,
+			.rates =3D SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture =3D {
+			.stream_name =3D "Voice Call Capture",
+			.channels_min =3D 1,
+			.channels_max =3D 2,
+			.rates =3D SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+};
+
+static int
+motmdm_notifier_call(struct notifier_block *bl, unsigned long state,
+                                                        void *unused)
+{
+	struct motmdm_driver_data *ddata =3D
+		container_of(bl, struct motmdm_driver_data, notifier);
+	bool enable, notify =3D false;
+	unsigned long flags;
+
+	enable =3D !!state;
+
+	spin_lock_irqsave(&ddata->lock, flags);
+	if (ddata->enabled !=3D enable) {
+		ddata->enabled =3D enable;
+		notify =3D true;
+	}
+	spin_unlock_irqrestore(&ddata->lock, flags);
+
+	if (!notify)
+		return NOTIFY_DONE;
+
+	if (enable)
+		motmdm_enable_primary_dai(ddata->component);
+	else
+		motmdm_disable_primary_dai(ddata->component);
+
+	return NOTIFY_DONE;
+}
+
+static int voice_receive_data(struct serdev_device *serdev,
+			     const unsigned char *buf,
+			     size_t len)
+{
+        struct motmdm_driver_data *ddata =3D serdev_device_get_drvdata(ser=
dev);
+	struct device *dev =3D ddata->component->dev;
+
+	printk("voice_receive_data: have %s %d\n", buf, len);
+
+	if (len > MOTMDM_AUDIO_MAX_LEN)
+		len =3D MOTMDM_AUDIO_MAX_LEN;
+
+	if (len <=3D MOTMDM_HEADER_LEN)
+		return 0;
+
+	printk("voice_receive_data: command reply? -- %s %d\n", buf, len);
+
+	snprintf(ddata->buf, len - MOTMDM_HEADER_LEN, buf + MOTMDM_HEADER_LEN);
+	dev_info(dev, "%s: received: %s\n", __func__, ddata->buf);
+	ddata->parsed =3D true;
+	wake_up(&ddata->read_queue);
+
+	return len;
+}
+
+static const struct serdev_device_ops voice_serdev_ops =3D {
+        .receive_buf    =3D voice_receive_data,
+        .write_wakeup   =3D serdev_device_write_wakeup,
+};
+
+static void motmdm_free_voice_serdev(struct motmdm_driver_data *ddata)
+{
+	serdev_device_close(ddata->serdev);
+}
+
+static int motmdm_soc_probe(struct snd_soc_component *component)
+{
+	struct motmdm_driver_data *ddata;
+	const unsigned char *cmd =3D "AT+CMUT=3D0";
+	int error;
+	u32 line;
+
+	ddata =3D devm_kzalloc(component->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	error =3D of_property_read_u32(component->dev->of_node, "reg", &line);
+	if (error)
+		return error;
+
+	ddata->serdev =3D (struct serdev_device *) component->dev;
+	ddata->component =3D component;
+	ddata->modem =3D component->dev->parent;
+	mutex_init(&ddata->mutex);
+	init_waitqueue_head(&ddata->read_queue);
+	ddata->len =3D PAGE_SIZE;
+	spin_lock_init(&ddata->lock);
+	snd_soc_component_set_drvdata(component, ddata);
+	ddata->len =3D MOTMDM_AUDIO_MAX_LEN;
+
+	ddata->buf =3D devm_kzalloc(component->dev, ddata->len, GFP_KERNEL);
+	if (!ddata->buf)
+		return -ENOMEM;
+
+	ddata->regmap =3D devm_regmap_init(component->dev, NULL, component,
+					 &motmdm_regmap);
+	if (IS_ERR(ddata->regmap)) {
+		error =3D PTR_ERR(ddata->regmap);
+		dev_err(component->dev, "%s: Failed to allocate regmap: %d\n",
+			__func__, error);
+
+		return error;
+	}
+
+	serdev_device_set_drvdata(ddata->serdev, ddata);
+        serdev_device_set_client_ops(ddata->serdev, &voice_serdev_ops);
+
+        error =3D serdev_device_open(ddata->serdev);
+        if (error)
+                return error;
+
+	error =3D motmdm_parse_tdm(component);
+	if (error)
+		goto unregister_serdev;
+
+	regcache_sync(ddata->regmap);
+
+	error =3D motmdm_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0)
+		goto unregister_serdev;
+
+	error =3D motmdm_disable_primary_dai(ddata->component);
+	if (error)
+		goto unregister_serdev;
+
+	ddata->notifier.notifier_call =3D motmdm_notifier_call;
+	register_modem_state_notifier(&ddata->notifier);
+
+	return 0;
+
+unregister_serdev:
+	motmdm_free_voice_serdev(ddata);
+	serdev_device_close(ddata->serdev);
+
+	return error;
+}
+
+static void motmdm_soc_remove(struct snd_soc_component *component)
+{
+	struct motmdm_driver_data *ddata =3D snd_soc_component_get_drvdata(compon=
ent);
+
+	unregister_modem_state_notifier(&ddata->notifier);
+
+	motmdm_free_voice_serdev(ddata);
+}
+
+static struct snd_soc_component_driver soc_codec_dev_motmdm =3D {
+	.probe =3D motmdm_soc_probe,
+	.remove =3D motmdm_soc_remove,
+	.controls =3D motmdm_snd_controls,
+	.num_controls =3D ARRAY_SIZE(motmdm_snd_controls),
+	.idle_bias_on =3D 1,
+	.use_pmdown_time =3D 1,
+	.endianness =3D 1,
+	.non_legacy_dai_naming =3D 1,
+};
+
+static int motmdm_codec_probe(struct serdev_device *serdev)
+{
+	return devm_snd_soc_register_component(&serdev->dev,
+					       &soc_codec_dev_motmdm,
+					       motmdm_dai,
+					       ARRAY_SIZE(motmdm_dai));
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id motmdm_of_match[] =3D {
+	{ .compatible =3D "motorola,mapphone-mdm6600-codec" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, motmdm_of_match);
+#endif
+
+static struct serdev_device_driver motmdm_driver =3D {
+	.probe =3D motmdm_codec_probe,
+	.driver =3D {
+		.name =3D "mot-mdm6600-codec",
+		.of_match_table =3D of_match_ptr(motmdm_of_match),
+	},
+};
+module_serdev_device_driver(motmdm_driver);
+
+MODULE_ALIAS("platform:motmdm-codec");
+MODULE_DESCRIPTION("ASoC Motorola Mapphone MDM6600 codec driver");
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_LICENSE("GPL v2");

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBKXbgAKCRAw5/Bqldv6
8jgqAJ0dUN5NPz+eZ08TcQeCeKbYMBUFWQCfaBVxin3hU4VCleRgulFrdNkDS18=
=URIk
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
