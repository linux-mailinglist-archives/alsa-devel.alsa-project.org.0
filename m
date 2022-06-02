Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3643853B967
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8369173F;
	Thu,  2 Jun 2022 15:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8369173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654175304;
	bh=NSNBkSX73Lx5b+0Jn5LFw33hKFsA/af0pAHUE4qKj9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btbY4NrGr9Cg8YZzTH1QICDQKhzKvPc/zUujz0vPO/sTHVPKWNFzWfVlRhF5kkMr8
	 j+OO+x0Y5wsE1TJAEKo1FPQ+Rv86lkxZoStounhFbSavb0VdFvHycDAp/mvb7g5LAU
	 6JUqmZPEl1/qveExG69bGss9UhH0KURMokTyL05s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA6AF804D0;
	Thu,  2 Jun 2022 15:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59589F80149; Thu,  2 Jun 2022 15:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F74DF80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F74DF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PnTiXYE4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4A6CB81F1B;
 Thu,  2 Jun 2022 13:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85471C34119;
 Thu,  2 Jun 2022 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654175211;
 bh=NSNBkSX73Lx5b+0Jn5LFw33hKFsA/af0pAHUE4qKj9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PnTiXYE4dI3yETbGcj25vADACeQRzFfd3S/aIgA0t1l3/Q/hvDo0svteb6DmURqZb
 BZyrt7EwT26wtnkn4T/MgvX5olIkQMUWMyfacawYQ9ws9AT+Y/8gQu7AxNVhB46xoz
 tyVZLdgXGUZBkH+7LedZ65tV/NkRjiq5CAV2hr14k0r+HmPvHy2VIUG44rFDO+LTW5
 SAwCcA7UN/Yr7jEr0YJqjYG2GuRu9xIpZQHq/9WBxCoj0AxtkP04PbLWa3vVG3nWg/
 sfLy98+MRipvgHu/WwXm7JCUNKED3sLE2C0OjnsLjvr4OZVX4E1VEBcoxyLVUBgJWZ
 xIeoJVz/tb50Q==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/3] ASoC: ssm4567: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:05:31 +0200
Message-Id: <20220602130531.3552275-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602130531.3552275-1-broonie@kernel.org>
References: <20220602130531.3552275-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; h=from:subject;
 bh=NSNBkSX73Lx5b+0Jn5LFw33hKFsA/af0pAHUE4qKj9Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimLVWk9UTV/vcshTsvPqe0hqQGkmjOXcnwcT5VDWJ
 5jxPWzSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpi1VgAKCRAk1otyXVSH0JCxB/
 4wSeJaeMyvmt0cEPT4aaeUH+ZK5Cu3wZ/8UG1ak820lCnRWc/ZbTDtjxTM9BmpV3xnrQVrBr8vOJSt
 WSGDNc2uGiB+IHx8GJnXgvjz2d1+Ojj1E/3BBDTXk1iiyWUuNjpXtJiU6logEXwf5FyA6QRpZF30xv
 HBfSYsDrKM4EEP5588Bfb6eM1cQyb3XgpnRR1J7OGUbiOzIz0z1huvbu2NDdDi/SQ5/Q0qwrrahKoj
 SxqoCpGRT4twNTq7klW/O6a2gocx6O1ms/5Xw6WYYHdGOK1qQSrss98m+a+uExgwKp8co8ogkWJA+N
 aC1NXyDnVcInZ7J99aUPYGwTJpc/VT
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
the ssm4567 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ssm4567.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 08ced09ef001..b47321c597d0 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -278,8 +278,8 @@ static int ssm4567_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int ctrl1 = 0;
 	bool invert_fclk;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

