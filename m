Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E88C4641
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163296C1;
	Mon, 13 May 2024 19:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163296C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621916;
	bh=WdpcdrePfNwFsbix0el9X+8Z4a1fgWVJwTo9rg3XJJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yn89szIuGIdBfBzDruZNNHDVG77lLtwJ71q41vzOc7ywu9gAFwvbqgX7VmKAGUvvk
	 iWVtT4BaY+ES7eUdO+HdMoLHZwif9583VF7CejQE5sLfUtLA0IoCCKJl+eDPl6Zgwz
	 f14pMupQ35l9hAS8MB0H1KQOw0xQ+mewMSn7Mw5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDD98F805C3; Mon, 13 May 2024 19:37:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8407F805B3;
	Mon, 13 May 2024 19:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17092F800E9; Mon, 13 May 2024 19:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (out-69.smtpout.orange.fr
 [193.252.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDADF800E9;
	Mon, 13 May 2024 19:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDADF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=ES/EOgJ9
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcIsL80i; Mon, 13 May 2024 19:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621859;
	bh=1XoI0qrkb16jr4M55oFmdJGGB7I4eLKt6bnnOAdsEJI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ES/EOgJ9+o9BPNKuuyYur0AGTIYX0XLGxXu2HluR7bjjtu66uy6rWHVo/iKF3pU6y
	 JKm8sxRQdmfgDD+XHlvwH2DntmE4uF+hgUONv6Fm9DVXj+7xJx/fxE9u4xsDv9LPeS
	 v7BsukwIRkRJyPM1aXye/w95YCk+GS974eSBzFDfL7UVUw37BZBFvLusX7U1Ub68j+
	 +rZrfOifHQCi6Z+/ddV6+kmhlsmaBFUJT2FHLjGLBTQASPoijThCxFctm3OcdLxOdU
	 TWuJqJCJTUBqR8qdb00OEtPkmTi+UFBkrCfMVMg4IjWlGu9pa38fiHwTr5d0/OrP4o
	 0UPNRn9pa9/9A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:39 +0200
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
Subject: [PATCH 2/6] ASoC: Intel: avs: Constify struct snd_soc_tplg_ops
Date: Mon, 13 May 2024 19:37:21 +0200
Message-ID: 
 <01de0157088de0475970c79738284d6c86d702fe.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KRQHBT5NFXQK54SO37ZVRKKYGEA7LEAW
X-Message-ID-Hash: KRQHBT5NFXQK54SO37ZVRKKYGEA7LEAW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRQHBT5NFXQK54SO37ZVRKKYGEA7LEAW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Constifying "struct snd_soc_tplg_ops" moves some data to a read-only
section, so increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  28046	    794	      0	  28840	   70a8	sound/soc/intel/avs/topology.o

After:
   text	   data	    bss	    dec	    hex	filename
  28206	    614	      0	  28820	   7094	sound/soc/intel/avs/topology.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 sound/soc/intel/avs/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 02bae207f6ec..35381a835c93 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1889,7 +1889,7 @@ avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_
 	return 0;
 }
 
-static struct snd_soc_tplg_ops avs_tplg_ops = {
+static const struct snd_soc_tplg_ops avs_tplg_ops = {
 	.io_ops			= avs_control_ops,
 	.io_ops_count		= ARRAY_SIZE(avs_control_ops),
 	.control_load		= avs_control_load,
-- 
2.45.0

