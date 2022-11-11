Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3862595C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:28:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F03167E;
	Fri, 11 Nov 2022 12:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F03167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166126;
	bh=MCCD55ssV/+LyB/gBcg4LJzJKVMhJ6KC7PQ9h0Gi9nk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4qVkF+LRMU0S1e5RXukWHr1bfXMelgpKs6aHd/lu3ZKg0FrJffH4RGne5GVichLh
	 SbHR+sy9z5l9IS82IAJpXiYJJOirysXbT9YFk5F+PpOMb0uUg7vjHxEYhXVNqXKLjY
	 CE2WQfOyDa7Mn7YeJahgA7ccmipfCmnnMwUbVVmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE48F8055C;
	Fri, 11 Nov 2022 12:27:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E196BF8055B; Fri, 11 Nov 2022 12:27:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-197.mail.aliyun.com (out29-197.mail.aliyun.com
 [115.124.29.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AADB1F804AB
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADB1F804AB
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1;
 BR=01201311R131S08rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0011861-7.36675e-05-0.99874;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q5.SfMd_1668166016; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q5.SfMd_1668166016) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 19:26:58 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V3 2/6] ASoC: codecs: Added configuration file parsing for
 aw883xx
Date: Fri, 11 Nov 2022 19:26:28 +0800
Message-Id: <1668165992-6493-3-git-send-email-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
References: <000701d8e7521f78bc05e6a340awinic.com>
 <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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

From: Weidong Wang <wangweidong.a@awinic.com>

The Awinic AW883XX is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Signed-off-by: Nick Li <liweilei@awinic.com>
Signed-off-by: Bruce zhao <zhaolei@awinic.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c | 1294 ++++++++++++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h |  145 +++
 2 files changed, 1439 insertions(+)
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h

diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
new file mode 100644
index 0000000..e4ad58f
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
@@ -0,0 +1,1294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * aw_bin_parse.c  -- ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ */
+
+#include <linux/cdev.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/firmware.h>
+#include <linux/hrtimer.h>
+#include <linux/input.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/miscdevice.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/workqueue.h>
+#include "aw883xx_bin_parse.h"
+
+#define printing_data_code
+
+static char *profile_name[AW_PROFILE_MAX] = {
+	"Music", "Voice", "Voip", "Ringtone",
+	"Ringtone_hs", "Lowpower", "Bypass",
+	"Mmi", "Fm", "Notification", "Receiver"
+};
+
+static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);
+
+/*
+ * Interface function
+ *
+ * return value:
+ *       value = 0 :success;
+ *       value = -1 :check bin header version
+ *       value = -2 :check bin data type
+ *       value = -3 :check sum or check bin data len error
+ *       value = -4 :check data version
+ *       value = -5 :check register num
+ *       value = -6 :check dsp reg num
+ *       value = -7 :check soc app num
+ *       value = -8 :bin is NULL point
+ *
+ */
+
+/*
+ * check sum data
+ */
+static int aw_check_sum(struct aw_bin *bin, int bin_num)
+{
+	unsigned int i = 0;
+	unsigned int sum_data = 0;
+	unsigned int check_sum = 0;
+	char *p_check_sum = NULL;
+
+	p_check_sum = &(bin->info.data[(bin->header_info[bin_num].valid_data_addr -
+						bin->header_info[bin_num].header_len)]);
+	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
+	check_sum = GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+				*(p_check_sum + 1), *(p_check_sum));
+
+	for (i = 4; i < bin->header_info[bin_num].bin_data_len +
+					bin->header_info[bin_num].header_len; i++) {
+		sum_data += *(p_check_sum + i);
+	}
+	pr_debug("aw_bin_parse bin_num = %d, check_sum = 0x%x, sum_data = 0x%x\n",
+						bin_num, check_sum, sum_data);
+	if (sum_data != check_sum) {
+		p_check_sum = NULL;
+		pr_err("%s. CheckSum Fail.bin_num=%d, CheckSum:0x%x, SumData:0x%x",
+				__func__, bin_num, check_sum, sum_data);
+		return -BIN_DATA_LEN_ERR;
+	}
+	p_check_sum = NULL;
+
+	return 0;
+}
+
+static int aw_check_data_version(struct aw_bin *bin, int bin_num)
+{
+	int i = 0;
+
+	for (i = DATA_VERSION_V1; i < DATA_VERSION_MAX; i++) {
+		if (bin->header_info[bin_num].bin_data_ver == i)
+			return 0;
+	}
+	pr_err("aw_bin_parse Unrecognized this bin data version\n");
+	return -DATA_VER_ERR;
+}
+
+static int aw_check_register_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_register_num = 0;
+	unsigned int parse_register_num = 0;
+	char *p_check_sum = NULL;
+	struct bin_header_info temp_info;
+
+	temp_info = bin->header_info[bin_num];
+	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
+	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
+	parse_register_num = GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+					*(p_check_sum + 1), *(p_check_sum));
+	check_register_num = (bin->header_info[bin_num].bin_data_len - 4) /
+				(bin->header_info[bin_num].reg_byte_len +
+				bin->header_info[bin_num].data_byte_len);
+	pr_debug("%s bin_num = %d,parse_register_num = 0x%x,check_register_num = 0x%x\n",
+				__func__, bin_num, parse_register_num, check_register_num);
+	if (parse_register_num != check_register_num) {
+		p_check_sum = NULL;
+		pr_err("%s bin_num = %d,parse_register_num = 0x%x,check_register_num = 0x%x\n",
+				__func__, bin_num, parse_register_num, check_register_num);
+
+		return -REG_NUM_ERR;
+	}
+	bin->header_info[bin_num].reg_num = parse_register_num;
+	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 4;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 4;
+	return 0;
+}
+
+static int aw_check_dsp_reg_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_dsp_reg_num = 0;
+	unsigned int parse_dsp_reg_num = 0;
+	char *p_check_sum = NULL;
+	struct bin_header_info temp_info;
+
+	temp_info = bin->header_info[bin_num];
+	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
+	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
+	parse_dsp_reg_num = GET_32_DATA(*(p_check_sum + 7), *(p_check_sum + 6),
+					*(p_check_sum + 5), *(p_check_sum + 4));
+	bin->header_info[bin_num].reg_data_byte_len =
+			GET_32_DATA(*(p_check_sum + 11), *(p_check_sum + 10),
+					*(p_check_sum + 9), *(p_check_sum + 8));
+	check_dsp_reg_num = (bin->header_info[bin_num].bin_data_len - 12) /
+				bin->header_info[bin_num].reg_data_byte_len;
+	pr_debug("%s bin_num = %d, parse_dsp_reg_num = 0x%x, check_dsp_reg_num = 0x%x",
+					__func__, bin_num, check_dsp_reg_num, check_dsp_reg_num);
+	if (parse_dsp_reg_num != check_dsp_reg_num) {
+		p_check_sum = NULL;
+		pr_err("aw_bin_parse check dsp reg num error\n");
+		pr_err("%s bin_num = %d, parse_dsp_reg_num = 0x%x, check_dsp_reg_num = 0x%x",
+					__func__, bin_num, check_dsp_reg_num, check_dsp_reg_num);
+		return -DSP_REG_NUM_ERR;
+	}
+	bin->header_info[bin_num].download_addr =
+			GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+					*(p_check_sum + 1), *(p_check_sum));
+	bin->header_info[bin_num].reg_num = parse_dsp_reg_num;
+	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 12;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 12;
+	return 0;
+}
+
+static int aw_check_soc_app_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_soc_app_num = 0;
+	unsigned int parse_soc_app_num = 0;
+	char *p_check_sum = NULL;
+	struct bin_header_info temp_info;
+
+	temp_info = bin->header_info[bin_num];
+	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
+	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
+	bin->header_info[bin_num].app_version = GET_32_DATA(*(p_check_sum + 3),
+			*(p_check_sum + 2), *(p_check_sum + 1), *(p_check_sum));
+	parse_soc_app_num = GET_32_DATA(*(p_check_sum + 11),
+		*(p_check_sum + 10), *(p_check_sum + 9), *(p_check_sum + 8));
+	check_soc_app_num = bin->header_info[bin_num].bin_data_len - 12;
+	pr_debug("%s bin_num = %d, parse_soc_app_num=0x%x, check_soc_app_num = 0x%x\n",
+					__func__, bin_num, parse_soc_app_num, check_soc_app_num);
+	if (parse_soc_app_num != check_soc_app_num) {
+		p_check_sum = NULL;
+		pr_err("aw_bin_parse check soc app num error\n");
+		pr_err("%s bin_num = %d, parse_soc_app_num=0x%x, check_soc_app_num = 0x%x\n",
+					__func__, bin_num, parse_soc_app_num, check_soc_app_num);
+
+		return -SOC_APP_NUM_ERR;
+	}
+	bin->header_info[bin_num].reg_num = parse_soc_app_num;
+	bin->header_info[bin_num].download_addr =
+			GET_32_DATA(*(p_check_sum + 7), *(p_check_sum + 6),
+					*(p_check_sum + 5), *(p_check_sum + 4));
+	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 12;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 12;
+	return 0;
+}
+
+/*
+ * bin header 1_0_0
+ */
+static void aw_get_single_bin_header_1_0_0(struct aw_bin *bin)
+{
+	int i;
+
+	bin->header_info[bin->all_bin_parse_num].header_len = 60;
+	bin->header_info[bin->all_bin_parse_num].check_sum =
+		GET_32_DATA(*(bin->p_addr + 3), *(bin->p_addr + 2),
+				*(bin->p_addr + 1), *(bin->p_addr));
+	bin->header_info[bin->all_bin_parse_num].header_ver =
+		GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
+				*(bin->p_addr + 5), *(bin->p_addr + 4));
+	bin->header_info[bin->all_bin_parse_num].bin_data_type =
+		GET_32_DATA(*(bin->p_addr + 11), *(bin->p_addr + 10),
+				*(bin->p_addr + 9), *(bin->p_addr + 8));
+	bin->header_info[bin->all_bin_parse_num].bin_data_ver =
+		GET_32_DATA(*(bin->p_addr + 15), *(bin->p_addr + 14),
+				*(bin->p_addr + 13), *(bin->p_addr + 12));
+	bin->header_info[bin->all_bin_parse_num].bin_data_len =
+		GET_32_DATA(*(bin->p_addr + 19), *(bin->p_addr + 18),
+				*(bin->p_addr + 17), *(bin->p_addr + 16));
+	bin->header_info[bin->all_bin_parse_num].ui_ver =
+		GET_32_DATA(*(bin->p_addr + 23), *(bin->p_addr + 22),
+				*(bin->p_addr + 21), *(bin->p_addr + 20));
+	bin->header_info[bin->all_bin_parse_num].reg_byte_len =
+		GET_32_DATA(*(bin->p_addr + 35), *(bin->p_addr + 34),
+				*(bin->p_addr + 33), *(bin->p_addr + 32));
+	bin->header_info[bin->all_bin_parse_num].data_byte_len =
+		GET_32_DATA(*(bin->p_addr + 39), *(bin->p_addr + 38),
+				*(bin->p_addr + 37), *(bin->p_addr + 36));
+	bin->header_info[bin->all_bin_parse_num].device_addr =
+		GET_32_DATA(*(bin->p_addr + 43), *(bin->p_addr + 42),
+			*(bin->p_addr + 41), *(bin->p_addr + 40));
+	for (i = 0; i < 8; i++) {
+		bin->header_info[bin->all_bin_parse_num].chip_type[i] =
+						*(bin->p_addr + 24 + i);
+	}
+	bin->header_info[bin->all_bin_parse_num].reg_num = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].reg_data_byte_len = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].download_addr = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].app_version = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].valid_data_len = 0x00000000;
+	bin->all_bin_parse_num += 1;
+}
+
+static int aw_parse_each_of_multi_bins_1_0_0(unsigned int bin_num, int bin_serial_num,
+				      struct aw_bin *bin)
+{
+	int ret = 0;
+	unsigned int bin_start_addr = 0;
+	unsigned int valid_data_len = 0;
+	struct bin_header_info aw_bin_header_info;
+
+	aw_bin_header_info = bin->header_info[bin->all_bin_parse_num - 1];
+	if (!bin_serial_num) {
+		bin_start_addr = GET_32_DATA(*(bin->p_addr + 67), *(bin->p_addr
+			+ 66), *(bin->p_addr + 65), *(bin->p_addr + 64));
+		bin->p_addr += (60 + bin_start_addr);
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
+			aw_bin_header_info.valid_data_addr + 4 + 8 * bin_num + 60;
+	} else {
+		valid_data_len = aw_bin_header_info.bin_data_len;
+		bin->p_addr += (60 + valid_data_len);
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
+		    aw_bin_header_info.valid_data_addr
+		    + aw_bin_header_info.bin_data_len
+		    + 60;
+	}
+
+	ret = aw_parse_bin_header_1_0_0(bin);
+	return ret;
+}
+
+/* Get the number of bins in multi bins, and set a for loop,
+ * loop processing each bin data
+ */
+static int aw_get_multi_bin_header_1_0_0(struct aw_bin *bin)
+{
+	int i = 0;
+	int ret = 0;
+	unsigned int bin_num = 0;
+
+	bin_num = GET_32_DATA(*(bin->p_addr + 63), *(bin->p_addr + 62),
+				*(bin->p_addr + 61), *(bin->p_addr + 60));
+	if (bin->multi_bin_parse_num == 1)
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
+	aw_get_single_bin_header_1_0_0(bin);
+
+	for (i = 0; i < bin_num; i++) {
+		pr_debug("aw_bin_parse enter multi bin for is %d\n", i);
+		ret = aw_parse_each_of_multi_bins_1_0_0(bin_num, i, bin);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
+/*
+ * If the bin framework header version is 1.0.0,
+ * determine the data type of bin, and then perform different processing
+ * according to the data type
+ * If it is a single bin data type, write the data directly
+ * into the structure array
+ * If it is a multi-bin data type, first obtain the number of bins,
+ * and then recursively call the bin frame header processing function
+ * according to the bin number to process the frame header information
+ * of each bin separately
+ */
+static int aw_parse_bin_header_1_0_0(struct aw_bin *bin)
+{
+	int ret = 0;
+	unsigned int bin_data_type;
+
+	bin_data_type = GET_32_DATA(*(bin->p_addr + 11), *(bin->p_addr + 10),
+					*(bin->p_addr + 9), *(bin->p_addr + 8));
+	pr_debug("aw_bin_parse bin_data_type 0x%x\n", bin_data_type);
+	switch (bin_data_type) {
+	case DATA_TYPE_REGISTER:
+	case DATA_TYPE_DSP_REG:
+	case DATA_TYPE_SOC_APP:
+		/* Divided into two processing methods,
+		 * one is single bin processing,
+		 * and the other is single bin processing in multi bin
+		 */
+		pr_debug("aw_bin_parse enter single bin branch\n");
+		bin->single_bin_parse_num += 1;
+		pr_debug("%s bin->single_bin_parse_num is %d\n", __func__,
+						bin->single_bin_parse_num);
+		if (!bin->multi_bin_parse_num)
+			bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
+		aw_get_single_bin_header_1_0_0(bin);
+		break;
+	case DATA_TYPE_MULTI_BINS:
+		/* Get the number of times to enter multi bins */
+		pr_debug("aw_bin_parse enter multi bin branch\n");
+		bin->multi_bin_parse_num += 1;
+		pr_debug("%s bin->multi_bin_parse_num is %d\n", __func__,
+						bin->multi_bin_parse_num);
+		ret = aw_get_multi_bin_header_1_0_0(bin);
+		if (ret < 0)
+			return ret;
+		break;
+	}
+	return 0;
+}
+
+/* get the bin's header version */
+static int aw_check_bin_header_version(struct aw_bin *bin)
+{
+	int ret = 0;
+	unsigned int header_version = 0;
+
+	header_version = GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
+					*(bin->p_addr + 5), *(bin->p_addr + 4));
+	pr_debug("aw_bin_parse header_version 0x%x\n", header_version);
+	/* Write data to the corresponding structure array
+	 * according to different formats of the bin frame header version
+	 */
+	switch (header_version) {
+	case HEADER_VERSION_1_0_0:
+		ret = aw_parse_bin_header_1_0_0(bin);
+		return ret;
+	default:
+		pr_err("aw_bin_parse Unrecognized this bin header version\n");
+		return -BIN_HEADER_VER_ERR;
+	}
+}
+
+static int aw_parsing_bin_file(struct aw_bin *bin)
+{
+	int i = 0;
+	int ret = 0;
+
+	if (!bin) {
+		pr_err("aw_bin_parse bin is NULL\n");
+		return -BIN_IS_NULL;
+	}
+	bin->p_addr = bin->info.data;
+	bin->all_bin_parse_num = 0;
+	bin->multi_bin_parse_num = 0;
+	bin->single_bin_parse_num = 0;
+
+	/* filling bins header info */
+	ret = aw_check_bin_header_version(bin);
+	if (ret < 0) {
+		pr_err("aw_bin_parse check bin header version error\n");
+		return ret;
+	}
+	bin->p_addr = NULL;
+
+	/* check bin header info */
+	for (i = 0; i < bin->all_bin_parse_num; i++) {
+		/* check sum */
+		ret = aw_check_sum(bin, i);
+		if (ret < 0) {
+			pr_err("aw_bin_parse check sum data error\n");
+			return ret;
+		}
+		/* check bin data version */
+		ret = aw_check_data_version(bin, i);
+		if (ret < 0) {
+			pr_err("aw_bin_parse check data version error\n");
+			return ret;
+		}
+		/* check valid data */
+		if (bin->header_info[i].bin_data_ver == DATA_VERSION_V1) {
+			/* check register num */
+			if (bin->header_info[i].bin_data_type ==
+							DATA_TYPE_REGISTER) {
+				ret = aw_check_register_num_v1(bin, i);
+				if (ret < 0)
+					return ret;
+				/* check dsp reg num */
+			} else if (bin->header_info[i].bin_data_type ==
+							DATA_TYPE_DSP_REG) {
+				ret = aw_check_dsp_reg_num_v1(bin, i);
+				if (ret < 0)
+					return ret;
+				/* check soc app num */
+			} else if (bin->header_info[i].bin_data_type ==
+							DATA_TYPE_SOC_APP) {
+				ret = aw_check_soc_app_num_v1(bin, i);
+				if (ret < 0)
+					return ret;
+			} else {
+				bin->header_info[i].valid_data_len =
+					bin->header_info[i].bin_data_len;
+			}
+		}
+	}
+
+	return 0;
+}
+
+int aw883xx_dev_dsp_data_order(struct aw_device *aw_dev,
+				uint8_t *data, uint32_t data_len)
+{
+	int i = 0;
+	uint8_t tmp_val = 0;
+
+	if (data_len % 2 != 0) {
+		dev_dbg(aw_dev->dev, "data_len:%d unsupported", data_len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < data_len; i += 2) {
+		tmp_val = data[i];
+		data[i] = data[i + 1];
+		data[i + 1] = tmp_val;
+	}
+
+	return 0;
+}
+
+static int aw_dev_parse_raw_reg(struct aw_device *aw_dev,
+		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
+{
+	prof_desc->sec_desc[AW_DATA_TYPE_REG].data = data;
+	prof_desc->sec_desc[AW_DATA_TYPE_REG].len = data_len;
+
+	prof_desc->prof_st = AW_PROFILE_OK;
+
+	return 0;
+}
+
+static int aw_dev_parse_raw_dsp_cfg(struct aw_device *aw_dev,
+		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
+{
+	int ret;
+
+	ret = aw883xx_dev_dsp_data_order(aw_dev, data, data_len);
+	if (ret < 0)
+		return ret;
+
+	prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].data = data;
+	prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].len = data_len;
+
+	prof_desc->prof_st = AW_PROFILE_OK;
+
+	return 0;
+}
+
+static int aw_dev_parse_raw_dsp_fw(struct aw_device *aw_dev,
+		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
+{
+	int ret;
+
+	ret = aw883xx_dev_dsp_data_order(aw_dev, data, data_len);
+	if (ret < 0)
+		return ret;
+
+	prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].data = data;
+	prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].len = data_len;
+
+	prof_desc->prof_st = AW_PROFILE_OK;
+
+	return 0;
+}
+
+static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev,
+		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
+{
+	struct aw_bin *aw_bin = NULL;
+	int i;
+	int ret;
+
+	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(struct aw_bin), GFP_KERNEL);
+	if (!aw_bin)
+		return -ENOMEM;
+
+	aw_bin->info.len = data_len;
+	memcpy(aw_bin->info.data, data, data_len);
+
+	ret = aw_parsing_bin_file(aw_bin);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "parse bin failed");
+		goto parse_bin_failed;
+	}
+
+	for (i = 0; i < aw_bin->all_bin_parse_num; i++) {
+		if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_REGISTER) {
+			prof_desc->sec_desc[AW_DATA_TYPE_REG].len =
+				aw_bin->header_info[i].valid_data_len;
+			prof_desc->sec_desc[AW_DATA_TYPE_REG].data =
+				data + aw_bin->header_info[i].valid_data_addr;
+		} else if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_DSP_REG) {
+			ret = aw883xx_dev_dsp_data_order(aw_dev,
+					data + aw_bin->header_info[i].valid_data_addr,
+					aw_bin->header_info[i].valid_data_len);
+			if (ret < 0)
+				goto parse_bin_failed;
+
+			prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].len =
+					aw_bin->header_info[i].valid_data_len;
+			prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].data =
+					data + aw_bin->header_info[i].valid_data_addr;
+		} else if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_DSP_FW) {
+			ret = aw883xx_dev_dsp_data_order(aw_dev,
+					data + aw_bin->header_info[i].valid_data_addr,
+					aw_bin->header_info[i].valid_data_len);
+			if (ret < 0)
+				goto parse_bin_failed;
+
+			prof_desc->fw_ver = aw_bin->header_info[i].app_version;
+			prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].len =
+					aw_bin->header_info[i].valid_data_len;
+			prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].data =
+					data + aw_bin->header_info[i].valid_data_addr;
+		}
+	}
+	devm_kfree(aw_dev->dev, aw_bin);
+	aw_bin = NULL;
+	prof_desc->prof_st = AW_PROFILE_OK;
+	return 0;
+
+parse_bin_failed:
+	devm_kfree(aw_dev->dev, aw_bin);
+	aw_bin = NULL;
+	return ret;
+}
+
+static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg_hdr *cfg_hdr,
+			struct aw_cfg_dde *cfg_dde, struct aw_prof_desc *scene_prof_desc)
+{
+
+	switch (cfg_dde->data_type) {
+	case ACF_SEC_TYPE_REG:
+		return aw_dev_parse_raw_reg(aw_dev,
+				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, scene_prof_desc);
+	case ACF_SEC_TYPE_DSP_CFG:
+		return aw_dev_parse_raw_dsp_cfg(aw_dev,
+				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, scene_prof_desc);
+	case ACF_SEC_TYPE_DSP_FW:
+		return aw_dev_parse_raw_dsp_fw(aw_dev,
+				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, scene_prof_desc);
+	case ACF_SEC_TYPE_MUTLBIN:
+		return aw_dev_prof_parse_multi_bin(aw_dev,
+				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, scene_prof_desc);
+	}
+	return 0;
+}
+
+static int aw_dev_parse_dev_type(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *prof_hdr, struct aw_all_prof_info *all_prof_info)
+{
+	int i = 0;
+	int ret;
+	int sec_num = 0;
+	struct aw_cfg_dde *cfg_dde =
+		(struct aw_cfg_dde *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
+
+	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
+		if ((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
+			(aw_dev->i2c->addr == cfg_dde[i].dev_addr) &&
+			(cfg_dde[i].type == AW_DEV_TYPE_ID)) {
+			if (cfg_dde[i].data_type != ACF_SEC_TYPE_MONITOR) {
+				if (cfg_dde[i].dev_profile >= AW_PROFILE_MAX) {
+					dev_err(aw_dev->dev, "dev_profile [%d] overflow",
+						cfg_dde[i].dev_profile);
+					return -EINVAL;
+				}
+				ret = aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],
+					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);
+				if (ret < 0) {
+					dev_err(aw_dev->dev, "parse failed");
+					return ret;
+				}
+				sec_num++;
+			}
+		}
+	}
+
+	if (sec_num == 0) {
+		dev_info(aw_dev->dev, "get dev type num is %d, please use default",
+					sec_num);
+		return AW_DEV_TYPE_NONE;
+	}
+
+	return AW_DEV_TYPE_OK;
+}
+
+static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *prof_hdr, struct aw_all_prof_info *all_prof_info)
+{
+	int i = 0;
+	int ret;
+	int sec_num = 0;
+	struct aw_cfg_dde *cfg_dde =
+		(struct aw_cfg_dde *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
+
+	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
+		if ((aw_dev->channel == cfg_dde[i].dev_index) &&
+			(cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID)) {
+			if (cfg_dde[i].data_type != ACF_SEC_TYPE_MONITOR) {
+				if (cfg_dde[i].dev_profile >= AW_PROFILE_MAX) {
+					dev_err(aw_dev->dev, "dev_profile [%d] overflow",
+						cfg_dde[i].dev_profile);
+					return -EINVAL;
+				}
+				ret = aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],
+					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);
+				if (ret < 0) {
+					dev_err(aw_dev->dev, "parse failed");
+					return ret;
+				}
+				sec_num++;
+			}
+		}
+	}
+
+	if (sec_num == 0) {
+		dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", sec_num);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw_dev_cfg_get_vaild_prof(struct aw_device *aw_dev,
+				struct aw_all_prof_info all_prof_info)
+{
+	int i;
+	int num = 0;
+	struct aw_sec_data_desc *sec_desc = NULL;
+	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+
+	for (i = 0; i < AW_PROFILE_MAX; i++) {
+		if (prof_desc[i].prof_st == AW_PROFILE_OK) {
+			sec_desc = prof_desc[i].sec_desc;
+			if ((sec_desc[AW_DATA_TYPE_REG].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_REG].len != 0) &&
+				(sec_desc[AW_DATA_TYPE_DSP_CFG].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_DSP_CFG].len != 0) &&
+				(sec_desc[AW_DATA_TYPE_DSP_FW].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_DSP_FW].len != 0)) {
+				prof_info->count++;
+			}
+		}
+	}
+
+	dev_dbg(aw_dev->dev, "get valid profile:%d", aw_dev->prof_info.count);
+
+	if (!prof_info->count) {
+		dev_err(aw_dev->dev, "no profile data");
+		return -EPERM;
+	}
+
+	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
+					prof_info->count * sizeof(struct aw_prof_desc),
+					GFP_KERNEL);
+	if (!prof_info->prof_desc) {
+		dev_err(aw_dev->dev, "prof_desc kzalloc failed");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < AW_PROFILE_MAX; i++) {
+		if (prof_desc[i].prof_st == AW_PROFILE_OK) {
+			sec_desc = prof_desc[i].sec_desc;
+			if ((sec_desc[AW_DATA_TYPE_REG].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_REG].len != 0) &&
+				(sec_desc[AW_DATA_TYPE_DSP_CFG].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_DSP_CFG].len != 0) &&
+				(sec_desc[AW_DATA_TYPE_DSP_FW].data != NULL) &&
+				(sec_desc[AW_DATA_TYPE_DSP_FW].len != 0)) {
+				if (num >= prof_info->count) {
+					dev_err(aw_dev->dev, "get scene num[%d] overflow count[%d]",
+						num, prof_info->count);
+					return -ENOMEM;
+				}
+				prof_info->prof_desc[num] = prof_desc[i];
+				prof_info->prof_desc[num].id = i;
+				num++;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *prof_hdr)
+{
+	int ret;
+	struct aw_all_prof_info all_prof_info;
+
+	memset(&all_prof_info, 0, sizeof(struct aw_all_prof_info));
+
+	ret = aw_dev_parse_dev_type(aw_dev, prof_hdr, &all_prof_info);
+	if (ret < 0) {
+		return ret;
+	} else if (ret == AW_DEV_TYPE_NONE) {
+		dev_dbg(aw_dev->dev, "get dev type num is 0, parse default dev");
+		ret = aw_dev_parse_dev_default_type(aw_dev, prof_hdr, &all_prof_info);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = aw_dev_cfg_get_vaild_prof(aw_dev, all_prof_info);
+	if (ret < 0)
+		return ret;
+
+	aw_dev->prof_info.prof_name_list = profile_name;
+
+	return 0;
+}
+
+static int aw_dev_create_prof_name_list_v_1_0_0_0(struct aw_device *aw_dev)
+{
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+	struct aw_prof_desc *prof_desc = prof_info->prof_desc;
+	int i;
+
+	if (!prof_desc) {
+		dev_err(aw_dev->dev, "prof_desc is NULL");
+		return -EINVAL;
+	}
+
+	prof_info->prof_name_list = devm_kzalloc(aw_dev->dev,
+					prof_info->count * PROFILE_STR_MAX,
+					GFP_KERNEL);
+	if (!prof_info->prof_name_list) {
+		dev_err(aw_dev->dev, "prof_name_list devm_kzalloc failed");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < prof_info->count; i++) {
+		prof_desc[i].id = i;
+		prof_info->prof_name_list[i] = prof_desc[i].prf_str;
+		dev_dbg(aw_dev->dev, "prof name is %s", prof_info->prof_name_list[i]);
+	}
+
+	return 0;
+}
+
+static int aw_get_dde_type_info(struct aw_device *aw_dev, struct aw_container *aw_cfg)
+{
+	int i;
+	int dev_num = 0;
+	int default_num = 0;
+	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
+		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
+
+	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
+		if (cfg_dde[i].type == AW_DEV_TYPE_ID)
+			dev_num++;
+
+		if (cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID)
+			default_num++;
+	}
+
+	if (!(dev_num || default_num)) {
+		dev_err(aw_dev->dev, "can't find scene");
+		return -EINVAL;
+	}
+
+	if (dev_num != 0)
+		aw_dev->prof_info.prof_type = AW_DEV_TYPE_ID;
+	else if (default_num != 0)
+		aw_dev->prof_info.prof_type = AW_DEV_DEFAULT_TYPE_ID;
+
+	return 0;
+}
+
+static int aw_get_dev_scene_count_v_1_0_0_0(struct aw_device *aw_dev, struct aw_container *aw_cfg,
+						uint32_t *scene_num)
+{
+	int i;
+	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
+		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
+	for (i = 0; i < cfg_hdr->a_ddt_num; ++i) {
+		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MUTLBIN) &&
+			(aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
+			(aw_dev->i2c->addr == cfg_dde[i].dev_addr))) {
+			(*scene_num)++;
+			}
+	}
+
+	return 0;
+}
+
+static int aw_get_default_scene_count_v_1_0_0_0(struct aw_device *aw_dev,
+						struct aw_container *aw_cfg,
+						uint32_t *scene_num)
+{
+	int i;
+	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
+		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
+
+	for (i = 0; i < cfg_hdr->a_ddt_num; ++i) {
+		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MUTLBIN) &&
+			(aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			(aw_dev->channel == cfg_dde[i].dev_index))
+			(*scene_num)++;
+	}
+
+	return 0;
+}
+
+static int aw_dev_parse_scene_count_v_1_0_0_0(struct aw_device *aw_dev,
+							struct aw_container *aw_cfg,
+							uint32_t *count)
+{
+	int ret;
+
+	ret = aw_get_dde_type_info(aw_dev, aw_cfg);
+	if (ret < 0)
+		return ret;
+
+	if (aw_dev->prof_info.prof_type == AW_DEV_TYPE_ID) {
+		aw_get_dev_scene_count_v_1_0_0_0(aw_dev, aw_cfg, count);
+	} else if (aw_dev->prof_info.prof_type == AW_DEV_DEFAULT_TYPE_ID) {
+		aw_get_default_scene_count_v_1_0_0_0(aw_dev, aw_cfg, count);
+	} else {
+		dev_err(aw_dev->dev, "unsupported prof_type[%x]",
+			aw_dev->prof_info.prof_type);
+		return -EINVAL;
+	}
+
+	dev_info(aw_dev->dev, "scene count is %d", (*count));
+	return 0;
+}
+
+static int aw_dev_parse_data_by_sec_type_v_1_0_0_0(struct aw_device *aw_dev,
+							struct aw_cfg_hdr *prof_hdr,
+							struct aw_cfg_dde_v_1_0_0_0 *cfg_dde,
+							int *cur_scene_id)
+{
+	int ret;
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+
+	switch (cfg_dde->data_type) {
+	case ACF_SEC_TYPE_MUTLBIN:
+		ret = aw_dev_prof_parse_multi_bin(aw_dev,
+					(uint8_t *)prof_hdr + cfg_dde->data_offset,
+					cfg_dde->data_size, &prof_info->prof_desc[*cur_scene_id]);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "parse multi bin failed");
+			return ret;
+		}
+		prof_info->prof_desc[*cur_scene_id].prf_str = cfg_dde->dev_profile_str;
+		prof_info->prof_desc[*cur_scene_id].id = cfg_dde->dev_profile;
+		(*cur_scene_id)++;
+		break;
+	default:
+		pr_err("unsupported SEC_TYPE [%d]", cfg_dde->data_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw_dev_parse_dev_type_v_1_0_0_0(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *prof_hdr)
+{
+	int i = 0;
+	int ret;
+	int cur_scene_id = 0;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
+		(struct aw_cfg_dde_v_1_0_0_0 *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
+
+	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
+		if ((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
+			(aw_dev->i2c->addr == cfg_dde[i].dev_addr) &&
+			(aw_dev->chip_id == cfg_dde[i].chip_id)) {
+			ret = aw_dev_parse_data_by_sec_type_v_1_0_0_0(aw_dev, prof_hdr,
+							&cfg_dde[i], &cur_scene_id);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "parse failed");
+				return ret;
+			}
+		}
+	}
+
+	if (cur_scene_id == 0) {
+		dev_err(aw_dev->dev, "get dev type failed, get num [%d]", cur_scene_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw_dev_parse_default_type_v_1_0_0_0(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *prof_hdr)
+{
+	int i = 0;
+	int ret;
+	int cur_scene_id = 0;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
+		(struct aw_cfg_dde_v_1_0_0_0 *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
+
+	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
+		if ((aw_dev->channel == cfg_dde[i].dev_index) &&
+			(aw_dev->chip_id == cfg_dde[i].chip_id)) {
+			ret = aw_dev_parse_data_by_sec_type_v_1_0_0_0(aw_dev, prof_hdr,
+							&cfg_dde[i], &cur_scene_id);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "parse failed");
+				return ret;
+			}
+		}
+	}
+
+	if (cur_scene_id == 0) {
+		dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", cur_scene_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw_dev_parse_by_hdr_v_1_0_0_0(struct aw_device *aw_dev,
+		struct aw_cfg_hdr *cfg_hdr)
+{
+	int ret;
+
+	if (aw_dev->prof_info.prof_type == AW_DEV_TYPE_ID) {
+		ret = aw_dev_parse_dev_type_v_1_0_0_0(aw_dev, cfg_hdr);
+		if (ret < 0)
+			return ret;
+	} else if (aw_dev->prof_info.prof_type == AW_DEV_DEFAULT_TYPE_ID) {
+		ret = aw_dev_parse_default_type_v_1_0_0_0(aw_dev, cfg_hdr);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_err(aw_dev->dev, "prof type matched failed, get num[%d]",
+			aw_dev->prof_info.prof_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw_dev_load_cfg_by_hdr_v_1_0_0_0(struct aw_device *aw_dev, struct aw_container *aw_cfg)
+{
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	int ret;
+
+	ret = aw_dev_parse_scene_count_v_1_0_0_0(aw_dev, aw_cfg, &prof_info->count);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "get scene count failed");
+		return ret;
+	}
+
+	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
+					prof_info->count * sizeof(struct aw_prof_desc),
+					GFP_KERNEL);
+	if (!prof_info->prof_desc)
+		return -ENOMEM;
+
+	ret = aw_dev_parse_by_hdr_v_1_0_0_0(aw_dev, cfg_hdr);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, " failed");
+		return ret;
+	}
+
+	ret = aw_dev_create_prof_name_list_v_1_0_0_0(aw_dev);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "create prof name list failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg)
+{
+	struct aw_cfg_hdr *cfg_hdr = NULL;
+	int ret;
+
+	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	switch (cfg_hdr->a_hdr_version) {
+	case AW_CFG_HDR_VER_0_0_0_1:
+		ret = aw_dev_load_cfg_by_hdr(aw_dev, cfg_hdr);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
+						cfg_hdr->a_hdr_version);
+			return ret;
+		}
+		break;
+	case AW_CFG_HDR_VER_1_0_0_0:
+		ret = aw_dev_load_cfg_by_hdr_v_1_0_0_0(aw_dev, aw_cfg);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
+						cfg_hdr->a_hdr_version);
+			return ret;
+		}
+		break;
+	default:
+		pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
+		return -EINVAL;
+	}
+
+	aw_dev->fw_status = AW_DEV_FW_OK;
+	return 0;
+}
+
+static uint8_t aw_dev_crc8_check(unsigned char *data, uint32_t data_size)
+{
+	uint8_t crc_value = 0x00;
+	uint8_t pdatabuf = 0;
+	int i;
+
+	while (data_size--) {
+		pdatabuf = *data++;
+		for (i = 0; i < 8; i++) {
+			/*if the lowest bit is 1*/
+			if ((crc_value ^ (pdatabuf)) & 0x01) {
+				/*Xor multinomial*/
+				crc_value ^= 0x18;
+				crc_value >>= 1;
+				crc_value |= 0x80;
+			} else {
+				crc_value >>= 1;
+			}
+			pdatabuf >>= 1;
+		}
+	}
+	return crc_value;
+}
+
+static int aw_dev_check_cfg_by_hdr(struct aw_container *aw_cfg)
+{
+	struct aw_cfg_hdr *cfg_hdr = NULL;
+	struct aw_cfg_dde *cfg_dde = NULL;
+	unsigned int end_data_offset = 0;
+	unsigned int act_data = 0;
+	unsigned int hdr_ddt_len = 0;
+	uint8_t act_crc8 = 0;
+	int i;
+
+	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+
+	/*check file type id is awinic acf file*/
+	if (cfg_hdr->a_id != ACF_FILE_ID) {
+		pr_err("not acf type file");
+		return -EINVAL;
+	}
+
+	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
+	if (hdr_ddt_len > aw_cfg->len) {
+		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
+		cfg_hdr->a_hdr_offset, aw_cfg->len);
+		return -EINVAL;
+	}
+
+	/*check data size*/
+	cfg_dde = (struct aw_cfg_dde *)((char *)aw_cfg->data + cfg_hdr->a_hdr_offset);
+	act_data += hdr_ddt_len;
+	for (i = 0; i < cfg_hdr->a_ddt_num; i++)
+		act_data += cfg_dde[i].data_size;
+
+	if (act_data != aw_cfg->len) {
+		pr_err("act_data[%d] not equal to file size[%d]!",
+			act_data, aw_cfg->len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
+		/* data check */
+		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
+		if (end_data_offset > aw_cfg->len) {
+			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
+				i, end_data_offset, aw_cfg->len);
+			return -EINVAL;
+		}
+
+		/* crc check */
+		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
+									cfg_dde[i].data_size);
+		if (act_crc8 != cfg_dde[i].data_crc) {
+			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
+				i, (uint32_t)act_crc8, cfg_dde[i].data_crc);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int aw_dev_check_acf_by_hdr_v_1_0_0_0(struct aw_container *aw_cfg)
+{
+	struct aw_cfg_hdr *cfg_hdr = NULL;
+	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde = NULL;
+	unsigned int end_data_offset = 0;
+	unsigned int act_data = 0;
+	unsigned int hdr_ddt_len = 0;
+	uint8_t act_crc8 = 0;
+	int i;
+
+	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+
+	/*check file type id is awinic acf file*/
+	if (cfg_hdr->a_id != ACF_FILE_ID) {
+		pr_err("not acf type file");
+		return -EINVAL;
+	}
+
+	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
+	if (hdr_ddt_len > aw_cfg->len) {
+		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
+		cfg_hdr->a_hdr_offset, aw_cfg->len);
+		return -EINVAL;
+	}
+
+	/*check data size*/
+	cfg_dde = (struct aw_cfg_dde_v_1_0_0_0 *)((char *)aw_cfg->data + cfg_hdr->a_hdr_offset);
+	act_data += hdr_ddt_len;
+	for (i = 0; i < cfg_hdr->a_ddt_num; i++)
+		act_data += cfg_dde[i].data_size;
+
+	if (act_data != aw_cfg->len) {
+		pr_err("act_data[%d] not equal to file size[%d]!",
+			act_data, aw_cfg->len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
+		/* data check */
+		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
+		if (end_data_offset > aw_cfg->len) {
+			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
+				i, end_data_offset, aw_cfg->len);
+			return -EINVAL;
+		}
+
+		/* crc check */
+		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
+							cfg_dde[i].data_size);
+		if (act_crc8 != cfg_dde[i].data_crc) {
+			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
+				i, (uint32_t)act_crc8, cfg_dde[i].data_crc);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+
+}
+
+int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg)
+{
+	struct aw_cfg_hdr *cfg_hdr = NULL;
+
+	if (!aw_cfg) {
+		pr_err("aw_prof is NULL");
+		return -ENOMEM;
+	}
+
+	if (aw_cfg->len < sizeof(struct aw_cfg_hdr)) {
+		pr_err("cfg hdr size[%d] overflow file size[%d]",
+			aw_cfg->len, (int)sizeof(struct aw_cfg_hdr));
+		return -EINVAL;
+	}
+
+	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
+	switch (cfg_hdr->a_hdr_version) {
+	case AW_CFG_HDR_VER_0_0_0_1:
+		return aw_dev_check_cfg_by_hdr(aw_cfg);
+	case AW_CFG_HDR_VER_1_0_0_0:
+		return aw_dev_check_acf_by_hdr_v_1_0_0_0(aw_cfg);
+	default:
+		pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int aw883xx_dev_get_profile_count(struct aw_device *aw_dev)
+{
+	if (!aw_dev) {
+		pr_err("aw_dev is NULL");
+		return -ENOMEM;
+	}
+
+	return aw_dev->prof_info.count;
+}
+
+int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index)
+{
+	if ((index >= aw_dev->prof_info.count) || (index < 0))
+		return -EINVAL;
+	else
+		return 0;
+}
+
+int aw883xx_dev_get_profile_index(struct aw_device *aw_dev)
+{
+	return aw_dev->set_prof;
+}
+
+int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index)
+{
+	struct aw_prof_desc *prof_desc = NULL;
+
+	if ((index < aw_dev->prof_info.count) && (index >= 0)) {
+		aw_dev->set_prof = index;
+		prof_desc = &aw_dev->prof_info.prof_desc[index];
+
+		dev_dbg(aw_dev->dev, "set prof[%s]",
+			aw_dev->prof_info.prof_name_list[prof_desc->id]);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index)
+{
+	struct aw_prof_desc *prof_desc = NULL;
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+
+	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
+		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
+			index, aw_dev->prof_info.count);
+		return NULL;
+	}
+
+	prof_desc = &aw_dev->prof_info.prof_desc[index];
+
+	return prof_info->prof_name_list[prof_desc->id];
+}
+
+int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,
+			struct aw_prof_desc **prof_desc)
+{
+	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
+		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
+			__func__, index, aw_dev->prof_info.count);
+		return -EINVAL;
+	}
+
+	*prof_desc = &aw_dev->prof_info.prof_desc[index];
+
+	return 0;
+}
+
diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
new file mode 100644
index 0000000..126c41a
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#ifndef __AW883XX_BIN_PARSE_H__
+#define __AW883XX_BIN_PARSE_H__
+
+#include "aw883xx_device.h"
+
+#define NULL				((void *)0)
+#define GET_32_DATA(w, x, y, z) \
+	((unsigned int)((((uint8_t)w) << 24) | \
+	(((uint8_t)x) << 16) | (((uint8_t)y) << 8) | \
+	((uint8_t)z)))
+#define BIN_NUM_MAX			100
+#define HEADER_LEN			60
+/*
+ * header information
+ */
+enum return_enum {
+	BIN_HEADER_VER_ERR = 1,
+	BIN_DATA_TYPE_ERR = 2,
+	BIN_DATA_LEN_ERR = 3,
+	DATA_VER_ERR = 4,
+	REG_NUM_ERR = 5,
+	DSP_REG_NUM_ERR = 6,
+	SOC_APP_NUM_ERR = 7,
+	BIN_IS_NULL = 8,
+};
+
+enum bin_header_version_enum {
+	HEADER_VERSION_1_0_0 = 0x01000000,
+};
+
+enum data_type_enum {
+	DATA_TYPE_REGISTER = 0x00000000,
+	DATA_TYPE_DSP_REG = 0x00000010,
+	DATA_TYPE_DSP_CFG = 0x00000011,
+	DATA_TYPE_SOC_REG = 0x00000020,
+	DATA_TYPE_SOC_APP = 0x00000021,
+	DATA_TYPE_DSP_FW = DATA_TYPE_SOC_APP,
+	DATA_TYPE_MULTI_BINS = 0x00002000,
+};
+
+/**
+ * @DATA_VERSION_V1：default little edian
+ */
+enum data_version_enum {
+	DATA_VERSION_V1 = 0X00000001,
+	DATA_VERSION_MAX,
+};
+
+/**
+ * @header_len: Frame header length
+ * @check_sum: Frame header information-Checksum
+ * @header_ver: Frame header information-Frame header version
+ * @bin_data_type: Frame header information-Data type
+ * @bin_data_ver: Frame header information-Data version
+ * @bin_data_len: Frame header information-Data length
+ * @ui_ver: Frame header information-ui version
+ * @chip_type[8]: Frame header information-chip type
+ * @reg_byte_len: Frame header information-reg byte len
+ * @data_byte_len: Frame header information-data byte len
+ * @device_addr: Frame header information-device addr
+ * @valid_data_len: Length of valid data obtained after parsing
+ * @valid_data_addr: The offset address of the valid data obtained
+ *                   after parsing relative to info
+ * @reg_num: The number of registers obtained after parsing
+ * @reg_data_byte_len: The byte length of the register obtained after parsing
+ * @download_addr: The starting address or download address obtained
+ *                 after parsing
+ * @app_version: The software version number obtained after parsing
+ */
+struct bin_header_info {
+	unsigned int header_len;
+	unsigned int check_sum;
+	unsigned int header_ver;
+	unsigned int bin_data_type;
+	unsigned int bin_data_ver;
+	unsigned int bin_data_len;
+	unsigned int ui_ver;
+	unsigned char chip_type[8];
+	unsigned int reg_byte_len;
+	unsigned int data_byte_len;
+	unsigned int device_addr;
+	unsigned int valid_data_len;
+	unsigned int valid_data_addr;
+
+	unsigned int reg_num;
+	unsigned int reg_data_byte_len;
+	unsigned int download_addr;
+	unsigned int app_version;
+};
+
+/*
+ * function define
+ *
+ */
+/*
+ * @len: The size of the bin file obtained from the firmware
+ * @data[]: Store the bin file obtained from the firmware
+ */
+struct bin_container {
+	unsigned int len;
+	unsigned char data[];
+};
+
+/**
+ * @p_addr: Offset pointer (backward offset pointer to obtain frame header
+ *          information and important information)
+ * @all_bin_parse_num: The number of all bin files
+ * @multi_bin_parse_num: The number of single bin files
+ * @single_bin_parse_num: The number of multiple bin files
+ * @header_info[BIN_NUM_MAX]: Frame header information and other important data
+ *                            obtained after parsing
+ * @info: Obtained bin file data that needs to be parsed
+ */
+struct aw_bin {
+	unsigned char *p_addr;
+	unsigned int all_bin_parse_num;
+	unsigned int multi_bin_parse_num;
+	unsigned int single_bin_parse_num;
+	struct bin_header_info header_info[BIN_NUM_MAX];
+	struct bin_container info;
+};
+
+/*******************awinic audio parse acf***********************/
+int aw883xx_dev_dsp_data_order(struct aw_device *aw_dev,
+				uint8_t *data, uint32_t data_len);
+int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,
+			struct aw_prof_desc **prof_desc);
+char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index);
+int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index);
+int aw883xx_dev_get_profile_index(struct aw_device *aw_dev);
+int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index);
+int aw883xx_dev_get_profile_count(struct aw_device *aw_dev);
+int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg);
+int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg);
+
+#endif
-- 
2.7.4

