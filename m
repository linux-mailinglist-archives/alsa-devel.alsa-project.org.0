Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633C1AAF4B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 19:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA94B165D;
	Wed, 15 Apr 2020 19:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA94B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586971038;
	bh=iseWDu7buGKgWlnAuZkXe6N57EemoX364HbCH2CJH6o=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=G6h3/jpKAqkF5ACE7huzVW07iarraKwwBeKxp8h70JohvCY2tqb5ZlA+4XjcGh52+
	 owQFNOXm3sLVH7zcWx6QsV28xhXZI2fSkSgpVU3PocwG9QwPb2B7yirpIg87QVGgDB
	 2+rI8B1xu6ikiixrUMoaxwpunAtsnm7vH9Rb/UqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFA4F800ED;
	Wed, 15 Apr 2020 19:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 030ABF80245; Wed, 15 Apr 2020 19:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 MIME_8BIT_HEADER, SPF_HELO_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E44B4F800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 19:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E44B4F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="POM0ui/R"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C7FF2076D;
 Wed, 15 Apr 2020 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586970926;
 bh=iseWDu7buGKgWlnAuZkXe6N57EemoX364HbCH2CJH6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=POM0ui/RjwG4uRcFdDMuLMZmiw9OW1fSlG7fOIAXTy+mmSZgy70H9Oc3OEPkpR/i+
 XjYzKG98xjzTXuqg543uuoicSxgcxOq49pjPBOPDpPL7tIr6r5ambZMAdeBelzg98h
 U7tz87gsDeKhVnJ7XZvx5RzWLR8HBJhlIDlO8yXQ=
Date: Wed, 15 Apr 2020 18:15:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Subject: Applied "ASoC: topology: Remove unneeded semicolon" to the asoc tree
In-Reply-To: <20200415162435.31859-1-amadeuszx.slawinski@linux.intel.com>
Message-Id: <applied-20200415162435.31859-1-amadeuszx.slawinski@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

The patch

   ASoC: topology: Remove unneeded semicolon

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 980f91778a2f4dcca43d16b7a83feda8df5c96e7 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Wed, 15 Apr 2020 12:24:34 -0400
Subject: [PATCH] ASoC: topology: Remove unneeded semicolon
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is unnecessary semicolon after last bracket of if statement,
remove it.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20200415162435.31859-1-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 33e8d189ba2f..a5cd73742dc5 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2390,7 +2390,7 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 		tplg->pos += le32_to_cpu(hdr->size) +
 			le32_to_cpu(hdr->payload_size);
 		return 0;
-	};
+	}
 
 	/* check the element size and count */
 	link = (struct snd_soc_tplg_link_config *)tplg->pos;
-- 
2.20.1

