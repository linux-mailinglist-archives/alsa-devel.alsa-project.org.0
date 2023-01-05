Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517665F094
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 16:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFBA7114CF;
	Thu,  5 Jan 2023 16:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFBA7114CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672934082;
	bh=vHZs9OjJ6KXg+S9h06OTafkkgxBlrbQRQXCR8C8oFts=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qAxYsM0Utm9tOXQ/+Dz8GDwk0hPkOhWm9xCJI2KHhzAs6tP6Ej7kGK4QckShjhPVL
	 AGUIb5SXXjrk9rpRMDp3ErdMwdErkTuKxruczTsxHYLS6d1tPyKn2V98WuJX4qcckX
	 PFKyfJITGMR08vl9ULp/iiQ7Bknx5TRMO2Q2p01E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 656C1F800C0;
	Thu,  5 Jan 2023 16:53:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA89FF804AA; Thu,  5 Jan 2023 16:53:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D10AF800C0
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 16:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D10AF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EaRmeDs9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3365DB81ABD;
 Thu,  5 Jan 2023 15:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72696C433EF;
 Thu,  5 Jan 2023 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672934017;
 bh=vHZs9OjJ6KXg+S9h06OTafkkgxBlrbQRQXCR8C8oFts=;
 h=From:Date:Subject:To:Cc:From;
 b=EaRmeDs94KgukTL3nj7VhltrGLOj5INt3wMoL9fll6WRAybCmCwkBrdrJLi/YMAOi
 G38A/xeGwXHS48/pb0wJ0aABHaE4g0CVNok4NTd+TUixmGFbhlyHUjnTCE9Jp8MEqX
 UUJyy1YEV6GPjEiTqDcVd/tICh8IjxlNNqFEL00O51pqRUSR27N72hH1Ti+v43aQ+7
 uRrPTEyhv1rba5cfIott1kTA0DQZtYlM2/hE3euHrkwJvCgMgtmpnHVDI4fmFrm9MV
 k1f9ernVSQ4yZknxLab+uP6u68l1p3ug6jH+9Wr8wGiL/BGVQEni0uZWiL8EkeBXH1
 lYAZFnOrhwlww==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 05 Jan 2023 08:53:32 -0700
Subject: [PATCH] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHzytmMC/x2NSQoCMRAAvzL02YYsRMGviIcsrdNgMiEdFxzm7
 2Y8FgVVKwg1JoHztEKjFwsvZYA+TBBnX+6EnAaDUcYqrRy+ZcnUOZPgs3Dhzv7BX0pYI2MVjGiD
 OxkXj5SshtEJXghD8yXOeyl76dR2URvd+POfX67b9gN/dwFjjAAAAA==
To: lgirdwood@gmail.com, broonie@kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=nathan@kernel.org;
 h=from:subject:message-id; bh=vHZs9OjJ6KXg+S9h06OTafkkgxBlrbQRQXCR8C8oFts=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMnbPjU6rCu0ly2bHu2wMyhmn4Li2T8xM3YKSjq/td54xUcq
 sFWqo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkjSwjw9QHEZEczY8je97eenThk6
 aeQyMrz4JNomHJfEeyF+kf4mVkWNOb1FfPFlP0om+uyEZFjV1i2zpKhW5NfcF/7+K9C/E/2QA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Syed.SabaKareem@amd.com, Vijendar.Mukunda@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clang warns:

  sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  sound/soc/amd/ps/pci-ps.c:239:9: note: uninitialized use occurs here
          return ret;
                 ^~~
  sound/soc/amd/ps/pci-ps.c:190:9: note: initialize the variable 'ret' to silence this warning
          int ret;
                 ^
                  = 0
  1 error generated.

Return -ENODEV, which matches the debug message's description of this block.

Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
Link: https://github.com/ClangBuiltLinux/linux/issues/1779
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/amd/ps/pci-ps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..f54b9fd9c3ce 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -217,6 +217,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		break;
 	default:
 		dev_dbg(&pci->dev, "No PDM devices found\n");
+		ret = -ENODEV;
 		goto de_init;
 	}
 

---
base-commit: 03178b4f7e2c59ead102e5ab5acb82ce1eaefe46
change-id: 20230105-wsometimes-uninitialized-pci-ps-c-3b5725c6ed31

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>
