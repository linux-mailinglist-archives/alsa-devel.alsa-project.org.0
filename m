Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E410C412558
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 20:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C2016D8;
	Mon, 20 Sep 2021 20:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C2016D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632163400;
	bh=oVUfVBxQ048vo3S4PEYb9gFWLyuCPOGgwmQQJ+CTB5g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Je4rD2gGID+Epp0XrHEYFtUkrRYV+0EGW1mc3ZxrtkFTAv+n8w1WdXc4/bymq+iMj
	 5LHO63ClDhUryM711vabuoGWxkDp3F8oi3TBgZJEgNyO5jeigtHxH2+y0lazNxJrqb
	 kLyofTLEchS0TzjRDwFEFDgA4aQkSOczpQkpACAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1CFF80279;
	Mon, 20 Sep 2021 20:42:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0C6F8025D; Mon, 20 Sep 2021 20:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D19F80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 20:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D19F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="GJt9l1cX"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id CE4204018A; 
 Mon, 20 Sep 2021 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632163312;
 bh=RJZDrQJzd/PSuwhwBqk2LEL2gE5VbirT5KM+/uoAMZM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=GJt9l1cX84J2OP93j5YuUFiPQVNMKb3ZV1UjuSiApMhiEzNho20YzONtFWFl47Kvj
 KZq6nr7iBQBlyhVu+gpYlXjG20kCNSqxBMxZBdZMi51yhrVV+h/aYL4eAqWjnqlCuD
 WCCTOaFWc4k3zLACjF1atwK1eyKnvR3CfMer690J8IKq6+j4eOXoaqXDOvWRRCgQOy
 x9YAjM1Xj5ihTYbYjSgcyEZ0K53T48Vgk5iF7lYXs0MGoaml9M6w40eq4rPALAMerh
 wwwrD/jCqWjCLOWq8z0mOL3EhLsHzq1MHgG0gstz9yJBLrIsrjanG4bBkJ+RC2yQ3Y
 Qkc/+igRL9p8A==
From: Colin King <colin.king@canonical.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" ->
 "Frontend"
Date: Mon, 20 Sep 2021 19:41:52 +0100
Message-Id: <20210920184152.18109-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index ac8f7324e94b..8b664cbf6fa6 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1747,5 +1747,5 @@ static struct platform_driver q6afe_dai_platform_driver = {
 };
 module_platform_driver(q6afe_dai_platform_driver);
 
-MODULE_DESCRIPTION("Q6 Audio Fronend dai driver");
+MODULE_DESCRIPTION("Q6 Audio Frontend dai driver");
 MODULE_LICENSE("GPL v2");
-- 
2.32.0

