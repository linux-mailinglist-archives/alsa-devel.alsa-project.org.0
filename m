Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116C7AB3A9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D482E79;
	Fri, 22 Sep 2023 16:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D482E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393032;
	bh=qf3L8Hm8ZsNqT8S25gWyZVssx/dA9M6cmCfDmmNtH54=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FKjxr3t7Koet3lb1I545YvjqET2CY1Fknt9Q/LyiMIpHgF9dfO4DhNUk7rPq71sR1
	 LdYjOLIYXo99f70th8B7vTuQ6ssCh2NjYkUMjgvDefAmQ2ICxJXF4qKgskWyZ9wDyk
	 S8yCi/aMFKdBsA885WppETRhiePQU+9QMG+OS+dY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFBA2F80568; Fri, 22 Sep 2023 16:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF34F8055A;
	Fri, 22 Sep 2023 16:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0545BF801F5; Fri, 22 Sep 2023 16:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0986F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0986F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=C3Rb0QSc
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ME9ncC026380;
	Fri, 22 Sep 2023 09:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=P
	9lo6NrtT7bVqMoFP5TYebIw4AWc4lUSCngfC5n9hv0=; b=C3Rb0QScSzVl/qDjO
	fc41mqDhuTc4ELuU1yXb3m0px5+Pi9vVHBj25znr6IVQi0Zsp3UvNGRQmevn4Ya2
	0wzQwkgQL9JAoXPUqi1wDJTyD2kZ0KarChH8PYLFUc7OnEeh/vBkVr/9ndEMSpFn
	VN00Wu628VI1zfZEuFu7KhQUJup7Ks6F/dJEobPlYmeXCMrdNHLSmuqdXh+JKULX
	iurOMZey6OkSNp612N/0MX1Ke5RfslqcdxWQtgRnfWMcNt1ln2gJSymuwyA1zLWl
	ASf1Ew8y40+xB8LrsoysEROKnIrzN7b6fFxADnr9aN7s/5h0OzzZbx7hdSPLqbru
	PSM8w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t8tt7h2pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:28:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 22 Sep
 2023 15:28:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 22 Sep 2023 15:28:28 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B79683561;
	Fri, 22 Sep 2023 14:28:27 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using unsupported
 commands
Date: Fri, 22 Sep 2023 15:28:16 +0100
Message-ID: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IFvwBFG7EHdNpFDfh6PwYPNjvliZgZ-r
X-Proofpoint-ORIG-GUID: IFvwBFG7EHdNpFDfh6PwYPNjvliZgZ-r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ONM2Q5YFHOCGE2DAT5YMM3O5KJ5HNFTT
X-Message-ID-Hash: ONM2Q5YFHOCGE2DAT5YMM3O5KJ5HNFTT
X-MailFrom: prvs=462953d6eb=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONM2Q5YFHOCGE2DAT5YMM3O5KJ5HNFTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some systems use older firmware which does not support newer commands
which are used to enable external boost. For those systems, we can
workaround this by writing the registers directly.

We can use the firmware version, stored inside cs_dsp, to determine
whether or not the command is supported.
To achieve this, it requires a cleanup in the api, to pass the cs_dsp
struct into the function.

We can also remove the redundant boolean firmware_running from the HDA
driver, and use the equivalent state inside cs_dsp.

This chain is based on Mark's branch, since the api change was made to
the function in sound/soc/codecs/cs35l41-lib.c.

Stefan Binding (2):
  ALSA: hda: cs35l41: Remove unnecessary boolean state variable
    firmware_running
  ALSA: cs35l41: Fix for old systems which do not support command

 include/sound/cs35l41.h        |  2 +-
 sound/pci/hda/cs35l41_hda.c    | 28 ++++++++++++----------------
 sound/pci/hda/cs35l41_hda.h    |  1 -
 sound/soc/codecs/cs35l41-lib.c |  6 ++++--
 sound/soc/codecs/cs35l41.c     |  4 ++--
 5 files changed, 19 insertions(+), 22 deletions(-)

-- 
2.34.1

