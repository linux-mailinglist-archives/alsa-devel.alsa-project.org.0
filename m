Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE540DDDF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E551918CA;
	Thu, 16 Sep 2021 17:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E551918CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805659;
	bh=ja12kU6CmXJCz//xEIz4FdZ0hXnKUgwz4H6mKM/yZFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/s27IFu+IDTJS0K1IhfHzZEXEK5Z9q+x3dZ34dAozlKGUWfPD4/2Jh/b595pNXS9
	 zi4RB1qX1nuG+2No/o2BUhH6ddcgiIkzHEvQhKWnU7LURfXV7yiJbiHQ4Ev5yQNSKr
	 zrsDNZqHbiD3DTPQ+GNDVBsgJpjP4eRUjzy9B7Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EABF8027B;
	Thu, 16 Sep 2021 17:19:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2049FF804E7; Thu, 16 Sep 2021 17:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D80EF8027B
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D80EF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="plFE9Psf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A096124B;
 Thu, 16 Sep 2021 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805537;
 bh=ja12kU6CmXJCz//xEIz4FdZ0hXnKUgwz4H6mKM/yZFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=plFE9PsfzmbcTgInPJNF0loU5vrF3TfLzQNrocmpXX7b+livDW3FMDH3mxnY+XPC1
 6m0Osd4RQebWRFkRrjjuR0GP93ZQEvTG6mXM7FFM5/92t+W5cOWQDJLkcT7stDGv+Q
 STo+RIPGw8v/3cE2Q5lTRj0up13fY3hxSq7+y7ZhewJfDwQnXqPSYBwTXwoPmZwQk8
 uJYA5NZPeyeUHjc7qdUJ921VE5gVg9jzxV1SKJN+/RkuQKpq5LLaPuYS14ewmgh/70
 wtlPMe4uECro56lWydq8xrFL4u82klLQqH8ufZ8laRNKQomYubMJH73yJy9aGOqjiY
 OwTXwM5ugNi6Q==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/6] ASoC: adau1701: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:18:03 +0100
Message-Id: <20210916151806.20756-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916151806.20756-1-broonie@kernel.org>
References: <20210916151806.20756-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; h=from:subject;
 bh=ja12kU6CmXJCz//xEIz4FdZ0hXnKUgwz4H6mKM/yZFQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1+p8Fa/CM9HwAbbPLTON70donHN7KXlVYB/EdwS
 ic37aqeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNfqQAKCRAk1otyXVSH0CYkB/
 4xQ+SSuIXQmpdmCiV7P88JcHGhepqz7QfYSA1Wy74ZhL3Ya5TkAJba3KS8Yyh0CphWRSHL42dtO6hQ
 qEP45+97ifMtnqqkpg0P447FfcBKQca+ph/PKA4fU6TrjHKdT7NLQQnES/6F2xkOb/KtzMXsRzWJpu
 1AMOs/uQVQmzXqTMOXzEW5+8HH7qRIED4dzlp3g8m/bgypZYNriQGoLJ6gwT4CeyYcS07MC+tpyqXA
 Fe/HNX0htKB0sB1wHbiYjqHyDQK4AG5Ql+9vj90+Dsf4ufB5S1fizSTu0uWzCcLjAxRBXiF22WzyGc
 S/WcPKAmGUZXFkQp7vxceDF759Y+7a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
the adau1701 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1701.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 5ce74697564a..c5bf461c0b7e 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -482,13 +482,13 @@ static int adau1701_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	unsigned int serictl = 0x00, seroctl = 0x00;
 	bool invert_lrclk;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* master, 64-bits per sample, 1 frame per sample */
 		seroctl |= ADAU1701_SEROCTL_MASTER | ADAU1701_SEROCTL_OBF16
 				| ADAU1701_SEROCTL_OLF1024;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

