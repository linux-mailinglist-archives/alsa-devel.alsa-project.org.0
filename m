Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16763F5FE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:11:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08575174B;
	Thu,  1 Dec 2022 18:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08575174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669914713;
	bh=4P1OLKqn7MEyXJREvUvZOjiyLHEARCRdaDxzVt3dJw0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y5p6PoIhiXBhxWN8xiBvEgWiy8VgmRmZFrE6eIW+81H7ba2C+Aj0fYK6sjX+UOTDU
	 9kCaJ0rwgb8sblXpMUtTd3/ZmjdnCp0vPeAyuBpQG2B3u4hAjSo2imGihYzRAfp7Na
	 TPZ/SAAALx616HB827J2w+FVxvYhl1JbdWLqz9YU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92546F804B1;
	Thu,  1 Dec 2022 18:10:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3F5DF8028D; Thu,  1 Dec 2022 18:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2629DF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2629DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZjHG9JnE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0478D6208C;
 Thu,  1 Dec 2022 17:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A77C433D6;
 Thu,  1 Dec 2022 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669914650;
 bh=4P1OLKqn7MEyXJREvUvZOjiyLHEARCRdaDxzVt3dJw0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZjHG9JnEdHwUAntAgA1QQcfj/qXN2VzzTvK4oOifait2ONvOQTnI2peiRxpVb8BUE
 +ZCw6lh7sd9b+ypHaKKZtIfmLlLK1A+3y1Vkmo9SYbrXf+62NjQQW/BVVSRTkVZ7DO
 IU8AGddDxTw+RLJ84Ae7JRjiqIzeDWyCRM55IE26QcpsubOWTJEYPmM9d/Sdj766pp
 MaqndX0JhyVECWdP3XAqulbveA7qAqwtTn9UiIqRRx5CEzaciY2JfR89QYB8qA3hRc
 HWUlPCw9pgUnp2gwJucEaiFX4jEwzbDdvM2iusRfGXDTn7PrJr+NyKRm9dCsav9R6C
 Zn7jDyJJikF6g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 0/6] kselftest/alsa: pcm-test improvements
Date: Thu,  1 Dec 2022 17:07:39 +0000
Message-Id: <20221201170745.1111236-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=broonie@kernel.org;
 h=from:subject; bh=4P1OLKqn7MEyXJREvUvZOjiyLHEARCRdaDxzVt3dJw0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiN9bww8um6NZydnGG5sorVUm7m+rnEclQ+vSFJr6
 lbAYyfaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4jfWwAKCRAk1otyXVSH0FxUB/
 9Euf2H6ndJuq2UJUTOJ31PfZ/zMDyjrSbntrThjHfj/F84K/FPcC+SgXXZnFeC9C4MtO59ThtK0yte
 E/Yz+EtaioW+Uvrwy968Ir6nGWaSBh4AdNvy3fijse6wtJEp4oI1Tw3nx0Ux1sozQD2rBEn/qseBYT
 QuOt+FhYLE+RyFUfkxhKVvKtshIv8PY7x81opuiZwEF6M4AJjHK9N4nSl6dxRGjE1LVkKaYVfTLtww
 ekX2hu5DlzNWBjO2WQ8Gzi6DD8LeOvjxfdx/fEtDmm6KYxSlJ19EUKMPwQoCafEAAgKSINpKaVxZeL
 +fV0N5S21HtNNd1iWGq5RyNUvrIWTa
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
requested configuration and then expands the set of cases we cover to
include more sample rates and channel counts.  This should exercise
switching between 8kHz and 44.1kHz based rates and ensure that clocking
doesn't get confused by non-stereo channel counts, both of which are I
expect common real world errors, at least for embedded cards.

v2:
 - Rebase onto Takashi's current tree.
 - Tweak the buffer sizes for the newly added cases, don't be quite
   so ambitious in how big a buffer we request for 96kHz and don't
   go quite so small for 8kHz since some devices start hitting lower
   limits on period size and struggle to deliver accurate timing.

Mark Brown (6):
  kselftest/alsa: Refactor pcm-test to list the tests to run in a struct
  kselftest/alsa: Report failures to set the requested sample rate as
    skips
  kselftest/alsa: Report failures to set the requested channels as skips
  kselftest/alsa: Don't any configuration in the sample config
  kselftest/alsa: Provide more meaningful names for tests
  kselftest/alsa: Add more coverage of sample rates and channel counts

 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  | 35 ++++----
 tools/testing/selftests/alsa/pcm-test.c       | 88 +++++++++++++------
 2 files changed, 81 insertions(+), 42 deletions(-)


base-commit: 2133dc91d6658242009177b564ac47c49e08668a
-- 
2.30.2

