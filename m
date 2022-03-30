Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4154EC173
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB8618A8;
	Wed, 30 Mar 2022 13:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB8618A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641417;
	bh=111nFQNGUUvNUOoM3silLV8vcRp4KOZ0W6kSv0vS8KU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8VW3j9vtjEXi2l2b2oE5XGfUw85zPeXAxqaG3ZXZS1pgZcYEnVYhgSnJw0JAPMhl
	 WGaDEZ5Vv1rmqIlW0dhrCqEXx5s5u5GLlrYS3lj1OhbuwPNVNWUS9OmSXGlTFSp2Ul
	 cay5oGqPTUe3GzxMyt3o895YN4TKhAXXJuA8Bvng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0AA0F805EA;
	Wed, 30 Mar 2022 13:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35BE1F80534; Wed, 30 Mar 2022 13:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96BB0F80534
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BB0F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PpJBLaa+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 291CC61671;
 Wed, 30 Mar 2022 11:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008ACC36AE2;
 Wed, 30 Mar 2022 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640965;
 bh=111nFQNGUUvNUOoM3silLV8vcRp4KOZ0W6kSv0vS8KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PpJBLaa+Uwe1zfO+WCdDUtfwYUuaYT9L9egJO1h9ndya9Ea+kv972q8P1VTt63dWK
 W+6loJ9KMCoqnUjuuYKpY+s/NtR+AlE13kaqcz5wR0lfOnpQFcv2I8rcxp+KFcoTpo
 4y8kADuc8z4r3Yjzky66pgsPGOkjQqKnoM502Pr64Gn+HCrnc9nKzKJPBWCQ1fWJbg
 FmJ1leDcduLw62AtCv+WZdZbmfWRD3YQdZkMPK2XJvgp7j91ag/dvxPfSFcW6arIXi
 KINIt7MfGKwc7Ty7RnSYE1FXaFkNbMxISVrElo8tWbM2HJY6oSiUJmNdSn2UMggnr9
 OeECLRTF6snxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 34/59] ASoC: soc-core: skip zero num_dai
 component in searching dai name
Date: Wed, 30 Mar 2022 07:48:06 -0400
Message-Id: <20220330114831.1670235-34-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
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
index dcf6be4c4aaa..0dc89f568407 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3184,7 +3184,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 	for_each_component(pos) {
 		struct device_node *component_of_node = soc_component_to_node(pos);
 
-		if (component_of_node != args->np)
+		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
 		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
-- 
2.34.1

