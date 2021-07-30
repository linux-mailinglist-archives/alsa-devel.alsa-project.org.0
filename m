Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C83D43DBC14
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9AF11AFD;
	Fri, 30 Jul 2021 17:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9AF11AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658476;
	bh=Xigzq0xIja9KBDjHeby//oNDknXbLSPg2Ldo9S0TNbI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HVApwkczHC0MTPpZiJ4a8DcFDYAZR3584lZj2ehobRX4OnNSx9KGNVnPbXd0Su0+J
	 NvDWf33miBNP3qIxyOc1pv4poLFVd9Ir1Rbdd8vHPizXxf+RXVX+1Z4lnK/pAtrq6x
	 3hpf5I3BB3uGO7mmVEo4dZR4uwF8E5e8i/DZbEnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1D8F80516;
	Fri, 30 Jul 2021 17:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694CEF804E6; Fri, 30 Jul 2021 17:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3130F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3130F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IMtscr6J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UELBKX004490; 
 Fri, 30 Jul 2021 10:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=kAukQohrfj/WX10UHQbvubN/oCuh+dDQDCfF1XNXFcE=;
 b=IMtscr6J3SobseiG2Dgj+ECCzBcUUm6f5cXYga4Qo3n/a3Z9E91kQ0U5a/jXqc1F6avJ
 k0Wl/ulfxn7SAmbglKO8F2b+y2tAjB+hMVhF1FXrcSgsH4LtmYnY3oopA/ETYUdrx5U/
 U+y13JMlTb7FV0cm/0RscQls7A3v8QBrsOMLzQTtbbK52JyKBpeMVLRIyNgxMl0tKFFC
 R7QgD5YDE9mKm6uZvTa1AAeRCij9GevnhjuHM8W/6ecF3LsRaLII6IWDzq+i/Cj2SuyH
 B84lXeith3vpTMlSGnn0bE73lzfxIq0Uw+1zS2oRwOhHv480cvqxjFeoxMaG7rfUZczv jg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:06 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 755022BA;
 Fri, 30 Jul 2021 15:19:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 00/27] ALSA: hda/cirrus: Split generic cirrus HDA codecs
 and CS8490 bridge into separate modules.
Date: Fri, 30 Jul 2021 16:18:17 +0100
Message-ID: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OhD0oMXdbKSG9kF-Q4iGhb6Dn3VO88wR
X-Proofpoint-ORIG-GUID: OhD0oMXdbKSG9kF-Q4iGhb6Dn3VO88wR
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This series of patches splits generic cirrus HDA codecs and CS8490 bridge
into separate modules, adds support for multiple companion codecs connected to
CS8409, and also adds support for new DELL HW platform.

CS8409 part is not really a HDA codec, it is a HDA bridge where companion codecs
(up to 16) can be attached. With growing number of supported configurations and 
platforms, patch_cirrus is getting less and less transparent and maintainable.
So, the logical step is to separate generic Cirrus HDA codecs support 
and Cirrus HDA bridge support.

Lots of improvements to existing functionality, code clean-up and refactoring,
remove duplicated/redundant code, improve I2C functions etc.

Add support for new DELL HW platform with 2 CS42L42 codecs for front and rear jacks.

Lucas Tanure (12):
  ALSA: hda/cirrus: Move CS8409 HDA bridge to separate module
  ALSA: hda/cs8409: Move arrays of configuration to a new file
  ALSA: hda/cs8409: Disable unsolicited response for the first boot
  ALSA: hda/cs8409: Prevent I2C access during suspend time
  ALSA: hda/cs8409: Generalize volume controls
  ALSA: hda/cs8409: Dont disable I2C clock between consecutive accesses
  ALSA: hda/cs8409: Avoid setting the same I2C address for every access
  ALSA: hda/cs8409: Avoid re-setting the same page as the last access
  ALSA: hda/cs8409: Support i2c bulk read/write functions
  ALSA: hda/cs8409: Separate CS8409, CS42L42 and project functions
  ALSA: hda/cs8409: Move codec properties to its own struct
  ALSA: hda/cs8409: Add support for dolphin

Stefan Binding (15):
  ALSA: hda/cs8409: Use enums for register names and coefficients
  ALSA: hda/cs8409: Mask all CS42L42 interrupts on initialization
  ALSA: hda/cs8409: Reduce HS pops/clicks for Cyborg
  ALSA: hda/cs8409: Disable unnecessary Ring Sense for
    Cyborg/Warlock/Bullseye
  ALSA: hda/cs8409: Disable unsolicited responses during suspend
  ALSA: hda/cs8409: Mask CS42L42 wake events
  ALSA: hda/cs8409: Simplify CS42L42 jack detect.
  ALSA: hda/cs8409: Support multiple sub_codecs for Suspend/Resume/Unsol
    events
  ALSA: hda/cs8409: Add Support to disable jack type detection for
    CS42L42
  ALSA: hda/cs8409: Enable Full Scale Volume for Line Out Codec on
    Dolphin
  ALSA: hda/cs8409: Set fixed sample rate of 48kHz for CS42L42
  ALSA: hda/cs8409: Use timeout rather than retries for I2C transaction
    waits
  ALSA: hda/cs8409: Remove unnecessary delays
  ALSA: hda/cs8409: Follow correct CS42L42 power down sequence for
    suspend
  ALSA: hda/cs8409: Unmute/Mute codec when stream starts/stops

 sound/pci/hda/Kconfig               |   10 +
 sound/pci/hda/Makefile              |    2 +
 sound/pci/hda/patch_cirrus.c        | 1074 -----------------------
 sound/pci/hda/patch_cs8409-tables.c |  560 ++++++++++++
 sound/pci/hda/patch_cs8409.c        | 1253 +++++++++++++++++++++++++++
 sound/pci/hda/patch_cs8409.h        |  369 ++++++++
 6 files changed, 2194 insertions(+), 1074 deletions(-)
 create mode 100644 sound/pci/hda/patch_cs8409-tables.c
 create mode 100644 sound/pci/hda/patch_cs8409.c
 create mode 100644 sound/pci/hda/patch_cs8409.h

-- 
2.25.1

