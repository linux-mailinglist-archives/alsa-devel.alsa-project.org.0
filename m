Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC013016F
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 09:38:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99497178F;
	Sat,  4 Jan 2020 09:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99497178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578127080;
	bh=VLu0priEMQYA9fAGGRvYXiLrrUFnNNNBlhuPBCY+qOQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T4uLMFVP/fAuisSwPxGC6+s7aMhH7HlGWmdO+DxB0fJawsILEVg+KKtvkw6LL3V6K
	 r0GtnquIKiuU8FGpbVGC+r+A/dAFKay4hNBhFKAAm5eUTuYhGV30ovEDP4evNVw/Lr
	 AeXk5AhZnSEXO0R2L2E7/SAtsf8SLlgQGVFNtru8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C3EDF8014F;
	Sat,  4 Jan 2020 09:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A06AF80157; Sat,  4 Jan 2020 09:36:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,
 RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E3EAF80100
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 09:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E3EAF80100
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5312FAD18
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 08:35:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat,  4 Jan 2020 09:35:56 +0100
Message-Id: <20200104083556.27789-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: control: Add verification for kctl
	accesses
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

The current implementation of ALSA control API fully relies on the
callbacks of each driver, and there is no verification of the values
passed via API.  This patch is an attempt to improve the situation
slightly by adding the validation code for the values stored via info
and get callbacks.

The patch adds a new kconfig, CONFIG_SND_CTL_VALIDATION.  It depends
on CONFIG_SND_DEBUG and off as default since the validation would
require a slight overhead including the additional call of info
callback at each get callback invocation.

When this config is enabled, the values stored by each info callback
invocation are verified, namely:
- Whether the info type is valid
- Whether the number of enum items is non-zero
- Whether the given info count is within the allowed boundary

Similarly, the values stored at each get callback are verified as
well:
- Whether the values are within the given range
- Whether the values are aligned with the given step
- Whether any further changes are seen in the data array over the
  given info count

The last point helps identifying a possibly invalid data type access,
typically a case where the info callback declares the type being
SNDRV_CTL_ELEM_TYPE_ENUMERATED while the get/put callbacks store
the values in value.integer.value[] array.

When a validation fails, the ALSA core logs an error message including
the device and the control ID, and the API call also returns an
error.  So, with the new validation turned on, the driver behavior
difference may be visible on user-space, too -- it's intentional,
though, so that we can catch an error more clearly.

The patch also introduces a new ctl access type,
SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK.  A driver may pass this flag with
other access bits to indicate that the ctl element won't be verified.
It's useful when a driver code is specially written to access the data
greater than info->count size by some reason.  For example, this flag
is actually set now in HD-audio HDMI codec driver which needs to clear
the data array in the case of the disconnected monitor.

Also, the PCM channel-map helper code is slightly modified to avoid
the false-positive hit by this validation code, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is a resend of the previous RFC patch for merging for 5.6.

 include/sound/control.h    |  10 ++
 sound/core/Kconfig         |   9 ++
 sound/core/control.c       | 283 +++++++++++++++++++++++++++++++++++++++------
 sound/core/pcm_lib.c       |   2 +-
 sound/pci/hda/patch_hdmi.c |   3 +-
 5 files changed, 268 insertions(+), 39 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 5d7c99475684..11feeee31e35 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -22,6 +22,16 @@ typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 				    unsigned int size,
 				    unsigned int __user *tlv);
 
+/* internal flag for skipping validations */
+#ifdef CONFIG_SND_CTL_VALIDATION
+#define SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK	(1 << 27)
+#define snd_ctl_skip_validation(info) \
+	((info)->access & SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK)
+#else
+#define SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK	0
+#define snd_ctl_skip_validation(info)		true
+#endif
+
 enum {
 	SNDRV_CTL_TLV_OP_READ = 0,
 	SNDRV_CTL_TLV_OP_WRITE = 1,
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 4044c42d8595..d4554f376160 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -178,6 +178,15 @@ config SND_PCM_XRUN_DEBUG
 	  sound clicking when system is loaded, it may help to determine
 	  the process or driver which causes the scheduling gaps.
 
+config SND_CTL_VALIDATION
+	bool "Perform sanity-checks for each control element access"
+	depends on SND_DEBUG
+	help
+	  Say Y to enable the additional validation of each control element
+	  access, including sanity-checks like whether the values returned
+	  from the driver are in the proper ranges or the check of the invalid
+	  access at out-of-array areas.
+
 config SND_VMASTER
 	bool
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 63bb2fcf13be..d06033d418a8 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -11,6 +11,7 @@
 #include <linux/vmalloc.h>
 #include <linux/time.h>
 #include <linux/mm.h>
+#include <linux/math64.h>
 #include <linux/sched/signal.h>
 #include <sound/core.h>
 #include <sound/minors.h>
@@ -248,7 +249,8 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 		   SNDRV_CTL_ELEM_ACCESS_INACTIVE |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND |
-		   SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK);
+		   SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK |
+		   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK);
 
 	err = snd_ctl_new(&kctl, count, access, NULL);
 	if (err < 0)
@@ -758,21 +760,199 @@ static int snd_ctl_elem_list(struct snd_card *card,
 	return err;
 }
 
-static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
-			     struct snd_ctl_elem_info *info)
+/* Check whether the given kctl info is valid */
+static int snd_ctl_check_elem_info(struct snd_card *card,
+				   const struct snd_ctl_elem_info *info)
+{
+	static const unsigned int max_value_counts[] = {
+		[SNDRV_CTL_ELEM_TYPE_BOOLEAN]	= 128,
+		[SNDRV_CTL_ELEM_TYPE_INTEGER]	= 128,
+		[SNDRV_CTL_ELEM_TYPE_ENUMERATED] = 128,
+		[SNDRV_CTL_ELEM_TYPE_BYTES]	= 512,
+		[SNDRV_CTL_ELEM_TYPE_IEC958]	= 1,
+		[SNDRV_CTL_ELEM_TYPE_INTEGER64] = 64,
+	};
+
+	if (info->type < SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    info->type > SNDRV_CTL_ELEM_TYPE_INTEGER64) {
+		if (card)
+			dev_err(card->dev,
+				"control %i:%i:%i:%s:%i: invalid type %d\n",
+				info->id.iface, info->id.device,
+				info->id.subdevice, info->id.name,
+				info->id.index, info->type);
+		return -EINVAL;
+	}
+	if (info->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED &&
+	    info->value.enumerated.items == 0) {
+		if (card)
+			dev_err(card->dev,
+				"control %i:%i:%i:%s:%i: zero enum items\n",
+				info->id.iface, info->id.device,
+				info->id.subdevice, info->id.name,
+				info->id.index);
+		return -EINVAL;
+	}
+	if (info->count > max_value_counts[info->type]) {
+		if (card)
+			dev_err(card->dev,
+				"control %i:%i:%i:%s:%i: invalid count %d\n",
+				info->id.iface, info->id.device,
+				info->id.subdevice, info->id.name,
+				info->id.index, info->count);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* The capacity of struct snd_ctl_elem_value.value.*/
+static const unsigned int value_sizes[] = {
+	[SNDRV_CTL_ELEM_TYPE_BOOLEAN]	= sizeof(long),
+	[SNDRV_CTL_ELEM_TYPE_INTEGER]	= sizeof(long),
+	[SNDRV_CTL_ELEM_TYPE_ENUMERATED] = sizeof(unsigned int),
+	[SNDRV_CTL_ELEM_TYPE_BYTES]	= sizeof(unsigned char),
+	[SNDRV_CTL_ELEM_TYPE_IEC958]	= sizeof(struct snd_aes_iec958),
+	[SNDRV_CTL_ELEM_TYPE_INTEGER64] = sizeof(long long),
+};
+
+#ifdef CONFIG_SND_CTL_VALIDATION
+/* fill the remaining snd_ctl_elem_value data with the given pattern */
+static void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
+				      struct snd_ctl_elem_info *info,
+				      u32 pattern)
+{
+	size_t offset = value_sizes[info->type] * info->count;
+
+	offset = (offset + sizeof(u32) - 1) / sizeof(u32);
+	memset32((u32 *)control->value.bytes.data + offset, pattern,
+		 sizeof(control->value) / sizeof(u32) - offset);
+}
+
+/* check whether the given integer ctl value is valid */
+static int sanity_check_int_value(struct snd_card *card,
+				  const struct snd_ctl_elem_value *control,
+				  const struct snd_ctl_elem_info *info,
+				  int i)
+{
+	long long lval, lmin, lmax, lstep;
+	u64 rem;
+
+	switch (info->type) {
+	default:
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		lval = control->value.integer.value[i];
+		lmin = 0;
+		lmax = 1;
+		lstep = 0;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		lval = control->value.integer.value[i];
+		lmin = info->value.integer.min;
+		lmax = info->value.integer.max;
+		lstep = info->value.integer.step;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
+		lval = control->value.integer64.value[i];
+		lmin = info->value.integer64.min;
+		lmax = info->value.integer64.max;
+		lstep = info->value.integer64.step;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		lval = control->value.enumerated.item[i];
+		lmin = 0;
+		lmax = info->value.enumerated.items - 1;
+		lstep = 0;
+		break;
+	}
+
+	if (lval < lmin || lval > lmax) {
+		dev_err(card->dev,
+			"control %i:%i:%i:%s:%i: value out of range %lld (%lld/%lld) at count %i\n",
+			control->id.iface, control->id.device,
+			control->id.subdevice, control->id.name,
+			control->id.index, lval, lmin, lmax, i);
+		return -EINVAL;
+	}
+	if (lstep) {
+		div64_u64_rem(lval, lstep, &rem);
+		if (rem) {
+			dev_err(card->dev,
+				"control %i:%i:%i:%s:%i: unaligned value %lld (step %lld) at count %i\n",
+				control->id.iface, control->id.device,
+				control->id.subdevice, control->id.name,
+				control->id.index, lval, lstep, i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* perform sanity checks to the given snd_ctl_elem_value object */
+static int sanity_check_elem_value(struct snd_card *card,
+				   const struct snd_ctl_elem_value *control,
+				   const struct snd_ctl_elem_info *info,
+				   u32 pattern)
+{
+	size_t offset;
+	int i, ret;
+	u32 *p;
+
+	switch (info->type) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		for (i = 0; i < info->count; i++) {
+			ret = sanity_check_int_value(card, control, info, i);
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* check whether the remaining area kept untouched */
+	offset = value_sizes[info->type] * info->count;
+	offset = (offset + sizeof(u32) - 1) / sizeof(u32);
+	p = (u32 *)control->value.bytes.data + offset;
+	for (; offset < sizeof(control->value) / sizeof(u32); offset++, p++) {
+		if (*p != pattern) {
+			ret = -EINVAL;
+			break;
+		}
+		*p = 0; /* clear the checked area */
+	}
+
+	return ret;
+}
+#else
+static inline void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
+					     struct snd_ctl_elem_info *info,
+					     u32 pattern)
+{
+}
+
+static inline int sanity_check_elem_value(struct snd_card *card,
+					  struct snd_ctl_elem_value *control,
+					  struct snd_ctl_elem_info *info,
+					  u32 pattern)
+{
+	return 0;
+}
+#endif
+
+static int __snd_ctl_elem_info(struct snd_card *card,
+			       struct snd_kcontrol *kctl,
+			       struct snd_ctl_elem_info *info,
+			       struct snd_ctl_file *ctl)
 {
-	struct snd_card *card = ctl->card;
-	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int index_offset;
 	int result;
 
-	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &info->id);
-	if (kctl == NULL) {
-		up_read(&card->controls_rwsem);
-		return -ENOENT;
-	}
 #ifdef CONFIG_SND_DEBUG
 	info->access = 0;
 #endif
@@ -791,7 +971,26 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 		} else {
 			info->owner = -1;
 		}
+		if (!snd_ctl_skip_validation(info) &&
+		    snd_ctl_check_elem_info(card, info) < 0)
+			result = -EINVAL;
 	}
+	return result;
+}
+
+static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
+			     struct snd_ctl_elem_info *info)
+{
+	struct snd_card *card = ctl->card;
+	struct snd_kcontrol *kctl;
+	int result;
+
+	down_read(&card->controls_rwsem);
+	kctl = snd_ctl_find_id(card, &info->id);
+	if (kctl == NULL)
+		result = -ENOENT;
+	else
+		result = __snd_ctl_elem_info(card, kctl, info, ctl);
 	up_read(&card->controls_rwsem);
 	return result;
 }
@@ -810,6 +1009,8 @@ static int snd_ctl_elem_info_user(struct snd_ctl_file *ctl,
 	result = snd_ctl_elem_info(ctl, &info);
 	if (result < 0)
 		return result;
+	/* drop internal access flags */
+	info.access &= ~SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK;
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
 	return result;
@@ -821,6 +1022,9 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int index_offset;
+	struct snd_ctl_elem_info info;
+	const u32 pattern = 0xdeadbeef;
+	int ret;
 
 	kctl = snd_ctl_find_id(card, &control->id);
 	if (kctl == NULL)
@@ -832,7 +1036,31 @@ static int snd_ctl_elem_read(struct snd_card *card,
 		return -EPERM;
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
-	return kctl->get(kctl, control);
+
+#ifdef CONFIG_SND_CTL_VALIDATION
+	/* info is needed only for validation */
+	memset(&info, 0, sizeof(info));
+	info.id = control->id;
+	ret = __snd_ctl_elem_info(card, kctl, &info, NULL);
+	if (ret < 0)
+		return ret;
+#endif
+
+	if (!snd_ctl_skip_validation(&info))
+		fill_remaining_elem_value(control, &info, pattern);
+	ret = kctl->get(kctl, control);
+	if (ret < 0)
+		return ret;
+	if (!snd_ctl_skip_validation(&info) &&
+	    sanity_check_elem_value(card, control, &info, pattern) < 0) {
+		dev_err(card->dev,
+			"control %i:%i:%i:%s:%i: access overflow\n",
+			control->id.iface, control->id.device,
+			control->id.subdevice, control->id.name,
+			control->id.index);
+		return -EINVAL;
+	}
+	return ret;
 }
 
 static int snd_ctl_elem_read_user(struct snd_card *card,
@@ -1173,23 +1401,6 @@ static void snd_ctl_elem_user_free(struct snd_kcontrol *kcontrol)
 static int snd_ctl_elem_add(struct snd_ctl_file *file,
 			    struct snd_ctl_elem_info *info, int replace)
 {
-	/* The capacity of struct snd_ctl_elem_value.value.*/
-	static const unsigned int value_sizes[] = {
-		[SNDRV_CTL_ELEM_TYPE_BOOLEAN]	= sizeof(long),
-		[SNDRV_CTL_ELEM_TYPE_INTEGER]	= sizeof(long),
-		[SNDRV_CTL_ELEM_TYPE_ENUMERATED] = sizeof(unsigned int),
-		[SNDRV_CTL_ELEM_TYPE_BYTES]	= sizeof(unsigned char),
-		[SNDRV_CTL_ELEM_TYPE_IEC958]	= sizeof(struct snd_aes_iec958),
-		[SNDRV_CTL_ELEM_TYPE_INTEGER64] = sizeof(long long),
-	};
-	static const unsigned int max_value_counts[] = {
-		[SNDRV_CTL_ELEM_TYPE_BOOLEAN]	= 128,
-		[SNDRV_CTL_ELEM_TYPE_INTEGER]	= 128,
-		[SNDRV_CTL_ELEM_TYPE_ENUMERATED] = 128,
-		[SNDRV_CTL_ELEM_TYPE_BYTES]	= 512,
-		[SNDRV_CTL_ELEM_TYPE_IEC958]	= 1,
-		[SNDRV_CTL_ELEM_TYPE_INTEGER64] = 64,
-	};
 	struct snd_card *card = file->card;
 	struct snd_kcontrol *kctl;
 	unsigned int count;
@@ -1241,14 +1452,12 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	 * Check information and calculate the size of data specific to
 	 * this userspace control.
 	 */
-	if (info->type < SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    info->type > SNDRV_CTL_ELEM_TYPE_INTEGER64)
-		return -EINVAL;
-	if (info->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED &&
-	    info->value.enumerated.items == 0)
-		return -EINVAL;
-	if (info->count < 1 ||
-	    info->count > max_value_counts[info->type])
+	/* pass NULL to card for suppressing error messages */
+	err = snd_ctl_check_elem_info(NULL, info);
+	if (err < 0)
+		return err;
+	/* user-space control doesn't allow zero-size data */
+	if (info->count < 1)
 		return -EINVAL;
 	private_size = value_sizes[info->type] * info->count;
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index ce3a36cb58da..18f498ab7af1 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2341,7 +2341,7 @@ static int pcm_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	if (!substream)
 		return -ENODEV;
 	memset(ucontrol->value.integer.value, 0,
-	       sizeof(ucontrol->value.integer.value));
+	       sizeof(long) * info->max_channels);
 	if (!substream->runtime)
 		return 0; /* no channels set */
 	for (map = info->chmap; map->channels; map++) {
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 630b1f5c276d..3beb842817ff 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -372,7 +372,8 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 }
 
 static const struct snd_kcontrol_new eld_bytes_ctl = {
-	.access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE |
+		SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK,
 	.iface = SNDRV_CTL_ELEM_IFACE_PCM,
 	.name = "ELD",
 	.info = hdmi_eld_ctl_info,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
