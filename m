Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585457EF655
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA011AE9;
	Fri, 17 Nov 2023 17:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA011AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239122;
	bh=OSMS6kNqXlEzWew5Ivg24YCYWBVP5dd3DSGxEygC90s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BMUU9H+HuA/Aqm1E9sKYvtnO/eF20oUA/1jI9PelTiBiLG5G5uD8ThmvoHN30hEwp
	 TeWJCzILzjccjIiHWlwF5aQJUFRspk7D/v1+pQfzIZMdwbA0Mu9gfbC2QFd1Qbq5PW
	 HzlHNAjrnR6/uc33d1q2fA8GYNht8y8amDZJShqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E271F8022B; Fri, 17 Nov 2023 17:37:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE397F80249;
	Fri, 17 Nov 2023 17:37:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30BABF802E8; Fri, 17 Nov 2023 17:37:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 81DA8F80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DA8F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dt5NOx9J
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AHFq7av014874;
	Fri, 17 Nov 2023 10:36:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=+
	h8A2Q5BPK15jigOBd8bxNYR8QvhfpYsQGQgKXTnliM=; b=dt5NOx9J7IuCgEAZH
	GXtYZqnsLoaD2zRsltdBZHZMqmlprQdG9kV/ntz3JfVHChLP4wgVwLSH08J1jk1o
	yHqGV183XYVE4FnKN7Hym6391rpaH0juEIIF8Ow8KVlz5yxaSHS59iEcQz4zScd+
	D0b4psfRIT9fAq7Qk1ncQT/Ybu62PneWSUp5fhaWPJ0JLPZdbJEQWKPzajE08PCL
	bW8JSoebTdeE1gSeFXs7/oQ0rYfDB0OirhLwCauu34uPaHtAmZcODP955y6g78T4
	TZtkVn6SUTIV3EW6aZQ0kehA6zPEhiHjsz1qGMJcp/vsYmz1u74UWUi/XRDJux54
	dBpdA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpfrca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:36:19 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 16:36:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Fri, 17 Nov 2023 16:36:16 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.225])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2248415B9;
	Fri, 17 Nov 2023 16:36:17 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/2] ALSA: cs35l41: prevent old firmwares using unsupported
 commands
Date: Fri, 17 Nov 2023 16:36:07 +0000
Message-ID: <20231117163609.823627-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jgTLt9TbNllyPY7cqshwiJ9XTZf5QAVM
X-Proofpoint-ORIG-GUID: jgTLt9TbNllyPY7cqshwiJ9XTZf5QAVM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3JISF7DNEYVQNTG3TWFQGMK3RDADUNLR
X-Message-ID-Hash: 3JISF7DNEYVQNTG3TWFQGMK3RDADUNLR
X-MailFrom: prvs=66859973bd=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JISF7DNEYVQNTG3TWFQGMK3RDADUNLR/>
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

Changes since V1:
- Added fixes tag to all patches
- patches rebased after v6.7 release

Stefan Binding (2):
  ALSA: hda: cs35l41: Remove unnecessary boolean state variable
    firmware_running
  ALSA: cs35l41: Fix for old systems which do not support command

 include/sound/cs35l41.h        |  2 +-
 sound/pci/hda/cs35l41_hda.c    | 28 ++++++++++++----------------
 sound/soc/codecs/cs35l41-lib.c |  6 ++++--
 sound/soc/codecs/cs35l41.c     |  4 ++--
 4 files changed, 19 insertions(+), 21 deletions(-)

-- 
2.34.1

