Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCB1A8FD1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 02:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7841670;
	Wed, 15 Apr 2020 02:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7841670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586911608;
	bh=MIFbLLsQWp269Xzn44zyUOw4QjOlLllwg+2W4ocF7cw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KBwaYVuaK8ganS6g4cwv8QNNH3y5y6bef5RSPsLw1tKCpKFTmgOxMApkeR+5Nxq2C
	 h7nfRiec5dYM4Vab+xoIzNav6D89P5XKIPtT23Qd+z1QSDhQy6iqAALvSU4/jUk72C
	 84e8PjdEV+ETclB0E/l+tdL8/9IsTQMllpZzLTA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E25F0F800B9;
	Wed, 15 Apr 2020 02:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 876D2F8013D; Wed, 15 Apr 2020 02:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFA8AF800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 02:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFA8AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TgJt1Ek8"
Received: by mail-wm1-x344.google.com with SMTP id h2so15278361wmb.4
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=da5vaFjSMeegtBHCMhBjxA2leXTbBVrGPC89YU84XVU=;
 b=TgJt1Ek8B2hWfOzcbyZgtFWI8S0RCh61oFBPykC3mfYswG6y7tE7MiPiuOGKnEVqiC
 VH1+VbkzgepA5c/9rpsDn4ob5Dx5p3wvBU7j3fvNPloqEhjaXat7iX0nbE9EtNZWXrOl
 cGDwc8x/h3AYODBGMl4z5RofzIi3vtT04hAAGheA1sntU93m0QUuSL4BqQprwZUsDHGh
 kEXEzYSQ39Iz+PkBcf/5SNiX0u39EOK3Ykjyw2qWv0hdxOag5fqRXE4d7FvY4ZKbcWpu
 f6SfbAjINTwd5PovXaaVg/fIR3EFmiyxBx4Mqp4ygLAhQwIKFWLkUNFfzMe6JTqVb1JQ
 V9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=da5vaFjSMeegtBHCMhBjxA2leXTbBVrGPC89YU84XVU=;
 b=X6K6yEXBt/PNavoh1QZ3jcwGjg9aVQ+J+4d2q7XdX5Y+uchP/j1/T8opfJ0u5ko9DS
 +bOzwtz+5wzN75zubnEhdqPN4bavj5qCn6J9hKecIFZzrvz27HF0fjLztYSvyzdQAFCg
 CoBiIpxjvEZpG11u7aH0y72AXYMyabj9uQPfH8qeudF/f9v2DfFbAHt2TWf5i1O5I4ml
 ABThFG6tV60AOOLYmUafz6U6pBqNdsukRotlla0mlaO4dEsb9RD6e58mPTbClHuP2adn
 OUSAW4R7wVe1+RkxLrXARjhzGlweeNclr+7BDB/+b8gSAy84iM1noYkScPaw4gA4bAFZ
 XcQg==
X-Gm-Message-State: AGi0PubgKvtOmRcmPmTHDcldWQ2GfCXXoRz1ZrBG8OEB4gW6cXb7CEJL
 1fAfPm1M+PmLdlg1v0uShkVbK86h
X-Google-Smtp-Source: APiQypKHvv8PQ4VFa39BtbcJrw8JIupCq/Qx400q0MUAplaY8nBJKZx7oSka7vjKGcv718YrD/NQYQ==
X-Received: by 2002:a1c:384:: with SMTP id 126mr2455481wmd.58.1586911493346;
 Tue, 14 Apr 2020 17:44:53 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i129sm21548158wmi.20.2020.04.14.17.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 17:44:52 -0700 (PDT)
Date: Wed, 15 Apr 2020 00:44:39 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] fix sw_params handling of timestamp types in direct plugins
Message-ID: <20200415004439.GA4480@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

In pcms using direct plugins (dmix/dsnoop/dshare), the timestamp type could
be different from the terminating hw plugin, then the kernel driver.

Be sure such pcms have plugins using consistently the same timestamp type.

signed-off-by: Sylvain Bertrand <sylvain.bertrand@legeek.net>
---
 src/conf/alsa.conf       |  1 +
 src/conf/pcm/dmix.conf   |  4 ++++
 src/conf/pcm/dsnoop.conf |  4 ++++
 src/pcm/pcm_direct.c     | 36 +++++++++++++++++++++++++++++++++++-
 src/pcm/pcm_direct.h     |  2 ++
 src/pcm/pcm_dmix.c       |  4 ++++
 src/pcm/pcm_dshare.c     |  4 ++++
 src/pcm/pcm_dsnoop.c     |  4 ++++
 src/pcm/pcm_local.h      |  2 ++
 9 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/src/conf/alsa.conf b/src/conf/alsa.conf
index a091b810..0e01c887 100644
--- a/src/conf/alsa.conf
+++ b/src/conf/alsa.conf
@@ -69,6 +69,7 @@ defaults.pcm.minperiodtime 5000		# in us
 defaults.pcm.ipc_key 5678293
 defaults.pcm.ipc_gid audio
 defaults.pcm.ipc_perm 0660
+defaults.pcm.tstamp_type "default"
 defaults.pcm.dmix.max_periods 0
 defaults.pcm.dmix.channels 2
 defaults.pcm.dmix.rate 48000
diff --git a/src/conf/pcm/dmix.conf b/src/conf/pcm/dmix.conf
index 7fa5c8b2..50e573da 100644
--- a/src/conf/pcm/dmix.conf
+++ b/src/conf/pcm/dmix.conf
@@ -56,6 +56,10 @@ pcm.!dmix {
 		@func refer
 		name defaults.pcm.ipc_perm
 	}
+	tstamp_type {
+		@func refer
+		name defaults.pcm.tstamp_type
+	}
 	slave {
 		pcm {
 			type hw
diff --git a/src/conf/pcm/dsnoop.conf b/src/conf/pcm/dsnoop.conf
index abbd44f7..f4336e5f 100644
--- a/src/conf/pcm/dsnoop.conf
+++ b/src/conf/pcm/dsnoop.conf
@@ -49,6 +49,10 @@ pcm.!dsnoop {
 		@func refer
 		name defaults.pcm.ipc_perm
 	}
+	tstamp_type {
+		@func refer
+		name defaults.pcm.tstamp_type
+	}
 	slave {
 		pcm {
 			type hw
diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 54d99005..aa60a477 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -991,8 +991,11 @@ int snd_pcm_direct_hw_free(snd_pcm_t *pcm ATTRIBUTE_UNUSED)
 	return 0;
 }
 
-int snd_pcm_direct_sw_params(snd_pcm_t *pcm ATTRIBUTE_UNUSED, snd_pcm_sw_params_t * params ATTRIBUTE_UNUSED)
+int snd_pcm_direct_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 {
+	if (params->tstamp_type != pcm->tstamp_type)
+		return -EINVAL;
+
 	/* values are cached in the pcm structure */
 	return 0;
 }
@@ -1318,6 +1321,15 @@ int snd_pcm_direct_initialize_slave(snd_pcm_direct_t *dmix, snd_pcm_t *spcm, str
 		return ret;
 	}
 
+	if (dmix->tstamp_type != -1) {
+		ret = snd_pcm_sw_params_set_tstamp_type(spcm, &sw_params,
+							dmix->tstamp_type);
+		if (ret < 0) {
+			SNDERR("unable to set tstamp type");
+			return ret;
+		}
+	}
+
 	if (dmix->type != SND_PCM_TYPE_DMIX &&
 	    dmix->type != SND_PCM_TYPE_DSHARE)
 		goto __skip_silencing;
@@ -1878,6 +1890,7 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 	rec->var_periodsize = 0;
 	rec->direct_memory_access = 1;
 	rec->hw_ptr_alignment = SND_PCM_HW_PTR_ALIGNMENT_AUTO;
+	rec->tstamp_type = -1;
 
 	/* read defaults */
 	if (snd_config_search(root, "defaults.pcm.dmix_max_periods", &n) >= 0) {
@@ -1941,6 +1954,27 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 			continue;
 		}
+		if (strcmp(id, "tstamp_type") == 0) {
+			const char *str;
+			err = snd_config_get_string(n, &str);
+			if (err < 0) {
+				SNDERR("Invalid type for %s", id);
+				return -EINVAL;
+			}
+			if (strcmp(str, "default") == 0)
+				rec->tstamp_type = -1;
+			else if (strcmp(str, "gettimeofday") == 0)
+				rec->tstamp_type = SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY;
+			else if (strcmp(str, "monotonic") == 0)
+				rec->tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC;
+			else if (strcmp(str, "monotonic_raw") == 0)
+				rec->tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW;
+			else {
+				SNDERR("The field tstamp_type is invalid : %s", str);
+				return -EINVAL;
+			}
+			continue;
+		}
 		if (strcmp(id, "ipc_gid") == 0) {
 			char *group;
 			char *endp;
diff --git a/src/pcm/pcm_direct.h b/src/pcm/pcm_direct.h
index 221edbe1..8a236970 100644
--- a/src/pcm/pcm_direct.h
+++ b/src/pcm/pcm_direct.h
@@ -173,6 +173,7 @@ struct snd_pcm_direct {
 	unsigned int recoveries;	/* mirror of executed recoveries on slave */
 	int direct_memory_access;	/* use arch-optimized buffer RW */
 	snd_pcm_direct_hw_ptr_alignment_t hw_ptr_alignment;
+	int tstamp_type;		/* cached from conf, can be -1(default) on top of real types */
 	union {
 		struct {
 			int shmid_sum;			/* IPC global sum ring buffer memory identification */
@@ -357,6 +358,7 @@ struct snd_pcm_direct_open_conf {
 	int var_periodsize;
 	int direct_memory_access;
 	snd_pcm_direct_hw_ptr_alignment_t hw_ptr_alignment;
+	int tstamp_type;
 	snd_config_t *slave;
 	snd_config_t *bindings;
 };
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index d533f40c..843fa316 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -1038,6 +1038,7 @@ int snd_pcm_dmix_open(snd_pcm_t **pcmp, const char *name,
 	dmix->ipc_key = opts->ipc_key;
 	dmix->ipc_perm = opts->ipc_perm;
 	dmix->ipc_gid = opts->ipc_gid;
+	dmix->tstamp_type = opts->tstamp_type;
 	dmix->semid = -1;
 	dmix->shmid = -1;
 
@@ -1237,6 +1238,9 @@ pcm.name {
 				# roundup
 				# rounddown
 				# auto (default)
+	tstamp_type STR		# timestamp type
+				# STR can be one of the below strings :
+				# default, gettimeofday, monotonic, monotonic_raw
 	slave STR
 	# or
 	slave {			# Slave definition
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 59448cfb..6a99452b 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -723,6 +723,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 	dshare->ipc_key = opts->ipc_key;
 	dshare->ipc_perm = opts->ipc_perm;
 	dshare->ipc_gid = opts->ipc_gid;
+	dshare->tstamp_type = opts->tstamp_type;
 	dshare->semid = -1;
 	dshare->shmid = -1;
 
@@ -929,6 +930,9 @@ pcm.name {
 		# roundup
 		# rounddown
 		# auto (default)
+	tstamp_type STR		# timestamp type
+				# STR can be one of the below strings :
+				# default, gettimeofday, monotonic, monotonic_raw
 	slave STR
 	# or
 	slave {			# Slave definition
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 24f472c7..c64df381 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -591,6 +591,7 @@ int snd_pcm_dsnoop_open(snd_pcm_t **pcmp, const char *name,
 	dsnoop->ipc_key = opts->ipc_key;
 	dsnoop->ipc_perm = opts->ipc_perm;
 	dsnoop->ipc_gid = opts->ipc_gid;
+	dsnoop->tstamp_type = opts->tstamp_type;
 	dsnoop->semid = -1;
 	dsnoop->shmid = -1;
 
@@ -780,6 +781,9 @@ pcm.name {
 		# roundup
 		# rounddown
 		# auto (default)
+	tstamp_type STR		# timestamp type
+				# STR can be one of the below strings :
+				# default, gettimeofday, monotonic, monotonic_raw
 	slave STR
 	# or
 	slave {			# Slave definition
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index 05ed935f..89d4125b 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -928,6 +928,8 @@ int INTERNAL(snd_pcm_hw_params_set_buffer_size_last)(snd_pcm_t *pcm, snd_pcm_hw_
 
 int snd_pcm_sw_params_set_tstamp_mode(snd_pcm_t *pcm, snd_pcm_sw_params_t *params, snd_pcm_tstamp_t val);
 int INTERNAL(snd_pcm_sw_params_get_tstamp_mode)(const snd_pcm_sw_params_t *params, snd_pcm_tstamp_t *val);
+int snd_pcm_sw_params_set_tstamp_type(snd_pcm_t *pcm, snd_pcm_sw_params_t *params, snd_pcm_tstamp_type_t val);
+int snd_pcm_sw_params_get_tstamp_type(const snd_pcm_sw_params_t *params, snd_pcm_tstamp_type_t *val);
 int snd_pcm_sw_params_set_avail_min(snd_pcm_t *pcm, snd_pcm_sw_params_t *params, snd_pcm_uframes_t val);
 int INTERNAL(snd_pcm_sw_params_get_avail_min)(const snd_pcm_sw_params_t *params, snd_pcm_uframes_t *val);
 int snd_pcm_sw_params_set_start_threshold(snd_pcm_t *pcm, snd_pcm_sw_params_t *params, snd_pcm_uframes_t val);
