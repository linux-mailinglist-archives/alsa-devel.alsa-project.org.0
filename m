Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E919C964
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 21:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A87A167F;
	Thu,  2 Apr 2020 21:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A87A167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585854353;
	bh=3Q/m9T1FmSl2OUtLhcrLE3ExFWzA3nvOnUpwLvZu2rg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tu/wuOJnePT5VxM7V9ud8FYh3srMI3WrNVEQgNHmKNSJBDKdhH6ViamUOOBV7wit7
	 UvVT8tr9nUH33EL6HBgI4Hn5UX/BHXz17/q6kPfp6qzjbmry9DBYogLeUawd0lqPwH
	 Bi8Pxz7Ir5CJVg2C4EfAyZ5TBhJY+sLRqiF+5QhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9DCF80088;
	Thu,  2 Apr 2020 21:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F2B2F80148; Thu,  2 Apr 2020 21:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA788F80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 21:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA788F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TzdFMN8M"
Received: by mail-wm1-x344.google.com with SMTP id t128so4621928wma.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Apr 2020 12:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v7J817YYvA8cs69mJucFAsCVzyWj3oMWObEDTbDgz48=;
 b=TzdFMN8MOPc5M5pqUmLqRNfa6AvTad8z/uK7SDDUhQ8DhCCHrkAzSJxTPLYo2rpJOi
 XbSxmtIRXPn1hiu2Kq0slfL0MzEOTV0djOWrL1hmQ81+egUDFi4ZBbTRSu6RgNQgio7o
 hfg7glexZzIDCibK/oUc5JBxvhvrDMwperkKt9nKuw9Mr9QhrUnoiZ7nPR6JNghE4paE
 wDsU3hIZi7BXtKxuhJo2THD9ML3gLdDjmp2qMvP3TxdVj+4NNfh9g1/j+VBY18xK/3uN
 cEKEOn3hPkzVWoUtl+LXLBw4GGLGOnn7zfw3lKcUzH4/prPydx8FqYT4EvNphCE9+gG7
 N/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v7J817YYvA8cs69mJucFAsCVzyWj3oMWObEDTbDgz48=;
 b=rfIMYGH+WtBlQTTxHqgLg6lk9Yw36L8gQsbC/gueQM51XsyiLkFl092ZMI3onV7oiA
 hfWY4DEAhyHbi+WCl1jbnVdeL7bQW4YvmX0J2QBuD33bPU9x/sBir21yD+bgrly2HxqY
 YwCYi2sF2D4l10SIbY36iQu/XEN2lwtU887yB2v67hHFezNTCZeeGR2GXhQ4iG7cKfFH
 zTtDAuR1voS22I1XV9RBXefMMSjMwseE6VydgZVexVHzIguXJK2KoV+h1aWXDXtADEw2
 Sutf/BR/smeSmiuq8JQ/TrLvvCdJxulr6zRVilSvoElz7uoOgQlcp4OVRbR2bNLbw9LN
 9CKw==
X-Gm-Message-State: AGi0PuYF/RC8xm3xLpibrYLS81u9MW0vpymFGpmkMvOiK7VsZl0Dduol
 A5IDv6vaVWk/Ql06vGqcSqs=
X-Google-Smtp-Source: APiQypKy+JP/qDViGnQ3gXbZK8M+YYx5C80aXqlWw1YpkSqYbXnhR5C4RsZlU1UEX14+LzcNeOfSuQ==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr4558877wma.114.1585854244364; 
 Thu, 02 Apr 2020 12:04:04 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id n124sm8514698wma.11.2020.04.02.12.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 12:04:03 -0700 (PDT)
Date: Thu, 2 Apr 2020 19:03:26 +0000
From: sylvain.bertrand@gmail.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200402190326.GA12391@freedom>
References: <20200328182624.GA775@freedom>
 <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
 <20200328203744.GA2398@freedom>
 <59266c58-96d8-93e9-bc8f-86e9fccf8d60@linux.intel.com>
 <20200328222021.GA4610@freedom> <s5hr1xbd2su.wl-tiwai@suse.de>
 <s5hlfng7oaj.wl-tiwai@suse.de> <20200401152538.GA11377@freedom>
 <s5hwo6z2o3r.wl-tiwai@suse.de> <20200401202126.GA9511@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401202126.GA9511@freedom>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org,
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

On Wed, Apr 01, 2020 at 08:21:26PM +0000, sylvain.bertrand@gmail.com wrote:
> For the first case, in pcm_params.c:_snd_pcm_hw_params_internal, it seems that
> "valid" default sw_params for a plugin pipeline should be made sort of
> recursive or "something else".

Ok, I found what was wrong: the "recursion" is kind of already done for
pcm->tstamp_type, then it seems we only need to check directly
pcm(direct)->tstamp_type at sw_params installation.

I fixed the patch, and started to test.

regards,

Sylvain

---

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
