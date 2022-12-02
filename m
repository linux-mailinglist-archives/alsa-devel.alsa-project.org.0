Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786D163FCE9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 01:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E90182B;
	Fri,  2 Dec 2022 01:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E90182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669940644;
	bh=dBD1V0ORWBj1gViOrTy7ZqLawnuQQJYymah38QyRU4M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFnVbn08Fz278DgyKdsfuFq3eF1j+WUzG4D9wwpyG1RzajEIQRT9sWggpM7ON7hKO
	 Q00yPBeZx4ADvt/HgHgIeSObduiuWOZZPcHeW8LZxTkA5dmbFKbif++hf4akeLcGpf
	 YJiXHgX03XsbyMVXLD7r7dvgErmO57qimhPQ7Pf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4349F80587;
	Fri,  2 Dec 2022 01:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC014F80568; Fri,  2 Dec 2022 01:21:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CACCBF80564
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 01:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACCBF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JEEjVcEo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 835A8621D7;
 Fri,  2 Dec 2022 00:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A315C433C1;
 Fri,  2 Dec 2022 00:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669940491;
 bh=dBD1V0ORWBj1gViOrTy7ZqLawnuQQJYymah38QyRU4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEEjVcEoCdDe2vydJgo6Fds44sBe4nGYVFs5kwlOOgY83hP0iaUWBGDlCA1+kjnRR
 2WDdmVsnGlz8Mo7C6Zv4CaB51etgn7ku9gHIlMI/PsxqrrlCFKZ1M/yvmuOjkZdFop
 20Sd6tfdBLXMjF9vhVNCxPiRC+ANdTVR8J9/as7ZI8UQGtMNGkRiFxVTCeyyCMXfD3
 PslMnWKxud72BUGBaM2esWXY/MKGAEp2bf053D3cOf17KmKAQ0NYhIjLpa4fbcQwRN
 dP4vihSqKnl/NdbIxxCuqyADDrDw870puxZ9SbzDaCETpzP9iHuc7V/f9bv6yXMd0a
 n2YH6/YV5qTWw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 6/7] kselftest/alsa: pcm - Provide descriptions for the
 default tests
Date: Fri,  2 Dec 2022 00:17:48 +0000
Message-Id: <20221202001749.3321187-7-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202001749.3321187-1-broonie@kernel.org>
References: <20221202001749.3321187-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=broonie@kernel.org;
 h=from:subject; bh=dBD1V0ORWBj1gViOrTy7ZqLawnuQQJYymah38QyRU4M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiUQrsTUC11H3brnOPFclzE/I346UGT29tb6iInrE
 QC+kHEGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4lEKwAKCRAk1otyXVSH0IyhB/
 9hUsUOCb9wqCoPiH7AgPo3TXcnBHp9zypli7WnEc/yqw2ZtuO96CZbFDFz72DqFIqDqiHZDzjYeKn+
 SRKMGmc+ttgXbm8dMJlkSDfMr+35fzOH7AKVV7hzQsHIYAbvpr/8oxWucxvONDuDJTim+Ol3xCrOxs
 CTWI1zv05zYvqq5PCRvjaeo2GxinTGCfXQ94J/sb6o24SOVjqZNtQ7b0XJUeDwJHgrJmv4piKNLy73
 saRRuYwjX65h6IE+ECKM4lZiajYbxLu+bk1i2loBoFG1BYVVvn0FTGZqknw6OK63PkQfTt6Cr48DKr
 w+oYe/TAjIHrD+4dHxi5WWhbrwBx5Z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org
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

Help people understand what the standard tests are trying to cover by
providing descriptions which both serve as comments in the file and log
messages in the program's output.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/alsa/pcm-test.conf b/tools/testing/selftests/alsa/pcm-test.conf
index 473a19251b49..1662a8c7073e 100644
--- a/tools/testing/selftests/alsa/pcm-test.conf
+++ b/tools/testing/selftests/alsa/pcm-test.conf
@@ -1,4 +1,5 @@
 pcm.test.time1 {
+	description "48kHz stereo small periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
 	rate 48000
@@ -7,6 +8,7 @@ pcm.test.time1 {
 	buffer_size 4096
 }
 pcm.test.time2 {
+	description "48kHz stereo large periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
 	rate 48000
-- 
2.30.2

