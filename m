Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A517C53BA36
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E12817D6;
	Thu,  2 Jun 2022 15:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E12817D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178193;
	bh=yzZe04MIihvNYYfonwNH+DTgIjUQiaeeFJhn6vPEwfM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4tetzO9uujBV+Rr/Tcd89iTOxdXo7P0/szpA0ABezAlMvFM5NC0aG+MDKmD0B2BZ
	 EEv5TDRyjtotdGavEutHqmw95w4+N10fT4kLZIxF9tHBAId7POLyl2PMHSMh2gx/Iv
	 a9fCLN5Y0udbuKd4AgnN1SScoXQftRjoia1r5V6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84832F80553;
	Thu,  2 Jun 2022 15:53:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8155BF8054A; Thu,  2 Jun 2022 15:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B937AF80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B937AF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Exvj4leC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84D50B81ED5;
 Thu,  2 Jun 2022 13:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EACC3411D;
 Thu,  2 Jun 2022 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178008;
 bh=yzZe04MIihvNYYfonwNH+DTgIjUQiaeeFJhn6vPEwfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Exvj4leC+N8wVDPkO8ep/udFngOXbi1ZM9Rp9roCn8vY+V4VvYexugFALPCRy++FT
 SijK0rTVDzv435Sau0/1S/xfyLjTqm00ao4YCg413x5pppBG8OO2FcHG3CLeQD+snT
 qtJPnXSrxBmlkgNHKaCRViEaU6rSf3ccp0v4gTJfXSTxZNqZU+gmpjAZKgMvx2YNl6
 JkCIyH7VtBMV7J2iRwHYT2csWXmovl0XQoxwc9hYlJNhFp6l7zBGIORmws4t3a3hCJ
 2rFWp3SEDKA0w6usWDJr+8b5DP/cQn4rnw6wK076vHKiC2Yyp4dG/qyqE9dru2Idjw
 joYLhF3dzyttA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 05/20] ASoC: sta350: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:01 +0200
Message-Id: <20220602135316.3554400-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; h=from:subject;
 bh=yzZe04MIihvNYYfonwNH+DTgIjUQiaeeFJhn6vPEwfM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCSk/jP8KAcF7m9DB8USKYoXygsiWMjQgDV+sGv
 QPlUc32JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAkgAKCRAk1otyXVSH0Ev+B/
 45G558sNViQVa++cqkRWFvSPSr3HeQgt61H9zXj9eH2tG2SVccOTl8NRxWasi93qaiquJWXgpHYX/c
 +bKJbTr+VcwZGTwqfpR9gmnW3uo1B9k/Ox31xoxxl2Bi0QJKcegB9YQJ+PQI7B26+AF8c4N7QAbtR8
 BkDqvSZw+9b9UEVBlRVdzHm35MNzBwwwHcuby2yu5KaaHDz5+L97lCiCk17syO0tShN5plsuNJILiC
 nJWrkQvBcx0x06VSbYaw4+IbUDeb19rXydFz6EK06tG2Ej/hifDq3eUmZVQeVng8GoNeRdQiwF0DWX
 J8SH6oRYGtZ3iAOBhGH5rZqdsvqft+
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
the sta350 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sta350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 9189fb3648f7..b2d15d20fe63 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -630,8 +630,8 @@ static int sta350_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
 	unsigned int confb = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

