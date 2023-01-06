Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9865F845
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 01:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F6712A2E;
	Fri,  6 Jan 2023 01:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F6712A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672965884;
	bh=n5rn1ndDy0J4oMMVBUgSely0aXqBqrOyuJvdvAA+ycQ=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XjBVuP9Dp7O9lLt75DDlX5633nm/mYQLpXQVojgOVnFM8cNARYQAO8xsfYHjw24iz
	 K8dXdLQ6+vDwC4+l4ECxFOuel9TnOQwtiCnmueFP0yznZNhhSQBLtFe/UQ3LAO+qHC
	 iOIqep7RNUVvZCVn94s66DbayZ10jT27+g5ckTZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4219FF80238;
	Fri,  6 Jan 2023 01:43:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C18F804AD; Fri,  6 Jan 2023 01:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E6EEF8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 01:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6EEF8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gp9fRbHr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1480761CBA;
 Fri,  6 Jan 2023 00:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E992CC433F0;
 Fri,  6 Jan 2023 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672965823;
 bh=n5rn1ndDy0J4oMMVBUgSely0aXqBqrOyuJvdvAA+ycQ=;
 h=From:Date:Subject:To:Cc:From;
 b=Gp9fRbHrqw00tH8HiCAyeNOv4Ko0dqddK1n+wwPyB2pqgCSM69R6hVvrdeVbS8A1F
 detZJXlnt6wI4qXyjtm1Ns+71kWGyr+oreDwxSm1iYNrLmOfexo8xY2LdQcnkCwgUD
 ZYTHLDJk8vPtgNFciREX69CWap2IFo9JT+blgfCsTpwKxqjlovinJVLVnfscu0NLdX
 o5f/CmaXbEtI8wSxNo9J7i7qItjnTJXxqAcCGWdz5dErQC9FyZIjDQ3zmhZqxVwDVv
 +ha34635clrncSD5Cl50QP2pVU93gB4OlnRWm+xC2347w+KLh0eUUh6ERvbcdSUq23
 IBg3FDorAj1NQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 05 Jan 2023 17:43:39 -0700
Subject: [PATCH v2] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
X-B4-Tracking: v=1; b=H4sIALtut2MC/5WOTQ6CMBCFr2K6dkxbrARX3sOwKO0AE6GQDuIP4
 e4WbuDyey/53lsEYyRkcT0sIuJMTENIoI8H4VobGgTyiYWWOpNKGnjx0ONEPTI8AwWayHb0RQ+j
 IxgZHGSVybVxF/SZEslTWUaoog2u3Uy95QnjVowRa3rv4/cycUs8DfGzf5nVlv4zOytQcJZa117
 meWGK2wNjwO40xEaU67r+ACeGIVvsAAAA
To: lgirdwood@gmail.com, broonie@kernel.org
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n5rn1ndDy0J4oMMVBUgSely0aXqBqrOyuJvdvAA+ycQ=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMnb8/Y1Z18MqTqn4MkcXGLMlX/gUGaQy6qkMHHB/51ME6vq
 eZ50lLIwiHEwyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgImwOzAy/KuXiIoRbnWfsvhmu/SSGV
 IG/v8WejGxzg5iPn7k1CX77YwMi2//yg6VU3qTf/302g5B5VDlh/lnVLjdppzbpLO96ORqbgA=
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
Cc: alsa-devel@alsa-project.org, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Syed.SabaKareem@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

ret is used uninitialized if 'goto de_init' is taken. As this is not an
error nor should the ACP be deinitialized, just directly return 0 in
this case statement, which resolves the warning.

Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
Link: https://github.com/ClangBuiltLinux/linux/issues/1779
Suggested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Instead of setting ret to -ENODEV and going to de_init, just 'return 0' in
  the default case (Vijendar)
Link to v1: https://lore.kernel.org/r/20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org
---
 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..64648b75de6b 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -217,7 +217,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		break;
 	default:
 		dev_dbg(&pci->dev, "No PDM devices found\n");
-		goto de_init;
+		return 0;
 	}
 
 	for (index = 0; index < adata->pdev_count; index++) {

---
base-commit: 03178b4f7e2c59ead102e5ab5acb82ce1eaefe46
change-id: 20230105-wsometimes-uninitialized-pci-ps-c-3b5725c6ed31

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>
