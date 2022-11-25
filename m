Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD03638D8D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 16:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A71E1722;
	Fri, 25 Nov 2022 16:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A71E1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669390687;
	bh=3SlyLP19taVwYswP0QsLQCc2T7JAhJt9Ptkt7u+hkVU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d39SQ5z5c8eWI2izNvKFWjVPlg9unqOk7o+w1sL5y4/GiTYoa920Oina2x4h/YX8M
	 jckZAnfTu9NYAn4zTJE1nQlZ/aUaH1Rc5zalxeejfwTFFCsAitTI3OI5MFTuhbbEKw
	 ez/KVm6W+99GAbZddoKLUK2S0NwdmZXgtgFVkhg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD7BF8047C;
	Fri, 25 Nov 2022 16:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C07AF80236; Fri, 25 Nov 2022 16:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42408F8014E
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 16:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42408F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CGMVcH8k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 380A7B82AFC;
 Fri, 25 Nov 2022 15:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81321C433D6;
 Fri, 25 Nov 2022 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669390620;
 bh=3SlyLP19taVwYswP0QsLQCc2T7JAhJt9Ptkt7u+hkVU=;
 h=From:To:Cc:Subject:Date:From;
 b=CGMVcH8kAVCenPMJAjKRJZ4uDXrp/fxoZgTBR7UZW5YNMVZ691sY1Pd68OvimbvQU
 3XbIevd8qHoN8n5dNG6XrD8qPoVNRjIl+0vYzu0mV37taPwYO2T8LHEZU0f0vdojOF
 GbrmG4aFpDiGxpvs/8tYUwJuc59wX8T65/jqPqLDXj+Y/dIzBrgUlsVXAlBCDM8exD
 R7TCC4BxBsOrlWPryuhvipnfSsCUfwUDXaMVIvlknTw8+UUr74rZAsKQkOd0+ZzAxP
 fHnorRJ9ACwEYtOUMy8YNTkU2tgLjMBaulWnaPTusfUJU7u+O2ri/1L8aXxGDBBOVE
 LVAqHvP52GgxQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH] kselftest/alsa: Add a .gitignore for the newly added PCM test
Date: Fri, 25 Nov 2022 15:36:54 +0000
Message-Id: <20221125153654.1037868-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=broonie@kernel.org;
 h=from:subject; bh=3SlyLP19taVwYswP0QsLQCc2T7JAhJt9Ptkt7u+hkVU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjgOEV2YYfPnHIDeS8UvUFhCMRNKcY+//gyzotOg1P
 HkblX7mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4DhFQAKCRAk1otyXVSH0ImVB/
 4oQf/6StF+Gfq++H0MH1tHg7CsCsiIAZrs6dr8zv6g67wQsZboelajPAMtBeA+AX3/Pp+SHLGi0E8W
 90/TVQltt5AHw27GmeZhBAdEEtfC/Ic2JjiYZzSzlo/L+WoDiEJlgZ7EXmXBVQ/XTVJqw5IhJuOEKp
 hHUl/m7cN63cUECQC7QoUXBGQi6ZVm+DtHJUx1O/Q9ZGVHiADTCA3YrM0XYMngPRKZHfdFWePZVExO
 M6gEMigujLelqcDChtMkKKGWesmSMpbuv7sflv1X6QFEpYQevL4C3B6nrv12oANwkFVAc4btaKEdyH
 uw6gvvb4SnxU02d6FCGn5uwEcgMzhI
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

The newly added PCM test produces a binary which is not ignored by git
when built in tree, fix that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/alsa/.gitignore b/tools/testing/selftests/alsa/.gitignore
index 3bb7c41266a8..2b0d11797f25 100644
--- a/tools/testing/selftests/alsa/.gitignore
+++ b/tools/testing/selftests/alsa/.gitignore
@@ -1 +1,2 @@
 mixer-test
+pcm-test
-- 
2.30.2

