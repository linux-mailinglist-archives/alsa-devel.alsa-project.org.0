Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34040DCA5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 16:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDE61893;
	Thu, 16 Sep 2021 16:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDE61893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631802218;
	bh=4MrmTkqq9WcvaqVvUxwZhWZWFlEwojaGB3n2qPQXAHU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mi3MuxhJmpN+qrcICBLKEaZzAbhb2vGdR+Cr4hFHxn+rHMJ1Eh2mYpjr8RnL+xebC
	 GYDYMwflZC4m1MBZyU68XM9OqNIVd3XIUSF1qFZ1V+QBdDhs40WmlA14cxQG1YLH+X
	 mdzgmH6vWofkrAT8B5TjuQQFhb6bc/T+HO66d8Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D24F80271;
	Thu, 16 Sep 2021 16:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D14F8025E; Thu, 16 Sep 2021 16:22:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DFCF80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 16:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DFCF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IH9ee/DQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A7A161056;
 Thu, 16 Sep 2021 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631802127;
 bh=4MrmTkqq9WcvaqVvUxwZhWZWFlEwojaGB3n2qPQXAHU=;
 h=From:To:Cc:Subject:Date:From;
 b=IH9ee/DQ8G4t3SaVfkamCOL4nJ2f69pqZruiTIdA6gKUymSaNOWZxMbiDuCiPN7Ql
 JZdtdcONEHtcWU5SrWhCFyAIypaW8A11Mmr7gEm88PyHNMWgXKMCFG9K8c6boEY9Sw
 sTak8Y93Y2bPLffaamfnC66QYBl9fcSX18zWjHzFX0EGwotHI3G+zOerPQ9FDjxznf
 DNhb94O7/uhK15Uh3/FO0c1UlWwF2UOYldYUZzt+5AzrgyXdSqvPDUPPAan0Fwdd1T
 qW3NCDaG9UbNZXDbJxj53jx1vfy5vfONRWTCQMODB1UKEuGdoNmWu1u/mtLYDgxywB
 NguA0fscMO2QA==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ad1836: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 15:21:25 +0100
Message-Id: <20210916142125.7226-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; h=from:subject;
 bh=4MrmTkqq9WcvaqVvUxwZhWZWFlEwojaGB3n2qPQXAHU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1JmD8V3EeVgtb/kYxZ+UWizEL8pMGB1pf3/CMao
 hdueFZ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNSZgAKCRAk1otyXVSH0LzaB/
 4yl42pr9lXSzk4MegZf53JxwHFW/lkJbx/FV3zT/iWTtIf/b6zqAnv8CAdiwjBbo22Fj0FqOIP60j3
 i7kcSq9Ty6CqRKmxQLxQczDmSOTDKk3BdoUVi18xU+nc5xVkjLec8aQX/5ZMPxPTyDfCz19T/k+mE7
 AEWx6Uy5FlHEji9ZSSOq1PnLXCpfuIYb5SihjH7wflBrJGu5kzkDZTZd70zitSs7dUKOI7RtNR88Uu
 3UQRanKbUa5XEWT7B/tZWdV+GMZsgjLKNdB45KG3gS8kSDvOO90RrIect6VddU8kfFJTLtbuuO+j1h
 YpcG3jx+gklCeFl0t3ABWQbsbxdFnc
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

As part of moving to remove the old style defines for the bus clocks update
the ad1836 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad1836.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 08a5651bed9f..29e1689da67f 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -148,9 +148,9 @@ static int ad1836_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	/* ALCLK,ABCLK are both output, AD1836 can only be master */
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	/* ALCLK,ABCLK are both output, AD1836 can only be provider */
+	case SND_SOC_DAIFMT_CBP_CFP:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

