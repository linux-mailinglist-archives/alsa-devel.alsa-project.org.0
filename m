Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3B5810E4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB5615C2;
	Tue, 26 Jul 2022 12:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB5615C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658830394;
	bh=yiD2RSSe6JNE7IfD2phiQgU1QPj9dXpDa03KF90uMXo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rlyRd3xycD2thHr3AmJoxIOAbgTtCF4/gE5a9aMEc+4KU7pkQh+Gy2jvpV2Z9EDYz
	 3jqInRzFwCMfd46wjA0V1grjlBrYtNeR7xnTzXyQk7CLR1NurXzYOIDYeBvJYzpQD6
	 De7o2Ms+a9ckP0JVorkoBX2CIeG2oOf5DQ+i+/Hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83014F804C3;
	Tue, 26 Jul 2022 12:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA7CF804C3; Tue, 26 Jul 2022 12:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DDFF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DDFF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Xd864KQb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q4TP8N032253;
 Tue, 26 Jul 2022 05:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=lR4sbE6cBVTFNXJo/Ef8C3UIe40HJQG18tvv1wPDk08=;
 b=Xd864KQbsz3ExeGGVbLL5JRuB/1m7Yc6wEuZXzDU/4+xYvgquLwjGS99VNsPjXpGxEZo
 7nEiWRVJ34QaYCHmXBwrnl9CWcEK7NfuhO4Do1RJFBwo6l9LVDc4JqW8AWhUZ0rpowyM
 wdJOUlhrq38TkWZ738+pWu2NpL++dziLZguQG37faiOez7yKgUoNPCIm1r5lKazr1MiT
 8Y7OJashDgdn335sGw+CZF10rcklE8dUUrE9qtQ3M5bkOIev0kj/757D5dLAu9YRheUq
 WY++KM95354LaC96KcU5TpHGj4KkbO0Fsmn0JhxR6mLo6SKgr7E2xaB/65mu6OXlwIOj pg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp3a2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 05:12:04 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 05:11:35 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 05:11:35 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A27FD2C5;
 Tue, 26 Jul 2022 10:11:32 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cameron
 Berkenpas <cam@neo-zeon.de>
Subject: [PATCH 0/2] Add support for CLSA0101
Date: Tue, 26 Jul 2022 11:11:29 +0100
Message-ID: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2Mup4KydkpKEMchmdm81MhcBgOT1OBlb
X-Proofpoint-ORIG-GUID: 2Mup4KydkpKEMchmdm81MhcBgOT1OBlb
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Add Support for the CLSA0101 laptop, an Intel version of CLSA0100.
This patch has been tested using the CLSA0100, ensuring it
doesn't break the sound for it.
We appreciate it if someone with CLSA0101 could verify that this
the patch works for them.

Lucas Tanure (2):
  ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
  ALSA: hda: cs35l41: Support CLSA0101

 sound/pci/hda/cs35l41_hda.c   | 67 +++++++++++++++++++++--------------
 sound/pci/hda/patch_realtek.c | 12 +++++++
 2 files changed, 53 insertions(+), 26 deletions(-)

-- 
2.37.1

