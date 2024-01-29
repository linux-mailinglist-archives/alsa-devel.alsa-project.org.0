Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C148C840B60
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33DF84A;
	Mon, 29 Jan 2024 17:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33DF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545722;
	bh=e+rapD5MF44xsQTrTn9qUAudkjaAvRtI+XztleK2lHQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fBSGjMkLhywqQofGczzZ7eVdPDb8yE99SbTUNzmzKHgwsOF1cTySX80NIAdJMbdhx
	 9AwyYFoRwI8O8b8V3miF/dXStlNwAcJ8oJeq6YGrloL419v8s/IIWmuyBmGmRxaHCQ
	 jBVh8c5YIZy9M3II/3dLeashWmkPnAtUXcwYCGB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26021F805C2; Mon, 29 Jan 2024 17:28:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08783F805C0;
	Mon, 29 Jan 2024 17:28:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C518F805A1; Mon, 29 Jan 2024 17:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2059F80563
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2059F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XjZ1HhLi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM05006968;
	Mon, 29 Jan 2024 10:27:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=a
	CQsG4ebcLQxKipcjMk5BfNAvFtIBi4e0wtIsxuP2ok=; b=XjZ1HhLiocUBrOojM
	Sumd7SwnGBW5+3iePaXnwJPiacXJwhlM3PB2RqI6REVlvIRvxtZ4gJoAN7aTYDsZ
	uKFjRX7KJE6lx/BlDMIxBQSLQUT0B+Mn8/BJSfMP3rcBiTmWJ2uHtWSQIZEkXbN7
	cH9fGTgcjy3+6v1P0EiLIXpwgonDhFiYFx1StxNiESS72Qjeq4tGnpmHyqOcr6D2
	iAEmTHlNX6vq0iMBEdxSRnnOLu10hXQu4+xipHw0Nw7qFGIEd6M2/vZQpy6dC99L
	m5ao/+vLuqi12NOImgxa1FV2NvI6Tz47hz29bPkU+Mdfi1tv6d2hlMc210NKizXb
	/nENw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:48 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:41 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:41 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6034C820242;
	Mon, 29 Jan 2024 16:27:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 00/18] ALSA: Various fixes for Cirrus Logic CS35L56 support
Date: Mon, 29 Jan 2024 16:27:19 +0000
Message-ID: <20240129162737.497-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Czor6TjL5qqxOUvlzQ_yyk5U4tgj7Dxb
X-Proofpoint-GUID: Czor6TjL5qqxOUvlzQ_yyk5U4tgj7Dxb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: C7TH47QST4VEYG2C64OD2AUUKDWVJGHT
X-Message-ID-Hash: C7TH47QST4VEYG2C64OD2AUUKDWVJGHT
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7TH47QST4VEYG2C64OD2AUUKDWVJGHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This chain of patches fixes various things that were undocumented, unknown
or uncertain when the original driver code was written. And also a few
things that were just bugs.

The HDA patches have dependencies on the ASoC patches, except for the final
patch that removes a bogus test stub function.

Richard Fitzgerald (18):
  ASoC: wm_adsp: Fix firmware file search order
  ASoC: wm_adsp: Don't overwrite fwf_name with the default
  ASoC: cs35l56: cs35l56_component_remove() must clear
    cs35l56->component
  ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
  ASoC: cs35l56: Don't add the same register patch multiple times
  ASoC: cs35l56: Remove buggy checks from cs35l56_is_fw_reload_needed()
  ASoC: cs35l56: Fix to ensure ASP1 registers match cache
  ASoC: cs35l56: Fix default SDW TX mixer registers
  ALSA: hda: cs35l56: Initialize all ASP1 registers
  ASoC: cs35l56: Fix for initializing ASP1 mixer registers
  ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon
    revision
  ASoC: cs35l56: Firmware file must match the version of preloaded
    firmware
  ASoC: cs35l56: Load tunings for the correct speaker models
  ASoC: cs35l56: Allow more time for firmware to boot
  ALSA: hda: cs35l56: Fix order of searching for firmware files
  ALSA: hda: cs35l56: Fix filename string field layout
  ALSA: hda: cs35l56: Firmware file must match the version of preloaded
    firmware
  ALSA: hda: cs35l56: Remove unused test stub function

 include/sound/cs35l56.h           |   7 +-
 sound/pci/hda/cs35l56_hda.c       | 138 ++++++++------
 sound/soc/codecs/cs35l56-shared.c | 140 ++++++++++++--
 sound/soc/codecs/cs35l56.c        | 307 +++++++++++++++++++++++++-----
 sound/soc/codecs/cs35l56.h        |   2 +
 sound/soc/codecs/wm_adsp.c        |  73 +++----
 6 files changed, 498 insertions(+), 169 deletions(-)

-- 
2.39.2

