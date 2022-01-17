Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A059490D1D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:01:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFC21860;
	Mon, 17 Jan 2022 18:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFC21860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438860;
	bh=cJPgM4GLpjqSaHg5vohVKKh1k0m1iDUXV+RF33JQnf0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZF1F8E6IuDyqQ+6XJWoAFG62OYrQXvZCrp7uArNnjnD43wFu0bqK7bXcKkmgicym
	 FM41B6xrqI4vKVL/C7VPhgJXA9VLeooj7P5aB8yqnwOLnszY0T4QdG/NippgJ7/Tu/
	 /Xy6iyzeUm7ybUDaRsbAVbj6PCUAAZn+GtqQVLTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E955F80510;
	Mon, 17 Jan 2022 17:59:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 573E2F8050F; Mon, 17 Jan 2022 17:59:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5942F80425
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5942F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+l2Py+k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25F2A611C3;
 Mon, 17 Jan 2022 16:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A020DC36AEC;
 Mon, 17 Jan 2022 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438784;
 bh=cJPgM4GLpjqSaHg5vohVKKh1k0m1iDUXV+RF33JQnf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+l2Py+kcaTU3tBE/G9oO2YJopYzTevjDXZVBQn5NY3pzp1o3XL6gLgzrpKraywKg
 rUC0ryE46FbASTY+RSDF6apoZo9JxRaZLDdD3Nt7HPCEC2VJbtYMfUJ9HOUdgPqYkO
 6fhp56X72UwOGEkfpQWegtYBtT1dPp+vyiZpd2CJEsdyRmi3ChlxT3Qk2wG7EPdHuZ
 mjNYmP5KKJwnzJnzSMuvAffIVSw8HBv4+YozuXZjbxRgbyB0tKx2Gmfi/rgPuWrEzt
 gsi93SXg46Ato4epxepWxLwMFu7VSpmC0dJvD8z5bGG0A98VhTVA7N9euBUhdADnnY
 1R/ihVEcsWDNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 20/52] ASoC: test-component: fix null pointer
 dereference.
Date: Mon, 17 Jan 2022 11:58:21 -0500
Message-Id: <20220117165853.1470420-20-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Ameer Hamza <amhamza.mgc@gmail.com>, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Ameer Hamza <amhamza.mgc@gmail.com>

[ Upstream commit c686316ec1210d43653c91e104c1e4cd0156dc89 ]

Dereferncing of_id pointer will result in exception in current
implementation since of_match_device() will assign it to NULL.
Adding NULL check for protection.

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
Link: https://lore.kernel.org/r/20211205204200.7852-1-amhamza.mgc@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/generic/test-component.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 85385a771d807..8fc97d3ff0110 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -532,13 +532,16 @@ static int test_driver_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct device_node *ep;
 	const struct of_device_id *of_id = of_match_device(test_of_match, &pdev->dev);
-	const struct test_adata *adata = of_id->data;
+	const struct test_adata *adata;
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
 	struct test_dai_name *dname;
 	struct test_priv *priv;
 	int num, ret, i;
 
+	if (!of_id)
+		return -EINVAL;
+	adata = of_id->data;
 	num = of_graph_get_endpoint_count(node);
 	if (!num) {
 		dev_err(dev, "no port exits\n");
-- 
2.34.1

