Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E696E675C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 16:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4534AE7F;
	Tue, 18 Apr 2023 16:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4534AE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681829055;
	bh=EpTBoQsSHc1GGy5IZVDaCCcQI5jKwxIyT0CguIVz2sU=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=XA4XsRIYltC9ZLGa2NtrsSXFv+rPs7u7f/tg5HCIybBAKCc8wEHpWREm02VPnxcVV
	 yVX2UYpVGO541Yl4PUXUuKuERd95z2UZ01qG1CiJKkT3Ytv3aK6AoBc2nAk7VWup/S
	 y5A5DvPDVr0HM0S7I7Zxx+fiUwnw9fHtaxE1oH5Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F5ABF80212;
	Tue, 18 Apr 2023 16:43:24 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: cs35l56: Updates for B0 silicon
Date: Tue, 18 Apr 2023 15:43:05 +0100
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRLR26N7EAI2YKD473HKVUX76NORKPKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182900394.26.3498610252009131778@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238C8F80510; Tue, 18 Apr 2023 16:43:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D5F4F80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 16:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D5F4F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GGm1sRuL
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I523hw019087;
	Tue, 18 Apr 2023 09:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=PVfga8AfecuCW4oJDNRPwVuMa7MjOGVikjQ6EXodY/M=;
 b=GGm1sRuLam/6USnysrB/hFP6UJgg2xjFC0bP503ECAYNh4ke7IiNFQuvJ7Fu9+TbAK+G
 qR/B3lLQIUTyq4n/Z3hwbDMcL97BUSFNpLFNPyDoQpKbveHnn1cVF2S7iq58KBAZmI43
 q7Utm6tT96AYrKLHUR8knWdFsqGMKAXfeuKFCkNXqu38iIy9tmlCmt2Zf5PBjXbP2d0p
 7OJOSlyYT8A6Z80ZA1y1BVPSltwClWOvZp3cMyYAnxpRMCH4Yf2dPRm84+HIjuEo481R
 DF7wTHCSXTf4pJaFUUq8aN844+jS07+dce1trox2GRnXBaMiCk0AHehNmUDzEwN8jqbx 6g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpxftd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:43:12 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 09:43:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Apr 2023 09:43:10 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DD204B06;
	Tue, 18 Apr 2023 14:43:09 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: cs35l56: Updates for B0 silicon
Date: Tue, 18 Apr 2023 15:43:05 +0100
Message-ID: <20230418144309.1100721-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: e36K95z1XISic5iuqIDsyytTtXAHR7lK
X-Proofpoint-ORIG-GUID: e36K95z1XISic5iuqIDsyytTtXAHR7lK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XRLR26N7EAI2YKD473HKVUX76NORKPKU
X-Message-ID-Hash: XRLR26N7EAI2YKD473HKVUX76NORKPKU
X-MailFrom: prvs=9472792d81=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRLR26N7EAI2YKD473HKVUX76NORKPKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These patches make some small changes to align with the B0
silicon revision.

Richard Fitzgerald (4):
  ASoC: cs35l56: Update comment on masking of EINT20 interrupts
  ASoC: cs35l56: Remove SDW1 TX5 and TX6
  ASoC: cs35l56: Remove SDW2RX1 mixer source
  ASoC: cs35l56: Rename mixer source defines for SoundWire DP1

 include/sound/cs35l56.h           | 10 +++------
 sound/soc/codecs/cs35l56-shared.c | 34 +++----------------------------
 sound/soc/codecs/cs35l56.c        | 30 ++-------------------------
 3 files changed, 8 insertions(+), 66 deletions(-)

-- 
2.30.2

