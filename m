Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C58C464E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:39:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2587F1;
	Mon, 13 May 2024 19:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2587F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621983;
	bh=9OE/14Txm8aXh36Jq+hSFTjslOY8o75MZHgMuNfCtzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3NcyyuYPKLGx/GMXoGvSHJyGPw2GKAWgbq7P5F1XHOng76FbyrBtbfpGQ1W7H/2A
	 Oc9bAyDpLN8JBQGQtbNB+mSYremFieX7CAc1dUpPHo/38wTU890PJTPY7jd3n42Qmm
	 MFkACOTeSzWshEpYa60u2IHvD4EEXQ8DGN8/kCSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3F8F80681; Mon, 13 May 2024 19:38:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D627FF80689;
	Mon, 13 May 2024 19:38:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A19CFF805AF; Mon, 13 May 2024 19:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D35FFF800E2;
	Mon, 13 May 2024 19:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D35FFF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=gD8obcW1
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcPsL82R; Mon, 13 May 2024 19:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621865;
	bh=gwrzcGjxkeip9bzIrX/+Ukodp6IKjva1jKsX16KOX4Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gD8obcW16mCMoDFz7RHcqZs7l87rOrifGN6K+j5KMXrj9kPV7yPVGw7fCKw8G2+vu
	 p8Q9MUoLJoW6bv/CU2Cpz2KjWbbM7UApwJTa17j5I6BKlr1naAOAzi6Kr0aGoMvjxX
	 kGqUU7uoQ2rewDsEnUHUWNoHAIk/7KTHcDceLosN5iW9EBl0hp3TedYZRsNOXGh1lq
	 GrzDeqBOxx99uIXvMLZmYZP6QFZBAqeF6bxW1AVjsHrtvIfGCnBiAuAvFgnVUJuLC0
	 8tiv0RNEM+pd6RHnaYwbQJr5hHVRCvkrwr0+CKHV3dZ0JFLqIFLFhyAdu0r4N4AxuY
	 ipu2cmYzo+OhQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:45 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 6/6] const_structs.checkpatch: add snd_soc_tplg_ops
Date: Mon, 13 May 2024 19:37:25 +0200
Message-ID: 
 <6936369a414077265c11115c98364ae21e3cbdda.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7HKJC3FGZYFKTYNYCAD6MRQT4IWAO6F6
X-Message-ID-Hash: 7HKJC3FGZYFKTYNYCAD6MRQT4IWAO6F6
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HKJC3FGZYFKTYNYCAD6MRQT4IWAO6F6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that the soc-topology can handle "const struct snd_soc_tplg_ops" make
sure that new usages of the struct already enter the tree as const.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 scripts/const_structs.checkpatch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/const_structs.checkpatch b/scripts/const_structs.checkpatch
index fa96cfd16e99..bae41780bd39 100644
--- a/scripts/const_structs.checkpatch
+++ b/scripts/const_structs.checkpatch
@@ -78,6 +78,7 @@ snd_rawmidi_ops
 snd_soc_component_driver
 snd_soc_dai_ops
 snd_soc_ops
+snd_soc_tplg_ops
 soc_pcmcia_socket_ops
 stacktrace_ops
 sysfs_ops
-- 
2.45.0

