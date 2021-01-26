Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81D304B2D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 22:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2EE216C7;
	Tue, 26 Jan 2021 22:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2EE216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611696127;
	bh=9OjtP0DIc/CCEucNkZDeEY4Efwk+TJzw7kAlZSR8d7Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ibRKhlpS9nZ2/9t9iq4JP+YqQRp7Vb0MJE6EIJVYCk0hL7FohKZ6Br/f9K28SUlUJ
	 /rCU/4Zdd+SlhniGA4gcQPGaNcrJmih+oMb/9rrFp+zvmkHc/tTvl8faf4fzlGlp9W
	 J0hzh0MBgDJMdZHnZQc8S9GJMLEhtUtHuj+43is4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6B1F80108;
	Tue, 26 Jan 2021 22:20:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 023E0F80158; Tue, 26 Jan 2021 22:20:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A59E1F8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 22:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A59E1F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EOpDSe6S"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37B7622240;
 Tue, 26 Jan 2021 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611696028;
 bh=9OjtP0DIc/CCEucNkZDeEY4Efwk+TJzw7kAlZSR8d7Y=;
 h=From:To:Cc:Subject:Date:From;
 b=EOpDSe6SsgvSSsQxpqwxDcm8oG2MzJOj3VVvo2GfeLqo0/2pevZ7Qw/OoDahSEhxe
 6Lf3WM84cJI1JxZ1S5mO97iSDEHjetNoIlU5+M1eZVZ8uOWMeYlNuWbFQcohilmBkY
 8O4z6jC8cgn7DeNRH2qul5/TrrgzeRQwl7vd9FIAH4lFXJ4FNbfhjoWFD/wdYPu1PO
 mPgizZHHcWDf0cbJcdZyh2BJiL+h/qNAp3cUskMNGZYvPZNet2CsduM8VTR5C8pE8Q
 v5f9imc++R+RGt8qBhk/zxS4bbNsXoQWWHXf8bogise8Vn1vF9JIXbK/rHzikKAKJf
 4w8s+zMRsWjlQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: q6asm: fix 'physical' typos
Date: Tue, 26 Jan 2021 15:20:23 -0600
Message-Id: <20210126212023.2921168-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bjorn Helgaas <bhelgaas@google.com>, alsa-devel@alsa-project.org
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

From: Bjorn Helgaas <bhelgaas@google.com>

Fix misspellings of "physical".

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index a6618efe22f2..36bf8bd4edd7 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -491,7 +491,7 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
  *
  * @dir: direction of audio stream
  * @ac: audio client instanace
- * @phys: physcial address that needs mapping.
+ * @phys: physical address that needs mapping.
  * @period_sz: audio period size
  * @periods: number of periods
  *
-- 
2.25.1

