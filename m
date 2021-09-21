Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19B413CA4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E71B16A9;
	Tue, 21 Sep 2021 23:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E71B16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260366;
	bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WciTW6w1t5RIjz/CEO/laiJsPyVSblx5YpHXMvkS3RbLGsVO+N+3OVSNeJnpJ4v59
	 xqc2Y4F3aL0npBLrwdz03nO93Bq8N3d9J5M1N3sb2F4yUfbcnF9tPf0gajFgjC9n6Z
	 ao6cNOhhhnYTMJ2HhoDwlwEBLjCsRidCXHIy1Rfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8CC2F804F1;
	Tue, 21 Sep 2021 23:37:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15E39F804E3; Tue, 21 Sep 2021 23:37:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89804F804E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89804F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nal2ktKi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9585A61019;
 Tue, 21 Sep 2021 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260216;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nal2ktKilqF7XAtGHjUJHBsz2vggf/m7AhyToUA+Xt4S3cgcmthbC43sYFqb3pSRU
 INaug+jA2ZzPKcjXwDsfw2qbqLOkZFXSejA37KzBN7AUqM4dN46YJVfxp/yshzcZ8H
 bxjOvVFqqkZR4QgdGrTpBXABK4cFGLi6LiIfFg3BT5xfNT6M55iPI6aQS001YFtJM0
 Op04cp339qYuLIsY+n5TLdbplRlzP5gDR76psjM1MBPoYKWdq6WUlUjFh6iVRJJuyG
 QqCG1EGJGG5WUepJSxc+CBc590IsylKoIRIgIhYcxVzuU7c02asn5gPZvqWkvHnCRi
 8vSFDTsMGZP3w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 05/16] ASoC: fsl-mqs: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:31 +0100
Message-Id: <20210921213542.31688-5-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; h=from:subject;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8WidR+IfgASeBZcEe7nEyf9oCvyXFXV112DJOT
 KNY5LeSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFgAKCRAk1otyXVSH0PmvCA
 CFBJLaHsRoeugg5/GbUWOyznY1qSNrYPQduxImC+WYVUpSSBFqVcAa+eDuE6tC6vtf3LHtcacRp3kx
 h3wgxGWjSSc3m24oF8z7YSUAmnuUL++PNVjmUgOYFCk/wkXIaZHlP8m2A+w57xhFBCjI2bCfY6CLNK
 0+fAwKkOw9fYK7YtE6rL+7ra/Fym3wVNtCtAvOaxxoBrdyECsRJXGpvlWlCIUdfFD/SC3+K1VUgRwg
 ohYoEYsCzH/C9J+/kOq3Big7XjajDf2bti2B35Pv9Tl7ypJV+WuP+oEnh/wvEcG2dyiFit3uvLsZsG
 YwGHrvt9cFQ+plmIsjCLc94iZvGuJs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the fsl-mqs driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_mqs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 69aeb0e71844..27b4536dce44 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -102,8 +102,8 @@ static int fsl_mqs_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

