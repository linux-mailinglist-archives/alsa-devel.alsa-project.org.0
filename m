Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254A32BA0F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9591F1915;
	Wed,  3 Mar 2021 19:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9591F1915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614797786;
	bh=NY38qqPa7IYJaRQZNRnoO7a9q5fzonRfWpQQBJf02DE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XsRV9F3X4vWkW1NrEBfO8+QU/heSmc0tKWjqgSNB7rueVJkePn/RELMHlh4s7gXZC
	 0oqH73uwAdSWsOqmuANsuZGywIs32Q103rtJKXUhigtBE6keKIp5lGDTzekHBSEAHb
	 gpnfLPbK9SZKOHV4eiQm70PhwVP5W0Ptk1R9V+fY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 153ADF80424;
	Wed,  3 Mar 2021 19:54:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F348F80424; Wed,  3 Mar 2021 19:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C89F8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C89F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="innMdD6p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123IrMkJ001579; Wed, 3 Mar 2021 12:53:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=qdFJpxie6ydQ1E4+uyPei8YTx0pOxzzOUZCoLJBVIvw=;
 b=innMdD6phvaq5Frmn9E49Ddas4stjFfjHt26opP/Gnth4zlETxdNlcSdsVHR6yEJvsIB
 kZkHTep3u4FwCd+QzW4hJzwgKgI497PwNjng8m4IeXVCJkDletXLnilywu/YToj5yvZ+
 QmOwVs9aJo7MsjkWNDkRtgLp89KHWnsQV16w8HMXyy0g0zhfvU9Wuj9SHQBjivQlZuOv
 9iekBHQPd1SpHD8ptYuR2N95Knt6STxI2W/y1P8wliRdCn86v642FQuUReHcL7OnKI+3
 /dg9fxciRie6gBRgZBjwAdwvT422CqReZY+SE6MHFL9oMoweO5BHRJ5ix/DMV349lEDd YA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctnd7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Mar 2021 12:53:51 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Mar 2021
 18:53:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Mar 2021 18:53:50 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EFDD911D0;
 Wed,  3 Mar 2021 18:53:49 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] ALSA: hda/cirrus: Add support for CS8409 HDA bridge and
 CS42L42 companion codec.
Date: Wed, 3 Mar 2021 18:53:45 +0000
Message-ID: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=467 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030131
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
 sound/pci/hda/patch_cirrus.c    | 1033 +++++++++++++++++++++++++++++++
 3 files changed, 1035 insertions(+), 2 deletions(-)

-- 
2.25.1

