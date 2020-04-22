Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E71B4333
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 13:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D2D116C0;
	Wed, 22 Apr 2020 13:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D2D116C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587554890;
	bh=Iq2Kv3ZxC841G3kMR4hx63eGmWZ3187+T4CsWKcNXIk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UqkDADEt/2PIfx7sK/fFepemtgjk8WXZT2wGRr9IS1+3WDxO+KItuXYCcKY/VbZU7
	 cV/nVu9OhnnlknnKVmbrpnydVfHpwN06iHPopxAh3yF9fFajk4B/zBZODmjDleYVgD
	 JKC3lnehFco8tNDX6sjWkZ6gEAmv855MOX7nT4Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7251F8020C;
	Wed, 22 Apr 2020 13:26:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD6FFF8020C; Wed, 22 Apr 2020 13:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A830F80142
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 13:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A830F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yRQkT2f0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9F9F20781;
 Wed, 22 Apr 2020 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587554773;
 bh=Iq2Kv3ZxC841G3kMR4hx63eGmWZ3187+T4CsWKcNXIk=;
 h=From:To:Cc:Subject:Date:From;
 b=yRQkT2f0I2GPvqWzkJTV953NF8Ebop4rMUtLjuRXyX+PFgGK751ZnB4XU9sEHfmsr
 8Wib5z2PG4Gg90iNutnSHogRoLDIGB4X9nQYH6MYCQy2ODczcgonqm+ADeTiRdzGbv
 LzkLa/RLuwVBaGfj9My+2+u3wC5o+lzKVt9GKM7w=
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Fix build
Date: Wed, 22 Apr 2020 12:26:02 +0100
Message-Id: <20200422112602.13109-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

The recent batch of SOF changes failed to build on some x86
configurations including an allmodconfig, revert the commits:

e150ef4169a76  ASoC: SOF: Introduce extended manifest
371091417864b  ASoC: SOF: ext_manifest: parse firmware version
7c024b948c206  ASoC: SOF: ext_manifest: parse compiler version
9e72f13ee541c  ASoC: SOF: ext_manifest: parse windows

to fix this.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/ext_manifest.h |  91 -------------
 sound/soc/sof/loader.c                | 189 +-------------------------
 2 files changed, 2 insertions(+), 278 deletions(-)
 delete mode 100644 include/uapi/sound/sof/ext_manifest.h

diff --git a/include/uapi/sound/sof/ext_manifest.h b/include/uapi/sound/sof/ext_manifest.h
deleted file mode 100644
index d49c47d08c7f..000000000000
--- a/include/uapi/sound/sof/ext_manifest.h
+++ /dev/null
@@ -1,91 +0,0 @@
-/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
- */
-
-/*
- * Extended manifest is a place to store metadata about firmware, known during
- * compilation time - for example firmware version or used compiler.
- * Given information are read on host side before firmware startup.
- * This part of output binary is not signed.
- */
-
-#ifndef __SOF_FIRMWARE_EXT_MANIFEST_H__
-#define __SOF_FIRMWARE_EXT_MANIFEST_H__
-
-#include <linux/const.h>
-#include <sound/sof/info.h>
-
-/* In ASCII `XMan` */
-#define SOF_EXT_MAN_MAGIC_NUMBER	0x6e614d58
-
-/* Build u32 number in format MMmmmppp */
-#define SOF_EXT_MAN_BUILD_VERSION(MAJOR, MINOR, PATH) ((uint32_t)( \
-	((MAJOR) << 24) | \
-	((MINOR) << 12) | \
-	(PATH)))
-
-/* check extended manifest version consistency */
-#define SOF_EXT_MAN_VERSION_INCOMPATIBLE(host_ver, cli_ver) ( \
-	((host_ver) & GENMASK(31, 24)) != \
-	((cli_ver) & GENMASK(31, 24)))
-
-/* used extended manifest header version */
-#define SOF_EXT_MAN_VERSION		SOF_EXT_MAN_BUILD_VERSION(1, 0, 0)
-
-/* extended manifest header, deleting any field breaks backward compatibility */
-struct sof_ext_man_header {
-	uint32_t magic;		/*< identification number, */
-				/*< EXT_MAN_MAGIC_NUMBER */
-	uint32_t full_size;	/*< [bytes] full size of ext_man, */
-				/*< (header + content + padding) */
-	uint32_t header_size;	/*< [bytes] makes header extensionable, */
-				/*< after append new field to ext_man header */
-				/*< then backward compatible won't be lost */
-	uint32_t header_version; /*< value of EXT_MAN_VERSION */
-				/*< not related with following content */
-	uint8_t elements[];	/*< list of ext_man_elem_* elements */
-} __packed;
-
-/* Now define extended manifest elements */
-
-/* Extended manifest elements types */
-enum sof_ext_man_elem_type {
-	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
-	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
-	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
-};
-
-/* extended manifest element header */
-struct sof_ext_man_elem_header {
-	uint32_t type;		/*< SOF_EXT_MAN_ELEM_ */
-	uint32_t size;		/*< in bytes, including header size */
-	uint8_t blob[];		/*< type dependent content */
-} __packed;
-
-/* FW version */
-struct sof_ext_man_fw_version {
-	struct sof_ext_man_elem_header hdr;
-	/* use sof_ipc struct because of code re-use */
-	struct sof_ipc_fw_version version;
-	uint32_t flags;
-} __packed;
-
-/* extended data memory windows for IPC, trace and debug */
-struct sof_ext_man_window {
-	struct sof_ext_man_elem_header hdr;
-	/* use sof_ipc struct because of code re-use */
-	struct sof_ipc_window ipc_window;
-} __packed;
-
-/* Used C compiler description */
-struct sof_ext_man_cc_version {
-	struct sof_ext_man_elem_header hdr;
-	/* use sof_ipc struct because of code re-use */
-	struct sof_ipc_cc_version cc_version;
-} __packed;
-
-#endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 8be30cd5e038..89f35db2577d 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -12,7 +12,6 @@
 
 #include <linux/firmware.h>
 #include <sound/sof.h>
-#include <uapi/sound/sof/ext_manifest.h>
 #include "ops.h"
 
 static int get_ext_windows(struct snd_sof_dev *sdev,
@@ -20,21 +19,13 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 {
 	const struct sof_ipc_window *w =
 		container_of(ext_hdr, struct sof_ipc_window, ext_hdr);
-	size_t w_size = struct_size(w, window, w->num_windows);
-
-	if (sdev->info_window) {
-		if (memcmp(sdev->info_window, w, w_size)) {
-			dev_err(sdev->dev, "error: mistmatch between window descriptor from extended manifest and mailbox");
-			return -EINVAL;
-		}
-		return 0;
-	}
 
 	if (w->num_windows == 0 || w->num_windows > SOF_IPC_MAX_ELEMS)
 		return -EINVAL;
 
 	/* keep a local copy of the data */
-	sdev->info_window = kmemdup(w, w_size, GFP_KERNEL);
+	sdev->info_window = kmemdup(w, struct_size(w, window, w->num_windows),
+				    GFP_KERNEL);
 	if (!sdev->info_window)
 		return -ENOMEM;
 
@@ -49,14 +40,6 @@ static int get_cc_info(struct snd_sof_dev *sdev,
 	const struct sof_ipc_cc_version *cc =
 		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
 
-	if (sdev->cc_version) {
-		if (memcmp(sdev->cc_version, cc, cc->ext_hdr.hdr.size)) {
-			dev_err(sdev->dev, "error: receive diverged cc_version descriptions");
-			return -EINVAL;
-		}
-		return 0;
-	}
-
 	dev_dbg(sdev->dev, "Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
 		cc->name, cc->major, cc->minor, cc->micro, cc->desc,
 		cc->optim);
@@ -143,151 +126,6 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 }
 EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
 
-static int ext_man_get_fw_version(struct snd_sof_dev *sdev,
-				  const struct sof_ext_man_elem_header *hdr)
-{
-	const struct sof_ext_man_fw_version *v;
-
-	v = container_of(hdr, struct sof_ext_man_fw_version, hdr);
-
-	memcpy(&sdev->fw_ready.version, &v->version, sizeof(v->version));
-	sdev->fw_ready.flags = v->flags;
-
-	/* log ABI versions and check FW compatibility */
-	return snd_sof_ipc_valid(sdev);
-}
-
-static int ext_man_get_windows(struct snd_sof_dev *sdev,
-			       const struct sof_ext_man_elem_header *hdr)
-{
-	const struct sof_ipc_ext_data_hdr *w_ipc;
-	const struct sof_ext_man_window *w;
-
-	w = container_of(hdr, struct sof_ext_man_window, hdr);
-	w_ipc = (const struct sof_ipc_ext_data_hdr *)&w->ipc_window;
-
-	return get_ext_windows(sdev, w_ipc);
-}
-
-static int ext_man_get_cc_info(struct snd_sof_dev *sdev,
-			       const struct sof_ext_man_elem_header *hdr)
-{
-	const struct sof_ext_man_cc_version *cc;
-	const struct sof_ipc_ext_data_hdr *cc_version;
-
-	cc = container_of(hdr, struct sof_ext_man_cc_version, hdr);
-	cc_version = (const struct sof_ipc_ext_data_hdr *)&cc->cc_version;
-
-	return get_cc_info(sdev, cc_version);
-}
-
-static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
-{
-	const struct sof_ext_man_header *head = (void *)fw->data;
-
-	/*
-	 * assert fw size is big enough to contain extended manifest header,
-	 * it prevents from reading unallocated memory from `head` in following
-	 * step.
-	 */
-	if (fw->size < sizeof(*head))
-		return -EINVAL;
-
-	/*
-	 * When fw points to extended manifest,
-	 * then first u32 must be equal SOF_EXT_MAN_MAGIC_NUMBER.
-	 */
-	if (head->magic == SOF_EXT_MAN_MAGIC_NUMBER)
-		return head->full_size;
-
-	/* otherwise given fw don't have an extended manifest */
-	return 0;
-}
-
-/* parse extended FW manifest data structures */
-static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
-				    const struct firmware *fw)
-{
-	const struct sof_ext_man_elem_header *elem_hdr;
-	const struct sof_ext_man_header *head;
-	ssize_t ext_man_size;
-	ssize_t remaining;
-	uintptr_t iptr;
-	int ret = 0;
-
-	head = (struct sof_ext_man_header *)fw->data;
-	remaining = head->full_size - head->header_size;
-	ext_man_size = snd_sof_ext_man_size(fw);
-
-	/* Assert firmware starts with extended manifest */
-	if (ext_man_size < 0) {
-		dev_err(sdev->dev, "error: exception while reading firmware extended manifest, code %d\n",
-			(int)ext_man_size);
-		return ext_man_size;
-	} else if (!ext_man_size) {
-		dev_err(sdev->dev, "error: can't parse extended manifest when it's not present\n");
-		return -EINVAL;
-	}
-
-	/* incompatible version */
-	if (SOF_EXT_MAN_VERSION_INCOMPATIBLE(SOF_EXT_MAN_VERSION,
-					     head->header_version)) {
-		dev_err(sdev->dev, "error: extended manifest version 0x%X differ from used 0x%X\n",
-			head->header_version, SOF_EXT_MAN_VERSION);
-		return -EINVAL;
-	}
-
-	/* get first extended manifest element header */
-	iptr = (uintptr_t)fw->data + head->header_size;
-
-	while (remaining > sizeof(*elem_hdr)) {
-		elem_hdr = (struct sof_ext_man_elem_header *)iptr;
-
-		dev_dbg(sdev->dev, "found sof_ext_man header type %d size 0x%X\n",
-			elem_hdr->type, elem_hdr->size);
-
-		if (elem_hdr->size < sizeof(*elem_hdr) ||
-		    elem_hdr->size > remaining) {
-			dev_err(sdev->dev, "error: invalid sof_ext_man header size, type %d size 0x%X\n",
-				elem_hdr->type, elem_hdr->size);
-			break;
-		}
-
-		/* process structure data */
-		switch (elem_hdr->type) {
-		case SOF_EXT_MAN_ELEM_FW_VERSION:
-			ret = ext_man_get_fw_version(sdev, elem_hdr);
-			break;
-		case SOF_EXT_MAN_ELEM_WINDOW:
-			ret = ext_man_get_windows(sdev, elem_hdr);
-			break;
-		case SOF_EXT_MAN_ELEM_CC_VERSION:
-			ret = ext_man_get_cc_info(sdev, elem_hdr);
-			break;
-		default:
-			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
-				 elem_hdr->type, elem_hdr->size);
-			break;
-		}
-
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to parse sof_ext_man header type %d size 0x%X\n",
-				elem_hdr->type, elem_hdr->size);
-			break;
-		}
-
-		remaining -= elem_hdr->size;
-		iptr += elem_hdr->size;
-	}
-
-	if (remaining) {
-		dev_err(sdev->dev, "error: sof_ext_man header is inconsistent\n");
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 /*
  * IPC Firmware ready.
  */
@@ -635,7 +473,6 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *fw_filename;
-	ssize_t ext_man_size;
 	int ret;
 
 	/* Don't request firmware again if firmware is already requested */
@@ -653,33 +490,11 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: request firmware %s failed err: %d\n",
 			fw_filename, ret);
-		goto err;
 	} else {
 		dev_dbg(sdev->dev, "request_firmware %s successful\n",
 			fw_filename);
 	}
 
-	/* check for extended manifest */
-	ext_man_size = snd_sof_ext_man_size(plat_data->fw);
-	if (ext_man_size > 0) {
-		ret = snd_sof_fw_ext_man_parse(sdev, plat_data->fw);
-
-		/* when no error occurred, drop extended manifest */
-		if (!ret)
-			plat_data->fw_offset = ext_man_size;
-		else
-			dev_err(sdev->dev, "error: firmware %s contains unsupported or invalid extended manifest: %d\n",
-				fw_filename, ret);
-	} else if (!ext_man_size) {
-		/* No extended manifest, so nothing to skip during FW load */
-		dev_dbg(sdev->dev, "firmware doesn't contain extended manifest\n");
-	} else {
-		ret = ext_man_size;
-		dev_err(sdev->dev, "error: firmware %s contains unsupported or invalid extended manifest: %d\n",
-			fw_filename, ret);
-	}
-
-err:
 	kfree(fw_filename);
 
 	return ret;
-- 
2.20.1

