Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E934EC2FC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163E51ABF;
	Wed, 30 Mar 2022 14:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163E51ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642035;
	bh=i4LvtJMYs5t9UOhjaHJspxXRS2kYwM/x4i+LuKPkDHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCaJlHMM6m+Xa9w6VdkP9cVRXV1hNC5kjHci/6ll/e3ksOx4elX+Dc/DsD8Z/TNOl
	 u51HZxONx9yh6Nph8BDpeJ5cxy3dy0I/hwyravGeIFdFpodoTBhOeBBhKx3qXYprup
	 C7qs9Eh9HEVY5upbI4hh+rXhFwCU+ZCZPa8Hk47g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A552F805C0;
	Wed, 30 Mar 2022 13:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971EEF805BF; Wed, 30 Mar 2022 13:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF88F805BF
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF88F805BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H7nPFKqn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B8E2616E0;
 Wed, 30 Mar 2022 11:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCD7C36AE3;
 Wed, 30 Mar 2022 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641265;
 bh=i4LvtJMYs5t9UOhjaHJspxXRS2kYwM/x4i+LuKPkDHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H7nPFKqnZjaP+pXB88MVcs6hND4xYOwAoxj2S+LJpoaX9TNEGqv8XrLI58YQCqzt+
 m8DD0zUj+a9d6yuZelMnH/bw4VO8BQGhzG7SMgrXBwuOOiZ/FBP39pHIrdMmj44qiZ
 hBMk9T+wwX+ZK50YfrC+30QBIm6kNT2V84+2ryCzTUJZe1CjioTTD68R8xL1rTvCdX
 XCD2b7hto+Eg2sxKAr6PYm2tDVUjGgsjrVagFGGjG9wYoYO0JjZ9XZQ0TVBwoO6Uba
 sP2YwgB/m4bixGZhQsEhqsODYlD+7f3uFeedwfaHJvDmZEdt3lpqqpiNXs+DOVW9PT
 4B9wYjWekKzPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 10/17] ASoC: soc-core: skip zero num_dai component
 in searching dai name
Date: Wed, 30 Mar 2022 07:53:59 -0400
Message-Id: <20220330115407.1673214-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115407.1673214-1-sashal@kernel.org>
References: <20220330115407.1673214-1-sashal@kernel.org>
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
index 0344d4423167..81c3aa167038 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3799,7 +3799,7 @@ static int snd_soc_get_dai_name(struct of_phandle_args *args,
 		if (!component_of_node && pos->dev->parent)
 			component_of_node = pos->dev->parent->of_node;
 
-		if (component_of_node != args->np)
+		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
 		if (pos->driver->of_xlate_dai_name) {
-- 
2.34.1

