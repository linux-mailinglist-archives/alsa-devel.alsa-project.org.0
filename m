Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC68299BB2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:53:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 062D516DA;
	Tue, 27 Oct 2020 00:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 062D516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756381;
	bh=vMMAgSfikcnpjQ3HPznBETOr9yljsKexNKRHJBcCX5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZApQoe82aPWRAcSA5oau9dQiYQTXfVGtHle7LADGeM4XocJKJ9p8iPgDRja+Ntkk
	 l64bqgsOkH6rIfMj58B8FR6S+qFMIu374DsH1gaiaM8C/9vw7M5XNY/4Jw5GWOVCSG
	 /5tu4p36imqKVvKJw6mH0Da9KnvaydMFks51oKpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 380B1F804BD;
	Tue, 27 Oct 2020 00:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B1FF8028B; Tue, 27 Oct 2020 00:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 817FBF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817FBF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PUTvTp6F"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B926223AB;
 Mon, 26 Oct 2020 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756200;
 bh=vMMAgSfikcnpjQ3HPznBETOr9yljsKexNKRHJBcCX5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PUTvTp6F8b5/BFM7ZmW8Y1ouUUOSv9Ags9z/o2v2iObxsaCdIQZmF864J9z+g/LqY
 KZnQBStbqwGO/w44D2NhHFtVsKLYxKSyib4ZAAUBi5FJ9Lv04rur+ZRlZy2ehJX6yG
 l5sf1GicGmdAEJr1CunuMyrJl4DkirL/GyCbJFc4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 043/147] ASoC: AMD: Clean kernel log from deferred
 probe error messages
Date: Mon, 26 Oct 2020 19:47:21 -0400
Message-Id: <20201026234905.1022767-43-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>
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

From: Akshu Agrawal <akshu.agrawal@amd.com>

[ Upstream commit f7660445c8e7fda91e8b944128554249d886b1d4 ]

While the driver waits for DAIs to be probed and retries probing,
have the error messages at debug level instead of error.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
Link: https://lore.kernel.org/r/20200826185454.5545-1-akshu.agrawal@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 406526e79af34..1a4e8ca0f99c2 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -472,12 +472,17 @@ static int acp3x_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				card->name, ret);
-		return ret;
+		else
+			dev_dbg(&pdev->dev,
+				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 	}
-	return 0;
+
+	return ret;
 }
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
-- 
2.25.1

