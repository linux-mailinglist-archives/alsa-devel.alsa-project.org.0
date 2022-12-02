Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3463FCD5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 01:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF55317C6;
	Fri,  2 Dec 2022 01:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF55317C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669940541;
	bh=fL/6WmOwOcUiyYILwtFYkRkQ5IlKeow+Hdrl+aYodck=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGtsrR3s2BlVvfeCIDKwQOplAakscLNqqjxkIrwRTnboYTIacGyQ6wRPpPysTFHoB
	 QYXXBFlZEr4ohhgSGPjsA9IxA/PDCL2I/WqXy+iqyUrjYBuWKNV12ww52E0QuygQMX
	 /raAZSR8/pMBlU9tAy47eiMbLGkpRWAU1ItXBaug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56037F804B1;
	Fri,  2 Dec 2022 01:21:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FC60F8028D; Fri,  2 Dec 2022 01:21:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC5BF80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 01:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC5BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TM4kWkfk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05CCCB82059;
 Fri,  2 Dec 2022 00:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1D6C433C1;
 Fri,  2 Dec 2022 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669940480;
 bh=fL/6WmOwOcUiyYILwtFYkRkQ5IlKeow+Hdrl+aYodck=;
 h=From:To:Cc:Subject:Date:From;
 b=TM4kWkfkJJyOqzMmsH9drWdcdVvtXIvJ4sjLCJsNHN9Xl/Er9EWen6R9op5lu4Wo1
 WkHROCt/V9Ufgjizkndgi+fwaigDrUPvUV1/VtMFCD0QMhHhYxpi9NVW7/DddW7ndM
 aj8vDF7e1aQoYRKzR23Zt/8y/XSGZULR7StUmqnAl/MeuspMwuUD3RpeHldV7cjLto
 pgyjKgCCgM4X4jkAZHA4ZcHbrMlyepL4dsO8QOvu9udk848T841vCyjCmQGIpokXQO
 WfQjSyJB/QlgCTowo9h6de4BHUhqDulN00q/Hm560VYmaYfKsGvhOCB03jM8Erwcc+
 JolfDPHBovcYQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 0/7] kselftest/alsa: pcm-test improvements
Date: Fri,  2 Dec 2022 00:17:42 +0000
Message-Id: <20221202001749.3321187-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=broonie@kernel.org;
 h=from:subject; bh=fL/6WmOwOcUiyYILwtFYkRkQ5IlKeow+Hdrl+aYodck=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiUQl9GC151uJWADOqctcgBEp0CD5e0lJ4Ihketwg
 d9M4Cd2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4lEJQAKCRAk1otyXVSH0Og9B/
 wMVcAbBcDjoXq7wq31DxAq7AUPXVvvp0LB6/WvzKkgIIF9ZYeNxiR8Vmt3CcxSIyTQaXTiJG4UFicw
 krxykVVRIQEwhQhslnp+kXDv1WIj99M6gvoQ6r+VWL9VmnwIavglZ3Lr7uqC7g/mmpGrPQvzIW7NEn
 /PNmPHRE64rs0/62Sx8N+H3A9PuR4925EWZLV0GMNYFDRNP/u/4N+kYH+FDrpByUKSFT3vrmdFwzPs
 01ArV/5hRroWuhqHZxovVE7wrziRRhSsqeGOnjj90AdYU89iO/toLAegKBYEPhzMhUqJjHGq00Ioln
 fryS7Ztm9EQJv/7xYvc/frBhvCmfci
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

This series provides a bunch of quick updates which should make the
coverage from pcm-test a bit more useful, it adds some support for
skipping tests when the hardware/driver is unable to support the
requested configuration, support for providing user visible descriptions
and then expands the set of cases we cover to include more sample rates
and channel counts.  This should exercise switching between 8kHz and
44.1kHz based rates and ensure that clocking doesn't get confused by
non-stereo channel counts, both of which are I expect common real world
errors, at least for embedded cards.

v3:
 - "Rebase" onto Takashi's current tree (with a revert).
 - Include Jaroslav's changes to specify all tests in the configuration
   file parsing.
 - Add a new "description" field to the configuration instead of trying
   to name the tests.
 - Always run both default and per-system tests, logging our success at
   setting the per-system configurations as a separate test since they
   shouldn't fail.
v2:
 - Rebase onto Takashi's current tree.
 - Tweak the buffer sizes for the newly added cases, don't be quite
   so ambitious in how big a buffer we request for 96kHz and don't
   go quite so small for 8kHz since some devices start hitting lower
   limits on period size and struggle to deliver accurate timing.

Jaroslav Kysela (1):
  kselftest/alsa: pcm - move more configuration to configuration files

Mark Brown (6):
  kselftest/alsa: pcm - Drop recent coverage improvement changes
  kselftest/alsa: pcm - Always run the default set of tests
  kselftest/alsa: pcm - skip tests when we fail to set params
  kselftest/alsa: pcm - Support optional description for tests
  kselftest/alsa: pcm - Provide descriptions for the default tests
  kselftest/alsa: pcm - Add more coverage by default

 tools/testing/selftests/alsa/Makefile         |   2 +-
 tools/testing/selftests/alsa/alsa-local.h     |   3 +
 tools/testing/selftests/alsa/conf.c           |  26 ++-
 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  |  43 ++--
 tools/testing/selftests/alsa/pcm-test.c       | 205 ++++++++++++------
 tools/testing/selftests/alsa/pcm-test.conf    |  63 ++++++
 6 files changed, 250 insertions(+), 92 deletions(-)
 create mode 100644 tools/testing/selftests/alsa/pcm-test.conf


base-commit: 7d721baea138696d5a6746fb5bce0a510a91bd65
-- 
2.30.2

