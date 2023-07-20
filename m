Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0375B02B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95EEC1FE;
	Thu, 20 Jul 2023 15:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95EEC1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860147;
	bh=tJxHhhDsj9Gk0YLj31sYJUbyAGN8ktfFNxgqB3IZ5BE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DgkUJHVVkSBc8qNu3KxIssPVQh2a7VUWIfI6SE9SoKWU/+1WsROpxODKG6f78nNyy
	 +4TdiQwkqhspHqLWmPebJHTStxMP1q4Y2Y5tgRk0lgO28/BiCQ0LVPGjPxSSXf0zc3
	 GkN3ZgeVHUKyG3vObPQ09dwjeCAdJiJXLtifss4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE78F805E5; Thu, 20 Jul 2023 15:32:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8CCF805E3;
	Thu, 20 Jul 2023 15:32:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4DB1F80548; Thu, 20 Jul 2023 15:32:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F68F80548
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F68F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CE/WQuhz
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36KAupUk002185;
	Thu, 20 Jul 2023 08:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=E
	W9xH6EwUI4+VhEi1xFvO7JxFFGjIaaBEXgWEdpAp04=; b=CE/WQuhzd1FAsmcsx
	sTIOcKPgqAI61BLWn4l35syr+xP61mC/pdYdORuogKHE4EPMgYOT4ierPYqxFl+i
	/nsqz0xi1efiZqpEsOlOBIQu/iQFCvB5K5bqxgFfE5uy/dZeDYAPppu46VnVV7mk
	ALzA4aeVjVMARBahuP5TIeDfxoFjHzOB3BLSSKK50raOY/NTUq1oML19xwByXH0B
	RSmvcEOhO/YjpcCRh1/E1ApOl3DMrZbsxNOt4zKYo2Is4E90BbXuOnVZNHciabis
	gsmPSdgBw2EHb1YDGWYJOIX9KE3LtaTy4OVNziejwQOf9vWvMgs7ntfzyt+TsC2q
	59ksw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:10 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:08 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 83BCD475;
	Thu, 20 Jul 2023 13:32:08 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 00/11]  Fix support for System Suspend for CS35L41 HDA
Date: Thu, 20 Jul 2023 14:31:36 +0100
Message-ID: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: L7QWUw1uIwSJqQtgQ4fIz73mWyeWFijy
X-Proofpoint-GUID: L7QWUw1uIwSJqQtgQ4fIz73mWyeWFijy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XWG6YPXDWCYRAZKZWXE7DUCDACSPNRZR
X-Message-ID-Hash: XWG6YPXDWCYRAZKZWXE7DUCDACSPNRZR
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWG6YPXDWCYRAZKZWXE7DUCDACSPNRZR/>
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

Stefan Binding (11):
  ALSA: cs35l41: Use mbox command to enable speaker output for external
    boost
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
  ALSA: hda/realtek: Support pre-/post- playback hooks for cs35l41
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

