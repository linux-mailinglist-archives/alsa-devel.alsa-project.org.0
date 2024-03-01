Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1D86E4E6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 17:03:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A7A9F6;
	Fri,  1 Mar 2024 17:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A7A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709308980;
	bh=qQH8gQPvTmEgXfrx67Ns4BOZEimP4hi/vcmroQc54kA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LjQy+ubaJ3GUkyzAmc6+f0XS13puLK9dcWYEbiph1HyGXHBTU9YKo94Usi8gGhoAc
	 57nxoZk3DxhfLfPlq06ZOVf8cqjTvZAjMgVfwLzuIr2gUYAJDf2ga73W9xJCljvBI5
	 wr+QIJZEyRouilD8lLC6a+CXhOMtVsTW3zd24ZtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06A79F8057A; Fri,  1 Mar 2024 17:02:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3B3F805A8;
	Fri,  1 Mar 2024 17:02:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CD84F80087; Fri,  1 Mar 2024 17:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB5D7F80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 17:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB5D7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=L4ieCI3r
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421Ex0dJ019890;
	Fri, 1 Mar 2024 10:02:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=R
	91vfkEZ4DcLlnzHd/Fm5vsxq1ZSdUhj38Xa13teIuw=; b=L4ieCI3rx1FXhPUGc
	KIsymHmDdTN0EfYQMYq31JowNWsLWCfkg3dTV3TMhuEq9Z0ig/Hixyftm3ARSFk+
	iigzQlDoP+Iz0xs1GPnomd38ngvAFCgX5SbkXV2QOdnKpDczi2bk2VvO9sRctWQk
	k7K6QtBcIIRcRYRtEjqwPm6CPpM4/J+Ps/Q1/gOj7JZrWrbzfU4pXR/Yy3d9e6Q0
	6++NWrFw3SlHgF4W4L3KSw5/hDfZ/m79ek9UTsK0lPbtWN+L1t+iZPjafXO7Dn/y
	ScWHynRRUGeT+h8+mleSn2oeKMTX2o9FQ4aEBiHvfhc9o7f3WbyK/LRiEOZUnHVB
	32uuQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8t02nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:02:12 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 16:02:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 16:02:11 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B51C482024B;
	Fri,  1 Mar 2024 16:02:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/3] ALSA: hda: cs35l41: Add support for a couple of Lenovo
 and Asus Laptops
Date: Fri, 1 Mar 2024 16:01:51 +0000
Message-ID: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _B_4OF2t4riIX304X7RssjAFLHNknMgj
X-Proofpoint-GUID: _B_4OF2t4riIX304X7RssjAFLHNknMgj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 52DFBIC2ITJBKNYTLTAXI63B5GXGI6RW
X-Message-ID-Hash: 52DFBIC2ITJBKNYTLTAXI63B5GXGI6RW
X-MailFrom: prvs=079039dfa1=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52DFBIC2ITJBKNYTLTAXI63B5GXGI6RW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for a couple of Lenovo Thinkbook 16P laptops using CS35L41
HDA. Also fix a _DSD BIOS error for the ASUS UM5302LA laptop.

Stefan Binding (3):
  ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P
  ALSA: hda/realtek: Add quirks for Lenovo Thinkbook 16P laptops
  ALSA: hda: cs35l41: Overwrite CS35L41 configuration for ASUS UM5302LA

 sound/pci/hda/cs35l41_hda_property.c | 6 ++++++
 sound/pci/hda/patch_realtek.c        | 2 ++
 2 files changed, 8 insertions(+)

-- 
2.34.1

