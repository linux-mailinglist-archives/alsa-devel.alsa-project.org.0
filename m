Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FE12F58B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:35:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668DE175E;
	Fri,  3 Jan 2020 09:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668DE175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040551;
	bh=7qDUJqWUGIh/L5ANwDEvjKBrnGLWNONlD+9DDIEi8cs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLp+PRXxU9dETG0AhnkL0ZBjJPmycYIjPZHcV8vkuHZPYDiA5ywOLYLJlc+8BvR6I
	 WNvQ++vieqVF5yhcCBfhm8MFq9NQWkFhZ5MDyVvcfUlYllOMAPS+Js4kZCD2Me+o9h
	 5r9yAPucFMtGV0xG3Mg3B7JhDOj2cXdBSvj6mDTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6123F803CD;
	Fri,  3 Jan 2020 09:18:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E69C0F8034F; Fri,  3 Jan 2020 09:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7922DF80292
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7922DF80292
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F397CB270
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:44 +0100
Message-Id: <20200103081714.9560-29-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 28/58] ALSA: info: Make snd_info_entry_ops as
	const
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

The reference to snd_info_entry_ops is rather read-only, so declare it
as a const pointer.  This allows a bit more optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 2 +-
 include/sound/info.h                                      | 2 +-
 sound/drivers/opl4/opl4_proc.c                            | 2 +-
 sound/isa/gus/gus_mem_proc.c                              | 2 +-
 sound/pci/cs4281.c                                        | 4 ++--
 sound/pci/cs46xx/cs46xx_lib.c                             | 2 +-
 sound/pci/emu10k1/emuproc.c                               | 2 +-
 sound/pci/mixart/mixart.c                                 | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 7b1ba1e447b9..8204e3b6fea6 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3912,7 +3912,7 @@ For a raw-data proc-file, set the attributes as follows:
 
 ::
 
-  static struct snd_info_entry_ops my_file_io_ops = {
+  static const struct snd_info_entry_ops my_file_io_ops = {
           .read = my_file_io_read,
   };
 
diff --git a/include/sound/info.h b/include/sound/info.h
index b01a22913400..7c13bf52cc81 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -64,7 +64,7 @@ struct snd_info_entry {
 	unsigned short content;
 	union {
 		struct snd_info_entry_text text;
-		struct snd_info_entry_ops *ops;
+		const struct snd_info_entry_ops *ops;
 	} c;
 	struct snd_info_entry *parent;
 	struct module *module;
diff --git a/sound/drivers/opl4/opl4_proc.c b/sound/drivers/opl4/opl4_proc.c
index e0516e532969..f2149091e10a 100644
--- a/sound/drivers/opl4/opl4_proc.c
+++ b/sound/drivers/opl4/opl4_proc.c
@@ -76,7 +76,7 @@ static ssize_t snd_opl4_mem_proc_write(struct snd_info_entry *entry,
 	return count;
 }
 
-static struct snd_info_entry_ops snd_opl4_mem_proc_ops = {
+static const struct snd_info_entry_ops snd_opl4_mem_proc_ops = {
 	.open = snd_opl4_mem_proc_open,
 	.release = snd_opl4_mem_proc_release,
 	.read = snd_opl4_mem_proc_read,
diff --git a/sound/isa/gus/gus_mem_proc.c b/sound/isa/gus/gus_mem_proc.c
index 54510e2d78c2..b5e1d1649500 100644
--- a/sound/isa/gus/gus_mem_proc.c
+++ b/sound/isa/gus/gus_mem_proc.c
@@ -37,7 +37,7 @@ static void snd_gf1_mem_proc_free(struct snd_info_entry *entry)
 	kfree(priv);
 }
 
-static struct snd_info_entry_ops snd_gf1_mem_proc_ops = {
+static const struct snd_info_entry_ops snd_gf1_mem_proc_ops = {
 	.read = snd_gf1_mem_proc_dump,
 };
 
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 8fd64dab372d..dc89ef906c9b 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1129,11 +1129,11 @@ static ssize_t snd_cs4281_BA1_read(struct snd_info_entry *entry,
 	return count;
 }
 
-static struct snd_info_entry_ops snd_cs4281_proc_ops_BA0 = {
+static const struct snd_info_entry_ops snd_cs4281_proc_ops_BA0 = {
 	.read = snd_cs4281_BA0_read,
 };
 
-static struct snd_info_entry_ops snd_cs4281_proc_ops_BA1 = {
+static const struct snd_info_entry_ops snd_cs4281_proc_ops_BA1 = {
 	.read = snd_cs4281_BA1_read,
 };
 
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 3f2fe26efee3..5bb84303f577 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -2815,7 +2815,7 @@ static ssize_t snd_cs46xx_io_read(struct snd_info_entry *entry,
 	return count;
 }
 
-static struct snd_info_entry_ops snd_cs46xx_proc_io_ops = {
+static const struct snd_info_entry_ops snd_cs46xx_proc_io_ops = {
 	.read = snd_cs46xx_io_read,
 };
 
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index d32f256af809..637446f19598 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -545,7 +545,7 @@ static void snd_emu_proc_ptr_reg_read20c(struct snd_info_entry *entry,
 }
 #endif
 
-static struct snd_info_entry_ops snd_emu10k1_proc_ops_fx8010 = {
+static const struct snd_info_entry_ops snd_emu10k1_proc_ops_fx8010 = {
 	.read = snd_emu10k1_fx8010_read,
 };
 
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 44009c555322..7ba487443c7f 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -1153,11 +1153,11 @@ static ssize_t snd_mixart_BA1_read(struct snd_info_entry *entry,
 	return count;
 }
 
-static struct snd_info_entry_ops snd_mixart_proc_ops_BA0 = {
+static const struct snd_info_entry_ops snd_mixart_proc_ops_BA0 = {
 	.read   = snd_mixart_BA0_read,
 };
 
-static struct snd_info_entry_ops snd_mixart_proc_ops_BA1 = {
+static const struct snd_info_entry_ops snd_mixart_proc_ops_BA1 = {
 	.read   = snd_mixart_BA1_read,
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
