Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB5118C01
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1675716F6;
	Tue, 10 Dec 2019 16:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1675716F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990481;
	bh=yy0V802LaSWiqHGz46wR1mdp6pe+OB4x+CZ+5XS85gE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kipXevsanbXCgR4ep4azNpdKYkt+yKOMYPNccL1bWPOZxUB5K/iS/7/2NrylNmqNf
	 MJBYz8X7jjB2bl3chsr9YmhkC5ArtBBELJaDQNOvNVMY5dsziShqVGw2RRYnzcDDuE
	 /8JGPGT9XqnPRdNg29Fgizo4YNa0XFiNCAbzChHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C2E5F8033E;
	Tue, 10 Dec 2019 15:55:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00A65F802A1; Tue, 10 Dec 2019 15:54:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC7AF80265
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC7AF80265
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E25FAF0B;
 Tue, 10 Dec 2019 14:54:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:54:05 +0100
Message-Id: <20191210145406.21419-23-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 22/23] ASoC: utils: Drop superfluous
	ioctl PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-utils.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 2fd4562f5e63..922eac930df9 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -77,7 +77,6 @@ static int dummy_dma_open(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver dummy_platform = {
 	.open		= dummy_dma_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 };
 
 static const struct snd_soc_component_driver dummy_codec = {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
