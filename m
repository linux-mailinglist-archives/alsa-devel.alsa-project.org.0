Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CD23F5C7
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Aug 2020 03:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12B61607;
	Sat,  8 Aug 2020 03:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12B61607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596849829;
	bh=ejgo1k1AGPs+IczL8IQ7qYbIjvwOaHXJeXTvIep6scE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zgbc4DlUa62fq5oX7AglTTMZBsjoG1e4uhPcJr0MN+7f94CMHPCVWzc4q38zRYQmt
	 6vGASu73f311sFxfukwjiAXQU4VOhPzXcn0zw8g2z87zlKkfsibUSugq0jsPN7Xv1x
	 DlpXc4UtMROPh5ipthb5ezUqe+iAaLI9TcFRnapE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC30F800B7;
	Sat,  8 Aug 2020 03:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0107F80218; Sat,  8 Aug 2020 03:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09772F800B7
 for <alsa-devel@alsa-project.org>; Sat,  8 Aug 2020 03:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09772F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="NodTcolu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=kj/TToLcJ4MZ4DSCFCc73HaSywbCEpwgumzWbAteKWw=; b=NodTcoluF+cVQR1Dznu5pYqr9Z
 m4eh1cbcGYn+ysAvsKmVqOI2N4Z+RccveAQLTgMt08eGLqqYokoC07HaJG4LuRSdS/tdqzQdgmT5Y
 z/vOvKXZbeqAHBLOPpycsd7oAfoqAtcRb8VyiloA3LYXIUH1FNzW36b64h/7VivE1xQNnyCbJ1z3f
 2dBHV+VZuD8E1sCsYJhiedUCfHIEefOwj8TI8GSGYZDEmQw3pb9qsYHu7G3iQy27HjMpgmj7tiNxy
 NYxUFQXFP0T/y4RAKpfVXwmhMJrJbqBi3QVDYOG5oCxhW00KmoOnZ1e7CArztVm4qpHiJKQxD5bUT
 RNp5r0Bg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4DYU-0001Eu-8S; Sat, 08 Aug 2020 01:21:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: delete repeated words in comments
Date: Fri,  7 Aug 2020 18:21:43 -0700
Message-Id: <20200808012143.10777-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

Drop the repeated words {start, it, the} in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/codecs/nau8825.c |    2 +-
 sound/soc/codecs/tas5086.c |    2 +-
 sound/soc/codecs/wm9713.c  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20200807.orig/sound/soc/codecs/nau8825.c
+++ linux-next-20200807/sound/soc/codecs/nau8825.c
@@ -251,7 +251,7 @@ static const unsigned short logtable[256
  *
  * Acquires the semaphore without jiffies. Try to acquire the semaphore
  * atomically. Returns 0 if the semaphore has been acquired successfully
- * or 1 if it it cannot be acquired.
+ * or 1 if it cannot be acquired.
  */
 static int nau8825_sema_acquire(struct nau8825 *nau8825, long timeout)
 {
--- linux-next-20200807.orig/sound/soc/codecs/tas5086.c
+++ linux-next-20200807/sound/soc/codecs/tas5086.c
@@ -487,7 +487,7 @@ static int tas5086_init(struct device *d
 	/*
 	 * If any of the channels is configured to start in Mid-Z mode,
 	 * configure 'part 1' of the PWM starts to use Mid-Z, and tell
-	 * all configured mid-z channels to start start under 'part 1'.
+	 * all configured mid-z channels to start under 'part 1'.
 	 */
 	if (priv->pwm_start_mid_z)
 		regmap_write(priv->regmap, TAS5086_PWM_START,
--- linux-next-20200807.orig/sound/soc/codecs/wm9713.c
+++ linux-next-20200807/sound/soc/codecs/wm9713.c
@@ -755,7 +755,7 @@ static void pll_factors(struct snd_soc_c
 	u64 Kpart;
 	unsigned int K, Ndiv, Nmod, target;
 
-	/* The the PLL output is always 98.304MHz. */
+	/* The PLL output is always 98.304MHz. */
 	target = 98304000;
 
 	/* If the input frequency is over 14.4MHz then scale it down. */
