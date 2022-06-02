Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F453B968
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44572174E;
	Thu,  2 Jun 2022 15:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44572174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654175318;
	bh=g6DaQn1XOxtQxacZgcwUtfK0LXYTyL4uGdfcjrrr2MU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fMhIcZBJJfy6ovY+LaJ5YQ21Egaavh8ePCEtr4aCOlwKblg8nNtWfv9B3zvmn5ryB
	 knFYOFPn1GBJWWYYEJ8xZczbBFqlAhmt/rZ6epITZWA+QQRoHTKoY8N3U+WGT86RWf
	 ASkdABh3H4WgwzlBznnZXkuzkLZJEvtp3btYJYX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BCE6F80527;
	Thu,  2 Jun 2022 15:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A42DF80527; Thu,  2 Jun 2022 15:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17A77F80236
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A77F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uodIq9eA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 01044CE1FD0;
 Thu,  2 Jun 2022 13:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C43FC3411A;
 Thu,  2 Jun 2022 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654175207;
 bh=g6DaQn1XOxtQxacZgcwUtfK0LXYTyL4uGdfcjrrr2MU=;
 h=From:To:Cc:Subject:Date:From;
 b=uodIq9eAqXxP1EgceQh/JW4ybvFmjiXPUzbdubNsF9ZCvgwy12bCKw6Zw/hkJ9eVO
 sOtpCBcymivMS8Vd1sSCkjPPIuqQNa/9Dn0YvcSg2ZsRcP5N8b/+gOr26am4T+3Ys+
 s2HBPCBxxKsZ3hW3j2RX2l7X6VOifDkmoIk4w0xJGOpDmavcc2heoewgXxVKwsLYjj
 q3DM27K2uC+Ts8hRubCAifSqR4+C7xIY1J7u0qWI1fXM1+EK0A3ASLQoEtVloQROYl
 FYHNCLqiqro2KvXIP+474bPvtRwnimbEmCq/5hhcjFUGVZxBRxgUPAYDfvY/yHIluf
 KS13DIvF2KIWg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/3] ASoC: ssm: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:05:28 +0200
Message-Id: <20220602130531.3552275-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=465; h=from:subject;
 bh=g6DaQn1XOxtQxacZgcwUtfK0LXYTyL4uGdfcjrrr2MU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimLVURYvpSiKuDPuGpja8Puv6I99N3KdZZ8YG6jyQ
 KOrWV8KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpi1VAAKCRAk1otyXVSH0D9CB/
 0eMqE/cUxld2ZcyrRoHs5cVB4Th1guEQERc1fdAGufxiE8ZEuDCd7CexPsC31USjIsUDCsG2C8zpw4
 8RhxCm+58GaY+Sz0RDurpdIuDPp88c7AB2lDrQSVMyCfhiAJTjhLP22lHD3FbweX3qQY2FAaGBkmPU
 3mM8/6gPRNiN8JNPW23gRMgrzeQuwgRFcMIjQRuXZ0STQGglgOW1msosGioVr7qVXL15saZtBHj2qX
 oYSGu8LQxeThYgSwI48jie+W4ebaS8LWNE8PJHgLNbgZ1pQHI30y8dAoOUZLgxs5RgHYoA/sEpH87O
 0bp0Xt5Yl/Y/adNxMdOMt91f5oUFNo
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

Trivial updates to modernise the various ssm* drivers to the new
DAI clocking constants.

Mark Brown (3):
  ASoC: ssm2518: Use modern ASoC DAI format terminology
  ASoC: ssm2602: Use modern ASoC DAI format terminology
  ASoC: ssm4567: Use modern ASoC DAI format terminology

 sound/soc/codecs/ssm2518.c | 4 ++--
 sound/soc/codecs/ssm2602.c | 6 +++---
 sound/soc/codecs/ssm4567.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.30.2

