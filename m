Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19709073E5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 15:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C79B60;
	Thu, 13 Jun 2024 15:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C79B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718285898;
	bh=FktdJ3dpxYgLwv3mOnNq66XfSBNmbtiWt8nu4ZUssjU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tAnYScDLo3lLo/vqDGc4E0l+LlUzy09C1SsDjPQThVfgsQQAu/hS2546QQYQYfwVY
	 OjXThou6hoxO15vh8effAEtMl5xU90C8/YPtV6b7uaXTVVrMQk5whLH8EBGYACtKI3
	 qqmAScToLFYHxpLQAO5DkkfN2KbWNH587Y+W09yQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA47F805C1; Thu, 13 Jun 2024 15:37:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECBBF805B3;
	Thu, 13 Jun 2024 15:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83509F8057A; Thu, 13 Jun 2024 15:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F7AF80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 15:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F7AF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=I5kJt75h
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45D5pN0K001648;
	Thu, 13 Jun 2024 08:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=QtBgSUb0MZHTNV1Q
	4UZmYBvp+K84oqTEqIP2wfhcxF8=; b=I5kJt75hgkxNUT5w2+y9mbI+3srSVPnn
	5lGCOpM0W8bscHn4p50FWaiOq0Px2AD0ebeWwcdwSC+dauRsdwDkciyKGKto/Q4v
	hpMW3RGakWl4l33O2BBhrVlnH+SAsBki/wGxfl8fFT6B1Iv4/SCpc89/n+6VkEnJ
	wLGtwUZ3JlITtJXnJP8+v/1fR/7xQMUOmiSmdfpUuZWbqUo9IsKvJMCwXQNWk59n
	I9rsVShN84EsNLjE7UCLnrZxxSFljYeMJnTFaSkDljmc7Y5T/HXqxNO2D3NtC2fg
	12sgdfI00spZ7uT2u3tPTmfgZ19fZ/isZGx8qyigEgUTZvNksZZ0OQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yqskgreuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:37:40 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:37:38 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:37:38 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8F38A820248;
	Thu, 13 Jun 2024 13:37:37 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 0/3] ALSA: hda: Component should be unbound before
 deconstruction
Date: Thu, 13 Jun 2024 14:37:10 +0100
Message-ID: <20240613133713.75550-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fSH1mpGTINbxL0twFSmqDta3asQgSHwc
X-Proofpoint-ORIG-GUID: fSH1mpGTINbxL0twFSmqDta3asQgSHwc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PFXZX4SGIZOF4OHFH6UV2M5BNGQ7PDER
X-Message-ID-Hash: PFXZX4SGIZOF4OHFH6UV2M5BNGQ7PDER
X-MailFrom: prvs=38942f2995=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFXZX4SGIZOF4OHFH6UV2M5BNGQ7PDER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Small chain of fixes to correct hda drivers using the hda component
infrastructure so that they unregister their component before proceeding
to deconstruct the driver.

These three patches been separated from the chain "[PATCH v2 0/7] ALSA:
hda: Improvements to hda_component"

Simon Trimmer (3):
  ALSA: hda: cs35l56: Component should be unbound before deconstruction
  ALSA: hda: cs35l41: Component should be unbound before deconstruction
  ALSA: hda: tas2781: Component should be unbound before deconstruction

 sound/pci/hda/cs35l41_hda.c     | 4 ++--
 sound/pci/hda/cs35l56_hda.c     | 4 ++--
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1

