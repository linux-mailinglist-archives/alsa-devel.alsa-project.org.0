Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703615823A5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 12:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1955E846;
	Wed, 27 Jul 2022 11:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1955E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658916041;
	bh=LzMlHbm3phcc3uaFVjX4CYnhb4QiUjHMIeQAaCRtYrc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q1K8rl9xnWSrAYlYUrniomVK3XZghzrfZnum7y6sgexd+OFLn4fPb8pz6jrLbLoOL
	 uN62e2FQlzOaG6hAnIkPb+ALniXpN6qE0YwoIM/mMXF5Rh55yzk3dJ43BA0fIoL4Q0
	 eXEkGvUbT/mkfGPowCwVzqoqRJEq6P9poRo92PDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E42EF804DA;
	Wed, 27 Jul 2022 11:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C47F804D8; Wed, 27 Jul 2022 11:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89261F80155
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89261F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="o338mblI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4SNEc032560;
 Wed, 27 Jul 2022 04:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=BbGXTgpT1IEb5EFQjmHXxXYe4Upr+BQfUJUo9eyfsh8=;
 b=o338mblIeSTcC723yseD6IPQMjazyJ1WSvfOiffTitQLZn5KCGQQ7/98XYIYXr24u90F
 wFhkhxpiGflERQi8TkfcQiaY5+0Ao3B5nvmeWIfcYNfPHZ3JRroQ7g+eFep3HZqzDz9b
 tVU7YwMNa5+54EzjjXkYcdiAbBaiK2YXbKcK7Ov64NGN4gI4KDLT4tlZgp6QDPFgHakG
 OJ/EXItu7Si7rYTVTlhGpNPC7pH7R7GGUYDh5xQK+2zbHzho66yWXw07UrqYlrch0SgM
 IQG+YNG3Q1pdkhLPePABpIkJXAped6WyCqGAeWPpt4xsLvWejxGjYAK4lWHJx0KOTNEx 1A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1vtk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 04:59:30 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 04:59:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Wed, 27 Jul 2022 04:59:28 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B38012D4;
 Wed, 27 Jul 2022 09:59:27 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Cameron Berkenpas <cam@neo-zeon.de>
Subject: [PATCH v2 0/4] Add support for CLSA0101
Date: Wed, 27 Jul 2022 10:59:20 +0100
Message-ID: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NqQOa9stilE_d5Zo1AKuxDdkdZiXk_q0
X-Proofpoint-ORIG-GUID: NqQOa9stilE_d5Zo1AKuxDdkdZiXk_q0
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

Changes from V1:
 - Add CLSA0101 id into scan.c, serial-multi-instantiate.c
 and cs35l41_hda_i2c.c

Lucas Tanure (4):
  ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
  ALSA: hda: cs35l41: Support CLSA0101
  ACPI: scan: Add CLSA0101 Laptop Support
  platform/x86: serial-multi-instantiate: Add CLSA0101 Laptop

 drivers/acpi/scan.c                           |  1 +
 .../platform/x86/serial-multi-instantiate.c   |  1 +
 sound/pci/hda/cs35l41_hda.c                   | 67 ++++++++++++-------
 sound/pci/hda/cs35l41_hda_i2c.c               |  3 +
 sound/pci/hda/patch_realtek.c                 | 12 ++++
 5 files changed, 58 insertions(+), 26 deletions(-)

-- 
2.37.1

