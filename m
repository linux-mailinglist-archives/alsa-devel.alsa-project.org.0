Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64821F82C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174471675;
	Tue, 14 Jul 2020 19:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174471675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747756;
	bh=UNO+nytYLwNzPCNrjMwzAzTyXnB39W/KgVAxRloHLTs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOwgt1mwiJ6f5tAgG3aWUV2OF1CharTtiEFikEieEcCQWalId9Z1icdU2Fs9N3+73
	 tf5/3G/iFRrkmq/Np4ebZHSYBilUNOosyMhttzm/6nmrekK0ZECiEC451FgDE9Aopu
	 rGMMD2m8evtM37LbsADd92OA2wRcaj8Vfz8LePOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2EA3F802C2;
	Tue, 14 Jul 2020 19:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B4F7F802BD; Tue, 14 Jul 2020 19:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B812CF8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B812CF8014E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08222AD55
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ALSA: Replace the word "slave" in vmaster API
Date: Tue, 14 Jul 2020 19:26:22 +0200
Message-Id: <20200714172631.25371-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
word "slave" in vmaster API.  I chose the word "replica" at this time
since it seems fitting for the purpose.

Note that the word "master" is kept in API, since it refers rather to
audio master volume control.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h         |  45 +++----
 include/sound/hda_codec.h       |   2 +-
 sound/core/vmaster.c            | 261 ++++++++++++++++++++--------------------
 sound/pci/ac97/ac97_patch.c     |  20 +--
 sound/pci/ca0106/ca0106_mixer.c |  18 +--
 sound/pci/hda/hda_codec.c       |  94 +++++++--------
 sound/pci/hda/hda_generic.c     |  20 +--
 sound/pci/hda/hda_generic.h     |   2 +-
 sound/pci/hda/hda_local.h       |  10 +-
 sound/pci/hda/patch_ca0132.c    |  10 +-
 sound/pci/hda/patch_sigmatel.c  |   2 +-
 sound/pci/ice1712/juli.c        |  16 +--
 sound/pci/ice1712/quartet.c     |  12 +-
 sound/ppc/awacs.c               |  12 +-
 sound/usb/6fire/control.c       |   2 +-
 15 files changed, 264 insertions(+), 262 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index aeaed2a05bae..3ff9c8380a61 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -188,20 +188,21 @@ int snd_ctl_enum_info(struct snd_ctl_elem_info *info, unsigned int channels,
  */
 struct snd_kcontrol *snd_ctl_make_virtual_master(char *name,
 						 const unsigned int *tlv);
-int _snd_ctl_add_slave(struct snd_kcontrol *master, struct snd_kcontrol *slave,
-		       unsigned int flags);
-/* optional flags for slave */
-#define SND_CTL_SLAVE_NEED_UPDATE	(1 << 0)
+int _snd_ctl_add_replica(struct snd_kcontrol *master,
+			 struct snd_kcontrol *replica,
+			 unsigned int flags);
+/* optional flags for replica */
+#define SND_CTL_REPLICA_NEED_UPDATE	(1 << 0)
 
 /**
- * snd_ctl_add_slave - Add a virtual slave control
+ * snd_ctl_add_replica - Add a virtual replica control
  * @master: vmaster element
- * @slave: slave element to add
+ * @replica: replica element to add
  *
- * Add a virtual slave control to the given master element created via
+ * Add a virtual replica control to the given master element created via
  * snd_ctl_create_virtual_master() beforehand.
  *
- * All slaves must be the same type (returning the same information
+ * All replicas must be the same type (returning the same information
  * via info callback).  The function doesn't check it, so it's your
  * responsibility.
  *
@@ -213,18 +214,18 @@ int _snd_ctl_add_slave(struct snd_kcontrol *master, struct snd_kcontrol *slave,
  * Return: Zero if successful or a negative error code.
  */
 static inline int
-snd_ctl_add_slave(struct snd_kcontrol *master, struct snd_kcontrol *slave)
+snd_ctl_add_replica(struct snd_kcontrol *master, struct snd_kcontrol *replica)
 {
-	return _snd_ctl_add_slave(master, slave, 0);
+	return _snd_ctl_add_replica(master, replica, 0);
 }
 
 /**
- * snd_ctl_add_slave_uncached - Add a virtual slave control
+ * snd_ctl_add_replica_uncached - Add a virtual replica control
  * @master: vmaster element
- * @slave: slave element to add
+ * @replica: replica element to add
  *
- * Add a virtual slave control to the given master.
- * Unlike snd_ctl_add_slave(), the element added via this function
+ * Add a virtual replica control to the given master.
+ * Unlike snd_ctl_add_replica(), the element added via this function
  * is supposed to have volatile values, and get callback is called
  * at each time queried from the master.
  *
@@ -235,10 +236,10 @@ snd_ctl_add_slave(struct snd_kcontrol *master, struct snd_kcontrol *slave)
  * Return: Zero if successful or a negative error code.
  */
 static inline int
-snd_ctl_add_slave_uncached(struct snd_kcontrol *master,
-			   struct snd_kcontrol *slave)
+snd_ctl_add_replica_uncached(struct snd_kcontrol *master,
+			   struct snd_kcontrol *replica)
 {
-	return _snd_ctl_add_slave(master, slave, SND_CTL_SLAVE_NEED_UPDATE);
+	return _snd_ctl_add_replica(master, replica, SND_CTL_REPLICA_NEED_UPDATE);
 }
 
 int snd_ctl_add_vmaster_hook(struct snd_kcontrol *kctl,
@@ -246,11 +247,11 @@ int snd_ctl_add_vmaster_hook(struct snd_kcontrol *kctl,
 			     void *private_data);
 void snd_ctl_sync_vmaster(struct snd_kcontrol *kctl, bool hook_only);
 #define snd_ctl_sync_vmaster_hook(kctl)	snd_ctl_sync_vmaster(kctl, true)
-int snd_ctl_apply_vmaster_slaves(struct snd_kcontrol *kctl,
-				 int (*func)(struct snd_kcontrol *vslave,
-					     struct snd_kcontrol *slave,
-					     void *arg),
-				 void *arg);
+int snd_ctl_apply_vmaster_replicas(struct snd_kcontrol *kctl,
+				   int (*func)(struct snd_kcontrol *vreplica,
+					       struct snd_kcontrol *replica,
+					       void *arg),
+				   void *arg);
 
 /*
  * Helper functions for jack-detection controls
diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index d16a4229209b..7a1de12e0354 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -208,7 +208,7 @@ struct hda_codec {
 	struct mutex control_mutex;
 	struct snd_array spdif_out;
 	unsigned int spdif_in_enable;	/* SPDIF input enable? */
-	const hda_nid_t *slave_dig_outs; /* optional digital out slave widgets */
+	const hda_nid_t *replica_dig_outs; /* optional digital out replica widgets */
 	struct snd_array init_pins;	/* initial (BIOS) pin configurations */
 	struct snd_array driver_pins;	/* pin configs set by codec parser */
 	struct snd_array cvt_setups;	/* audio convert setups */
diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index ab54d79654c9..3ed54bd5effd 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Virtual master and slave controls
+ * Virtual master and replica controls
  *
  *  Copyright (c) 2008 by Takashi Iwai <tiwai@suse.de>
  */
@@ -21,15 +21,15 @@ struct link_ctl_info {
 };
 
 /*
- * link master - this contains a list of slave controls that are
+ * link master - this contains a list of replica controls that are
  * identical types, i.e. info returns the same value type and value
  * ranges, but may have different number of counts.
  *
  * The master control is so far only mono volume/switch for simplicity.
- * The same value will be applied to all slaves.
+ * The same value will be applied to all replicas.
  */
 struct link_master {
-	struct list_head slaves;
+	struct list_head replicas;
 	struct link_ctl_info info;
 	int val;		/* the master value */
 	unsigned int tlv[4];
@@ -38,23 +38,23 @@ struct link_master {
 };
 
 /*
- * link slave - this contains a slave control element
+ * link replica - this contains a replica control element
  *
  * It fakes the control callbacsk with additional attenuation by the
- * master control.  A slave may have either one or two channels.
+ * master control.  A replica may have either one or two channels.
  */
 
-struct link_slave {
+struct link_replica {
 	struct list_head list;
 	struct link_master *master;
 	struct link_ctl_info info;
 	int vals[2];		/* current values */
 	unsigned int flags;
 	struct snd_kcontrol *kctl; /* original kcontrol pointer */
-	struct snd_kcontrol slave; /* the copy of original control entry */
+	struct snd_kcontrol replica; /* the copy of original control entry */
 };
 
-static int slave_update(struct link_slave *slave)
+static int replica_update(struct link_replica *replica)
 {
 	struct snd_ctl_elem_value *uctl;
 	int err, ch;
@@ -62,68 +62,68 @@ static int slave_update(struct link_slave *slave)
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (!uctl)
 		return -ENOMEM;
-	uctl->id = slave->slave.id;
-	err = slave->slave.get(&slave->slave, uctl);
+	uctl->id = replica->replica.id;
+	err = replica->replica.get(&replica->replica, uctl);
 	if (err < 0)
 		goto error;
-	for (ch = 0; ch < slave->info.count; ch++)
-		slave->vals[ch] = uctl->value.integer.value[ch];
+	for (ch = 0; ch < replica->info.count; ch++)
+		replica->vals[ch] = uctl->value.integer.value[ch];
  error:
 	kfree(uctl);
 	return err < 0 ? err : 0;
 }
 
-/* get the slave ctl info and save the initial values */
-static int slave_init(struct link_slave *slave)
+/* get the replica ctl info and save the initial values */
+static int replica_init(struct link_replica *replica)
 {
 	struct snd_ctl_elem_info *uinfo;
 	int err;
 
-	if (slave->info.count) {
+	if (replica->info.count) {
 		/* already initialized */
-		if (slave->flags & SND_CTL_SLAVE_NEED_UPDATE)
-			return slave_update(slave);
+		if (replica->flags & SND_CTL_REPLICA_NEED_UPDATE)
+			return replica_update(replica);
 		return 0;
 	}
 
 	uinfo = kmalloc(sizeof(*uinfo), GFP_KERNEL);
 	if (!uinfo)
 		return -ENOMEM;
-	uinfo->id = slave->slave.id;
-	err = slave->slave.info(&slave->slave, uinfo);
+	uinfo->id = replica->replica.id;
+	err = replica->replica.info(&replica->replica, uinfo);
 	if (err < 0) {
 		kfree(uinfo);
 		return err;
 	}
-	slave->info.type = uinfo->type;
-	slave->info.count = uinfo->count;
-	if (slave->info.count > 2  ||
-	    (slave->info.type != SNDRV_CTL_ELEM_TYPE_INTEGER &&
-	     slave->info.type != SNDRV_CTL_ELEM_TYPE_BOOLEAN)) {
-		pr_err("ALSA: vmaster: invalid slave element\n");
+	replica->info.type = uinfo->type;
+	replica->info.count = uinfo->count;
+	if (replica->info.count > 2  ||
+	    (replica->info.type != SNDRV_CTL_ELEM_TYPE_INTEGER &&
+	     replica->info.type != SNDRV_CTL_ELEM_TYPE_BOOLEAN)) {
+		pr_err("ALSA: vmaster: invalid replica element\n");
 		kfree(uinfo);
 		return -EINVAL;
 	}
-	slave->info.min_val = uinfo->value.integer.min;
-	slave->info.max_val = uinfo->value.integer.max;
+	replica->info.min_val = uinfo->value.integer.min;
+	replica->info.max_val = uinfo->value.integer.max;
 	kfree(uinfo);
 
-	return slave_update(slave);
+	return replica_update(replica);
 }
 
 /* initialize master volume */
 static int master_init(struct link_master *master)
 {
-	struct link_slave *slave;
+	struct link_replica *replica;
 
 	if (master->info.count)
 		return 0; /* already initialized */
 
-	list_for_each_entry(slave, &master->slaves, list) {
-		int err = slave_init(slave);
+	list_for_each_entry(replica, &master->replicas, list) {
+		int err = replica_init(replica);
 		if (err < 0)
 			return err;
-		master->info = slave->info;
+		master->info = replica->info;
 		master->info.count = 1; /* always mono */
 		/* set full volume as default (= no attenuation) */
 		master->val = master->info.max_val;
@@ -134,113 +134,113 @@ static int master_init(struct link_master *master)
 	return -ENOENT;
 }
 
-static int slave_get_val(struct link_slave *slave,
-			 struct snd_ctl_elem_value *ucontrol)
+static int replica_get_val(struct link_replica *replica,
+			   struct snd_ctl_elem_value *ucontrol)
 {
 	int err, ch;
 
-	err = slave_init(slave);
+	err = replica_init(replica);
 	if (err < 0)
 		return err;
-	for (ch = 0; ch < slave->info.count; ch++)
-		ucontrol->value.integer.value[ch] = slave->vals[ch];
+	for (ch = 0; ch < replica->info.count; ch++)
+		ucontrol->value.integer.value[ch] = replica->vals[ch];
 	return 0;
 }
 
-static int slave_put_val(struct link_slave *slave,
-			 struct snd_ctl_elem_value *ucontrol)
+static int replica_put_val(struct link_replica *replica,
+			   struct snd_ctl_elem_value *ucontrol)
 {
 	int err, ch, vol;
 
-	err = master_init(slave->master);
+	err = master_init(replica->master);
 	if (err < 0)
 		return err;
 
-	switch (slave->info.type) {
+	switch (replica->info.type) {
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
-		for (ch = 0; ch < slave->info.count; ch++)
+		for (ch = 0; ch < replica->info.count; ch++)
 			ucontrol->value.integer.value[ch] &=
-				!!slave->master->val;
+				!!replica->master->val;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
-		for (ch = 0; ch < slave->info.count; ch++) {
+		for (ch = 0; ch < replica->info.count; ch++) {
 			/* max master volume is supposed to be 0 dB */
 			vol = ucontrol->value.integer.value[ch];
-			vol += slave->master->val - slave->master->info.max_val;
-			if (vol < slave->info.min_val)
-				vol = slave->info.min_val;
-			else if (vol > slave->info.max_val)
-				vol = slave->info.max_val;
+			vol += replica->master->val - replica->master->info.max_val;
+			if (vol < replica->info.min_val)
+				vol = replica->info.min_val;
+			else if (vol > replica->info.max_val)
+				vol = replica->info.max_val;
 			ucontrol->value.integer.value[ch] = vol;
 		}
 		break;
 	}
-	return slave->slave.put(&slave->slave, ucontrol);
+	return replica->replica.put(&replica->replica, ucontrol);
 }
 
 /*
- * ctl callbacks for slaves
+ * ctl callbacks for replicas
  */
-static int slave_info(struct snd_kcontrol *kcontrol,
-		      struct snd_ctl_elem_info *uinfo)
+static int replica_info(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
 {
-	struct link_slave *slave = snd_kcontrol_chip(kcontrol);
-	return slave->slave.info(&slave->slave, uinfo);
+	struct link_replica *replica = snd_kcontrol_chip(kcontrol);
+	return replica->replica.info(&replica->replica, uinfo);
 }
 
-static int slave_get(struct snd_kcontrol *kcontrol,
-		     struct snd_ctl_elem_value *ucontrol)
+static int replica_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
 {
-	struct link_slave *slave = snd_kcontrol_chip(kcontrol);
-	return slave_get_val(slave, ucontrol);
+	struct link_replica *replica = snd_kcontrol_chip(kcontrol);
+	return replica_get_val(replica, ucontrol);
 }
 
-static int slave_put(struct snd_kcontrol *kcontrol,
-		     struct snd_ctl_elem_value *ucontrol)
+static int replica_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
 {
-	struct link_slave *slave = snd_kcontrol_chip(kcontrol);
+	struct link_replica *replica = snd_kcontrol_chip(kcontrol);
 	int err, ch, changed = 0;
 
-	err = slave_init(slave);
+	err = replica_init(replica);
 	if (err < 0)
 		return err;
-	for (ch = 0; ch < slave->info.count; ch++) {
-		if (slave->vals[ch] != ucontrol->value.integer.value[ch]) {
+	for (ch = 0; ch < replica->info.count; ch++) {
+		if (replica->vals[ch] != ucontrol->value.integer.value[ch]) {
 			changed = 1;
-			slave->vals[ch] = ucontrol->value.integer.value[ch];
+			replica->vals[ch] = ucontrol->value.integer.value[ch];
 		}
 	}
 	if (!changed)
 		return 0;
-	err = slave_put_val(slave, ucontrol);
+	err = replica_put_val(replica, ucontrol);
 	if (err < 0)
 		return err;
 	return 1;
 }
 
-static int slave_tlv_cmd(struct snd_kcontrol *kcontrol,
-			 int op_flag, unsigned int size,
-			 unsigned int __user *tlv)
+static int replica_tlv_cmd(struct snd_kcontrol *kcontrol,
+			   int op_flag, unsigned int size,
+			   unsigned int __user *tlv)
 {
-	struct link_slave *slave = snd_kcontrol_chip(kcontrol);
+	struct link_replica *replica = snd_kcontrol_chip(kcontrol);
 	/* FIXME: this assumes that the max volume is 0 dB */
-	return slave->slave.tlv.c(&slave->slave, op_flag, size, tlv);
+	return replica->replica.tlv.c(&replica->replica, op_flag, size, tlv);
 }
 
-static void slave_free(struct snd_kcontrol *kcontrol)
+static void replica_free(struct snd_kcontrol *kcontrol)
 {
-	struct link_slave *slave = snd_kcontrol_chip(kcontrol);
-	if (slave->slave.private_free)
-		slave->slave.private_free(&slave->slave);
-	if (slave->master)
-		list_del(&slave->list);
-	kfree(slave);
+	struct link_replica *replica = snd_kcontrol_chip(kcontrol);
+	if (replica->replica.private_free)
+		replica->replica.private_free(&replica->replica);
+	if (replica->master)
+		list_del(&replica->list);
+	kfree(replica);
 }
 
 /*
- * Add a slave control to the group with the given master control
+ * Add a replica control to the group with the given master control
  *
- * All slaves must be the same type (returning the same information
+ * All replicas must be the same type (returning the same information
  * via info callback).  The function doesn't check it, so it's your
  * responsibility.
  *
@@ -249,35 +249,36 @@ static void slave_free(struct snd_kcontrol *kcontrol)
  * - logarithmic volume control (dB level), no linear volume
  * - master can only attenuate the volume, no gain
  */
-int _snd_ctl_add_slave(struct snd_kcontrol *master, struct snd_kcontrol *slave,
-		       unsigned int flags)
+int _snd_ctl_add_replica(struct snd_kcontrol *master,
+			 struct snd_kcontrol *replica,
+			 unsigned int flags)
 {
 	struct link_master *master_link = snd_kcontrol_chip(master);
-	struct link_slave *srec;
+	struct link_replica *srec;
 
-	srec = kzalloc(struct_size(srec, slave.vd, slave->count),
+	srec = kzalloc(struct_size(srec, replica.vd, replica->count),
 		       GFP_KERNEL);
 	if (!srec)
 		return -ENOMEM;
-	srec->kctl = slave;
-	srec->slave = *slave;
-	memcpy(srec->slave.vd, slave->vd, slave->count * sizeof(*slave->vd));
+	srec->kctl = replica;
+	srec->replica = *replica;
+	memcpy(srec->replica.vd, replica->vd, replica->count * sizeof(*replica->vd));
 	srec->master = master_link;
 	srec->flags = flags;
 
 	/* override callbacks */
-	slave->info = slave_info;
-	slave->get = slave_get;
-	slave->put = slave_put;
-	if (slave->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK)
-		slave->tlv.c = slave_tlv_cmd;
-	slave->private_data = srec;
-	slave->private_free = slave_free;
-
-	list_add_tail(&srec->list, &master_link->slaves);
+	replica->info = replica_info;
+	replica->get = replica_get;
+	replica->put = replica_put;
+	if (replica->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK)
+		replica->tlv.c = replica_tlv_cmd;
+	replica->private_data = srec;
+	replica->private_free = replica_free;
+
+	list_add_tail(&srec->list, &master_link->replicas);
 	return 0;
 }
-EXPORT_SYMBOL(_snd_ctl_add_slave);
+EXPORT_SYMBOL(_snd_ctl_add_replica);
 
 /*
  * ctl callbacks for master controls
@@ -309,20 +310,20 @@ static int master_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int sync_slaves(struct link_master *master, int old_val, int new_val)
+static int sync_replicas(struct link_master *master, int old_val, int new_val)
 {
-	struct link_slave *slave;
+	struct link_replica *replica;
 	struct snd_ctl_elem_value *uval;
 
 	uval = kmalloc(sizeof(*uval), GFP_KERNEL);
 	if (!uval)
 		return -ENOMEM;
-	list_for_each_entry(slave, &master->slaves, list) {
+	list_for_each_entry(replica, &master->replicas, list) {
 		master->val = old_val;
-		uval->id = slave->slave.id;
-		slave_get_val(slave, uval);
+		uval->id = replica->replica.id;
+		replica_get_val(replica, uval);
 		master->val = new_val;
-		slave_put_val(slave, uval);
+		replica_put_val(replica, uval);
 	}
 	kfree(uval);
 	return 0;
@@ -344,7 +345,7 @@ static int master_put(struct snd_kcontrol *kcontrol,
 	if (new_val == old_val)
 		return 0;
 
-	err = sync_slaves(master, old_val, new_val);
+	err = sync_replicas(master, old_val, new_val);
 	if (err < 0)
 		return err;
 	if (master->hook && !first_init)
@@ -355,17 +356,17 @@ static int master_put(struct snd_kcontrol *kcontrol,
 static void master_free(struct snd_kcontrol *kcontrol)
 {
 	struct link_master *master = snd_kcontrol_chip(kcontrol);
-	struct link_slave *slave, *n;
+	struct link_replica *replica, *n;
 
-	/* free all slave links and retore the original slave kctls */
-	list_for_each_entry_safe(slave, n, &master->slaves, list) {
-		struct snd_kcontrol *sctl = slave->kctl;
+	/* free all replica links and retore the original replica kctls */
+	list_for_each_entry_safe(replica, n, &master->replicas, list) {
+		struct snd_kcontrol *sctl = replica->kctl;
 		struct list_head olist = sctl->list;
-		memcpy(sctl, &slave->slave, sizeof(*sctl));
-		memcpy(sctl->vd, slave->slave.vd,
+		memcpy(sctl, &replica->replica, sizeof(*sctl));
+		memcpy(sctl->vd, replica->replica.vd,
 		       sctl->count * sizeof(*sctl->vd));
 		sctl->list = olist; /* keep the current linked-list */
-		kfree(slave);
+		kfree(replica);
 	}
 	kfree(master);
 }
@@ -378,8 +379,8 @@ static void master_free(struct snd_kcontrol *kcontrol)
  *
  * Creates a virtual master control with the given name string.
  *
- * After creating a vmaster element, you can add the slave controls
- * via snd_ctl_add_slave() or snd_ctl_add_slave_uncached().
+ * After creating a vmaster element, you can add the replica controls
+ * via snd_ctl_add_replica() or snd_ctl_add_replica_uncached().
  *
  * The optional argument @tlv can be used to specify the TLV information
  * for dB scale of the master control.  It should be a single element
@@ -403,7 +404,7 @@ struct snd_kcontrol *snd_ctl_make_virtual_master(char *name,
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return NULL;
-	INIT_LIST_HEAD(&master->slaves);
+	INIT_LIST_HEAD(&master->replicas);
 
 	kctl = snd_ctl_new1(&knew, master);
 	if (!kctl) {
@@ -455,11 +456,11 @@ int snd_ctl_add_vmaster_hook(struct snd_kcontrol *kcontrol,
 EXPORT_SYMBOL_GPL(snd_ctl_add_vmaster_hook);
 
 /**
- * snd_ctl_sync_vmaster - Sync the vmaster slaves and hook
+ * snd_ctl_sync_vmaster - Sync the vmaster replicas and hook
  * @kcontrol: vmaster kctl element
  * @hook_only: sync only the hook
  *
- * Forcibly call the put callback of each slave and call the hook function
+ * Forcibly call the put callback of each replica and call the hook function
  * to synchronize with the current value of the given vmaster element.
  * NOP when NULL is passed to @kcontrol.
  */
@@ -476,7 +477,7 @@ void snd_ctl_sync_vmaster(struct snd_kcontrol *kcontrol, bool hook_only)
 		if (err < 0)
 			return;
 		first_init = err;
-		err = sync_slaves(master, master->val, master->val);
+		err = sync_replicas(master, master->val, master->val);
 		if (err < 0)
 			return;
 	}
@@ -487,34 +488,34 @@ void snd_ctl_sync_vmaster(struct snd_kcontrol *kcontrol, bool hook_only)
 EXPORT_SYMBOL_GPL(snd_ctl_sync_vmaster);
 
 /**
- * snd_ctl_apply_vmaster_slaves - Apply function to each vmaster slave
+ * snd_ctl_apply_vmaster_replicas - Apply function to each vmaster replica
  * @kctl: vmaster kctl element
  * @func: function to apply
  * @arg: optional function argument
  *
- * Apply the function @func to each slave kctl of the given vmaster kctl.
+ * Apply the function @func to each replica kctl of the given vmaster kctl.
  * Returns 0 if successful, or a negative error code.
  */
-int snd_ctl_apply_vmaster_slaves(struct snd_kcontrol *kctl,
-				 int (*func)(struct snd_kcontrol *vslave,
-					     struct snd_kcontrol *slave,
-					     void *arg),
-				 void *arg)
+int snd_ctl_apply_vmaster_replicas(struct snd_kcontrol *kctl,
+				   int (*func)(struct snd_kcontrol *vreplica,
+					       struct snd_kcontrol *replica,
+					       void *arg),
+				   void *arg)
 {
 	struct link_master *master;
-	struct link_slave *slave;
+	struct link_replica *replica;
 	int err;
 
 	master = snd_kcontrol_chip(kctl);
 	err = master_init(master);
 	if (err < 0)
 		return err;
-	list_for_each_entry(slave, &master->slaves, list) {
-		err = func(slave->kctl, &slave->slave, arg);
+	list_for_each_entry(replica, &master->replicas, list) {
+		err = func(replica->kctl, &replica->replica, arg);
 		if (err < 0)
 			return err;
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_ctl_apply_vmaster_slaves);
+EXPORT_SYMBOL_GPL(snd_ctl_apply_vmaster_replicas);
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 45ef0f52ec55..23cb846cf8c2 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -19,7 +19,7 @@ static struct snd_kcontrol *snd_ac97_find_mixer_ctl(struct snd_ac97 *ac97,
 						    const char *name);
 static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 				const unsigned int *tlv,
-				const char * const *slaves);
+				const char * const *replicas);
 
 /*
  *  Chip specific initialization
@@ -3373,7 +3373,7 @@ AC97_SINGLE("Downmix LFE and Center to Front", 0x5a, 12, 1, 0),
 AC97_SINGLE("Downmix Surround to Front", 0x5a, 11, 1, 0),
 };
 
-static const char * const slave_vols_vt1616[] = {
+static const char * const replica_vols_vt1616[] = {
 	"Front Playback Volume",
 	"Surround Playback Volume",
 	"Center Playback Volume",
@@ -3381,7 +3381,7 @@ static const char * const slave_vols_vt1616[] = {
 	NULL
 };
 
-static const char * const slave_sws_vt1616[] = {
+static const char * const replica_sws_vt1616[] = {
 	"Front Playback Switch",
 	"Surround Playback Switch",
 	"Center Playback Switch",
@@ -3400,10 +3400,10 @@ static struct snd_kcontrol *snd_ac97_find_mixer_ctl(struct snd_ac97 *ac97,
 	return snd_ctl_find_id(ac97->bus->card, &id);
 }
 
-/* create a virtual master control and add slaves */
+/* create a virtual master control and add replicas */
 static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 				const unsigned int *tlv,
-				const char * const *slaves)
+				const char * const *replicas)
 {
 	struct snd_kcontrol *kctl;
 	const char * const *s;
@@ -3416,16 +3416,16 @@ static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 	if (err < 0)
 		return err;
 
-	for (s = slaves; *s; s++) {
+	for (s = replicas; *s; s++) {
 		struct snd_kcontrol *sctl;
 
 		sctl = snd_ac97_find_mixer_ctl(ac97, *s);
 		if (!sctl) {
 			dev_dbg(ac97->bus->card->dev,
-				"Cannot find slave %s, skipped\n", *s);
+				"Cannot find replica %s, skipped\n", *s);
 			continue;
 		}
-		err = snd_ctl_add_slave(kctl, sctl);
+		err = snd_ctl_add_replica(kctl, sctl);
 		if (err < 0)
 			return err;
 	}
@@ -3451,12 +3451,12 @@ static int patch_vt1616_specific(struct snd_ac97 * ac97)
 	snd_ac97_rename_vol_ctl(ac97, "Master Playback", "Front Playback");
 
 	err = snd_ac97_add_vmaster(ac97, "Master Playback Volume",
-				   kctl->tlv.p, slave_vols_vt1616);
+				   kctl->tlv.p, replica_vols_vt1616);
 	if (err < 0)
 		return err;
 
 	err = snd_ac97_add_vmaster(ac97, "Master Playback Switch",
-				   NULL, slave_sws_vt1616);
+				   NULL, replica_sws_vt1616);
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 3b8ec673dc0a..cea9a5da9477 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -739,7 +739,7 @@ static int rename_ctl(struct snd_card *card, const char *src, const char *dst)
 static
 DECLARE_TLV_DB_SCALE(snd_ca0106_master_db_scale, -6375, 25, 1);
 
-static const char * const slave_vols[] = {
+static const char * const replica_vols[] = {
 	"Analog Front Playback Volume",
         "Analog Rear Playback Volume",
 	"Analog Center/LFE Playback Volume",
@@ -752,7 +752,7 @@ static const char * const slave_vols[] = {
 	NULL
 };
 
-static const char * const slave_sws[] = {
+static const char * const replica_sws[] = {
 	"Analog Front Playback Switch",
 	"Analog Rear Playback Switch",
 	"Analog Center/LFE Playback Switch",
@@ -761,13 +761,13 @@ static const char * const slave_sws[] = {
 	NULL
 };
 
-static void add_slaves(struct snd_card *card,
-		       struct snd_kcontrol *master, const char * const *list)
+static void add_replicas(struct snd_card *card,
+			 struct snd_kcontrol *master, const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *slave = ctl_find(card, *list);
-		if (slave)
-			snd_ctl_add_slave(master, slave);
+		struct snd_kcontrol *replica = ctl_find(card, *list);
+		if (replica)
+			snd_ctl_add_replica(master, replica);
 	}
 }
 
@@ -852,7 +852,7 @@ int snd_ca0106_mixer(struct snd_ca0106 *emu)
 	err = snd_ctl_add(card, vmaster);
 	if (err < 0)
 		return err;
-	add_slaves(card, vmaster, slave_vols);
+	add_replicas(card, vmaster, replica_vols);
 
 	if (emu->details->spi_dac) {
 		vmaster = snd_ctl_make_virtual_master("Master Playback Switch",
@@ -862,7 +862,7 @@ int snd_ca0106_mixer(struct snd_ca0106 *emu)
 		err = snd_ctl_add(card, vmaster);
 		if (err < 0)
 			return err;
-		add_slaves(card, vmaster, slave_sws);
+		add_replicas(card, vmaster, replica_sws);
 	}
 
 	strcpy(card->mixername, "CA0106");
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7e3ae4534df9..1b6aff38add9 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -785,7 +785,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->spdif_out);
 	snd_array_free(&codec->verbs);
 	codec->preset = NULL;
-	codec->slave_dig_outs = NULL;
+	codec->replica_dig_outs = NULL;
 	codec->spdif_status_reset = 0;
 	snd_array_free(&codec->mixers);
 	snd_array_free(&codec->nids);
@@ -1806,11 +1806,11 @@ int snd_hda_codec_reset(struct hda_codec *codec)
 	return 0;
 }
 
-typedef int (*map_slave_func_t)(struct hda_codec *, void *, struct snd_kcontrol *);
+typedef int (*map_replica_func_t)(struct hda_codec *, void *, struct snd_kcontrol *);
 
-/* apply the function to all matching slave ctls in the mixer list */
-static int map_slaves(struct hda_codec *codec, const char * const *slaves,
-		      const char *suffix, map_slave_func_t func, void *data) 
+/* apply the function to all matching replica ctls in the mixer list */
+static int map_replicas(struct hda_codec *codec, const char * const *replicas,
+			const char *suffix, map_replica_func_t func, void *data)
 {
 	struct hda_nid_item *items;
 	const char * const *s;
@@ -1821,7 +1821,7 @@ static int map_slaves(struct hda_codec *codec, const char * const *slaves,
 		struct snd_kcontrol *sctl = items[i].kctl;
 		if (!sctl || sctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER)
 			continue;
-		for (s = slaves; *s; s++) {
+		for (s = replicas; *s; s++) {
 			char tmpname[sizeof(sctl->id.name)];
 			const char *name = *s;
 			if (suffix) {
@@ -1840,7 +1840,7 @@ static int map_slaves(struct hda_codec *codec, const char * const *slaves,
 	return 0;
 }
 
-static int check_slave_present(struct hda_codec *codec,
+static int check_replica_present(struct hda_codec *codec,
 			       void *data, struct snd_kcontrol *sctl)
 {
 	return 1;
@@ -1860,17 +1860,17 @@ static int put_kctl_with_value(struct snd_kcontrol *kctl, int val)
 	return 0;
 }
 
-struct slave_init_arg {
+struct replica_init_arg {
 	struct hda_codec *codec;
 	int step;
 };
 
-/* initialize the slave volume with 0dB via snd_ctl_apply_vmaster_slaves() */
-static int init_slave_0dB(struct snd_kcontrol *slave,
-			  struct snd_kcontrol *kctl,
-			  void *_arg)
+/* initialize the replica volume with 0dB via snd_ctl_apply_vmaster_replicas() */
+static int init_replica_0dB(struct snd_kcontrol *replica,
+			    struct snd_kcontrol *kctl,
+			    void *_arg)
 {
-	struct slave_init_arg *arg = _arg;
+	struct replica_init_arg *arg = _arg;
 	int _tlv[4];
 	const int *tlv = NULL;
 	int step;
@@ -1879,7 +1879,7 @@ static int init_slave_0dB(struct snd_kcontrol *slave,
 	if (kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK) {
 		if (kctl->tlv.c != snd_hda_mixer_amp_tlv) {
 			codec_err(arg->codec,
-				  "Unexpected TLV callback for slave %s:%d\n",
+				  "Unexpected TLV callback for replica %s:%d\n",
 				  kctl->id.name, kctl->id.index);
 			return 0; /* ignore */
 		}
@@ -1897,7 +1897,7 @@ static int init_slave_0dB(struct snd_kcontrol *slave,
 		return 0;
 	if (arg->step && arg->step != step) {
 		codec_err(arg->codec,
-			  "Mismatching dB step for vmaster slave (%d!=%d)\n",
+			  "Mismatching dB step for vmaster replica (%d!=%d)\n",
 			  arg->step, step);
 		return 0;
 	}
@@ -1905,49 +1905,49 @@ static int init_slave_0dB(struct snd_kcontrol *slave,
 	arg->step = step;
 	val = -tlv[SNDRV_CTL_TLVO_DB_SCALE_MIN] / step;
 	if (val > 0) {
-		put_kctl_with_value(slave, val);
+		put_kctl_with_value(replica, val);
 		return val;
 	}
 
 	return 0;
 }
 
-/* unmute the slave via snd_ctl_apply_vmaster_slaves() */
-static int init_slave_unmute(struct snd_kcontrol *slave,
-			     struct snd_kcontrol *kctl,
-			     void *_arg)
+/* unmute the replica via snd_ctl_apply_vmaster_replicas() */
+static int init_replica_unmute(struct snd_kcontrol *replica,
+			       struct snd_kcontrol *kctl,
+			       void *_arg)
 {
-	return put_kctl_with_value(slave, 1);
+	return put_kctl_with_value(replica, 1);
 }
 
-static int add_slave(struct hda_codec *codec,
-		     void *data, struct snd_kcontrol *slave)
+static int add_replica(struct hda_codec *codec,
+		       void *data, struct snd_kcontrol *replica)
 {
-	return snd_ctl_add_slave(data, slave);
+	return snd_ctl_add_replica(data, replica);
 }
 
 /**
- * __snd_hda_add_vmaster - create a virtual master control and add slaves
+ * __snd_hda_add_vmaster - create a virtual master control and add replicas
  * @codec: HD-audio codec
  * @name: vmaster control name
  * @tlv: TLV data (optional)
- * @slaves: slave control names (optional)
- * @suffix: suffix string to each slave name (optional)
- * @init_slave_vol: initialize slaves to unmute/0dB
+ * @replicas: replica control names (optional)
+ * @suffix: suffix string to each replica name (optional)
+ * @init_replica_vol: initialize replicas to unmute/0dB
  * @ctl_ret: store the vmaster kcontrol in return
  *
  * Create a virtual master control with the given name.  The TLV data
  * must be either NULL or a valid data.
  *
- * @slaves is a NULL-terminated array of strings, each of which is a
- * slave control name.  All controls with these names are assigned to
+ * @replicas is a NULL-terminated array of strings, each of which is a
+ * replica control name.  All controls with these names are assigned to
  * the new virtual master control.
  *
  * This function returns zero if successful or a negative error code.
  */
 int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
-			unsigned int *tlv, const char * const *slaves,
-			  const char *suffix, bool init_slave_vol,
+			  unsigned int *tlv, const char * const *replicas,
+			  const char *suffix, bool init_replica_vol,
 			  struct snd_kcontrol **ctl_ret)
 {
 	struct snd_kcontrol *kctl;
@@ -1956,9 +1956,9 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 	if (ctl_ret)
 		*ctl_ret = NULL;
 
-	err = map_slaves(codec, slaves, suffix, check_slave_present, NULL);
+	err = map_replicas(codec, replicas, suffix, check_replica_present, NULL);
 	if (err != 1) {
-		codec_dbg(codec, "No slave found for %s\n", name);
+		codec_dbg(codec, "No replica found for %s\n", name);
 		return 0;
 	}
 	kctl = snd_ctl_make_virtual_master(name, tlv);
@@ -1968,20 +1968,20 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 	if (err < 0)
 		return err;
 
-	err = map_slaves(codec, slaves, suffix, add_slave, kctl);
+	err = map_replicas(codec, replicas, suffix, add_replica, kctl);
 	if (err < 0)
 		return err;
 
 	/* init with master mute & zero volume */
 	put_kctl_with_value(kctl, 0);
-	if (init_slave_vol) {
-		struct slave_init_arg arg = {
+	if (init_replica_vol) {
+		struct replica_init_arg arg = {
 			.codec = codec,
 			.step = 0,
 		};
-		snd_ctl_apply_vmaster_slaves(kctl,
-					     tlv ? init_slave_0dB : init_slave_unmute,
-					     &arg);
+		snd_ctl_apply_vmaster_replicas(kctl,
+					       tlv ? init_replica_0dB : init_replica_unmute,
+					       &arg);
 	}
 
 	if (ctl_ret)
@@ -2284,7 +2284,7 @@ static unsigned int convert_to_spdif_status(unsigned short val)
 	return sbits;
 }
 
-/* set digital convert verbs both for the given NID and its slaves */
+/* set digital convert verbs both for the given NID and its replicas */
 static void set_dig_out(struct hda_codec *codec, hda_nid_t nid,
 			int mask, int val)
 {
@@ -2292,7 +2292,7 @@ static void set_dig_out(struct hda_codec *codec, hda_nid_t nid,
 
 	snd_hdac_regmap_update(&codec->core, nid, AC_VERB_SET_DIGI_CONVERT_1,
 			       mask, val);
-	d = codec->slave_dig_outs;
+	d = codec->replica_dig_outs;
 	if (!d)
 		return;
 	for (; *d; d++)
@@ -3580,9 +3580,9 @@ static void setup_dig_out_stream(struct hda_codec *codec, hda_nid_t nid,
 				    spdif->ctls & ~AC_DIG1_ENABLE & 0xff,
 				    -1);
 	snd_hda_codec_setup_stream(codec, nid, stream_tag, 0, format);
-	if (codec->slave_dig_outs) {
+	if (codec->replica_dig_outs) {
 		const hda_nid_t *d;
-		for (d = codec->slave_dig_outs; *d; d++)
+		for (d = codec->replica_dig_outs; *d; d++)
 			snd_hda_codec_setup_stream(codec, *d, stream_tag, 0,
 						   format);
 	}
@@ -3595,9 +3595,9 @@ static void setup_dig_out_stream(struct hda_codec *codec, hda_nid_t nid,
 static void cleanup_dig_out_stream(struct hda_codec *codec, hda_nid_t nid)
 {
 	snd_hda_codec_cleanup_stream(codec, nid);
-	if (codec->slave_dig_outs) {
+	if (codec->replica_dig_outs) {
 		const hda_nid_t *d;
-		for (d = codec->slave_dig_outs; *d; d++)
+		for (d = codec->replica_dig_outs; *d; d++)
 			snd_hda_codec_cleanup_stream(codec, *d);
 	}
 }
@@ -3679,7 +3679,7 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_close);
  * @hinfo: PCM information to assign
  *
  * Open analog outputs and set up the hw-constraints.
- * If the digital outputs can be opened as slave, open the digital
+ * If the digital outputs can be opened as replica, open the digital
  * outputs, too.
  */
 int snd_hda_multi_out_analog_open(struct hda_codec *codec,
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 9074265d934a..261fa05662b5 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4112,7 +4112,7 @@ static void parse_digital(struct hda_codec *codec)
 	int i, nums;
 	hda_nid_t dig_nid, pin;
 
-	/* support multiple SPDIFs; the secondary is set up as a slave */
+	/* support multiple SPDIFs; the secondary is set up as a replica */
 	nums = 0;
 	for (i = 0; i < spec->autocfg.dig_outs; i++) {
 		pin = spec->autocfg.dig_out_pins[i];
@@ -4131,10 +4131,10 @@ static void parse_digital(struct hda_codec *codec)
 			spec->multiout.dig_out_nid = dig_nid;
 			spec->dig_out_type = spec->autocfg.dig_out_type[0];
 		} else {
-			spec->multiout.slave_dig_outs = spec->slave_dig_outs;
-			if (nums >= ARRAY_SIZE(spec->slave_dig_outs) - 1)
+			spec->multiout.replica_dig_outs = spec->replica_dig_outs;
+			if (nums >= ARRAY_SIZE(spec->replica_dig_outs) - 1)
 				break;
-			spec->slave_dig_outs[nums - 1] = dig_nid;
+			spec->replica_dig_outs[nums - 1] = dig_nid;
 		}
 		nums++;
 	}
@@ -4589,7 +4589,7 @@ static void call_update_outputs(struct hda_codec *codec)
 	else
 		snd_hda_gen_update_outputs(codec);
 
-	/* sync the whole vmaster slaves to reflect the new auto-mute status */
+	/* sync the whole vmaster replicas to reflect the new auto-mute status */
 	if (spec->auto_mute_via_amp && !codec->bus->shutdown)
 		snd_ctl_sync_vmaster(spec->vmaster_mute.sw_kctl, false);
 }
@@ -5233,8 +5233,8 @@ EXPORT_SYMBOL_GPL(snd_hda_gen_parse_auto_config);
  * Build control elements
  */
 
-/* slave controls for virtual master */
-static const char * const slave_pfxs[] = {
+/* replica controls for virtual master */
+static const char * const replica_pfxs[] = {
 	"Front", "Surround", "Center", "LFE", "Side",
 	"Headphone", "Speaker", "Mono", "Line Out",
 	"CLFE", "Bass Speaker", "PCM",
@@ -5286,7 +5286,7 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 	if (!spec->no_analog && !spec->suppress_vmaster &&
 	    !snd_hda_find_mixer_ctl(codec, "Master Playback Volume")) {
 		err = snd_hda_add_vmaster(codec, "Master Playback Volume",
-					  spec->vmaster_tlv, slave_pfxs,
+					  spec->vmaster_tlv, replica_pfxs,
 					  "Playback Volume");
 		if (err < 0)
 			return err;
@@ -5294,7 +5294,7 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 	if (!spec->no_analog && !spec->suppress_vmaster &&
 	    !snd_hda_find_mixer_ctl(codec, "Master Playback Switch")) {
 		err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
-					    NULL, slave_pfxs,
+					    NULL, replica_pfxs,
 					    "Playback Switch",
 					    true, &spec->vmaster_mute.sw_kctl);
 		if (err < 0)
@@ -5809,7 +5809,7 @@ int snd_hda_gen_build_pcms(struct hda_codec *codec)
 					     spec->stream_name_digital);
 		if (!info)
 			return -ENOMEM;
-		codec->slave_dig_outs = spec->multiout.slave_dig_outs;
+		codec->replica_dig_outs = spec->multiout.replica_dig_outs;
 		spec->pcm_rec[1] = info;
 		if (spec->dig_out_type)
 			info->pcm_type = spec->dig_out_type;
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index bbd6d2b741f2..78b9893543d3 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -116,7 +116,7 @@ struct hda_gen_spec {
 					 * dig_out_nid and hp_nid are optional
 					 */
 	hda_nid_t alt_dac_nid;
-	hda_nid_t slave_dig_outs[3];	/* optional - for auto-parsing */
+	hda_nid_t replica_dig_outs[3];	/* optional - for auto-parsing */
 	int dig_out_type;
 
 	/* capture */
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 3dca65d79b02..fc9f3f50096e 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -129,11 +129,11 @@ void snd_hda_set_vmaster_tlv(struct hda_codec *codec, hda_nid_t nid, int dir,
 struct snd_kcontrol *snd_hda_find_mixer_ctl(struct hda_codec *codec,
 					    const char *name);
 int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
-			  unsigned int *tlv, const char * const *slaves,
-			  const char *suffix, bool init_slave_vol,
+			  unsigned int *tlv, const char * const *replicas,
+			  const char *suffix, bool init_replica_vol,
 			  struct snd_kcontrol **ctl_ret);
-#define snd_hda_add_vmaster(codec, name, tlv, slaves, suffix) \
-	__snd_hda_add_vmaster(codec, name, tlv, slaves, suffix, true, NULL)
+#define snd_hda_add_vmaster(codec, name, tlv, replicas, suffix) \
+	__snd_hda_add_vmaster(codec, name, tlv, replicas, suffix, true, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
@@ -216,7 +216,7 @@ struct hda_multi_out {
 	hda_nid_t hp_out_nid[HDA_MAX_OUTS];	/* DACs for multiple HPs */
 	hda_nid_t extra_out_nid[HDA_MAX_OUTS];	/* other (e.g. speaker) DACs */
 	hda_nid_t dig_out_nid;	/* digital out audio widget */
-	const hda_nid_t *slave_dig_outs;
+	const hda_nid_t *replica_dig_outs;
 	int max_channels;	/* currently supported analog channels */
 	int dig_out_used;	/* current usage of digital out (HDA_DIG_XXX) */
 	int no_share_stream;	/* don't share a stream with multiple pins */
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 34fe753a46fb..cce03bf8132c 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -6245,10 +6245,10 @@ static int zxr_add_headphone_gain_switch(struct hda_codec *codec)
 }
 
 /*
- * Need to create slave controls for the alternate codecs that have surround
+ * Need to create replica controls for the alternate codecs that have surround
  * capabilities.
  */
-static const char * const ca0132_alt_slave_pfxs[] = {
+static const char * const ca0132_alt_replica_pfxs[] = {
 	"Front", "Surround", "Center", "LFE", NULL,
 };
 
@@ -6376,15 +6376,15 @@ static int ca0132_build_controls(struct hda_codec *codec)
 		if (err < 0)
 			return err;
 	}
-	/* Setup vmaster with surround slaves for desktop ca0132 devices */
+	/* Setup vmaster with surround replicas for desktop ca0132 devices */
 	if (ca0132_use_alt_functions(spec)) {
 		snd_hda_set_vmaster_tlv(codec, spec->dacs[0], HDA_OUTPUT,
 					spec->tlv);
 		snd_hda_add_vmaster(codec, "Master Playback Volume",
-					spec->tlv, ca0132_alt_slave_pfxs,
+					spec->tlv, ca0132_alt_replica_pfxs,
 					"Playback Volume");
 		err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
-					    NULL, ca0132_alt_slave_pfxs,
+					    NULL, ca0132_alt_replica_pfxs,
 					    "Playback Switch",
 					    true, &spec->vmaster_mute.sw_kctl);
 		if (err < 0)
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index d8ed69cb9df1..fcef46111725 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -3135,7 +3135,7 @@ static void fixup_hp_headphone(struct hda_codec *codec, hda_nid_t pin)
 	unsigned int pin_cfg = snd_hda_codec_get_pincfg(codec, pin);
 
 	/* It was changed in the BIOS to just satisfy MS DTM.
-	 * Lets turn it back into slaved HP
+	 * Lets turn it back into replica HP
 	 */
 	pin_cfg = (pin_cfg & (~AC_DEFCFG_DEVICE)) |
 		(AC_JACK_HP_OUT << AC_DEFCFG_DEVICE_SHIFT);
diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index 7be4eb42f05e..189783525c8c 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -397,7 +397,7 @@ static const struct snd_kcontrol_new juli_mute_controls[] = {
 	},
 };
 
-static const char * const slave_vols[] = {
+static const char * const replica_vols[] = {
 	PCM_VOLUME,
 	MONITOR_AN_IN_VOLUME,
 	MONITOR_DIG_IN_VOLUME,
@@ -418,16 +418,16 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 	return snd_ctl_find_id(card, &sid);
 }
 
-static void add_slaves(struct snd_card *card,
+static void add_replicas(struct snd_card *card,
 		       struct snd_kcontrol *master,
 		       const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *slave = ctl_find(card, *list);
-		/* dev_dbg(card->dev, "add_slaves - %s\n", *list); */
-		if (slave) {
-			/* dev_dbg(card->dev, "slave %s found\n", *list); */
-			snd_ctl_add_slave(master, slave);
+		struct snd_kcontrol *replica = ctl_find(card, *list);
+		/* dev_dbg(card->dev, "add_replicas - %s\n", *list); */
+		if (replica) {
+			/* dev_dbg(card->dev, "replica %s found\n", *list); */
+			snd_ctl_add_replica(master, replica);
 		}
 	}
 }
@@ -454,7 +454,7 @@ static int juli_add_controls(struct snd_ice1712 *ice)
 					      juli_master_db_scale);
 	if (!vmaster)
 		return -ENOMEM;
-	add_slaves(ice->card, vmaster, slave_vols);
+	add_replicas(ice->card, vmaster, replica_vols);
 	err = snd_ctl_add(ice->card, vmaster);
 	if (err < 0)
 		return err;
diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index 866596205710..32c32996ecbd 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -757,7 +757,7 @@ static const struct snd_kcontrol_new qtet_controls[] = {
 	QTET_CONTROL("Output 3/4 to Monitor 1/2", sw, OUT34_MON12),
 };
 
-static const char * const slave_vols[] = {
+static const char * const replica_vols[] = {
 	PCM_12_PLAYBACK_VOLUME,
 	PCM_34_PLAYBACK_VOLUME,
 	NULL
@@ -776,13 +776,13 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 	return snd_ctl_find_id(card, &sid);
 }
 
-static void add_slaves(struct snd_card *card,
+static void add_replicas(struct snd_card *card,
 		       struct snd_kcontrol *master, const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *slave = ctl_find(card, *list);
-		if (slave)
-			snd_ctl_add_slave(master, slave);
+		struct snd_kcontrol *replica = ctl_find(card, *list);
+		if (replica)
+			snd_ctl_add_replica(master, replica);
 	}
 }
 
@@ -806,7 +806,7 @@ static int qtet_add_controls(struct snd_ice1712 *ice)
 			qtet_master_db_scale);
 	if (!vmaster)
 		return -ENOMEM;
-	add_slaves(ice->card, vmaster, slave_vols);
+	add_replicas(ice->card, vmaster, replica_vols);
 	err = snd_ctl_add(ice->card, vmaster);
 	if (err < 0)
 		return err;
diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 73c0fd7277e6..245c53033661 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -1063,12 +1063,12 @@ snd_pmac_awacs_init(struct snd_pmac *chip)
 	if (pm5500 || imac || lombard) {
 		vmaster_sw = snd_ctl_make_virtual_master(
 			"Master Playback Switch", (unsigned int *) NULL);
-		err = snd_ctl_add_slave_uncached(vmaster_sw,
-						 chip->master_sw_ctl);
+		err = snd_ctl_add_replica_uncached(vmaster_sw,
+						   chip->master_sw_ctl);
 		if (err < 0)
 			return err;
-		err = snd_ctl_add_slave_uncached(vmaster_sw,
-						  chip->speaker_sw_ctl);
+		err = snd_ctl_add_replica_uncached(vmaster_sw,
+						   chip->speaker_sw_ctl);
 		if (err < 0)
 			return err;
 		err = snd_ctl_add(chip->card, vmaster_sw);
@@ -1076,10 +1076,10 @@ snd_pmac_awacs_init(struct snd_pmac *chip)
 			return err;
 		vmaster_vol = snd_ctl_make_virtual_master(
 			"Master Playback Volume", (unsigned int *) NULL);
-		err = snd_ctl_add_slave(vmaster_vol, master_vol);
+		err = snd_ctl_add_replica(vmaster_vol, master_vol);
 		if (err < 0)
 			return err;
-		err = snd_ctl_add_slave(vmaster_vol, speaker_vol);
+		err = snd_ctl_add_replica(vmaster_vol, speaker_vol);
 		if (err < 0)
 			return err;
 		err = snd_ctl_add(chip->card, vmaster_vol);
diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index 20f34d2ace5f..a4fcd2fe4745 100644
--- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -539,7 +539,7 @@ static int usb6fire_control_add_virtual(
 		ret = snd_ctl_add(card, control);
 		if (ret < 0)
 			return ret;
-		ret = snd_ctl_add_slave(vmaster, control);
+		ret = snd_ctl_add_replica(vmaster, control);
 		if (ret < 0)
 			return ret;
 		i++;
-- 
2.16.4

