Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC630AA69
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD601768;
	Mon,  1 Feb 2021 16:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD601768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612191947;
	bh=U0zBBz5zio/jirU9N3DiSWGOUSha0OsOoXa0WErhQqk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=abYItXEAKUp+3nF/mJi/48ytIr3Ln48XN7XiMmwk/QhJgh+ew5exVwl2dQFhXfrRo
	 gFYDPcM4P+Ot1rnN1KEGteO9taWpipjUs7D4yKtYcjpmKmYsTprlJUsy+cEE0B33VL
	 OEcYUZ6r6o1b4WE9NY4tAfX7VpBC0wpaWhHqsgik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1ECF80154;
	Mon,  1 Feb 2021 16:04:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C366F80153; Mon,  1 Feb 2021 16:04:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09224F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09224F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="YWQoQOJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1612191847;
 x=1643727847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGvbFDBGYvFU3RVb9BLmQdP9zs490DWKvasCn0aqu8Y=;
 b=YWQoQOJ+xRLhRrLt0BsDEAyhNmOHzYbcPbVcfJdqO30kNNF9+rCOKeQa
 unDlz6BC1Oj9JsD8nChPRLhbT8rcG2phdhy/PZWD/iPvZ/9FtK5RI0jUq
 c+nbmxIxylsbXa+DfqekC03aaTdSeOSpe2abcMc5NVa6FhukoZ6ILSUol
 Mm9pZPEC+PTpFyyuuCh3AkXF2fXWqujdPCFIr3B5Z4Id5gsg/ZbWyXbXv
 X3I/2TKFyNvEC+TnN9HFWFTkTn27OKrd9DvKx27NZhGN5InOjkjbd/4v2
 fdOtekrNIsahgjhxp45Lwp1OEjskQ4gt8DrcFi6XqyyQb41MeFdCQL77J g==;
From: Camel Guo <camel.guo@axis.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] Add support to expose controls of ladspa plugin
Date: Mon, 1 Feb 2021 16:03:52 +0100
Message-ID: <20210201150352.6342-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: tiwai@suse.de, Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

In order for external software components to adjust ladspa plugin
dynamically, this commit adds an option to exposes the control array of
input control ports of a ladspa plugin to a file, through which any
applications with proper permission can control this plugin.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 src/pcm/pcm_ladspa.c | 157 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 139 insertions(+), 18 deletions(-)

diff --git a/src/pcm/pcm_ladspa.c b/src/pcm/pcm_ladspa.c
index ad73347d..40b5d38f 100644
--- a/src/pcm/pcm_ladspa.c
+++ b/src/pcm/pcm_ladspa.c
@@ -32,6 +32,9 @@
  *   http://www.medianet.ag
  */
   
+#include <stdbool.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
 #include <dirent.h>
 #include <locale.h>
 #include <math.h>
@@ -93,7 +96,8 @@ typedef struct {
 	unsigned int port_bindings_size;	/* size of array */
 	unsigned int *port_bindings;		/* index = channel number, value = LADSPA port */
 	unsigned int controls_size;		/* size of array */
-	unsigned char *controls_initialized;	/* initialized by ALSA user */
+	bool controls_new;			/* if controls is new, it can be overrided by alsa config */
+	bool controls_shared;			/* if controls is shared memory map */
 	LADSPA_Data *controls;			/* index = LADSPA control port index */
 } snd_pcm_ladspa_plugin_io_t;
 
@@ -101,6 +105,7 @@ typedef struct {
 	struct list_head list;
 	snd_pcm_ladspa_policy_t policy;
 	char *filename;
+	char *controls_path;
 	void *dl_handle;
 	const LADSPA_Descriptor *desc;
 	snd_pcm_ladspa_plugin_io_t input;
@@ -110,6 +115,73 @@ typedef struct {
 
 #endif /* DOC_HIDDEN */
 
+static LADSPA_Data* mmap_ladspa_controls(const char* filename, unsigned long length, bool *is_new)
+{
+	LADSPA_Data *ptr = NULL;
+	int fd = -1;
+	int ret = 0;
+	struct stat statbuf = { 0 };
+	int prot = PROT_READ;
+
+	if (filename == NULL || is_new == NULL) return NULL;
+
+	*is_new = false;
+
+	fd = open(filename, O_RDONLY);
+	if(fd < 0) {
+		if (errno == ENOENT) {
+			fd = open(filename, O_RDWR | O_CREAT, 0666);
+			if(fd < 0) {
+				SNDERR("Failed to open controls file: %s", filename);
+				return NULL;
+			}
+
+			prot |= PROT_WRITE;
+			*is_new = true;
+		} else {
+			SNDERR("Failed to open %s due to '%s'", filename, strerror(errno));
+			return NULL;
+		}
+	}
+
+	ret = fstat(fd, &statbuf);
+	if (ret == -1) {
+		SNDERR("Failed to get status of '%s' due to '%s'", filename, strerror(errno));
+		goto out;
+	}
+
+	if (statbuf.st_size < (off_t) length) {
+		/* this file is invalid, must be truncated and re-initialized later on */
+		close(fd);
+
+		fd = open(filename, O_RDWR | O_CREAT, 0666);
+		if(fd < 0) {
+			SNDERR("Failed to open controls file: %s", filename);
+			/* no need to close(fd), so just return */
+			return NULL;
+		}
+
+		ret = ftruncate(fd, length);
+		if (ret == -1) {
+			SNDERR("Failed to increase the size of '%s' due to '%s'", filename, strerror(errno));
+			goto out;
+		}
+
+		prot |= PROT_WRITE;
+		*is_new = true;
+	}
+
+	ptr = (LADSPA_Data*) mmap(NULL, length, prot, MAP_SHARED, fd, 0);
+	if(ptr == MAP_FAILED) {
+		SNDERR("Failed to mmap %s due to %s", filename, strerror(errno));
+		ptr = NULL;
+	}
+
+out:
+	close (fd);
+	return ptr;
+}
+
 static unsigned int snd_pcm_ladspa_count_ports(snd_pcm_ladspa_plugin_t *lplug,
                                                LADSPA_PortDescriptor pdesc)
 {
@@ -174,8 +246,11 @@ static int snd_pcm_ladspa_find_port_idx(unsigned int *res,
 
 static void snd_pcm_ladspa_free_io(snd_pcm_ladspa_plugin_io_t *io)
 {
-	free(io->controls);
-	free(io->controls_initialized);
+	if (io->controls_shared) {
+		munmap(io->controls, io->controls_size * sizeof(LADSPA_Data));
+	} else {
+		free(io->controls);
+	}
 }
 
 static void snd_pcm_ladspa_free_plugins(struct list_head *plugins)
@@ -186,6 +261,8 @@ static void snd_pcm_ladspa_free_plugins(struct list_head *plugins)
                 snd_pcm_ladspa_free_io(&plugin->output);
 		if (plugin->dl_handle)
 			dlclose(plugin->dl_handle);
+		if (plugin->controls_path)
+			free(plugin->controls_path);
 		free(plugin->filename);
 		list_del(&plugin->list);
 		free(plugin);
@@ -574,8 +651,6 @@ static int snd_pcm_ladspa_connect_controls(snd_pcm_ladspa_plugin_t *plugin,
 	for (idx = midx = 0; idx < plugin->desc->PortCount; idx++)
 		if ((plugin->desc->PortDescriptors[idx] & (io->pdesc | LADSPA_PORT_CONTROL)) == (io->pdesc | LADSPA_PORT_CONTROL)) {
 			if (io->controls_size > midx) {
-			        if (!io->controls_initialized[midx])
-			                snd_pcm_ladspa_get_default_cvalue(plugin->desc, idx, &io->controls[midx]);
 				plugin->desc->connect_port(instance->handle, idx, &io->controls[midx]);
 			} else {
 				return -EINVAL;
@@ -878,6 +953,10 @@ snd_pcm_ladspa_write_areas(snd_pcm_t *pcm,
         		snd_pcm_ladspa_plugin_t *plugin = list_entry(pos, snd_pcm_ladspa_plugin_t, list);
         		list_for_each(pos1, &plugin->instances) {
         			instance = list_entry(pos1, snd_pcm_ladspa_instance_t, list);
+				if (plugin->input.controls_shared) {
+					(void) snd_pcm_ladspa_connect_controls(plugin, &plugin->input, instance);
+				}
+				/* Skip output controls since they can not be changed dynamically */
         			for (idx = 0; idx < instance->input.channels.size; idx++) {
                                         chn = instance->input.channels.array[idx];
                                         data = instance->input.data[idx];
@@ -939,6 +1018,10 @@ snd_pcm_ladspa_read_areas(snd_pcm_t *pcm,
         		snd_pcm_ladspa_plugin_t *plugin = list_entry(pos, snd_pcm_ladspa_plugin_t, list);
         		list_for_each(pos1, &plugin->instances) {
         			instance = list_entry(pos1, snd_pcm_ladspa_instance_t, list);
+				if (plugin->input.controls_shared) {
+					(void) snd_pcm_ladspa_connect_controls(plugin, &plugin->input, instance);
+				}
+				/* Skip output controls since they can not be changed dynamically */
         			for (idx = 0; idx < instance->input.channels.size; idx++) {
                                         chn = instance->input.channels.array[idx];
                                         data = instance->input.data[idx];
@@ -1227,26 +1310,50 @@ static int snd_pcm_ladspa_add_default_controls(snd_pcm_ladspa_plugin_t *lplug,
 {
 	unsigned int count = 0;
 	LADSPA_Data *array;
-	unsigned char *initialized;
 	unsigned long idx;
+	unsigned long midx;
+	bool controls_shared = false;
+	bool is_new = true;
 
 	for (idx = 0; idx < lplug->desc->PortCount; idx++)
 		if ((lplug->desc->PortDescriptors[idx] & (io->pdesc | LADSPA_PORT_CONTROL)) == (io->pdesc | LADSPA_PORT_CONTROL))
 			count++;
-	array = (LADSPA_Data *)calloc(count, sizeof(LADSPA_Data));
-	if (!array)
-		return -ENOMEM;
-	initialized = (unsigned char *)calloc(count, sizeof(unsigned char));
-	if (!initialized) {
-		free(array);
-		return -ENOMEM;
+
+	/*
+	 * Only support to expose ladspa control array for input control ports
+	 */
+	if ((io->pdesc == LADSPA_PORT_INPUT) && lplug->controls_path && count != 0) {
+		array = mmap_ladspa_controls(lplug->controls_path, count * sizeof(LADSPA_Data), &is_new);
+		if (!array)
+			return -ENOMEM;
+		controls_shared = true;
+	} else {
+		array = (LADSPA_Data *)calloc(count, sizeof(LADSPA_Data));
+		if (!array)
+			return -ENOMEM;
+	}
+
+	if (is_new) {
+		/*
+		 * Initialize array of controls of this ladspa plugin with its
+		 * default values defined in this plugin implementation. This
+		 * array can be overrided by its alsa configuration files.
+		 */
+		for (idx = midx = 0; idx < lplug->desc->PortCount; idx++) {
+			if ((lplug->desc->PortDescriptors[idx] & (io->pdesc | LADSPA_PORT_CONTROL)) == (io->pdesc | LADSPA_PORT_CONTROL)) {
+				snd_pcm_ladspa_get_default_cvalue(lplug->desc, idx, &array[midx]);
+				midx++;
+			}
+		}
 	}
+
 	io->controls_size = count;
-	io->controls_initialized = initialized;
+	io->controls_new = is_new;
+	io->controls_shared = controls_shared;
 	io->controls = array;
 
 	return 0;
-}	
+}
 
 static int snd_pcm_ladspa_parse_controls(snd_pcm_ladspa_plugin_t *lplug,
 					 snd_pcm_ladspa_plugin_io_t *io,
@@ -1287,8 +1394,10 @@ static int snd_pcm_ladspa_parse_controls(snd_pcm_ladspa_plugin_t *lplug,
 			SNDERR("internal error");
 			return err;
 		}
-		io->controls_initialized[uval] = 1;
-		io->controls[uval] = (LADSPA_Data)dval;
+
+		if (io->controls_new) {
+			io->controls[uval] = (LADSPA_Data)dval;
+		}
 	}
 
 	return 0;
@@ -1429,7 +1538,7 @@ static int snd_pcm_ladspa_add_plugin(struct list_head *list,
 				     int reverse)
 {
 	snd_config_iterator_t i, next;
-	const char *label = NULL, *filename = NULL;
+	const char *label = NULL, *filename = NULL, *controls_path = NULL;
 	long ladspa_id = 0;
 	int err;
 	snd_pcm_ladspa_plugin_t *lplug;
@@ -1467,6 +1576,12 @@ static int snd_pcm_ladspa_add_plugin(struct list_head *list,
 			output = n;
 			continue;
 		}
+		if (strcmp(id, "controls") == 0) {
+			err = snd_config_get_string(n, &controls_path);
+			if (err < 0)
+				return err;
+			continue;
+		}
 		if (strcmp(id, "policy") == 0) {
 			const char *str;
 			err = snd_config_get_string(n, &str);
@@ -1496,6 +1611,11 @@ static int snd_pcm_ladspa_add_plugin(struct list_head *list,
 	lplug->input.pdesc = LADSPA_PORT_INPUT;
 	lplug->output.pdesc = LADSPA_PORT_OUTPUT;
 	INIT_LIST_HEAD(&lplug->instances);
+	if (controls_path) {
+		lplug->controls_path = strdup(controls_path);
+	} else {
+		lplug->controls_path = NULL;
+	}
 	if (filename) {
 		err = snd_pcm_ladspa_check_file(lplug, filename, label, ladspa_id);
 		if (err < 0) {
@@ -1692,6 +1812,7 @@ pcm.name {
 			[label STR]	# LADSPA plugin label (for example 'delay_5s')
 			[filename STR]	# Full filename of .so library with LADSPA plugin code
 			[policy STR]	# Policy can be 'none' or 'duplicate'
+			[controls STR]	# Path (directory) with controls for this plugin
 			input | output {
 				bindings {
 					C INT or STR	# C - channel, INT - audio port index, STR - audio port name
-- 
2.20.1

