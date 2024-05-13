Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D98C464C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC4A206;
	Mon, 13 May 2024 19:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC4A206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621968;
	bh=mmp/3E5t0JWgl4/OYoYB0/Z3Zg7EBCcBulwzfpIlR2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OrhxF/TSPCCTdvuDEdNszBvtZUYIPjahSfNsUNnZr+7Q28CGzd9jPgFLTCnYowCky
	 bSriil13XC+uj9KZwEZmaHXzm0tVfONpyv271/QsCRjsKg3Uzvz+nsk444fZLjeAjG
	 tLLGsG3Kg6AiHuoEYJRfiK5Fa+HLSxs8P3dFYwC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8097AF80632; Mon, 13 May 2024 19:38:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C46DF805FE;
	Mon, 13 May 2024 19:38:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C284F8025F; Mon, 13 May 2024 19:37:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8677BF8024C;
	Mon, 13 May 2024 19:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8677BF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=W1sQ4L4K
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcMsL81f; Mon, 13 May 2024 19:37:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621863;
	bh=A26Rl7MtM3B51oWgHFeoUVOcPLJ5BY3Z+dYCWIU7CTA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=W1sQ4L4KZKDLj0JG8sMTDYYCXP31N2hT7k41A6sBY2Z8c0LmZkf9HmTV/yO2SncVE
	 fgorRdt1du9JSEGgtxOsjW91X/7ATkARIMK+pmfb4WbV5x5hzRPtusgNdtVHouDF3L
	 OqZrK0UvU6SQ01Fi6g0FG6FOTaZCiJYN0Gf9HnzRQi9gSWxCC0eUxSXeKuAXU4mWy6
	 4YJe+ZsrlXunh3/sPF2VAAlGiwUES0zAWQEt38sO9Ba/mnlhnzUWeKbsfmSIp373kF
	 bygSM8HADDUbJfdv1hbyvQ+HVlzyFBhQ6LoWuQd0F44GMSmFGRJHgiwtSqXZQVu79B
	 mp4n6S/LpS+PA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:43 +0200
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
Subject: [PATCH 4/6] ASoC: Intel: Skylake: Constify struct snd_soc_tplg_ops
Date: Mon, 13 May 2024 19:37:23 +0200
Message-ID: 
 <48f096b6dc617ecf3ca53211c2a696a4df33b21a.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6AYQV6DTEHTZQSXGKF7G47TB4QTGIVA
X-Message-ID-Hash: Q6AYQV6DTEHTZQSXGKF7G47TB4QTGIVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6AYQV6DTEHTZQSXGKF7G47TB4QTGIVA/>
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
  58844	   5282	     56	  64182	   fab6	sound/soc/intel/skylake/skl-topology.o

After:
   text	   data	    bss	    dec	    hex	filename
  59004	   5122	     56	  64182	   fab6	sound/soc/intel/skylake/skl-topology.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index e27f0fc3d897..602ef4321122 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3470,7 +3470,7 @@ static int skl_tplg_complete(struct snd_soc_component *component)
 	return 0;
 }
 
-static struct snd_soc_tplg_ops skl_tplg_ops  = {
+static const struct snd_soc_tplg_ops skl_tplg_ops = {
 	.widget_load = skl_tplg_widget_load,
 	.control_load = skl_tplg_control_load,
 	.bytes_ext_ops = skl_tlv_ops,
-- 
2.45.0

