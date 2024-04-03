Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A3896A54
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C492C74;
	Wed,  3 Apr 2024 11:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C492C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135879;
	bh=iYFpr2MqS0B9WjuWG5dfN8QG1tQ6E7J2EnZtahGh85I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ovJbqCjMr2UDCVkd4djfvX+IeIjPP/AaIdlF75pfiVFnhSjHs4GnPVPhQP8JwXJtM
	 wrqyM6c6YAV9d8hCriX4FMnSTnePgQlVDkKGqYMcVJuGL2KoJmmTMEtJychnelRnC0
	 dZkm9zu6unStxzvbgL8fk6C/EMNZTsxEKmxQggZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67A1F805AD; Wed,  3 Apr 2024 11:17:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E78F805A0;
	Wed,  3 Apr 2024 11:17:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C07AF8020D; Wed,  3 Apr 2024 11:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D6E9F80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D6E9F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kMxQ/msn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135705; x=1743671705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iYFpr2MqS0B9WjuWG5dfN8QG1tQ6E7J2EnZtahGh85I=;
  b=kMxQ/msnzyhiaeO29JNjsGbtm7tPnewqYTAOqvdmjAVo8Hny2EmJ3Txa
   qbOMB4uu26R9RIFd39KSjSuZ+9AqCmGFkKvCPvXwjp6PFzXBW5k29Ws2o
   NVfXsJZ0j8Vu5ZcbSIpdrw87v//u3zpaAcoEc/jvFjyHXoWX/LFkrm4JQ
   CnIs8lNvw9HYWRlhjt493eDRw0dLt1FW6mu+owvyb4eSi3+m9o5zxEgVG
   q5XzsA7k97aMFE7aaV5z6AzCej2jRRFZTSOQhN7drd/6V/jBucSk8IgD4
   IM/rLnzKijIGGLvfwDYd1+6wupzlw+WCoGbjfZkmQM7t2DxCVI/6Q2ks2
   w==;
X-CSE-ConnectionGUID: kugzD/rFTz2hkAtXSpz6nA==
X-CSE-MsgGUID: Vgxdx4nZQhqrRd1Fs6KvMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322568"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="10322568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:15:00 -0700
X-CSE-ConnectionGUID: slL1i1sHQiu17QNQsuEyzw==
X-CSE-MsgGUID: plvU+xOBR0C+wzO6jAn6dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18410517"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/4] ASoC: topology: Cleanup after ABI v4 support removal
Date: Wed,  3 Apr 2024 11:16:28 +0200
Message-Id: <20240403091629.647267-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MPRGTREJPHZLDXPXSYYXC5FYHAXL6VI7
X-Message-ID-Hash: MPRGTREJPHZLDXPXSYYXC5FYHAXL6VI7
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPRGTREJPHZLDXPXSYYXC5FYHAXL6VI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Flag 'abi_match' along with several other local variables has no purpose
with v4 related members removed.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 47 +++++++++-------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e73dc4e786ff..90ca37e008b3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1771,11 +1771,10 @@ static int soc_tplg_pcm_create(struct soc_tplg *tplg,
 static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_pcm *pcm, *_pcm;
+	struct snd_soc_tplg_pcm *pcm;
 	int count;
 	int size;
 	int i;
-	bool abi_match;
 	int ret;
 
 	count = le32_to_cpu(hdr->count);
@@ -1805,24 +1804,15 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 		if (size != sizeof(*pcm))
 			return -EINVAL;
 
-		abi_match = true;
-		_pcm = pcm;
-
 		/* create the FE DAIs and DAI links */
-		ret = soc_tplg_pcm_create(tplg, _pcm);
-		if (ret < 0) {
-			if (!abi_match)
-				kfree(_pcm);
+		ret = soc_tplg_pcm_create(tplg, pcm);
+		if (ret < 0)
 			return ret;
-		}
 
 		/* offset by version-specific struct size and
 		 * real priv data size
 		 */
-		tplg->pos += size + le32_to_cpu(_pcm->priv.size);
-
-		if (!abi_match)
-			kfree(_pcm); /* free the duplicated one */
+		tplg->pos += size + le32_to_cpu(pcm->priv.size);
 	}
 
 	dev_dbg(tplg->dev, "ASoC: adding %d PCM DAIs\n", count);
@@ -2003,11 +1993,10 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_link_config *link, *_link;
+	struct snd_soc_tplg_link_config *link;
 	int count;
 	int size;
 	int i, ret;
-	bool abi_match;
 
 	count = le32_to_cpu(hdr->count);
 
@@ -2032,23 +2021,14 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 		if (size != sizeof(*link))
 			return -EINVAL;
 
-		abi_match = true;
-		_link = link;
-
-		ret = soc_tplg_link_config(tplg, _link);
-		if (ret < 0) {
-			if (!abi_match)
-				kfree(_link);
+		ret = soc_tplg_link_config(tplg, link);
+		if (ret < 0)
 			return ret;
-		}
 
 		/* offset by version-specific struct size and
 		 * real priv data size
 		 */
-		tplg->pos += size + le32_to_cpu(_link->priv.size);
-
-		if (!abi_match)
-			kfree(_link); /* free the duplicated one */
+		tplg->pos += size + le32_to_cpu(link->priv.size);
 	}
 
 	return 0;
@@ -2161,8 +2141,7 @@ static int soc_tplg_dai_elems_load(struct soc_tplg *tplg,
 static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 				  struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_manifest *manifest, *_manifest;
-	bool abi_match;
+	struct snd_soc_tplg_manifest *manifest;
 	int ret = 0;
 
 	manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
@@ -2171,15 +2150,9 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	if (le32_to_cpu(manifest->size) != sizeof(*manifest))
 		return -EINVAL;
 
-	abi_match = true;
-	_manifest = manifest;
-
 	/* pass control to component driver for optional further init */
 	if (tplg->ops && tplg->ops->manifest)
-		ret = tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
-
-	if (!abi_match)	/* free the duplicated one */
-		kfree(_manifest);
+		ret = tplg->ops->manifest(tplg->comp, tplg->index, manifest);
 
 	return ret;
 }
-- 
2.25.1

