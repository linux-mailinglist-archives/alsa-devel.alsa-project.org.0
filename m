Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD46C46DD89
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88DD62694;
	Wed,  8 Dec 2021 22:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88DD62694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638998403;
	bh=2FpH5VoXr9ueY5bDrwm6B2Tr7onF5v+ChxxrbUuG+c4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i8wXrkPfp3pnKaeeRRS2g18DXdBLeg6/8LRQZ3X8EKVm2fN6OjT/l2I09gyBky/c6
	 00o0sIlqld/0FCt5uU8EEeepj+ORmme2XxICrYpBnRmqr6sCPRlYPtd4sQvCT7ZRVZ
	 om+16g5Z0bqw1w4+uaH9GRVLWdoahPgVYMm2ZPiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 986F7F804FE;
	Wed,  8 Dec 2021 22:18:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32732F804EC; Wed,  8 Dec 2021 22:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE956F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE956F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yrr3Nmue"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C0337CE23C4;
 Wed,  8 Dec 2021 21:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18597C00446;
 Wed,  8 Dec 2021 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638998270;
 bh=2FpH5VoXr9ueY5bDrwm6B2Tr7onF5v+ChxxrbUuG+c4=;
 h=From:To:Cc:Subject:Date:From;
 b=Yrr3NmueTLsshhKaA0OTAVsBNNaEOqI0SplQLGafRKHlZV9Rg+BWlODz5fkO2qZjx
 shKfp5iTSQ2TrZX0UGSYFvTyexHp2L1p7BaWbxHrmcuoEJpcqo7YBVWCnmZQpfMmO4
 vnyv3Qyipi42SA/NgHxhaI1GYa5X1rP3jY8ycfzuaFYHrUF10+c7QQTnVzS5GzZ/uJ
 Z1F4yc0ORMJY4sJrTwO2p/Aur0yshIJ3awaQoHiIznCs8ca0/NCCvA4np26Ifu5l6A
 hp7dEt4KnenPx8I75oRwlbSi/f+sfRrxEP01AMh7Yb4aMDKyuH4vjO9bOzL8szol+d
 FeNoL9z7fmN5g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 0/3] kselftest: alsa: Add basic mixer selftest
Date: Wed,  8 Dec 2021 21:17:42 +0000
Message-Id: <20211208211745.533603-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; h=from:subject;
 bh=2FpH5VoXr9ueY5bDrwm6B2Tr7onF5v+ChxxrbUuG+c4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhsSD1HVS5LAtgAeA5KjgYRZbZjE0afMZo56TjpTcw
 pW5Bls2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbEg9QAKCRAk1otyXVSH0KBeB/
 0dZ+rG5/EXHfvNPwe4qrkUcWql9pkBALACyp40hoSflqojOri1+5Xn+Mmk92m4uau3QlGZLU/+bxG2
 QngGXfYMsBBDF89jj3pxn7fG5mIeCRjnqxx3xxSPy/pPowa/c2IwBGJPsQd/mn1VP144SbkB+Q5Fn5
 ov9DQUTEbI5E5M7vv6JqcD0grTwVhdL/tNkUSjKTPrYoZzo0yeB67HPSbltxUW5g/xpSskX5MDqq9G
 NI+WGJwRqhfrA6KJRkSjl0UfgRjDpkRQJqDL2BcWGZDqpOkFdOuzQ6YXBxNvKVFUOBYeF0N7hs7vKO
 trA9xVBFAia3mhLmB9fxrMTAovH4WN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

This series adds a basic selftest for the mixer interface, as discussed
in the cover letter for the main patch there's plenty of additional
coverage that could be added but this is a good starting point.

v3:
 - Pull in incremental updates adding a fixed library configuration from
   Jaroslav and support for volatile controls from Takashi Sakamoto.
 - Stylistic updates suggested by Shuah.
v2:
 - Use pkg-config to get CFLAGS and LDLIBS for alsa-lib.

Jaroslav Kysela (1):
  kselftest: alsa: Use private alsa-lib configuration in mixer test

Mark Brown (1):
  kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest

Takashi Sakamoto (1):
  kselftest: alsa: optimization for SNDRV_CTL_ELEM_ACCESS_VOLATILE

 MAINTAINERS                               |   8 +
 tools/testing/selftests/Makefile          |   3 +-
 tools/testing/selftests/alsa/.gitignore   |   1 +
 tools/testing/selftests/alsa/Makefile     |   9 +
 tools/testing/selftests/alsa/mixer-test.c | 663 ++++++++++++++++++++++
 5 files changed, 683 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/alsa/.gitignore
 create mode 100644 tools/testing/selftests/alsa/Makefile
 create mode 100644 tools/testing/selftests/alsa/mixer-test.c


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
-- 
2.30.2

