Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5653B96A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84E21743;
	Thu,  2 Jun 2022 15:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84E21743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654175331;
	bh=gUax4Ge2dOYXNrRikHzLEebvjT0pj8y2lnt2SLMHqjc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuLk7UuzJfJG6RSUTw6LU3idqXm4Dn5GRseJ4e3qOjTzDiBJbfl0z+H676lbBCmSU
	 +pGqfannG5NHV/1ghPp9+BXyQZZ4aco2tw6cAiopEwIEgetGEeYkcAfCRoneyoLAZ3
	 yOx2XE3dd8wZ0iBwvVVaJtCdBhq2fFVirYrtbNq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3026F80528;
	Thu,  2 Jun 2022 15:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14FC4F80526; Thu,  2 Jun 2022 15:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA77F804AB
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA77F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k/lcsYgn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 72030CE1FF7;
 Thu,  2 Jun 2022 13:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52FCC36AE3;
 Thu,  2 Jun 2022 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654175208;
 bh=gUax4Ge2dOYXNrRikHzLEebvjT0pj8y2lnt2SLMHqjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k/lcsYgnv4ppq7MpHJ+HDjzYBFK0PF/c+y3uhvKNdJYGAQmQmhlURQu3fKbNO+hH9
 hoL8ydO+stlVCtyNBYOByhSgjCJn/n+n46iyxbWFd7A3GJ9l0NkjljFafvQIc2zjCn
 flRvzQWw8NlQrZQlQ95xVKLRLHKeak+rgN2LYgqi0FSY8IGYR26vk2Sen7ZoJxF3PD
 waIOdCfW0gCYjnES5Jp7IIcPrQ7lHlJ2rGAxEGA7/Mh4zBOHRik+QK/LuVfp13soPw
 J74QplFaOI7nIXRf30Klv6krV3+diM2BmVKdMR5CaTs2Uxh/aZ50jkiiAktJz7yTaJ
 mlV4AvMB1LTwg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/3] ASoC: ssm2518: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:05:29 +0200
Message-Id: <20220602130531.3552275-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602130531.3552275-1-broonie@kernel.org>
References: <20220602130531.3552275-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=819; h=from:subject;
 bh=gUax4Ge2dOYXNrRikHzLEebvjT0pj8y2lnt2SLMHqjc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimLVVji3K6ETLycvv6ylLwOmQysJEpjCyHPm0IKWt
 cVnCES+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpi1VQAKCRAk1otyXVSH0A0DB/
 49DBjVMrdRRQE756NFm17QvRUj679H93vpwVZ6UCxQjug8fE15/lW2t93s31h21eNkGHV2IvcGAqS2
 CJAnq3MaJZuYYFOX5u+ULXOASMPp/+UtP7kCeQEoYXt8yFPcWxtfcRJXlArpwrWkW5Dhdmd//qW+GL
 wBhrcSuGjw5udoF4gvGQjbgaXkOzX9/Fw0ZPk0IpIW2tP+f7bBufAhAM7WWfEyjuyAsUR7cgf/3O82
 PqxdZlWXH+3P0L+jZhYoOxNLDWOBBbDP5aasLwrYScaCPR/JuyMObkHvlZnhXwodsJhpUmIMjbCDU1
 l1yIJrvmq7PAjJopvLM/JxHaO3Wx7w
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
the ssm2518 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ssm2518.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 83acbdbb8e0d..012f209e76e9 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -409,8 +409,8 @@ static int ssm2518_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	bool invert_fclk;
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

