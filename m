Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D243C809571
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:34:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B15207;
	Thu,  7 Dec 2023 23:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B15207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988476;
	bh=Lq06mwNMjDgFe0DyRT6KiZkNWm7P+g8lzpc3H+kqz6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h/u0akhsXL9Bwe8Hm1Jnz5j9xi46DQvj7E+xtL2YRl1/pXpVL1KXjoyvpzQSws/Qj
	 H3Nq0uEp+RuKiIkzkK+1DWRJdQQAhgwoOgQwSigKdvyuclOCqNoBdmCqhLXrHsL+V1
	 FmjkOs207FKrln6qcxQiil3dr6sJrzzrZzjz3DL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44995F80743; Thu,  7 Dec 2023 23:31:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F27DF8074C;
	Thu,  7 Dec 2023 23:31:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89C6F805EF; Thu,  7 Dec 2023 23:31:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA2F3F80564
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2F3F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ECvQk0g7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988228; x=1733524228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lq06mwNMjDgFe0DyRT6KiZkNWm7P+g8lzpc3H+kqz6U=;
  b=ECvQk0g7mCkgC4X6ykqyaaSacqAqP+2s54V3q41Er0zkov/gO8XWUN3V
   a6CQxLc3TIJ8wldvPUiFwtO6WvlvWy6ktBPMbrU/g0uyTegc4XU3L7ZYC
   reAfYHFHeQvwmGJKl5SOK7YF21inP+muWigK7oDL1ENd97DU3UtVZrzVV
   ZveCfxMNdDhgu5uAjKSlZ2qhkAla/5+ZLOY+QK11iiYlaT8yMmV3FaSko
   PVVK+6OIm1Vd8o+DV1wWIhTST5yPMAV/6lRKc9bO6fFENPX+Ydh/LGRIU
   uvUWfjGy8joljepL5tXf5fCNIgt29ncaAsVchU6EgclZ2d00V0AbHhGad
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516705"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307517"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307517"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 15/16] soundwire: debugfs: add interface for BPT/BRA
 transfers
Date: Thu,  7 Dec 2023 16:29:43 -0600
Message-Id: <20231207222944.663893-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I33OQF3Q4TXA443WZTH54VUEYHCANRUH
X-Message-ID-Hash: I33OQF3Q4TXA443WZTH54VUEYHCANRUH
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I33OQF3Q4TXA443WZTH54VUEYHCANRUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add code to show what codec drivers will need to do to enable BPT/BRA
transfers. The only difference is to set the 'command_type' file to
1. A zero-value will rely on regular read/write commands in Column0.

For now the code will only return error codes since the Manager side
is not enabled yet.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/debugfs.c | 122 +++++++++++++++++++++++++++++++-----
 1 file changed, 106 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 6d253d69871d..de35f5beec4d 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -138,9 +138,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(sdw_slave_reg);
 
-#define MAX_CMD_BYTES 256
+#define MAX_CMD_BYTES (1024 * 1024)
 
 static int cmd;
+static int cmd_type;
 static u32 start_addr;
 static size_t num_bytes;
 static u8 read_buffer[MAX_CMD_BYTES];
@@ -164,6 +165,25 @@ static int set_command(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(set_command_fops, NULL,
 			 set_command, "%llu\n");
 
+static int set_command_type(void *data, u64 value)
+{
+	struct sdw_slave *slave = data;
+
+	if (value > 1)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	dev_dbg(&slave->dev, "command type: %s\n", value ? "BRA" : "Column0");
+
+	cmd_type = value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(set_command_type_fops, NULL,
+			 set_command_type, "%llu\n");
+
 static int set_start_address(void *data, u64 value)
 {
 	struct sdw_slave *slave = data;
@@ -199,9 +219,64 @@ static int set_num_bytes(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(set_num_bytes_fops, NULL,
 			 set_num_bytes, "%llu\n");
 
+static int do_bpt_sequence(struct sdw_slave *slave, bool write,
+			   u8 *buffer)
+{
+	struct sdw_bpt_msg msg = {0};
+	int ret1;
+	int ret;
+
+	msg.addr = start_addr;
+	msg.len = num_bytes;
+	msg.dev_num = slave->dev_num;
+	if (write)
+		msg.flags = SDW_MSG_FLAG_WRITE;
+	else
+		msg.flags = SDW_MSG_FLAG_READ;
+	msg.buf = buffer;
+
+	ret = sdw_bpt_open_stream(slave->bus, slave, SDW_BRA, &msg);
+	if (ret < 0) {
+		dev_err(&slave->dev, "bpt_open_stream failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = sdw_bpt_send_async(slave->bus,
+				 slave,
+				 &msg);
+	if (ret < 0) {
+		dev_err(&slave->dev, "bpt_send_async failed: %d\n", ret);
+		goto close;
+	}
+
+	dev_dbg(&slave->dev, "send_async done\n");
+
+	ret = sdw_bpt_wait(slave->bus,
+			   slave,
+			   &msg);
+	if (ret < 0)
+		dev_err(&slave->dev, "%s: bpt_wait failed: %d\n", __func__, ret);
+
+	dev_dbg(&slave->dev, "wait done\n");
+
+close:
+	ret1 = sdw_bpt_close_stream(slave->bus, slave, SDW_BRA, &msg);
+	if (ret1 < 0) {
+		dev_err(&slave->dev, "%s: bpt_close_stream failed: %d\n",
+			__func__, ret1);
+		if (!ret)
+			ret = ret1;
+	}
+
+	return ret;
+}
+
 static int cmd_go(void *data, u64 value)
 {
+	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
+	ktime_t start_t;
+	ktime_t finish_t;
 	int ret;
 
 	if (value != 1)
@@ -218,40 +293,54 @@ static int cmd_go(void *data, u64 value)
 		return ret;
 	}
 
-	/* Userspace changed the hardware state behind the kernel's back */
-	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
-
-	dev_dbg(&slave->dev, "starting command\n");
-
 	if (cmd == 0) {
-		const struct firmware *fw;
-
 		ret = request_firmware(&fw, firmware_file, &slave->dev);
 		if (ret < 0) {
 			dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
 			goto out;
 		}
-
-		if (fw->size != num_bytes) {
+		if (fw->size < num_bytes) {
 			dev_err(&slave->dev,
-				"firmware %s: unexpected size %zd, desired %zd\n",
+				"firmware %s: firmware size %zd, desired %zd\n",
 				firmware_file, fw->size, num_bytes);
-			release_firmware(fw);
 			goto out;
 		}
+	}
 
-		ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
-		release_firmware(fw);
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	dev_dbg(&slave->dev, "starting command\n");
+	start_t = ktime_get();
+
+	if (cmd == 0) {
+		if (cmd_type) {
+			ret = do_bpt_sequence(slave, true, (u8 *)fw->data);
+		} else {
+			ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
+		}
 	} else {
-		ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
+		memset(read_buffer, 0, sizeof(read_buffer));
+
+		if (cmd_type) {
+			ret = do_bpt_sequence(slave, false, read_buffer);
+		} else {
+			ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
+		}
 	}
 
-	dev_dbg(&slave->dev, "command completed %d\n", ret);
+	finish_t = ktime_get();
 
 out:
+	if (fw)
+		release_firmware(fw);
+
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
 
+	dev_dbg(&slave->dev, "command completed, status %d, time %lld ms\n",
+		ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
+
 	return ret;
 }
 DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
@@ -293,6 +382,7 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 
 	/* interface to send arbitrary commands */
 	debugfs_create_file("command", 0200, d, slave, &set_command_fops);
+	debugfs_create_file("command_type", 0200, d, slave, &set_command_type_fops);
 	debugfs_create_file("start_address", 0200, d, slave, &set_start_address_fops);
 	debugfs_create_file("num_bytes", 0200, d, slave, &set_num_bytes_fops);
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
-- 
2.39.2

