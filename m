Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27D470986
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 19:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3329920F6;
	Fri, 10 Dec 2021 19:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3329920F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639162574;
	bh=XbRD8SE9Sm0L9EqdqTLSsceqzxrGreq0c6O1rAa3MBc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PsRLovnz7QrFKEcEODfNiAdtSvZ40GJI2nqu0rm/vLwYQ13Ij8mILYOz5V4Q5vtYo
	 /lP3Oo0vYoq+gXIQljoJOReCUhtOJC+PC+TyKw3CQKj0Y4qsaq1q4yHjky1gYBTmdJ
	 yZVK9wl5HHuTIbUo0TH+DKnsYKv4CRg4mvmYwghk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F370F80507;
	Fri, 10 Dec 2021 19:54:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3982AF804ED; Fri, 10 Dec 2021 19:54:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303B3F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 19:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303B3F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TZyIfG8D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 40449CE2CD1;
 Fri, 10 Dec 2021 18:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735EAC341C7;
 Fri, 10 Dec 2021 18:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639162457;
 bh=XbRD8SE9Sm0L9EqdqTLSsceqzxrGreq0c6O1rAa3MBc=;
 h=From:To:Cc:Subject:Date:From;
 b=TZyIfG8DNL/Yenj56XTMp0Ly4pf0vThKI2RG0IQkDPgq+lpDEsQKewfIEu5BPZe+q
 YD+k2n0yUDKbEIbaFDSLEntxCBteGE4lxUUJW27NRqGTIH4E7NV36Uy5iu0C/gsCtp
 Q829sNNc2Azqd8/5QDqarvFbjRlxV6DQ3SBMJPpEjx7X8alo1MXW/CuaJPR680Pe7U
 nt8D0WbxzUSZylwqfrDwX4iPVfYe9GTXus2p6RFGphFZi/lPuAFifqfSRc1GF5lIM8
 7e4I3J0Y1X/1mo+kEMV/uSVi5dCzM9f3MsuirjF6GvNBQVS0//ZIW5X89IXmjkZwcM
 wkWdglbcCcc7w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v4 0/3] kselftest: alsa: Add basic mixer selftest
Date: Fri, 10 Dec 2021 18:54:07 +0000
Message-Id: <20211210185410.740009-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; h=from:subject;
 bh=XbRD8SE9Sm0L9EqdqTLSsceqzxrGreq0c6O1rAa3MBc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhs6JNtwJ3yuNNBnA+kg5bbxoV9/a46bXFdIrJi0hh
 Zdw64mqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbOiTQAKCRAk1otyXVSH0MbuB/
 9QwexZoBery3pAU+uCEWgX/JEIu0zq/p01FUryP7d8JOAxEki92E0DmnHf8mdERVtY8kjHnIxDpWAk
 JlMwwv/5fhCdQeWFE1JgBPecLhqBq1KlmVpc6U0zh02QhByjUG/oavGhcbypBBeNDKFNu/vN0MF6hX
 BsXPeK1NTVbE6mYfk2rnKgQnozBl9B1htQaERnwTqyTvpRoY+aX1KvrWSWTbBh22azPrJ8XFZ9JHoU
 z05B63AHHlrAkjSbopaBFCL0VmVvmXZBj9lG5goZlRrsMbPkqyJJD065u3yIYn4p6cM1D3SZo9H3Ff
 SFMBDyh8paRNpJnoGHARI3F0dcHiHy
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

v4:
 - More stylistic updates suggested by Shuah.
 - Fix build with older alsa-lib.
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
 tools/testing/selftests/alsa/mixer-test.c | 665 ++++++++++++++++++++++
 5 files changed, 685 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/alsa/.gitignore
 create mode 100644 tools/testing/selftests/alsa/Makefile
 create mode 100644 tools/testing/selftests/alsa/mixer-test.c


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
-- 
2.30.2

