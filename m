Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB425970
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF501670;
	Tue, 21 May 2019 22:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF501670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471796;
	bh=bqRWXNKfTaIJj6LNVwdrsJElIod+HQvfJ049CO20TJo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U43pUnawF0Js/7Kcp7cNtChFxVJe/LnP5kid6Vx76VLBOeFrgPztfmR+VcQONV7T3
	 KMn6us/aSF3VI1OIKsfANr8WqlMX/6xXB6cuXsJIZQ/pcROT6MQRcnjFZdFn/gktv4
	 nd7iwEi7UW2lyCyukGDF6PxqcETx/qq9mEBRHSy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C79CF89753;
	Tue, 21 May 2019 22:45:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 504A7F806E7; Tue, 21 May 2019 22:44:37 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DB9DF8972D
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB9DF8972D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kPvTfCye"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=w9apU0qvwmpPn5fnWWSmUo8fBqOSldGiQqUGB7pLVSk=; b=kPvTfCyeuxQC
 8joStUUftc0ly1BjX5J3lj4dFlGhNU1M3FkNYGMNIY1RvkPEDZl3qYLvFjPIri/xACIIHqf8gkI3+
 wWfIjLa5TxzXgv0OICIm5dDnQB9HwrypIZUzXBeMsUhF2RIrZxz2SAch3R9HEm9Zc1Z7ug8KTu4QU
 lX5us=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRI-0001yo-06; Tue, 21 May 2019 20:32:48 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 9A6CE1126D23; Tue, 21 May 2019 21:32:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190517014341.133938-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190521203243.9A6CE1126D23@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:43 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677-spi: Handle over reading when
	flipping bytes" to the asoc tree
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

The patch

   ASoC: rt5677-spi: Handle over reading when flipping bytes

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 7b8164c1a29ce8ef91672c50ceac5c14475f5601 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Thu, 16 May 2019 18:43:40 -0700
Subject: [PATCH] ASoC: rt5677-spi: Handle over reading when flipping bytes

There is a case when a we want to read a large number of bytes that
require a burst but is not a multiple of the word size (8). When this
happens rt5677_spi_reverse will run off the end of the buffer. The
solution is to tell spi_reverse the actual size of the destination and
stop if we reach it even if we have data left that we read.

Cc: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 84b6bd8b50e1..a4dfa0345c6e 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -101,7 +101,7 @@ static void rt5677_spi_reverse(u8 *dst, u32 dstlen, const u8 *src, u32 srclen)
 	u32 word_size = min_t(u32, dstlen, 8);
 
 	for (w = 0; w < dstlen; w += word_size) {
-		for (i = 0; i < word_size; i++) {
+		for (i = 0; i < word_size && i + w < dstlen; i++) {
 			si = w + word_size - i - 1;
 			dst[w + i] = si < srclen ? src[si] : 0;
 		}
@@ -152,8 +152,9 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		status |= spi_sync(g_spi, &m);
 		mutex_unlock(&spi_mutex);
 
+
 		/* Copy data back to caller buffer */
-		rt5677_spi_reverse(cb + offset, t[1].len, body, t[1].len);
+		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
 	}
 	return status;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
