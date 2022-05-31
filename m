Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65865393BB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54A32018;
	Tue, 31 May 2022 17:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54A32018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010095;
	bh=RmwCycR3WFlIwfKXA5dP2eyhQAV6Zi3YQ1p6a5oR4A4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PrSSdG3ciydTcqxAZyc+ONjDSNbZBZWKSqyAYNOqQ0nrUq5m06+z9n4v16O1QE5pB
	 awT50wXP8NO6LOJA5QEYO/sd4UKasUmilzBhppRJN3rJeICdRJ78IMkuIkmNJIjiWh
	 GZZDKAdAVQabHgkgiu1sLVjr9GD8cIU+4ymypGhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F79F80516;
	Tue, 31 May 2022 17:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2781EF8051C; Tue, 31 May 2022 17:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ACDDF80516
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACDDF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X3PA433j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97555B81168;
 Tue, 31 May 2022 15:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AFCC385A9;
 Tue, 31 May 2022 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654010027;
 bh=RmwCycR3WFlIwfKXA5dP2eyhQAV6Zi3YQ1p6a5oR4A4=;
 h=From:To:Cc:Subject:Date:From;
 b=X3PA433joT0XoLzFfVKPaRF8uiK6lH7oPvAiWsVJSbUkaJ338U46HfNfa6wvPSBoc
 9BFJ8wv5W6TuiXYJ0ZOx94kdXyuHp36rpenrEj3vsXZR9FKZJaDoUOqa9UD+EjCYZn
 E8agMwIgYf1kMsyIIiQ5e8NqsOzhmXSxzLUwOHzxkzkXq/bU+g9ccEyd/JnRMJhYLe
 zxFq/gW1GLU4/W+KbTqVNT/38VapH1Ira3EqMtx4WKXEqmS5B3xt0MqjXWsq0OfH6b
 mI6HyScAbgqeHkKTY4TzPd7QzlcjHcOCsI8HpoTYiEndNVuqjz60k7S/ETsTNOn/74
 ryT/wtvNVP0qw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH] selftests: alsa: Handle pkg-config failure more gracefully
Date: Tue, 31 May 2022 17:13:37 +0200
Message-Id: <20220531151337.2933810-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; h=from:subject;
 bh=RmwCycR3WFlIwfKXA5dP2eyhQAV6Zi3YQ1p6a5oR4A4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiljBBCCHKDUduv/2nquVo28cAVN51XaTXqgU+Tu7q
 X2OsG86JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpYwQQAKCRAk1otyXVSH0CpYB/
 9QBZ+2ZEym7LVf16fGuCDWbOBtahBrHoM+mSrEzpsYPimoy6iMkBxy/QJFqhxCb2xGWP45mEHieKBc
 enOaemDT17QIJDWAvqZIBr+zIKviE5ongTuvxqacPnR8MdUCdTEl0ZSKo98GGLR2ExVI+6p9iXdf5N
 cIrkK5CmajuEYHxkq2qlG9bWC/FzXTB5n3tp4E4tqyzrVMfRkPyDfj88I1LWtM9R6L+OgexgCgscse
 9h+eJ/PQBjaHLKCf7RkF3IMAwZq/lF03RsolwPbWGsHtND94ZzHLRgt2HfWtFmCG2z2t0FErL4tKpr
 jJ69pgWBSi8QzAqFwVR5QDADPmIeOt
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

Follow the pattern used by other selftests like memfd and fall back on the
standard toolchain options to build with a system installed alsa-lib if
we don't get anything from pkg-config. This reduces our build dependencies
a bit in the common case while still allowing use of pkg-config in case
there is a need for it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index f64d9090426d..fd8ddce2b1a6 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -3,6 +3,9 @@
 
 CFLAGS += $(shell pkg-config --cflags alsa)
 LDLIBS += $(shell pkg-config --libs alsa)
+ifeq ($(LDLIBS),)
+LDLIBS += -lasound
+endif
 
 TEST_GEN_PROGS := mixer-test
 
-- 
2.30.2

