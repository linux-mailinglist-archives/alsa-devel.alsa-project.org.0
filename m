Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3075CB74
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988111FA;
	Fri, 21 Jul 2023 17:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988111FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952846;
	bh=2Meav8bP/+wPjpX5WwOSOtJZZKP1DLrJ+AXczzjWYRQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vNSRHTDZeL6e+cZWOP4UhyXxGCqJLBxb437ij/w9M5paa7UBvEidwMqThk6hoID0U
	 ymVcNdTqzINH1+/4sHDBWMdRgvbQgbbp84Q8GyOCXI1gYFiCMXflVJGc9+haq+RNte
	 sKDi9LDiqhE9Ohj/ZIPov0ebo9w2ok2EJj253oHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BDDF8057F; Fri, 21 Jul 2023 17:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92383F8057F;
	Fri, 21 Jul 2023 17:18:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A79F8055C; Fri, 21 Jul 2023 17:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E323F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E323F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hG97G1q0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwg011284;
	Fri, 21 Jul 2023 10:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=q
	LMLNLcgrkd2GN4RsPHG93N6pllAVjaH9PciQbGF2GI=; b=hG97G1q0jmVRFcCEu
	ipDMdI45xiz0n5K6P42Ka3Ks6pJm912kVIRkgQuzZ0MOdU9RmOaTMZA5xH+jHUce
	tPoqOmRL1tBazSuD6jqHgVeziGrnmM5kj7qpPlzBt53srqyUxJUv4TN9lBIDq0+S
	ZvZLTrpjDfa3A1anL0pCGntGeruHAGYOISYSa7dojd08pncB2DrIhN8qY35vUo6u
	5KYiQxMY1ar9TxiOCw7fGGX7LeJIjuai05NHNMms15mUwN3ImWtI/VblS8qmMjjR
	x/HSqiJbetT+8ux0sn6j8uHTShLlckFSxa58KA0Lb289+P8zWl9b7zz84PzeErBb
	D1vng==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:27 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:25 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6CC2946B;
	Fri, 21 Jul 2023 15:18:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 00/11] Fix support for System Suspend for CS35L41 HDA
Date: Fri, 21 Jul 2023 16:18:05 +0100
Message-ID: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: em39YRvIjjJex4WMzgHbAZ1cq77NiW6z
X-Proofpoint-ORIG-GUID: em39YRvIjjJex4WMzgHbAZ1cq77NiW6z
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XJOCNMIQM4I54EE4AR3OOLLW26R4ENT2
X-Message-ID-Hash: XJOCNMIQM4I54EE4AR3OOLLW26R4ENT2
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJOCNMIQM4I54EE4AR3OOLLW26R4ENT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There have been a couple of customer reports of intermittant issues after
system resume, where sometimes the DSP firmware stops responding.
Investigations into this issue show that there is a race between receiving
a prepare from the HDA core, and the firmware reload which is started by
the system resume. This can causes the Global Enable on the CS35L41 to be
enabled during the firmware load, which can sometimes cause issues in the
DSP.

The existing system resume behaviour also did not resume the audio, if
audio was previously playing when it was suspended.
In addition, during investigation, it was found there were additional
problems in the System Resume sequence, as well as the Playback sequence
with External Boost, where the driver does not correctly follow its
enable sequence for this mode. This can cause additional issues such as
pops and clicks.

This chain intends to correct the sequences for playback and system
suspend/resume so that the driver: obeys the external boost enable sequence;
resumes audio on system resume; and avoids the race condition on firmware
load and playback during system resume.

Changes since v1:
- Split patch 1 into 2 separate patches
- Combine Patches 6 and 9

Stefan Binding (11):
  ALSA: cs35l41: Use mbox command to enable speaker output for external
    boost
  ALSA: cs35l41: Poll for Power Up/Down rather than waiting a fixed
    delay
  ALSA: hda: cs35l41: Check mailbox status of pause command after
    firmware load
  ALSA: hda: cs35l41: Ensure we correctly re-sync regmap before system
    suspending.
  ALSA: hda: cs35l41: Ensure we pass up any errors during system
    suspend.
  ALSA: hda: cs35l41: Move Play and Pause into separate functions
  ALSA: hda: hda_component: Add pre and post playback hooks to
    hda_component
  ALSA: hda: cs35l41: Use pre and post playback hooks
  ALSA: hda: cs35l41: Rework System Suspend to ensure correct call
    separation
  ALSA: hda: cs35l41: Add device_link between HDA and cs35l41_hda
  ALSA: hda: cs35l41: Ensure amp is only unmuted during playback

 include/sound/cs35l41.h        |   5 +-
 sound/pci/hda/cs35l41_hda.c    | 288 +++++++++++++++++++++++++--------
 sound/pci/hda/hda_component.h  |   2 +
 sound/pci/hda/patch_realtek.c  |  10 +-
 sound/soc/codecs/cs35l41-lib.c | 118 ++++++++++++--
 sound/soc/codecs/cs35l41.c     |  18 +--
 6 files changed, 343 insertions(+), 98 deletions(-)

-- 
2.34.1

