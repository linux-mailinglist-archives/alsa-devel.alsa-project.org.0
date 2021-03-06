Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DE32F9C3
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 12:36:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 427F219FD;
	Sat,  6 Mar 2021 12:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 427F219FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615030580;
	bh=w0oogo7qifSc7/vl63xWEnAj6XQLM9eKHHfanXBM3zY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b6b9aLr4UjTaODTqBGj+J9rmuWUw+SBGcxkxLWU5nw6lbmCNCk+qkfPyz2bt69y6e
	 1u/DJAXAyXJGqKyyMY3add2rhps0TnsM3PkmYbJ8EM0WOdS+z6F8ULL/0VHQyAvx4G
	 e3eTNH/StHQySvM9BIPGAlKxluycdUmyBdnXZx1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE2EF80271;
	Sat,  6 Mar 2021 12:34:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03BFCF80271; Sat,  6 Mar 2021 12:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E590F80116
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 12:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E590F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="U4NUlh/L"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126BYc1H006179; Sat, 6 Mar 2021 05:34:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=glhzWDcghErpnM2Iz9REOzjIm1JJM+qiVk6HPgiBrCo=;
 b=U4NUlh/LnrPTHnVv8u/2rN8hqCLpweTfX4SmVggXDDIl1YlR8TIkOXxk0fCqE24+iOVl
 wUgm7Sfyel0H1JfQf/O9TZjSZff15sukleQGrrwQqToJDaRslk3vlLxns/E2TJubL13T
 gPNO0aqEdt1rMSOc3Z1R5rurNqkOcCWIWVae3z7t7xV27X6AzMV2bQeiv7p2oe74r9zS
 X0K1wzRARKosOiWitdiu15G2ZEmKyp7PpKWJuI0Ah19PLsNrFxKgWH9HNOexdLsGI5ly
 AT5nViOVxCZ+J+hn6AvMVR6vRKWlc5cj1GAAbbDXj549tQLCqGSjkGZ0yNU1qD0uDXsq AQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vr316-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 06 Mar 2021 05:34:37 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 6 Mar 2021
 11:19:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sat, 6 Mar 2021 11:19:34 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5EE3911CB;
 Sat,  6 Mar 2021 11:19:34 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/4] ALSA: hda/cirrus: Add support for CS8409 HDA bridge
 and CS42L42 companion codec
Date: Sat, 6 Mar 2021 11:19:30 +0000
Message-ID: <20210306111934.4832-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=604 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103060070
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

Dell's laptops Inspiron 3500, Inspiron 3501, Inspiron 3505 are using
Cirrus Logic CS8409 HDA bridge with CS42L42 companion codec.

The CS8409 is a multichannel HD audio routing controller.
CS8409 includes support for four channels of digital
microphone data and two bidirectional ASPs for up to 32
channels of TDM data or 4 channels of I2S data. The CS8409 is
intended to be used with a remote companion codec that implements
high performance analog functions in close physical
proximity to the end-equipment audio port or speaker driver.

The CS42L42 is a low-power audio codec with integrated MIPI
SoundWire interface or I2C/I2S/TDM interfaces designed
for portable applications. It provides a high-dynamic range,
stereo DAC for audio playback and a mono high-dynamic-range
ADC for audio capture

Changes since version 1:

ALSA: hda/cirrus: Increase AUTO_CFG_MAX_INS from 8 to 18
* No change

ALSA: hda/cirrus: Add support for CS8409 HDA bridge and CS42L42
companion codec.
* Removed redundant fields in fixup table
* Handle gpio via spec->gpio_dir, spec->gpio_data and spec->gpio_mask
* Moved cs8409_cs42l42_init() from patch 2, to handle resume correctly

ALSA: hda/cirrus: Add jack detect interrupt support from CS42L42
companion codec.
* Run scripts/checkpatch.pl, fixed new warnings

ALSA: hda/cirrus: Add Headphone and Headset MIC Volume Control
* Moved control values to cache to avoid i2c read at each time.

Stefan Binding (1):
  ALSA: hda/cirrus: Add Headphone and Headset MIC Volume Control

Vitaly Rodionov (3):
  ALSA: hda/cirrus: Increase AUTO_CFG_MAX_INS from 8 to 18
  ALSA: hda/cirrus: Add support for CS8409 HDA bridge and CS42L42
    companion codec.
  ALSA: hda/cirrus: Add jack detect interrupt support from CS42L42
    companion codec.

 sound/pci/hda/hda_auto_parser.h |    2 +-
 sound/pci/hda/hda_local.h       |    2 +-
 sound/pci/hda/patch_cirrus.c    | 1081 +++++++++++++++++++++++++++++++
 3 files changed, 1083 insertions(+), 2 deletions(-)

-- 
2.25.1

