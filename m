Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25D63FCE8
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 01:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8B717E6;
	Fri,  2 Dec 2022 01:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8B717E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669940638;
	bh=2TvBpW+4mBe//AkYGD/5GQvrFqDxmtFqkYgIiMm0bgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUk3jcEHfLE67RmgtyZjYqT15D4iZCuo7MakgB2ssARlocUDaA8Hgxjg2GIvmyFB6
	 QKd1FL1zdbHj1NVDT1Yp3C3EexnDWRf2x5O3Ai1GMGedBbfGtK0pPzG0HlrYwMuiTE
	 IbwhA8TxGBt1YfMGQwXXPg5BQvm4pILsDHLp8v6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65AF7F8057D;
	Fri,  2 Dec 2022 01:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11DA3F80118; Fri,  2 Dec 2022 01:21:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4723F80118
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 01:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4723F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KcFXp35N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAF79621DA;
 Fri,  2 Dec 2022 00:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DCBC4347C;
 Fri,  2 Dec 2022 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669940490;
 bh=2TvBpW+4mBe//AkYGD/5GQvrFqDxmtFqkYgIiMm0bgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KcFXp35NRCmH6ZYPyy31n3LAu+jwq2kJCWgdVsvSztn9MMq3fN5lUinCJdZ1YvEkF
 xL4dZQRZhSzQ4HnmrrM8W96mwXdeFcWdNBgzcfpYZZ6d0fs2G/h2gfnE71GRNcKgVB
 OPdCbe8GRRkBJZM19WY0vEBK6bVn6t5s4lmGAH88H9goXOR08p+gBb4WbkamrzGCVc
 QoLCnO8NUQFK4YHOnW/xhVnLsW0lemZ41gg/UMz6x01iefSD22IYYFBkzVmliwREpA
 PJG9aAxqvFn7BtGoGzEMbzjIM6yyFZHxJCIMmJJOQTe/LalIEFXbZWNMbaILIB+XcB
 SCZurxV2CvlwQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 5/7] kselftest/alsa: pcm - Support optional description for
 tests
Date: Fri,  2 Dec 2022 00:17:47 +0000
Message-Id: <20221202001749.3321187-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202001749.3321187-1-broonie@kernel.org>
References: <20221202001749.3321187-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject; bh=2TvBpW+4mBe//AkYGD/5GQvrFqDxmtFqkYgIiMm0bgA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiUQq9PhIaf0O7Ezd65lBt/l7LVB7O8/W0d1//JGw
 IXs0OSGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4lEKgAKCRAk1otyXVSH0OyVB/
 wLRcQW5P/g1qd8SZ5Zg9Fs9Jwc1mzWGb7otESMM0f0RMdhOW0Bge3A3SHfz+5BcIQH4lxdzgOb78Af
 B7HJdsZzP46f8w7uNybSWoqaYS4F9j0SF8GsxqOKytc0apmS315oCgTg0VE8jsB5aug0CO1HhzOSoG
 kSAcCs5KGqAHvckJm56UAILVKG/Udz6lqEYVudDuF1Eo2PxT7IuhQIEpZF7hKgQ9KmfTtbqlRkewZa
 JjQsUsZzz90F0V/TfbCNJrtpiRMeO+3ZEx8Nufw5KRpC9dS6jAPJOK/TDIcwWNXRBAmifSrau7X5nL
 Bw4t8oR5v+CZghefkEkgGID6hqR9uM
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

In order to help with the comprehensibility of tests it is useful for us to
document what the test is attempting to cover. We could just do this through
comments in the configuration files but in order to aid people looking at
the output of the program in logs let's provide support for an optional
'description' directive which we log prior to running each of the tests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 5fbb3ff517aa..57d3f6dcb46b 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -244,6 +244,11 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 	snd_pcm_sw_params_t *sw_params;
 	const char *test_class_name;
 	bool skip = true;
+	const char *desc;
+
+	desc = conf_get_string(pcm_cfg, "description", NULL, NULL);
+	if (desc)
+		ksft_print_msg("%s\n", desc);
 
 	switch (class) {
 	case TEST_CLASS_DEFAULT:
-- 
2.30.2

