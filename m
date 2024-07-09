Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E83192BD7F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 16:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05308868;
	Tue,  9 Jul 2024 16:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05308868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720536821;
	bh=MR706r9bLwg1kUgwL9MzfqWo4JfFZnbjwXcQ31JA2kc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YJ2KwsbZDJ6mxpFJr1CImruAx51M+sVMlgSbM0ZfiO6KDTAlqmnMGkOkO6k+uhQsg
	 ZeI5FVy4cgUIx4PwNbXR/y5vkmK1SWwa6r+Z3VILLqa4PGouSdNOVySl/ZNj5TGAbF
	 4zB6ZweC3P60p3+S+n62mhCPuQckPsRV+sxru7Rw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6433DF80074; Tue,  9 Jul 2024 16:53:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB586F80074;
	Tue,  9 Jul 2024 16:53:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07221F80508; Tue,  9 Jul 2024 16:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 250D0F8019B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 16:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250D0F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P6XIFkDF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4699TeIa016166;
	Tue, 9 Jul 2024 09:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2astjUORRu3bICmB
	shlYDX/v1GBiyMqqTFXMnbBfoLo=; b=P6XIFkDFH5YqHQW3oJ6LlSWPeIa+k5l+
	dl0CqOjzDSO2prXWV0thmc9F3vv/GS9vLLdrexxnRIjEKpRU7+gJV9/OvN44R0Ta
	+ZZNORdt8RTS+Mnh9bUoZWbMGtBSunB2rggcVm1Bj7+Fw1xLXdltIhAG7fJG6NUu
	3qaymwh4I23xsm6DDO1GEeK/3iHJnGWitsn5Hl1NhlUf+n8S1ZXzLFZbMkwAqG91
	KzFkRGf9mvW3HoTgDzGU3ezT3BRRinkrHQRob2KvxL3hd7VKdDu7GO792sdBByD7
	oxoWme4Q7ywHhU85u2T8F93gK1GWLqiCHMprB30l168dzbzDmAvlYQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axtqje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 09:51:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 15:51:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 9 Jul 2024 15:51:57 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E3BC1820244;
	Tue,  9 Jul 2024 14:51:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/4] firmware: cs_dsp: Some small coding improvements
Date: Tue, 9 Jul 2024 15:51:52 +0100
Message-ID: <20240709145156.268074-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oKq_uKdNqpJY3E0sieEU2OuMNcQGERy2
X-Proofpoint-GUID: oKq_uKdNqpJY3E0sieEU2OuMNcQGERy2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: F3NM53EAAAHGPTZXC46QL77UI24T4TS3
X-Message-ID-Hash: F3NM53EAAAHGPTZXC46QL77UI24T4TS3
X-MailFrom: prvs=4920b5cb13=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3NM53EAAAHGPTZXC46QL77UI24T4TS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit series that makes some small improvements to code and the
kernel log messages.

Richard Fitzgerald (4):
  firmware: cs_dsp: Don't allocate temporary buffer for info text
  firmware: cs_dsp: Make wmfw and bin filename arguments const char *
  firmware: cs_dsp: Merge wmfw format log message into INFO message
  firmware: cs_dsp: Rename fw_ver to wmfw_ver

 drivers/firmware/cirrus/cs_dsp.c       | 64 +++++++++-----------------
 include/linux/firmware/cirrus/cs_dsp.h | 10 ++--
 sound/soc/codecs/wm_adsp.c             |  2 +-
 3 files changed, 27 insertions(+), 49 deletions(-)

-- 
2.39.2

