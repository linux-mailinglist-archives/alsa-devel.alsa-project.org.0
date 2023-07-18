Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B97570F9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 02:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769A8868;
	Tue, 18 Jul 2023 02:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769A8868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689640318;
	bh=v0OtEKj0jdSOyjDt7MKHxHRE0+A2wPxrR5yddi7afsg=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UeywQpBeWxboCCvjJ3zD/bsr7Us5on2AG/fPvw+CpXSKn1bXXGTHgRha1NrFIpBQV
	 5oMXTrxIyRLlf0Mw7nPfN59vbTTXFf4dL0k1dH4KMJEwkh+CQnaF+NR9PwlQsbYOVK
	 aYtcDgkVGO3D0q4gm8Rp1llxRzL2ydHX2AATHGpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CBE1F80549; Tue, 18 Jul 2023 02:30:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8933F80153;
	Tue, 18 Jul 2023 02:30:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18430F80527; Tue, 18 Jul 2023 02:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F4056F8007E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 02:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4056F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YzuBYfAq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62CFB611E4;
	Tue, 18 Jul 2023 00:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43351C433C8;
	Tue, 18 Jul 2023 00:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689640191;
	bh=v0OtEKj0jdSOyjDt7MKHxHRE0+A2wPxrR5yddi7afsg=;
	h=From:Subject:Date:To:Cc:From;
	b=YzuBYfAqx6T/yjwE/2ouEPWSAnlFZ8v+ShzPtpuf7AU6pzAxiEf4K4YXl4yH0+PM1
	 rnKBUi3dk+xP/R8Odpv7e8HJocq5TvzRL0nKXV65U9YU0xP7dokuPXLERTxSNSeGo8
	 XwarNQTb7NTBtq/MJ4bV11IY+FsLD/xIRbUzzzbo4BPZU8VyupRm2yBHo0kBuWJqLV
	 qkio9T0O98+rBM5Mxm1Ir87r1hPz8nmZwgMpL/pameZGjzJo8xXMy7p+Nu/rN+A9G7
	 trN/lFrtfm/VDNpHn/AFJdVh6Q2s6MnlkUdDlQUX0IoSOjiVIZIIpH5rzaDoxPw7UR
	 JbiTGEt3i4abw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/5] ASoC: Improve coverage in default KUnit runs
Date: Tue, 18 Jul 2023 01:28:41 +0100
Message-Id: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnctWQC/33NQQ6CMBCF4auQWTumLSGIK+9hWBRmgAbSIS0SC
 eHuVuLa5f8W39shcnAc4Z7tEHh10YlPYS4ZtIP1PaOj1GCUyVWpNNooLS4yyyT9huPLuwXZ22Z
 iLPhGVChSTCUkYA7cufeJP+vUg4uLhO38WvV3/bHa/GNXjQqbqjNkK2qtyR8jB8/TVUIP9XEcH
 0wdsrLFAAAA
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v0OtEKj0jdSOyjDt7MKHxHRE0+A2wPxrR5yddi7afsg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktdz4Ol24MwxgtTKpMJ5NbGqCjunXQD/bHfNyE
 n7YFFftkzCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLXc+AAKCRAk1otyXVSH
 0AANB/98j9OYuOpEIyK0NrKZjuCl4lPMFyV4nkv4lHmNNHUjWs4zeyBoC1v/xeAL1Wx2j2abvcE
 QMMX9Z+G6W13TBzG2ZU8c3sAUxBzK3aRmpY6tbWUIgRlnyKhwTHDg0oPdw1zUFYdvDyh+e18dVZ
 BoQw+NUA+b3ZZb+27pOcV8op3yLk6R0E7oIoDGIPojuxx5HWfbDcDKZwTWm63WFnUTX6nM/i73o
 Xk7NNX92ogdqEayaWrZrHKXKhjmgD4iI7OX3SUu+kOwUAD3kI9kqZ/owKo8Cg3dx1IXKnSqsz3D
 +5Lr87WHgJuW5SOUvnWWaWbxxgc3zEyRneY0gzzVtFv3NdRT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: JHJX5SRTSHZ7DLKOSLE2XNPK4NDGDQW5
X-Message-ID-Hash: JHJX5SRTSHZ7DLKOSLE2XNPK4NDGDQW5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have some KUnit tests for ASoC but they're not being run as much as
they should be since ASoC isn't enabled in the configs used by default
with KUnit and in the case of the topology tests there is no way to
enable them without enabling drivers that use them.  This series
provides a Kconfig option which KUnit can use directly rather than worry
about drivers.

Further, since KUnit is typically run in UML but ALSA prevents build
with UML we need to remove that Kconfig conflict.  As far as I can tell
the motiviation for this is that many ALSA drivers use iomem APIs which
are not available under UML and it's more trouble than it's worth to go
through and add per driver dependencies.  In order to avoid these issues
we also provide stubs for these APIs so there are no build time issues
if a driver relies on iomem but does not depend on it.  With these stubs
I am able to build all the sound drivers available in a UML defconfig
(UML allmodconfig appears to have substantial other issues in a quick
test).

With this series I am able to run the topology KUnit tests as part of a
kunit --alltests run.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Add support for building ALSA with UML.
- Link to v1: https://lore.kernel.org/r/20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org

---
Mark Brown (5):
      driver core: Provide stubs for !IOMEM builds
      platform: Provide stubs for !HAS_IOMEM builds
      ALSA: Enable build with UML
      kunit: Enable ASoC in all_tests.config
      ASoC: topology: Add explicit build option

 include/linux/device.h                       | 26 ++++++++++++++++++++++++++
 include/linux/platform_device.h              | 28 ++++++++++++++++++++++++++++
 sound/Kconfig                                |  4 ----
 sound/soc/Kconfig                            | 11 +++++++++++
 tools/testing/kunit/configs/all_tests.config |  5 +++++
 5 files changed, 70 insertions(+), 4 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230701-asoc-topology-kunit-enable-5e8dd50d0ed7

Best regards,
-- 
Mark Brown <broonie@kernel.org>

