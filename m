Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20A690DE4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1E8E7A;
	Thu,  9 Feb 2023 17:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1E8E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675958774;
	bh=e2tiDbyTw1fd2c2MTiUbrVJIJV38GUVtw5eT7IfWsng=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WOairuvpLw7QizciqVJ0ohZJBH4QGiF8BepuL4kCQ3VEzEOupnboYbEEmiwtLX5QL
	 D8+3hF2D5jWdhwfbiga3TgbqFFmEnTlY01msUXP3W50Ee23ShMcWLfBaL2wOwUlniF
	 nU/KznHkA9+fMvc6ieX07tmg0KtkqTlFARvZ/6gI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FABF8051F;
	Thu,  9 Feb 2023 17:04:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CA1BF8021D; Thu,  9 Feb 2023 17:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FEE7F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FEE7F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U4a/nNj4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319EbGUx024199;
	Thu, 9 Feb 2023 10:04:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=NZ7xBDBXQMgPcMlUjfpxYnKxvMVKqHABd3ZIXatEoA4=;
 b=U4a/nNj4bpRQ0pwcA/2JHt71b7rAcHlbE7NrAn6QQU7vxc+RY1qXAtsaBTTXs0IGCIG6
 41/jxBlvHsssQKenJkYJoFr9Fy4Cr6T+43Sx3hDGj66BJVUWRBJiByryOfNEgJrPvQ/M
 Fs2FKBlYPblOQ/ybs58Y1DWmFP+frSC26/1wsC2ghvPMLl2LSXnIxsSyR371w5FpRLDo
 l08+TEIAmIquILRuB6rg6ncXouNsA/4jZw1gQeTqw35Zk9nsQr60HmXPAcONyMIpwszm
 9d/rbIO+nP7lCbBYse7HJx7zCEzIziyI9AEM+qq8QpNh0IRQyyJlwiXw5eoG/viPI9Kh sw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nhmnv02nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 10:04:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 9 Feb
 2023 10:04:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Thu, 9 Feb 2023 10:04:13 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D358D45;
	Thu,  9 Feb 2023 16:04:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/3] Various Fixes/Improvements for CS35L41 HDA
Date: Thu, 9 Feb 2023 16:04:00 +0000
Message-ID: <20230209160403.838326-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _wHsKOHLrv6YF-8VMDhYu3XtDC86CVDy
X-Proofpoint-ORIG-GUID: _wHsKOHLrv6YF-8VMDhYu3XtDC86CVDy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UOB4AZQKEXT76YVH7BDAJ6NVVVS2ZA5I
X-Message-ID-Hash: UOB4AZQKEXT76YVH7BDAJ6NVVVS2ZA5I
X-MailFrom: prvs=74048fb3a3=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOB4AZQKEXT76YVH7BDAJ6NVVVS2ZA5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes issue in calibration, where return codes were misinterpreted.
Enable High Pass filter to reduce pops and clicks.
Add improvement to ensure firmware and tuning files are always loaded
together.

Stefan Binding (2):
  ALSA: hda: cs35l41: Ensure firmware/tuning pairs are always loaded
  ALSA: hda: cs35l41: Enable Amp High Pass Filter

Vitaly Rodionov (1):
  ALSA: hda/cs35l41: Fix error condition check

 sound/pci/hda/cs35l41_hda.c | 117 ++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 59 deletions(-)

-- 
2.34.1

