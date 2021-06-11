Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 673493A470F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 18:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52691AA8;
	Fri, 11 Jun 2021 18:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52691AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623430445;
	bh=3OpQuP2R1cfZsAAGivO/AiBB5ONUOTN+20FkmEcxELM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vm9DRU6lhAlQW+MFTsfksS/LNIot9eBDYV4d/cqGW8mhCJDY3R2+qtUj4cUrjzOzI
	 PQjF3cTd5e1QJf/3ef/+XF1YIxW7UVYYB0+uigqqZDfVWw8+PwevsAfOSWP6e4ELzG
	 RRalR7QNMw3Odd5AaCczgvG5QxzDquxZxvJDlaxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 575ACF80276;
	Fri, 11 Jun 2021 18:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01414F8026C; Fri, 11 Jun 2021 18:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97054F80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 18:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97054F80149
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lrkOP-0004zC-1F; Fri, 11 Jun 2021 16:52:25 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: i2c: tea6330t: Remove redundant initialization of
 variable err
Date: Fri, 11 Jun 2021 17:52:23 +0100
Message-Id: <20210611165223.38983-1-colin.king@canonical.com>
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

The variable err is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/i2c/tea6330t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index 742d0f724375..037d6293f728 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -284,7 +284,7 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
 	struct tea6330t *tea;
 	const struct snd_kcontrol_new *knew;
 	unsigned int idx;
-	int err = -ENOMEM;
+	int err;
 	u8 default_treble, default_bass;
 	unsigned char bytes[7];
 
-- 
2.31.1

