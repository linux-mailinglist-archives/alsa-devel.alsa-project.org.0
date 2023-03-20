Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07556C10BE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 12:24:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB391210;
	Mon, 20 Mar 2023 12:24:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB391210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679311494;
	bh=fmRiIIihlKOUb65Jw1XONTGaCBf4XtAy25f+BDgOwZA=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=SVFzKR9MjWBS0x+raA+e6Sb5hHeDoUwXfK1S8Y/HqKuBQUDphsRnyA8uAdyQAdfy/
	 paoHNs7wlzJccIwAYMKUIDgPWb4/T9JZGHJxKu03NHV/rwvZ6s43jNOcIKRxdgQp+P
	 E6Ja4sME+qqzW3fcOm47jxc6lWMhNNC6ER02p/BI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9259F80105;
	Mon, 20 Mar 2023 12:23:14 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 0/8] ASoC: Initial support for Cirrus Logic CS35L56
Date: Mon, 20 Mar 2023 11:22:37 +0000
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKPH2SCJ6NPB7YEONOHAD4HUI3B2IZIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167931139411.26.131085857843717784@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07FCF80527; Mon, 20 Mar 2023 12:23:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 404FDF80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 12:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404FDF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nZnhXHJZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K6xMZe028388;
	Mon, 20 Mar 2023 06:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=fDcLPRwsWuPguF0YsBVGjvipWUK74H88kT9GfGNR424=;
 b=nZnhXHJZfqTziDCMYIy+RIY6V6+nVdigiXkmV7vQUeDSv04YId83oUhANirt9W3PbSAB
 xNq3vGt3YDpAlyETQCgM16r2g6YTkhrodzw5OQ0IULBgArwNWZTovHVWubX9Ka6UfOjL
 o9DjeIUcdCfoq3TChTQUiTMrPcN15rWb5IIwDewqnr/G2d+mig9CYKf0ECp120LA6l8/
 SEUl67Ad1Z03uPqhFSAhU94htZ5rBuclL9GdCgyBVfzhg6t+QUHCkrpbu8WjrEjLRBfE
 YrTvdd5Xq6387EhMJ4oPUR0oIftDbvBFjUMtpsWgyyWba6cEOLwSbWk9C5rh9loLS79z Mw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pd9qptc80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 06:22:47 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 20 Mar
 2023 06:22:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 20 Mar 2023 06:22:45 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7EA4DB38;
	Mon, 20 Mar 2023 11:22:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 0/8] ASoC: Initial support for Cirrus Logic CS35L56
Date: Mon, 20 Mar 2023 11:22:37 +0000
Message-ID: <20230320112245.115720-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D6m4bf_3pTVT8DJFTYw26g4ssTpsOhUr
X-Proofpoint-ORIG-GUID: D6m4bf_3pTVT8DJFTYw26g4ssTpsOhUr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VKPH2SCJ6NPB7YEONOHAD4HUI3B2IZIN
X-Message-ID-Hash: VKPH2SCJ6NPB7YEONOHAD4HUI3B2IZIN
X-MailFrom: prvs=8443a53618=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKPH2SCJ6NPB7YEONOHAD4HUI3B2IZIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L56 is a high-performance boosted mono audio amplifier.
Supported control interfaces are I2C, SPI or SoundWire.
Supported audio interfaces are I2S/TDM or SoundWire.

The CS35L56 has a self-booting firmware in ROM, with the ability
to patch the firmware and/or apply tunings.
Patches #1 to #7 add support to cs_dsp and wm_adsp for self-booting
firmware and the ability to apply a .bin file without having to
apply a .wmfw.

Changes since v2:
- Fix Kconfig to prevent the driver being built-in if the SoundWire
  core is a module.

Changes since v1:
- Check for error when getting pm_runtime in cs35l56_irq().
- Use SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK instead of the old define.
- Re-word two comments in cs35l56-sdw.c.
- Add an comment explaining the wait for init_completion in
  cs35l56_dsp_work().
- Omit patches to Intel machine driver. These will be done as a
  separate thread.

Richard Fitzgerald (1):
  ASoC: cs35l56: Add driver for Cirrus Logic CS35L56

Simon Trimmer (7):
  firmware: cs_dsp: Introduce no_core_startstop for self-booting DSPs
  ASoC: wm_adsp: Use no_core_startstop to prevent creating preload
    control
  firmware: cs_dsp: Support DSPs that don't require firmware download
  ASoC: wm_adsp: Support DSPs that don't require firmware download
  ASoC: wm_adsp: Expose the DSP boot work actions as wm_adsp_power_up()
  ASoC: wm_adsp: Add support for loading bin files without wmfw
  ASoC: wm_adsp: Simplify the logging of requested firmware files

 MAINTAINERS                            |    1 +
 drivers/firmware/cirrus/cs_dsp.c       |   17 +-
 include/linux/firmware/cirrus/cs_dsp.h |    1 +
 include/sound/cs35l56.h                |  266 +++++
 sound/soc/codecs/Kconfig               |   40 +
 sound/soc/codecs/Makefile              |   10 +
 sound/soc/codecs/cs35l56-i2c.c         |   83 ++
 sound/soc/codecs/cs35l56-sdw.c         |  528 +++++++++
 sound/soc/codecs/cs35l56-shared.c      |  390 +++++++
 sound/soc/codecs/cs35l56-spi.c         |   81 ++
 sound/soc/codecs/cs35l56.c             | 1461 ++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.h             |   77 ++
 sound/soc/codecs/wm_adsp.c             |   63 +-
 sound/soc/codecs/wm_adsp.h             |    3 +
 14 files changed, 3005 insertions(+), 16 deletions(-)
 create mode 100644 include/sound/cs35l56.h
 create mode 100644 sound/soc/codecs/cs35l56-i2c.c
 create mode 100644 sound/soc/codecs/cs35l56-sdw.c
 create mode 100644 sound/soc/codecs/cs35l56-shared.c
 create mode 100644 sound/soc/codecs/cs35l56-spi.c
 create mode 100644 sound/soc/codecs/cs35l56.c
 create mode 100644 sound/soc/codecs/cs35l56.h

-- 
2.30.2

