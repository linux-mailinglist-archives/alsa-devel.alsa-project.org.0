Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D943D664A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB83A1754;
	Mon, 26 Jul 2021 20:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB83A1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322620;
	bh=UPLHZ2j+c5fQSYs7kBZu5uPsvMTOD/vWlkmnmXnalGg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YBX+jJMaAjrscordJSfacPD9x8kzhVuTpteP7+8CWTpdZXJ59hvm5Lv5fgrty2tDo
	 20AoplXbBvVcHfHv18Jur0cWu7AaFFJyNFWu2X0YzRB67yZmYl8imtX627I2ttadLf
	 yB1x2xF7XhFdqzXOTbVOe+rfehG2NRMtMjBkhMYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A697F804D2;
	Mon, 26 Jul 2021 20:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10007F804CF; Mon, 26 Jul 2021 20:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E5C3F8025A
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E5C3F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="edbAeJQM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q9XBFC001064; 
 Mon, 26 Jul 2021 13:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=KFhMj4zInmP23rRrrQYzay5UeaPGV8+kCYH0f0Qe5bY=;
 b=edbAeJQMx+jQiZnOAOAy47jEZ21vkJAlQu9p4pZZrR0GWrcPFQJsxngxoyu8i2HCkMuK
 suKjsRV7wX8Igv2LA4HPhD75MiSVYd0W3NoEBeINGOqxuhmtyJt+3Qa78Aay4noomWz4
 c25qRu7LLzJHrNPv6LIUEk5oOsE/57gfeTX0V54hpKC33QSy6USgayaVjv+MhSpCFHCc
 YuBLwyEyHVGx7HzLoMrMc104Q9j+SyEIUt2Moeued/Ih9DW45oJnkEOfQx/c0gVM489h
 FtpsUFEQYb+GzdmYBjl0cfFwYBF52kDuFnmELdRxNQv5c7wvvPQ5tKdpeoXczCTmjH2a RQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a1th2rgpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:02:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:46:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:46:58 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEE7A45D;
 Mon, 26 Jul 2021 17:46:57 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 00/27] ALSA: hda/cirrus: Split generic cirrus HDA codecs and
 CS8490 bridge into separate modules.
Date: Mon, 26 Jul 2021 18:46:13 +0100
Message-ID: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9QikoGclDdf5ouUEFOR8S_37rzz_57LQ
X-Proofpoint-GUID: 9QikoGclDdf5ouUEFOR8S_37rzz_57LQ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260105
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

 sound/pci/hda/Kconfig               |   11 +
 sound/pci/hda/Makefile              |    2 +
 sound/pci/hda/patch_cirrus.c        | 1074 -----------------------
 sound/pci/hda/patch_cs8409-tables.c |  560 ++++++++++++
 sound/pci/hda/patch_cs8409.c        | 1234 +++++++++++++++++++++++++++
 sound/pci/hda/patch_cs8409.h        |  369 ++++++++
 6 files changed, 2176 insertions(+), 1074 deletions(-)
 create mode 100644 sound/pci/hda/patch_cs8409-tables.c
 create mode 100644 sound/pci/hda/patch_cs8409.c
 create mode 100644 sound/pci/hda/patch_cs8409.h

-- 
2.25.1

