Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3F3A82A6
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 16:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E559D1684;
	Tue, 15 Jun 2021 16:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E559D1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623766952;
	bh=3arimWHc3JdAqDIRLiq9QrjUt58bhshWhPncFh6FCp4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nBVy9V1HZjQ0DW8jQDnXjVZkM4ggntOfO5jZb/56H3hwRSHQhQUvXaesPArvWL/q0
	 X56IvJCDz79zCplcEzcsj1DyqJNutsLZsONoK8hQzWL3w+dR5Qs0Eb/rJrplaRp9Bw
	 aTLP11j4ViM2x12Ihd0dUzVYIGIK3SNAor4WbEF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B7BF80113;
	Tue, 15 Jun 2021 16:21:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E1BF80171; Tue, 15 Jun 2021 16:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CF12F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 16:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF12F80113
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lt9vt-0003Rp-3k; Tue, 15 Jun 2021 14:20:49 +0000
From: Colin King <colin.king@canonical.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: bebob: Fix bit flag quirk constants
Date: Tue, 15 Jun 2021 15:20:48 +0100
Message-Id: <20210615142048.59900-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
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

The quirking bit-flags are currently set as contiguous integer enum values
and so currently SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC is zero and so
he quirking never getting set or tested correctly for this quirk. Fix this
by setting the quirking constants as shifted bit values.

Addresses-Coverity: ("Bitwise-and with zero")
Fixes: 93cd12d6e88a ("ALSA: bebob: code refactoring for model-dependent quirks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/firewire/bebob/bebob.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index c06579d9380e..4d73ecb30d79 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -76,8 +76,8 @@ struct snd_bebob_spec {
 };
 
 enum snd_bebob_quirk {
-	SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC,
-	SND_BEBOB_QUIRK_WRONG_DBC,
+	SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC = (1 << 0),
+	SND_BEBOB_QUIRK_WRONG_DBC		  = (1 << 1),
 };
 
 struct snd_bebob {
-- 
2.31.1

