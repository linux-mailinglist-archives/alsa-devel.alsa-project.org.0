Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF04E77B9
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A9D16BB;
	Fri, 25 Mar 2022 16:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A9D16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222492;
	bh=yhSS5QFzpSTHWJKj3nJOwCFOpGDbuX47CgX/7nUWtCg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=STN2PKu/3XKVujl9AtYlrCXeMvpfSoWc1PkYobbgxAtGjBwFRHc1fXsYCW+IMOyqL
	 uRDueDlPqcI9JwwJQarpT4raX6cvFI578v3GK5L9AossKUm2XmZmAd46vmmC22ywjA
	 2kOm3/kG61wNF65SHBJSZ01VHWJdjlT2VYlbX6hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BFA5F80516;
	Fri, 25 Mar 2022 16:33:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 803F7F80115; Fri, 25 Mar 2022 16:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49321F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49321F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kdj4BTu1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 924516150F;
 Fri, 25 Mar 2022 15:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF06AC340E9;
 Fri, 25 Mar 2022 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222383;
 bh=yhSS5QFzpSTHWJKj3nJOwCFOpGDbuX47CgX/7nUWtCg=;
 h=From:To:Cc:Subject:Date:From;
 b=Kdj4BTu10epLytc8SO+NYgoUo/MB3lkIbCf0yvgwo83HOJwbtGuL7gbSGeQMnswtU
 n8EljbYgsZppSw8ypFaz7Bg/srzgxsp2nkXPfBDZLohm1CUAbsUyg4Y64UArBIur2U
 OAy/QEkcPbdzzAMKTj9c7y6YLyeLQ6LJftPhDr2GZRvxnWDNd6YHM3PjlWR/7ofVZb
 xkFVhvoPhqkU8ZK3e6/HzhnW5oa2y2L4qKP+u7jNxSTpi/YrSYMgd+1RTHMFIR8B1d
 4vtDk5rjf0lYIG3bzFAv7DnKuNzm48/rrsZQ4sNWAmSQ0INUdp4t+lN7iOrHbUuhne
 uXHg2uMhAl2NA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 0/7] ASoC: wm8731: Overhaul of the driver
Date: Fri, 25 Mar 2022 15:31:14 +0000
Message-Id: <20220325153121.1598494-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; h=from:subject;
 bh=yhSS5QFzpSTHWJKj3nJOwCFOpGDbuX47CgX/7nUWtCg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBDorb71NpJf4gC6utJJgQDs2pvR6PFVLbULEfF
 tuwCj9KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gQwAKCRAk1otyXVSH0H8GB/
 4j9snS6BUjtlXOFzH/l1X2vn6+03EiGB+AM2tZy1XbeIKfJO8pDB++AlJtE5y02PegcM1O2qj8tAt1
 GOkviqYaUGgZ0e8TyLbNz3LIydUQcsu68rSyklxpzU8Pzzgt+qPCKOj92nHnPb2npDm5GKaO9Fsqql
 ZnJj4rayTbKtrmH/O2Q94UiBmyxoJoqAbf3i2gPgjhGjvjDEj3sGljRfkD8+AVLNDOWyBIGnZoxMo0
 h9IYX9N2STgQerZJdii/cabHB5pwQs/rNpsA4Qri6/By7KZ1k8HZZppGiu/QCBKk4x/Eu5idVIoyTR
 KvMXjknoOTJN/IFZ0+X9EGCIQlF5Gz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

This series contains a bunch of fairly minor changes which overhaul and
modernise the WM8731 driver, there should be no impact on the driver's
functionality.

Mark Brown (7):
  ASoC: wm8731: Update to modern DAI terminology
  ASoC: wm8731: Factor component init out of bus code
  ASoC: wm8731: Move regulator request into wm8731_init()
  ASoC: wm8731: Factor our MCLK and mutex initialisation
  ASoC: wm8731: Factor out the I2C and SPI bus code into separate
    modules
  ASoC: wm8731: Convert DT bindings to YAML format
  ARM: configs: Update multi_v5_defconfig for WM8731 bus refactoring

 .../devicetree/bindings/sound/wlf,wm8731.yaml |  97 +++++++
 .../devicetree/bindings/sound/wm8731.txt      |  27 --
 arch/arm/configs/multi_v5_defconfig           |   3 +-
 sound/soc/atmel/Kconfig                       |   4 +-
 sound/soc/au1x/Kconfig                        |   2 +-
 sound/soc/codecs/Kconfig                      |  18 +-
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/wm8731-i2c.c                 |  69 +++++
 sound/soc/codecs/wm8731-spi.c                 |  59 ++++
 sound/soc/codecs/wm8731.c                     | 266 +++---------------
 sound/soc/codecs/wm8731.h                     |  27 ++
 sound/soc/pxa/Kconfig                         |   4 +-
 12 files changed, 323 insertions(+), 257 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8731.txt
 create mode 100644 sound/soc/codecs/wm8731-i2c.c
 create mode 100644 sound/soc/codecs/wm8731-spi.c


base-commit: 0b88a659002151e354272a13ae29d8b795ef1b46
-- 
2.30.2

