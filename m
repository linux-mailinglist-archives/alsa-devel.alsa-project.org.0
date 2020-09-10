Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF822640A7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 10:56:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31738166A;
	Thu, 10 Sep 2020 10:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31738166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599728180;
	bh=ufwDJLSegb+A/2yDDvdZS258z8MliasgSu1Fm6mUhCQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EUUZ/QPdLLDBTNhYx4517D9+q7SgPqv7eRyfJeMjE6uvn1e81RZYVx41TIpjYR2n4
	 LuhZ2tVcwiqMYtzrGlEYuyaEerldfbIvibTpn1QewuysJsdsd7LQunQoMTt69+VvQV
	 j3+lDAptM5xpxu8qqjlNMdI6KQ4Iqw0bXzmgFEDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5043FF8026F;
	Thu, 10 Sep 2020 10:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57C3F80264; Thu, 10 Sep 2020 10:54:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C18AF8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 10:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C18AF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=infinera.com header.i=@infinera.com
 header.b="jkmMEJHb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URq42bfhUm/KO91hINiL/W0BDstF3dWGLdfmgtwRLnT6gQ1LB3pQ8pkFWjYZXODGzkXGTpPhbZx1DvGIFFMN1ICLmSkHR4w4R5XSUt29MZiPt0JwxOQoRrJjpHxOywpLf2XoXMXHeUo+rqVpW++LN/Ezk0bh5f0L9ZyVwxaoiyoFHcsiQFSzHUcWSxCTptNnB3D1eKuCvfVaCbu78h2UBG/XTecIDY2uezjZSPJ2TVJrCFZ8FVoc7mOLvKtJlYeCNjpcssGN9IWCUFZZgnY2C/eX4asSH4RXIQXGqkyBmJYnmEKXXEfqaTjWZlfu3hq6juJwKr38ApO2UMJXJsN/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPOCEX8ljTcxsyYyl39b03L1F7qBLlocdPa6VU6aA54=;
 b=kkxf0ScCTkk46/i//tGEc1Vfqc+AOODy2lxR7XtwyUVGt9Wq94UdSMDMD3BnrEYBUP07Ss5xkczbcFS44ynQ9iLV3rtPUgtcY/XYY8xkpWYnJ8iTuwL5P4vnC6aRywHjNjBG/BhI4CVD8/epCEItd6R2/hXlfcLbrkmBjIvMKc/oGzO7buSH052YkCEkOogjpXuVayuoQBb37AhfQgoHUn3n4qsFnSX32pcCmBx/b7RnD7Z6aSWq6KI5vi1+a3w9d7k+7Qppy4LTd3N7gNCm5GZSzKrOMEpI03IMonZ4ZiKpdgtuLCOtIQsCRuRHkOqdDrOFcmlUVebT4Z2KOycTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.191) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=infinera.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=infinera.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPOCEX8ljTcxsyYyl39b03L1F7qBLlocdPa6VU6aA54=;
 b=jkmMEJHbViakc8cIGAFAXrgwH+7ZFDoDjTE4s3oA0MTQWtHmrnWltbatHul/y1cK4IPCK2/LMSYMlL5HpAGOqyOUppwufDPOGHwEfi20tiBJ+sXAIzvnDgLUBiCy+SC4Lzu6dfTP0GNZSozqEJbsSxZR0Dg8ZDur+Z6130/JxWk=
Received: from CO2PR07CA0084.namprd07.prod.outlook.com (2603:10b6:100::52) by
 DM6PR10MB3785.namprd10.prod.outlook.com (2603:10b6:5:1d2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.19; Thu, 10 Sep 2020 08:54:23 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::21) by CO2PR07CA0084.outlook.office365.com
 (2603:10b6:100::52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 08:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.191)
 smtp.mailfrom=infinera.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.191 as permitted sender) receiver=protection.outlook.com; 
 client-ip=8.4.225.191; helo=owa.infinera.com;
Received: from owa.infinera.com (8.4.225.191) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 08:54:21 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 10 Sep 2020 01:54:21 -0700
Received: from sv-smtp-prod2.infinera.com (10.100.98.82) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Thu, 10 Sep 2020 01:54:21 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by
 sv-smtp-prod2.infinera.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 10 Sep 2020 01:53:34 -0700
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com
 [10.210.71.2])
 by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 807D72C06DF0;
 Thu, 10 Sep 2020 10:53:33 +0200 (CEST)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
 id 72CE55EE3; Thu, 10 Sep 2020 10:53:33 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for H570e USB headsets
Date: Thu, 10 Sep 2020 10:53:28 +0200
Message-ID: <20200910085328.19188-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2020 08:53:34.0456 (UTC)
 FILETIME=[DDA20F80:01D6874F]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc27312-59f8-4e4f-379b-08d855671c73
X-MS-TrafficTypeDiagnostic: DM6PR10MB3785:
X-Microsoft-Antispam-PRVS: <DM6PR10MB378562D28F2E42EA9CB271E1F4270@DM6PR10MB3785.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYXidjIt20/A33dF3YUC6mpwZTpbwm56X4zq7bCfibQn9Tq4EGAV4XB/MqrweV+bFMXr33V11+UMCTNvbaK/zDORB0AqzMqRJJm6pVRSsd79J+4BOOoqtaw7A/0uiT/BNouQOML+q2pwV3DTk40pUzxO6K2NdAW9PTvYFTzpkEQKzwfxKSoi+fJ+go7k/2ktb3furM24b/F27XhBRcZkEU4t0V9NNXZGrgmeoewvqztnIVOlXKWGSB6KSmDrl7EZhz7VDMRj61Gd1zSO5W3+cbf58gYDq3yoW4GBF6ZMaGphRUvmQASqo9ig0YsQDx+iSY/DWvc5yEL+iQGCjGy72odcW/WU8apKHLNL9QlnonTp38dS4OeteKVhPAyGIgebch5/0FgAXwQC+5Nkr5EVu6WAz8feyb6/EfNI8y42r/JDRrdF8S7lRJdcW5wWZ5Qu
X-Forefront-Antispam-Report: CIP:8.4.225.191; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:owa.infinera.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(4326008)(8936002)(6266002)(8676002)(107886003)(34020700004)(47076004)(186003)(426003)(42186006)(336012)(54906003)(44832011)(2616005)(36906005)(5660300002)(316002)(82310400003)(86362001)(478600001)(70586007)(70206006)(36756003)(1076003)(6666004)(2906002)(356005)(26005)(81166007)(6916009)(83380400001)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 08:54:21.9630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc27312-59f8-4e4f-379b-08d855671c73
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77; Ip=[8.4.225.191];
 Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3785
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
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

Needs the same delay as H650e

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: stable@vger.kernel.org
---
 sound/usb/quirks.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 75bbdc691243..892296df131d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1678,12 +1678,13 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 	    && (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
 		msleep(20);
 
-	/* Zoom R16/24, Logitech H650e, Jabra 550a, Kingston HyperX needs a tiny
-	 * delay here, otherwise requests like get/set frequency return as
-	 * failed despite actually succeeding.
+	/* Zoom R16/24, Logitech H650e/H570e, Jabra 550a, Kingston HyperX
+	 *  needs a tiny delay here, otherwise requests like get/set
+	 *  frequency return as failed despite actually succeeding.
 	 */
 	if ((chip->usb_id == USB_ID(0x1686, 0x00dd) ||
 	     chip->usb_id == USB_ID(0x046d, 0x0a46) ||
+	     chip->usb_id == USB_ID(0x046d, 0x0a56) ||
 	     chip->usb_id == USB_ID(0x0b0e, 0x0349) ||
 	     chip->usb_id == USB_ID(0x0951, 0x16ad)) &&
 	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
-- 
2.26.2

