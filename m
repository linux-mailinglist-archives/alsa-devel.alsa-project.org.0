Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4B3580A7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 12:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB69167B;
	Thu,  8 Apr 2021 12:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB69167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617878023;
	bh=XcFO8EjhKP7bh6TKJApN/EydKDSzrPgxuqvf683pv48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AkYlMaUGi/5fCaxX9y/bwLZpkosg13fdO9UhBFNTzE0M0Ro9th7efZTM7kEObEtUE
	 npR9ZaNzj3vz6Zi0oUjw6UYLVpQD+IO9/P7IMBNerAQ47N5pGhV8OpzDkD9Ce9a8hZ
	 XuklZ26L4kZI3dfDlnQaq0qzccHP8dH1mhKsVdj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61EBF80246;
	Thu,  8 Apr 2021 12:32:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B12DEF8020B; Thu,  8 Apr 2021 12:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 993B2F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 12:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993B2F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="j4E9B4Ov"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GKLAT8Yq"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 81B135C015E;
 Thu,  8 Apr 2021 06:31:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 08 Apr 2021 06:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=L0ifWzEWl8ZlGuUUZYoiVuYdoZ
 TeXLntX3BMrtp3NnM=; b=j4E9B4Ov+ACpOWIRo5/byEpWbXKAiiO1SYcoQoz2iL
 eJt9iuLbtfFCWWLkSgPOlu5hsWAXxJuuiouPFLg47B0m4RWjDCSg8SK1sigqFXVg
 BAxsMFBM6hYA4NbY2ptE9sPsKGB1VdF/B0vvA6d5nZmelEk1Ao5FepqGBGwjGmpX
 8qUKA24Hb30g6R0kWo1KRBIsmEaMe1AFN07SjJpzuqmx4aVjAHY56aAnDnPlmJzv
 Zi/zYt5gQdD12k7/dv3/3M+2/85rjErAKzz2Cpv4o2yefmYJgDRq0WSSVUOW3l0N
 s9cKHKYu5+IBT35toyBw4YgSoiXVrjFGRorX18F67zLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=L0ifWzEWl8ZlGuUUZ
 YoiVuYdoZTeXLntX3BMrtp3NnM=; b=GKLAT8YqE72P0RrL2In7VKNUu0A4jJlQs
 UeZgjBCDbpF+MvqmI9NCh6gjRlbrHT7/kSMDSFjsWH0FzZ1BqJAYW7lmxq+BsOQX
 182JmEf1j5qqvUFtUzsABL0Go9iSUoi3Y0bCF/K2qTgKGlnzkHDbtnMOhSROF0g1
 WlaAfTqNDd5mGY02Zs8OuvJLDV4Bp6dOfIcn4l6kQQhjHTH1mcAopbB4tr+BW5eP
 1jW/2F8nLIT5TsLGBnXLw+irCQwcCJx2EyYOaPtlRVWKDSnW/yJW2q8ETkRNkR97
 gBOPH1a8M0k4JIf5vnzkMvI6xrdMDK+ZAvmY/UZR2mtdvnJ7j+zMw==
X-ME-Sender: <xms:mdtuYEiW1wdkBlpnGJ0kysnuUnJsX8wcnWikdyS40P9DfcJtO9_jCA>
 <xme:mdtuYGpfxN03_QkP-Or6edwGKbuHfVc2nZ6AzSpHdLGmKDpkGzhm3mOsg2mVbhfW2
 _CuoqWy4SIL1zeN15w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:mdtuYMHT321mGnzbCYfMCIAztvTIAsNGAXa_9mgJCp4xQoslMg4sEQ>
 <xmx:mdtuYImX9qjEh3EbolEOkVMTrLZWZNT5XG9TjyjBZHI5eSucqrNIjw>
 <xmx:mdtuYPkeOubCJttQsA0bzyrdGyBOiUFfSMGZN4h43S8mW7ZkAw8QUA>
 <xmx:mttuYEx-90mez3VzaYbmtUOg7PoM0kGLLYWaVqmvU81diy97kJtclA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1947224005A;
 Thu,  8 Apr 2021 06:31:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
Date: Thu,  8 Apr 2021 19:31:49 +0900
Message-Id: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

ALSA control interface allows users to add arbitrary control elements
(called "user controls" or "user elements"), and its resource usage is
limited just by the max number of control sets (currently 32).  This
limit, however, is quite loose: each allocation of control set may
have 1028 elements, and each element may have up to 512 bytes (ILP32) or
1024 bytes (LP64) of value data. Moreover, each control set may contain
the enum strings and TLV data, which can be up to 64kB and 128kB,
respectively.  Totally, the whole memory consumption may go over 38MB --
it's quite large, and we'd rather like to reduce the size.

OTOH, there have been other requests even to increase the max number
of user elements; e.g. ALSA firewire stack require the more user
controls, hence we want to raise the bar, too.

For satisfying both requirements, this patch changes the management of
user controls: instead of setting the upper limit of the number of
user controls, we check the actual memory allocation size and set the
upper limit of the total allocation in bytes.  As long as the memory
consumption stays below the limit, more user controls are allowed than
the current limit 32. At the same time, we set the lower limit (8MB)
as default than the current theoretical limit, in order to lower the
risk of DoS.

As a compromise for lowering the default limit, now the actual memory
limit is defined as a module option, 'max_user_ctl_alloc_size', so that
user can increase/decrease the limit if really needed, too.

Co-developed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
v1->v2: Drop alloc_size field from user_element, calculate at private_free
v2->v3: Rebase. Fix boundary error. Obsolete macro usage relying on modern
        compiler optimization. Change comment style by modern coding
        convention. Rename module parameter so that users get it easily.
        Patch comment improvements.
---
 include/sound/core.h |  2 +-
 sound/core/control.c | 75 ++++++++++++++++++++++++++++++--------------
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 2e24f194ef70..1f9aef0adbc9 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -100,7 +100,7 @@ struct snd_card {
 	struct rw_semaphore controls_rwsem;	/* controls list lock */
 	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
 	int controls_count;		/* count of all controls */
-	int user_ctl_count;		/* count of all user controls */
+	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 20d707d4ef40..a076c08c21b6 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -7,6 +7,7 @@
 #include <linux/threads.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/time.h>
@@ -18,8 +19,11 @@
 #include <sound/info.h>
 #include <sound/control.h>
 
-/* max number of user-defined controls */
-#define MAX_USER_CONTROLS	32
+// Max allocation size for user controls.
+static int max_user_ctl_alloc_size = 8 * 1024 * 1024;
+module_param_named(max_user_ctl_alloc_size, max_user_ctl_alloc_size, int, 0444);
+MODULE_PARM_DESC(max_user_ctl_alloc_size, "Max allocation size for user controls");
+
 #define MAX_CONTROL_COUNT	1028
 
 struct snd_kctl_ioctl {
@@ -561,9 +565,6 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 			goto error;
 		}
 	ret = snd_ctl_remove(card, kctl);
-	if (ret < 0)
-		goto error;
-	card->user_ctl_count--;
 error:
 	up_write(&card->controls_rwsem);
 	return ret;
@@ -1265,6 +1266,12 @@ struct user_element {
 	void *priv_data;		/* private data (like strings for enumerated type) */
 };
 
+// check whether the addition (in bytes) of user ctl element may overflow the limit.
+static bool check_user_elem_overflow(struct snd_card *card, ssize_t add)
+{
+	return (ssize_t)card->user_ctl_alloc_size + add > max_user_ctl_alloc_size;
+}
+
 static int snd_ctl_elem_user_info(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_info *uinfo)
 {
@@ -1342,6 +1349,10 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	if (size > 1024 * 128)	/* sane value */
 		return -EINVAL;
 
+	// does the TLV size change cause overflow?
+	if (check_user_elem_overflow(ue->card, (ssize_t)(size - ue->tlv_data_size)))
+		return -ENOMEM;
+
 	container = vmemdup_user(buf, size);
 	if (IS_ERR(container))
 		return PTR_ERR(container);
@@ -1359,11 +1370,16 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 		for (i = 0; i < kctl->count; ++i)
 			kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
 		mask = SNDRV_CTL_EVENT_MASK_INFO;
+	} else {
+		ue->card->user_ctl_alloc_size -= ue->tlv_data_size;
+		ue->tlv_data_size = 0;
+		kvfree(ue->tlv_data);
 	}
 
-	kvfree(ue->tlv_data);
 	ue->tlv_data = container;
 	ue->tlv_data_size = size;
+	// decremented at private_free.
+	ue->card->user_ctl_alloc_size += size;
 
 	mask |= SNDRV_CTL_EVENT_MASK_TLV;
 	for (i = 0; i < kctl->count; ++i)
@@ -1405,16 +1421,17 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	unsigned int i;
 	const uintptr_t user_ptrval = ue->info.value.enumerated.names_ptr;
 
-	if (ue->info.value.enumerated.names_length > 64 * 1024)
+	buf_len = ue->info.value.enumerated.names_length;
+	if (buf_len > 64 * 1024)
 		return -EINVAL;
 
-	names = vmemdup_user((const void __user *)user_ptrval,
-		ue->info.value.enumerated.names_length);
+	if (check_user_elem_overflow(ue->card, buf_len))
+		return -ENOMEM;
+	names = vmemdup_user((const void __user *)user_ptrval, buf_len);
 	if (IS_ERR(names))
 		return PTR_ERR(names);
 
 	/* check that there are enough valid names */
-	buf_len = ue->info.value.enumerated.names_length;
 	p = names;
 	for (i = 0; i < ue->info.value.enumerated.items; ++i) {
 		name_len = strnlen(p, buf_len);
@@ -1428,14 +1445,27 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 
 	ue->priv_data = names;
 	ue->info.value.enumerated.names_ptr = 0;
+	// increment the allocation size; decremented again at private_free.
+	ue->card->user_ctl_alloc_size += ue->info.value.enumerated.names_length;
 
 	return 0;
 }
 
+static size_t compute_user_elem_size(size_t size, unsigned int count)
+{
+	return sizeof(struct user_element) + size * count;
+}
+
 static void snd_ctl_elem_user_free(struct snd_kcontrol *kcontrol)
 {
 	struct user_element *ue = kcontrol->private_data;
 
+	// decrement the allocation size.
+	ue->card->user_ctl_alloc_size -= compute_user_elem_size(ue->elem_data_size, kcontrol->count);
+	ue->card->user_ctl_alloc_size -= ue->tlv_data_size;
+	if (ue->priv_data)
+		ue->card->user_ctl_alloc_size -= ue->info.value.enumerated.names_length;
+
 	kvfree(ue->tlv_data);
 	kvfree(ue->priv_data);
 	kfree(ue);
@@ -1449,6 +1479,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	unsigned int count;
 	unsigned int access;
 	long private_size;
+	size_t alloc_size;
 	struct user_element *ue;
 	unsigned int offset;
 	int err;
@@ -1466,13 +1497,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 			return err;
 	}
 
-	/*
-	 * The number of userspace controls are counted control by control,
-	 * not element by element.
-	 */
-	if (card->user_ctl_count + 1 > MAX_USER_CONTROLS)
-		return -ENOMEM;
-
 	/* Check the number of elements for this userspace control. */
 	count = info->owner;
 	if (count == 0)
@@ -1503,6 +1527,10 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	if (info->count < 1)
 		return -EINVAL;
 	private_size = value_sizes[info->type] * info->count;
+	alloc_size = compute_user_elem_size(private_size, count);
+
+	if (check_user_elem_overflow(card, alloc_size))
+		return -ENOMEM;
 
 	/*
 	 * Keep memory object for this userspace control. After passing this
@@ -1514,16 +1542,18 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	if (err < 0)
 		return err;
 	memcpy(&kctl->id, &info->id, sizeof(kctl->id));
-	kctl->private_data = kzalloc(sizeof(struct user_element) + private_size * count,
-				     GFP_KERNEL);
-	if (kctl->private_data == NULL) {
+	ue = kzalloc(alloc_size, GFP_KERNEL);
+	if (!ue) {
 		kfree(kctl);
 		return -ENOMEM;
 	}
+	kctl->private_data = ue;
 	kctl->private_free = snd_ctl_elem_user_free;
 
+	// increment the allocated size; decremented again at private_free.
+	card->user_ctl_alloc_size += alloc_size;
+
 	/* Set private data for this userspace control. */
-	ue = (struct user_element *)kctl->private_data;
 	ue->card = card;
 	ue->info = *info;
 	ue->info.access = 0;
@@ -1565,9 +1595,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	 * applications because the field originally means PID of a process
 	 * which locks the element.
 	 */
-
-	card->user_ctl_count++;
-
  unlock:
 	up_write(&card->controls_rwsem);
 	return err;
-- 
2.27.0

