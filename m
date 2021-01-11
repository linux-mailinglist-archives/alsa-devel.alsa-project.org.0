Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 499492F1377
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 14:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27991673;
	Mon, 11 Jan 2021 14:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27991673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610370596;
	bh=+dibvLjG/t86k9Ok5jx8DQ74FuIXiGufsywSjqXjrro=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n05jwdfpFtGf1CvJMXwCTZ0SjHuBaHczKhkwF/CqNeT9uCYXkIyirnwN/wzwipyI0
	 SebnZY1JFdmXgq1hH2/SpOjuM1toq8PrR9IY3aCgYZMLasslzFnsGv0t+BUvSofBKy
	 /j/144cXylXR5rT30tmTIE/b7gtvu0fwT3Dz+AEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E74B0F804E0;
	Mon, 11 Jan 2021 14:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A61F804C2; Mon, 11 Jan 2021 14:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09748F804C2
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 14:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09748F804C2
Received: from [123.114.32.120] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kywuE-0001Ym-AA; Mon, 11 Jan 2021 13:06:51 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v4 3/4] alsa: jack: add more jack_kctl debugfs nodes
Date: Mon, 11 Jan 2021 21:05:56 +0800
Message-Id: <20210111130557.90208-4-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111130557.90208-1-hui.wang@canonical.com>
References: <20210111130557.90208-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Adding 4 more debugfs nodes, users could get more information about
the jack_kctl from them:
 - kctl_id, read-only, get jack_kctl->kctl's id
   sound/card0/HeadphoneJack# cat kctl_id
   Headphone Jack

 - mask_bits, read-only, get jack_kctl's events mask_bits
   sound/card0/HeadphoneJack# cat mask_bits
   0x0001 HEADPHONE(0x0001)

 - status, read-only, get jack_kctl's current status
   headphone unplugged:
   sound/card0/HeadphoneJack# cat status
   0x0000
   headphone plugged:
   sound/card0/HeadphoneJack# cat status
   0x0001 HEADPHONE(0x0001)

 - type, read-only, get jack's supported events type
   sound/card0/HeadphoneJack# cat type
   0x0001 HEADPHONE(0x0001)

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/core/jack.c | 144 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index e1d1b26f3a5e..fc49dae887f8 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -230,6 +230,119 @@ static ssize_t jackin_inject_write(struct file *file,
 	return ret;
 }
 
+static ssize_t jack_kctl_id_read(struct file *file,
+				 char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int len, ret;
+
+	buf = kvzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = scnprintf(buf, PAGE_SIZE, "%s\n", jack_kctl->kctl->id.name);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	kvfree(buf);
+	return ret;
+}
+
+/* the bit definition is aligned with snd_jack_types in jack.h */
+static const char * const jack_events_name[] = {
+	"HEADPHONE(0x0001)", "MICROPHONE(0x0002)", "LINEOUT(0x0004)",
+	"MECHANICAL(0x0008)", "VIDEOOUT(0x0010)", "LINEIN(0x0020)",
+	"", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)", "BTN_3(0x0800)",
+	"BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)", "",
+};
+
+static int parse_mask_bits(unsigned int mask_bits, char *s)
+{
+	char *buf;
+	int len, i;
+
+	buf = kvzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = scnprintf(buf, PAGE_SIZE, "0x%04x", mask_bits);
+
+	for (i = 0; i < 16; i++)
+		if (mask_bits & (1 << i))
+			len += scnprintf(buf + strlen(buf), PAGE_SIZE - strlen(buf),
+					 " %s", jack_events_name[i]);
+
+	len += scnprintf(buf + strlen(buf), PAGE_SIZE - strlen(buf), "\n");
+
+	strcpy(s, buf);
+
+	kvfree(buf);
+
+	return len;
+}
+
+static ssize_t jack_kctl_mask_bits_read(struct file *file,
+					char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int len, ret;
+
+	buf = kvzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = parse_mask_bits(jack_kctl->mask_bits, buf);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	kvfree(buf);
+	return ret;
+}
+
+static ssize_t jack_kctl_status_read(struct file *file,
+				     char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int len, ret;
+
+	buf = kvzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = parse_mask_bits(jack_kctl->kctl->private_value, buf);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	kvfree(buf);
+	return ret;
+}
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+static ssize_t jack_type_read(struct file *file,
+			      char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int len, ret;
+
+	buf = kvzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = parse_mask_bits(jack_kctl->jack->type, buf);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	kvfree(buf);
+	return ret;
+}
+
+static const struct file_operations jack_type_fops = {
+	.open = simple_open,
+	.read = jack_type_read,
+	.llseek = default_llseek,
+};
+#endif
+
 static const struct file_operations sw_inject_enable_fops = {
 	.open = simple_open,
 	.read = sw_inject_enable_read,
@@ -243,6 +356,24 @@ static const struct file_operations jackin_inject_fops = {
 	.llseek = default_llseek,
 };
 
+static const struct file_operations jack_kctl_id_fops = {
+	.open = simple_open,
+	.read = jack_kctl_id_read,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations jack_kctl_mask_bits_fops = {
+	.open = simple_open,
+	.read = jack_kctl_mask_bits_read,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations jack_kctl_status_fops = {
+	.open = simple_open,
+	.read = jack_kctl_status_read,
+	.llseek = default_llseek,
+};
+
 /* The substrings in the jack's name but not suitable for folder's name */
 static const char * const dropped_chars[] = {
 	"/", "=", ",", " ",
@@ -282,6 +413,19 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	debugfs_create_file("jackin_inject", 0200, jack_kctl->jack_debugfs_root, jack_kctl,
 			    &jackin_inject_fops);
 
+	debugfs_create_file("kctl_id", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_id_fops);
+
+	debugfs_create_file("mask_bits", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_mask_bits_fops);
+
+	debugfs_create_file("status", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_status_fops);
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+	debugfs_create_file("type", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_type_fops);
+#endif
 	return 0;
 }
 #else /* CONFIG_DEBUG_FS */
-- 
2.25.1

