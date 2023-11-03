Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A67E0022
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 10:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448A4846;
	Fri,  3 Nov 2023 10:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448A4846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699005545;
	bh=XiRq4iRO2Vfje99qdGf5mlvFbxBY6W7tXSVGi4O7elM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VVKEiaf66RTt73Gdp66UvjljsAwYSSP2ZIJRNTr2wcFQOU6iu91ZVeB9d/+jWdBm3
	 2tUSIdQvk1YK9gQz9tYuYD0WqGFAlfrzXN92RarJxTFZWO0WrxO2TXeULp6lIKe2XO
	 qJQVREUOCf4a1bLCMfvFZShBbin1c+GKgzQyAM6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21207F8057C; Fri,  3 Nov 2023 10:57:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA007F8055C;
	Fri,  3 Nov 2023 10:57:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EEF8F80290; Fri,  3 Nov 2023 10:55:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B20BF8014B;
	Fri,  3 Nov 2023 10:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B20BF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=XNCq4frN
X-UUID: 0268385a7a2f11eea33bb35ae8d461a2-20231103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=36KOaLQYZpx+CBVDxAIZQHr56OQpZtru/mLgKhFMQEI=;
	b=XNCq4frNl7Ure2q48Gzr9eohKPPCXYcUD08RYIj7e4srQZMUo4WD5pl79ESAMyk+u68lK7dqaCLtE5RZROPCVw6TNg62Qf6zP+VwIKL0Qwjn7sHVcABWQFTj3bB6sunQOttBV4Z1EJM6zjBIhHLpq1WmDep2vbfT7TuiZ1x2HwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:86c8f0fa-8662-40ce-a03c-6295f7f07ae4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:abe93c72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0268385a7a2f11eea33bb35ae8d461a2-20231103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2084049131; Fri, 03 Nov 2023 17:54:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Nov 2023 17:54:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Nov 2023 17:54:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] ASoC: SOF: mediatek: remove unused variables
Date: Fri, 3 Nov 2023 17:54:29 +0800
Message-ID: <20231103095433.10475-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.552300-8.000000
X-TMASE-MatchedRID: CZ72wFVpXzbtt0HEL3BUV2ivjLE8DPtZhQaFqMRElgmctWHPLT5FfaOh
	e5t05aXCoMrRxniPIdrzXqndlTSd4XrAhMQyuycqngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEgBwKKRHe+r9sGaC9CZ9ufaSe4AUD2MhNW9T26wF2Q0+trTZbfiv2vIgRPkrFqNz8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.552300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 
 A73DFE082454B4F6E5DDA2F6EB029BB6F4A21EB136424A16F44F6AEAA72751B92000:8
X-MTK: N
Message-ID-Hash: C6UHSFMBHB7RCA5Y3NJK4ECNYTSJJ7FH
X-Message-ID-Hash: C6UHSFMBHB7RCA5Y3NJK4ECNYTSJJ7FH
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6UHSFMBHB7RCA5Y3NJK4ECNYTSJJ7FH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are some variables that are no longer being used because they
were declared for the deprecated memory layout. Currently, these code
sections confuse the users. Therefore, this series removes the code
that was implemented for those variables.

Trevor Wu (3):
  ASoC: SOF: mediatek: mt8195: clean up unused code
  ASoC: SOF: mediatek: mt8186: clean up unused code
  ASoC: SOF: mediatek: remove unused variables

 sound/soc/sof/mediatek/adsp_helper.h   |  4 ---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 49 --------------------------
 sound/soc/sof/mediatek/mt8195/mt8195.c | 49 --------------------------
 3 files changed, 102 deletions(-)

-- 
2.18.0

