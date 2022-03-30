Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DE4EC08F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EAE17D6;
	Wed, 30 Mar 2022 13:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EAE17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641023;
	bh=kDKQLtxdtubo8cbSoy0C0473dnGZFJuLtrEEafSBCiw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbxmi1VfrI7o8cGQDtGqXYBhEyQtC1bc5wo3BZO/TIXpatP7gUq4tEGajvorZax5L
	 i8I68FejehkuDCkaAjdQpE2nCJG84mF42Ogc0jvfO+TkklRscsB2DRa8iPmP5Nj0w9
	 OmHyPQjaszC2cps5FawpzdDHruedO00dIg8i+FIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B51CBF80538;
	Wed, 30 Mar 2022 13:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9F1F80537; Wed, 30 Mar 2022 13:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6111FF80528
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6111FF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pMEJT1KL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 145716162C;
 Wed, 30 Mar 2022 11:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E54C34111;
 Wed, 30 Mar 2022 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640858;
 bh=kDKQLtxdtubo8cbSoy0C0473dnGZFJuLtrEEafSBCiw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pMEJT1KLoh8zPaDlHJsR6dqkCaxpUBaN6fLjTr5VW9yhFgv/VtQJrzenG/W7WxR/9
 Z8m7EZIJ+p8EItpX4fKjrRnaUkf55vpginzMfkb576BStHBUqNEQvGX1eRMn5w+rYR
 5QLlyaDIBDCUxWEVgPmyS85foU4qFOTYwRXckeqZXveujGfsgxmmEJZipncS+718NJ
 A6OEbQqXe9gOMQgEpuUTK1ogpJh9eoXbKJoEVrBJnWyypB9WVWuS5sBn2VsTbSZwgb
 63uPA0MBdkXACkekhW5NSZ3nnoZHHhom3HOKbm2RvQmFEyCHtCBozwbbqLaObSORmL
 9HdRP1+i7a54w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 34/66] ASoC: soc-core: skip zero num_dai
 component in searching dai name
Date: Wed, 30 Mar 2022 07:46:13 -0400
Message-Id: <20220330114646.1669334-34-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea ]

In the case like dmaengine which's not a dai but as a component, the
num_dai is zero, dmaengine component has the same component_of_node
as cpu dai, when cpu dai component is not ready, but dmaengine component
is ready, try to get cpu dai name, the snd_soc_get_dai_name() return
-EINVAL, not -EPROBE_DEFER, that cause below error:

asoc-simple-card <card name>: parse error -22
asoc-simple-card: probe of <card name> failed with error -22

The sound card failed to probe.

So this patch fixes the issue above by skipping the zero num_dai
component in searching dai name.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1644491952-7457-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 434e61b46983..a088bc9f7dd7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3233,7 +3233,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 	for_each_component(pos) {
 		struct device_node *component_of_node = soc_component_to_node(pos);
 
-		if (component_of_node != args->np)
+		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
 		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
-- 
2.34.1

