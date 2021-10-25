Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D0439AD3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 17:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDA2116CE;
	Mon, 25 Oct 2021 17:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDA2116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635177022;
	bh=inCvvS/AnJJKQmtZDKIVGROYfRHo1VVVmFid8jU5CB8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vaGpSsw7GI5wy7hN8zDO+67/wDK/gMrPdth+oSh5VOZJ2tdycyWzvx+ZXDnmECqbt
	 yEFn2hh7t8diZBYJktOVpqhTOHA9aQmlRMLwYBKJVfkD7Iw+5G17tX6zBnBnxcmF94
	 rnnZP1Qzo1l0q4K82DV4ileTuUp3sUEImLnFIZB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F58F8025E;
	Mon, 25 Oct 2021 17:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0191F8025A; Mon, 25 Oct 2021 17:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DDF1F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 17:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDF1F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUmaFOwY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 814CF60184;
 Mon, 25 Oct 2021 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635176933;
 bh=inCvvS/AnJJKQmtZDKIVGROYfRHo1VVVmFid8jU5CB8=;
 h=From:To:Cc:Subject:Date:From;
 b=XUmaFOwY58E8Qk82Bl/5BThYCHoDalthXPHGQJr+hS5QBMwmfdfr3Qo8r5Ioa3one
 PPdJSssnvro+p1yaK3bA63/LyYJdFstc7V68JK/WpCqz/MSOxugwLpyLxr+aWUWN0M
 Qj8nV6l48AoDaaDu2lFg950J5OAHpi1gMlPop8V3E3RyydIoHCL3raSoYBMAmaYNv1
 iZIbYJmW1SoS/QLz6qyQbGwqukwNwEkL20RSB5wlp89YUdUdfM4CNdv4QO8yb7k3Ew
 Ws2LkXCa255Ozdh3rqDThmn7UDq/HPBkFSimp7SCfdcJpXrcZwG6ZTS/LOgrPJxX9A
 GatOcGBptnukQ==
From: Mark Brown <broonie@kernel.org>
To: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: topology: Fix stub for snd_soc_tplg_component_remove()
Date: Mon, 25 Oct 2021 16:48:44 +0100
Message-Id: <20211025154844.2342120-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; h=from:subject;
 bh=inCvvS/AnJJKQmtZDKIVGROYfRHo1VVVmFid8jU5CB8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhdtGK+KLpu3/dAsso4RzENvDGwfQ9270UCtS91Z1x
 WG90kIyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYXbRigAKCRAk1otyXVSH0GYjB/
 48wEswpAdtAXXhDKHsnajgCbri1ptnWimjQlfnFKaV4qClfd2hVRvDbNB5mx8ATha5P5oXHbtdeRom
 DD628yBh1B6Wx5HLTfOaNUe0ezJJn7Rm5ObAQPqpWd32Qk9RXSuOjdgFbUVP+Vt/fJ6kul8iojY8vo
 w+JbbCdmbVJcjRWfQvH4cDZ4fZ0FmFgVxW27Prw1X0mT4PpUW2aUkhW/e5PQCAxNZBbYblwzKK8jTS
 rKJyqKtvM4yJhEtKzgCHz/qoJghb4ZiPhDwOcwn5cWmnyOAIstPjDVie53ZI0T8t3EfkAyY4mCpFGG
 e9VMOFjhusvcHincyv/FgqYf0zQTfY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

When removing the index argument from snd_soc_topology_component_remove()
commit a5b8f71c5477f (ASoC: topology: Remove multistep topology loading)
forgot to update the stub for !SND_SOC_TOPOLOGY use, causing build failures
for anything that tries to make use of it.

Fixes: a5b8f71c5477f (ASoC: topology: Remove multistep topology loading)
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-topology.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index 7f33de8ffd95..b4b896f83b94 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -188,8 +188,7 @@ int snd_soc_tplg_widget_bind_event(struct snd_soc_dapm_widget *w,
 
 #else
 
-static inline int snd_soc_tplg_component_remove(struct snd_soc_component *comp,
-						u32 index)
+static inline int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 {
 	return 0;
 }
-- 
2.30.2

