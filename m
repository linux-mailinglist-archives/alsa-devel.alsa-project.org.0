Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4276C3C2DCD
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D270216CE;
	Sat, 10 Jul 2021 04:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D270216CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625883923;
	bh=CTqiA0nCJ1PAXq3EDSd5kAAfEFa48FGUGn2VsY6ulMs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJ8Y+LBtF4CvSQymWOVJjX5PfsDh5AdCr/Pau7k6xMO8fOdaZULg1/aOF2AAmeV5I
	 9DVFhRdThoPzPKzCdS84sGzbP5FYt/SjSP3789RLqK4lU343u/nTfvFL5NJaFhgqri
	 nYjIIRCFt4MNfIQsqK2L9lGP47LKTUjJTfe7Fvr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 839FBF80557;
	Sat, 10 Jul 2021 04:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7621DF80553; Sat, 10 Jul 2021 04:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8778DF8012A
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8778DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SNfgpv2N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E930B61402;
 Sat, 10 Jul 2021 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883560;
 bh=CTqiA0nCJ1PAXq3EDSd5kAAfEFa48FGUGn2VsY6ulMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNfgpv2NhGPIUaexNoRRK8tw7nGQDuU+PlT6tT8ESU3NW9F9uJmWsyJ9SksnYepek
 asbNwfqDTsT1KkIwf5ki1Xjh5L8bSqneP9Mq0HfymL0tSiR5IJTaTra8WF32kJ5Lue
 UjZLjK4tBX/5XcalUiuGRRVRtWLc2IP4tT5alkQWwgVgT8Ir6RqDbxY1Uq/NUuWMcM
 7iliGbz+dVgjxq5nKXbOwaJytW3/tXS0cpiyrSKd6O2xrzVYQ7XvjrfaqGmliHTojC
 SK95/6KOO1wDd2ee1S7xkxHYaUsw6mRMFYmJBzBUXfcoNGymF/qbs261X0yLB51w46
 kZHt/V9PcKJlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 068/114] ALSA: control_led - fix initialization
 in the mode show callback
Date: Fri,  9 Jul 2021 22:17:02 -0400
Message-Id: <20210710021748.3167666-68-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710021748.3167666-1-sashal@kernel.org>
References: <20210710021748.3167666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Jaroslav Kysela <perex@perex.cz>

[ Upstream commit e381a14c3e3a4e90e293d4eaa5a3ab8ae98b9973 ]

The str variable should be always initialized before use even if
the switch covers all cases. This is a minimalistic fix: Assign NULL,
the sprintf() may print '(null)' if something is corrupted.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Link: https://lore.kernel.org/r/20210614071710.1786866-1-perex@perex.cz
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a90e31dbde61..ff7fd5e29551 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -397,7 +397,7 @@ static ssize_t show_mode(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
-	const char *str;
+	const char *str = NULL;
 
 	switch (led->mode) {
 	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
-- 
2.30.2

