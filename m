Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B7842C10
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 19:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D645C14DC;
	Tue, 30 Jan 2024 19:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D645C14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706640466;
	bh=BgX7RiCZm4cCtNAsSKviPBoSyj5UZj3CE7hHLX99arI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiHJ2OyCppMI+kdiP9XjGELaF53BROwK1SGkfG40CwYuwoFdVbR/GAMVEgOIJ+1xQ
	 Ss8EQ3/L1wwDPfCsv3JkV7FAxwU4LtJ9y7zeuj8xHghcm687u17xA1BnQM1XIhaFn5
	 lxV9yLOQutOIeyO6YjEJ0b7RSOZ4o5FGPdrUJrY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9B7F805D5; Tue, 30 Jan 2024 19:47:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21322F805BA;
	Tue, 30 Jan 2024 19:47:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A77D3F8056F; Tue, 30 Jan 2024 19:46:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0754F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 19:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0754F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=LBunFWEq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3633160F95;
	Tue, 30 Jan 2024 18:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5076C433C7;
	Tue, 30 Jan 2024 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706640393;
	bh=BgX7RiCZm4cCtNAsSKviPBoSyj5UZj3CE7hHLX99arI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBunFWEqvViQi4mxRet0UjF3zVoCFqXCE7PoMJ9cUjfAKTF21EBsVpzTWv4tQLJs7
	 UGpW1mtNGFZKlNsUjMrsDbzkSoh3xLapa1QTLux7s/FYMhmpn4CLlJC+lAPGQkTbfK
	 Hn5iLgqlC8n9t6Qm4biUliNLWxTvQEOndVcoriCg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/6] sysfs: Introduce a mechanism to hide static
 attribute_groups
Date: Tue, 30 Jan 2024 10:46:27 -0800
Message-ID: <2024013028-deflator-flaring-ec62@gregkh>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024013025-spoiling-exact-ad20@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
MIME-Version: 1.0
Lines: 247
X-Developer-Signature: v=1; a=openpgp-sha256; l=10288;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=ldWPRKHJqP6LClfj3aiNEK2q3/7xLx9Q8bLbfNPTanA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKk7XVj6BB4wsv1Nf3j+WGnOr363X5Fbv73/4Sefs3xG+
 nolXt7YjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIVSTD/ErnGX9DyredPu/W
 zfV5kQTn7G0cOxgWLFzBtctiV6fvzugYx6y7gWL1O6btBwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YW4OYR6LAWUO2A7BDKE4H5R6GSZREAAX
X-Message-ID-Hash: YW4OYR6LAWUO2A7BDKE4H5R6GSZREAAX
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW4OYR6LAWUO2A7BDKE4H5R6GSZREAAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dan Williams <dan.j.williams@intel.com>

Add a mechanism for named attribute_groups to hide their directory at
sysfs_update_group() time, or otherwise skip emitting the group
directory when the group is first registered. It piggybacks on
is_visible() in a similar manner as SYSFS_PREALLOC, i.e. special flags
in the upper bits of the returned mode. To use it, specify a symbol
prefix to DEFINE_SYSFS_GROUP_VISIBLE(), and then pass that same prefix
to SYSFS_GROUP_VISIBLE() when assigning the @is_visible() callback:

	DEFINE_SYSFS_GROUP_VISIBLE($prefix)

	struct attribute_group $prefix_group = {
		.name = $name,
		.is_visible = SYSFS_GROUP_VISIBLE($prefix),
	};

SYSFS_GROUP_VISIBLE() expects a definition of $prefix_group_visible()
and $prefix_attr_visible(), where $prefix_group_visible() just returns
true / false and $prefix_attr_visible() behaves as normal.

The motivation for this capability is to centralize PCI device
authentication in the PCI core with a named sysfs group while keeping
that group hidden for devices and platforms that do not meet the
requirements. In a PCI topology, most devices will not support
authentication, a small subset will support just PCI CMA (Component
Measurement and Authentication), a smaller subset will support PCI CMA +
PCIe IDE (Link Integrity and Encryption), and only next generation
server hosts will start to include a platform TSM (TEE Security
Manager).

Without this capability the alternatives are:

* Check if all attributes are invisible and if so, hide the directory.
  Beyond trouble getting this to work [1], this is an ABI change for
  scenarios if userspace happens to depend on group visibility absent any
  attributes. I.e. this new capability avoids regression since it does
  not retroactively apply to existing cases.

* Publish an empty /sys/bus/pci/devices/$pdev/tsm/ directory for all PCI
  devices (i.e. for the case when TSM platform support is present, but
  device support is absent). Unfortunate that this will be a vestigial
  empty directory in the vast majority of cases.

* Reintroduce usage of runtime calls to sysfs_{create,remove}_group()
  in the PCI core. Bjorn has already indicated that he does not want to
  see any growth of pci_sysfs_init() [2].

* Drop the named group and simulate a directory by prefixing all
  TSM-related attributes with "tsm_". Unfortunate to not use the naming
  capability of a sysfs group as intended.

In comparison, there is a small potential for regression if for some
reason an @is_visible() callback had dependencies on how many times it
was called. Additionally, it is no longer an error to update a group
that does not have its directory already present, and it is no longer a
WARN() to remove a group that was never visible.

Link: https://lore.kernel.org/all/2024012321-envious-procedure-4a58@gregkh/ [1]
Link: https://lore.kernel.org/linux-pci/20231019200110.GA1410324@bhelgaas/ [2]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/sysfs/group.c      | 45 ++++++++++++++++++++++++-------
 include/linux/sysfs.h | 63 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 87 insertions(+), 21 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 138676463336..ccb275cdabcb 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -31,6 +31,17 @@ static void remove_files(struct kernfs_node *parent,
 			kernfs_remove_by_name(parent, (*bin_attr)->attr.name);
 }
 
+static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
+{
+	if (grp->attrs && grp->is_visible)
+		return grp->is_visible(kobj, grp->attrs[0], 0);
+
+	if (grp->bin_attrs && grp->is_bin_visible)
+		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
+
+	return 0;
+}
+
 static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			kuid_t uid, kgid_t gid,
 			const struct attribute_group *grp, int update)
@@ -52,6 +63,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 				kernfs_remove_by_name(parent, (*attr)->name);
 			if (grp->is_visible) {
 				mode = grp->is_visible(kobj, *attr, i);
+				mode &= ~SYSFS_GROUP_INVISIBLE;
 				if (!mode)
 					continue;
 			}
@@ -81,6 +93,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						(*bin_attr)->attr.name);
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
+				mode &= ~SYSFS_GROUP_INVISIBLE;
 				if (!mode)
 					continue;
 			}
@@ -127,16 +140,31 @@ static int internal_create_group(struct kobject *kobj, int update,
 
 	kobject_get_ownership(kobj, &uid, &gid);
 	if (grp->name) {
+		umode_t mode = __first_visible(grp, kobj);
+
+		if (mode & SYSFS_GROUP_INVISIBLE)
+			mode = 0;
+		else
+			mode = S_IRWXU | S_IRUGO | S_IXUGO;
+
 		if (update) {
 			kn = kernfs_find_and_get(kobj->sd, grp->name);
 			if (!kn) {
-				pr_warn("Can't update unknown attr grp name: %s/%s\n",
-					kobj->name, grp->name);
-				return -EINVAL;
+				pr_debug("attr grp %s/%s not created yet\n",
+					 kobj->name, grp->name);
+				/* may have been invisible prior to this update */
+				update = 0;
+			} else if (!mode) {
+				sysfs_remove_group(kobj, grp);
+				kernfs_put(kn);
+				return 0;
 			}
-		} else {
-			kn = kernfs_create_dir_ns(kobj->sd, grp->name,
-						  S_IRWXU | S_IRUGO | S_IXUGO,
+		}
+
+		if (!update) {
+			if (!mode)
+				return 0;
+			kn = kernfs_create_dir_ns(kobj->sd, grp->name, mode,
 						  uid, gid, kobj, NULL);
 			if (IS_ERR(kn)) {
 				if (PTR_ERR(kn) == -EEXIST)
@@ -279,9 +307,8 @@ void sysfs_remove_group(struct kobject *kobj,
 	if (grp->name) {
 		kn = kernfs_find_and_get(parent, grp->name);
 		if (!kn) {
-			WARN(!kn, KERN_WARNING
-			     "sysfs group '%s' not found for kobject '%s'\n",
-			     grp->name, kobject_name(kobj));
+			pr_debug("sysfs group '%s' not found for kobject '%s'\n",
+				 grp->name, kobject_name(kobj));
 			return;
 		}
 	} else {
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b717a70219f6..a42642b277dd 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -61,22 +61,32 @@ do {							\
 /**
  * struct attribute_group - data structure used to declare an attribute group.
  * @name:	Optional: Attribute group name
- *		If specified, the attribute group will be created in
- *		a new subdirectory with this name.
+ *		If specified, the attribute group will be created in a
+ *		new subdirectory with this name. Additionally when a
+ *		group is named, @is_visible and @is_bin_visible may
+ *		return SYSFS_GROUP_INVISIBLE to control visibility of
+ *		the directory itself.
  * @is_visible:	Optional: Function to return permissions associated with an
- *		attribute of the group. Will be called repeatedly for each
- *		non-binary attribute in the group. Only read/write
+ *		attribute of the group. Will be called repeatedly for
+ *		each non-binary attribute in the group. Only read/write
  *		permissions as well as SYSFS_PREALLOC are accepted. Must
- *		return 0 if an attribute is not visible. The returned value
- *		will replace static permissions defined in struct attribute.
+ *		return 0 if an attribute is not visible. The returned
+ *		value will replace static permissions defined in struct
+ *		attribute. Use SYSFS_GROUP_VISIBLE() when assigning this
+ *		callback to specify separate _group_visible() and
+ *		_attr_visible() handlers.
  * @is_bin_visible:
  *		Optional: Function to return permissions associated with a
  *		binary attribute of the group. Will be called repeatedly
  *		for each binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC are accepted. Must
- *		return 0 if a binary attribute is not visible. The returned
- *		value will replace static permissions defined in
- *		struct bin_attribute.
+ *		permissions as well as SYSFS_PREALLOC (and the
+ *		visibility flags for named groups) are accepted. Must
+ *		return 0 if a binary attribute is not visible. The
+ *		returned value will replace static permissions defined
+ *		in struct bin_attribute. If @is_visible is not set, Use
+ *		SYSFS_GROUP_VISIBLE() when assigning this callback to
+ *		specify separate _group_visible() and _attr_visible()
+ *		handlers.
  * @attrs:	Pointer to NULL terminated list of attributes.
  * @bin_attrs:	Pointer to NULL terminated list of binary attributes.
  *		Either attrs or bin_attrs or both must be provided.
@@ -91,13 +101,42 @@ struct attribute_group {
 	struct bin_attribute	**bin_attrs;
 };
 
+#define SYSFS_PREALLOC		010000
+#define SYSFS_GROUP_INVISIBLE	020000
+
+/*
+ * The first call to is_visible() in the create / update path may
+ * indicate visibility for the entire group
+ */
+#define DEFINE_SYSFS_GROUP_VISIBLE(name)                             \
+	static inline umode_t sysfs_group_visible_##name(            \
+		struct kobject *kobj, struct attribute *attr, int n) \
+	{                                                            \
+		if (n == 0 && !name##_group_visible(kobj))           \
+			return SYSFS_GROUP_INVISIBLE;                \
+		return name##_attr_visible(kobj, attr, n);           \
+	}
+
+/*
+ * Same as DEFINE_SYSFS_GROUP_VISIBLE, but for groups with only binary
+ * attributes
+ */
+#define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                             \
+	static inline umode_t sysfs_group_visible_##name(                \
+		struct kobject *kobj, struct bin_attribute *attr, int n) \
+	{                                                                \
+		if (n == 0 && !name##_group_visible(kobj))               \
+			return SYSFS_GROUP_INVISIBLE;                    \
+		return name##_attr_visible(kobj, attr, n);               \
+	}
+
+#define SYSFS_GROUP_VISIBLE(fn) sysfs_group_visible_##fn
+
 /*
  * Use these macros to make defining attributes easier.
  * See include/linux/device.h for examples..
  */
 
-#define SYSFS_PREALLOC 010000
-
 #define __ATTR(_name, _mode, _show, _store) {				\
 	.attr = {.name = __stringify(_name),				\
 		 .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
-- 
2.43.0

