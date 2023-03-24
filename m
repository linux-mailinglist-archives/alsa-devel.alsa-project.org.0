Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF96CEEC5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88FAB84A;
	Wed, 29 Mar 2023 18:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88FAB84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106097;
	bh=G73bPPq+mgOejSMC0IfV5XAR0FSepGCObl4MXLPqVCA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QaZSm2uR4EkiKJMA5X3jz17heMAVb7373HA6sSqrzcTVgXPJrDKDKP8hEXf5k0NtN
	 AghFtQkpIwa00eIQT2zfgPyNwys611Zn5PIewiJ155QGfQhIt247uo9erUpNmuEE+9
	 pLzDqeZWfzza5uEFPexg+c4YE+gS5sifZ36wndGk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8EEF80571;
	Wed, 29 Mar 2023 18:06:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B353FF802E8; Fri, 24 Mar 2023 16:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89943F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 16:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89943F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2022-7-12 header.b=alkTre79
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OF4ERE023932;
	Fri, 24 Mar 2023 15:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=bbarXCl626B39KPisJMC+F/vsaqimQLhqQdGF0IiSTY=;
 b=alkTre79gDNlGUovG8GXVbG9mVDEOfFcIXswnosA8ogwQH3gBfCKdi3KayGsBFi51/FY
 tf5THEmfnjvn7OIkbYYJgWQlLoS9HWDubGkhPypUjf7SCgWHcsQSkl0sLFLnr9aUTyot
 c4Gv6f/k0LT8uZBKrRUhYXuLtLZNcyX8zxBiE7780cvpvej73R23ezVWrHKugriN+cO4
 gCwFUeUAc7cAiHq0S2AcmQo/B/ETDmSSANPFOoUucaqbM/d5HZqv8AYNY2IK1fjSOWCh
 oIFEaHFWe4+2dzSe2/43487TG/kU/DQt1nl2Y1CCPLw0xvPrnGL6I+vEoCTwf1KmdCFv TA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3phe69r0fd-25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 15:05:45 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32OEkqVf037930;
	Fri, 24 Mar 2023 14:55:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pgxpy4d73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 14:55:39 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OEtcBl033198;
	Fri, 24 Mar 2023 14:55:39 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3pgxpy4d6j-1;
	Fri, 24 Mar 2023 14:55:38 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH next] ASoC: cs35l56: Remove redundant return statement in
 cs35l56_spi_probe()
Date: Fri, 24 Mar 2023 07:55:35 -0700
Message-Id: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_08,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240120
X-Proofpoint-ORIG-GUID: FtsxNHGA5rOB_qmHc35Rq0PHR0iURuRI
X-Proofpoint-GUID: FtsxNHGA5rOB_qmHc35Rq0PHR0iURuRI
X-MailFrom: harshit.m.mogalapalli@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T5V3LADYUGLADRRRTXDDLQJWWLCGFEI2
X-Message-ID-Hash: T5V3LADYUGLADRRRTXDDLQJWWLCGFEI2
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:52 +0000
CC: error27@gmail.com, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5V3LADYUGLADRRRTXDDLQJWWLCGFEI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have unreachable 'return ret' statement in cs35l56_spi_probe(),
delete it as its dead code..

This is found by static analysis with smatch.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.
---
 sound/soc/codecs/cs35l56-spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 80dcf37daae2..4b2084e85f29 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -29,7 +29,6 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 	if (IS_ERR(cs35l56->regmap)) {
 		ret = PTR_ERR(cs35l56->regmap);
 		return dev_err_probe(&spi->dev, ret, "Failed to allocate register map\n");
-		return ret;
 	}
 
 	cs35l56->dev = &spi->dev;
-- 
2.38.1

