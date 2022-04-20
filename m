Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F9509095
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 21:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139B71775;
	Wed, 20 Apr 2022 21:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139B71775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650483669;
	bh=tc5FOp37X1nlh+h/hDzp8RiZRIjBdt1lbWGyfRjb/YE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lrc7HDWPGYvXawfrFEZ+NvVOPBSlKm9GZ+wcnhnGrinM+b93EOvMRGlFyGBhNho0U
	 +YQJEblmCtATcn8VdMnxsGphflSoALjfXIVyWYTR19d45osLw/ywGeBMPWWYyYtD4d
	 YG7o/TCgdiaG9Sp92fNoG7ZytaWig6B/C/oRVdlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB9AF804F1;
	Wed, 20 Apr 2022 21:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F034AF800C1; Wed, 20 Apr 2022 21:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 929BBF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 21:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929BBF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bJZcIGT+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74834616AD;
 Wed, 20 Apr 2022 19:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027FDC385A0;
 Wed, 20 Apr 2022 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650483568;
 bh=tc5FOp37X1nlh+h/hDzp8RiZRIjBdt1lbWGyfRjb/YE=;
 h=From:To:Cc:Subject:Date:From;
 b=bJZcIGT+I2/2WDaUcLZV14eVCGVwMBp3lcWW073t2TpB46QmX6UpMjDpdmbWRlc58
 VPMAMx3Vi1xr3N0JLlmqDXrD5usUgxHHyMWrc8ksSkmu77I3R5fBzA4oImdGYJ6050
 xaGOu7UrauWc3jjZT5IINMnxxrb7ktAQOSBRPBmpnqh2lp7AvaWD3YvyOJTdg35GG4
 BSO2tARIFtI0aQhQ0OilBoB27ghCbKxaX1zcGk/H3Zib+XWr4IphBq01tY/dTZMZQX
 XPb1B9YciFKJPrKpJgBH19Y46UYrP73gEV9fHBMEmQbdivvecRS6j26BQPQaQGjXhe
 odz/SzkQHQCxQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: max98090: Reject invalid values in custom control
 put()
Date: Wed, 20 Apr 2022 20:34:53 +0100
Message-Id: <20220420193454.2647908-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; h=from:subject;
 bh=tc5FOp37X1nlh+h/hDzp8RiZRIjBdt1lbWGyfRjb/YE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYGA9iH8lWExS5j3bxF5Io32jetcZ/B00KdIrKB8j
 r9Uly0+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmBgPQAKCRAk1otyXVSH0BwjB/
 9uHzNQAkofRJkm4IA3zSKFb3o1wfHqCCxz1X+bzw3TwLmTIYjFruin+Eb7UnVeoYHS0BYE6K2zlB4i
 DxWADpO2HZoByIPVg6jYStlV5zgZ1kvV3FezKvdDWg8At/Aq3X0A/QbcKVK4eIgpioc6fTR4Cb1eC4
 0jcP+MLF4Umax5UrJfMHjbmhUn/FA+dKQWqx4dg7i5A/bWfI2wYkmowrVoMf/+B5VbrAc/RXRDJn5m
 kAM1KxLPgxYApfeHai942i6EbxrxA+Rh6TPpqZzp54rAXIopi7whgNPh7+fRxKKGHG8lpPXaMhQqhM
 tpaVON93wwvUY6kDmM5qjxYzP3KqLr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The max98090 driver has a custom put function for some controls which can
only be updated in certain circumstances which makes no effort to validate
that input is suitable for the control, allowing out of spec values to be
written to the hardware and presented to userspace. Fix this by returning
an error when invalid values are written.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index b45ec35cd63c..6d9261346842 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -413,6 +413,9 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 
 	val = (val >> mc->shift) & mask;
 
+	if (sel < 0 || sel > mc->max)
+		return -EINVAL;
+
 	*select = sel;
 
 	/* Setting a volume is only valid if it is already On */
-- 
2.30.2

