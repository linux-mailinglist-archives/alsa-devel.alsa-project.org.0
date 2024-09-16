Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01B97C9DF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2816EDF6;
	Thu, 19 Sep 2024 15:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2816EDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751691;
	bh=bBXVjManR5QI5nqLaRpf1s6ZfTEZVAXdd/J2a6VUsCo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U4+UvZMDEOmwDdol2ZBVw6ovEsBBqoLfLc0x5VPcTjEeMMvTEybohfTuq91k4SvLC
	 Gk6tg7gKnIK+bKf4JPK2VfwpfHHZKhGvALX+nfOx6ALxX4+q0rRhSVm1h+/bxCz0s8
	 K+xVeE84z8ozmLDbIaSIGbT/k1/RvPFzpsUTySPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D2F6F8068C; Thu, 19 Sep 2024 15:13:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01EFFF8059F;
	Thu, 19 Sep 2024 15:13:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D239F8020D; Mon, 16 Sep 2024 11:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD941F80074
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 11:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD941F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Jg+Nzkwb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726477904; x=1758013904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bBXVjManR5QI5nqLaRpf1s6ZfTEZVAXdd/J2a6VUsCo=;
  b=Jg+Nzkwb1PlYOkc3maIgS5X/d7LNfKW4FI5A0anVsQ9x2XEusW64tMHB
   GD8KMTNNFpDsWWXBGr+Gyu72KFlOVX8Pym6VuzH5DGq4l4XxHoxzEJkgn
   rJ4IC2wCF7xL2KxxzFDxZKm63lDQclqjsmK8MDoqs2JdMwVg9J4woopxZ
   QpfnzyCNuiIjh3NEdV3DbvOIFPVhPeW8wJ+CZRfq/HDppe/T4L2hvLXZl
   rCcS9you9UEQeWfxGTgOo4kIs1kkG2+sOpFe7lxNo6PREH/CgPuhY0UQa
   r8fftInwFgwaDUZJeDlSVd8fl3ePxn3RLkR5wzkkC/OsLEj0tMzektsyF
   w==;
X-CSE-ConnectionGUID: zBJi05dESDObnv88EXzWcg==
X-CSE-MsgGUID: WplkUA/6QpyGdb05qmq9uQ==
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600";
   d="scan'208";a="34997189"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 02:11:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 02:11:22 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 02:11:20 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/2] Updates for mchp-spdif(tx/rx)
Date: Mon, 16 Sep 2024 12:10:55 +0300
Message-ID: <20240916091056.11910-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=98237714c=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OL5ECN5BAC2RQP4652QR44GJQI2WZTL5
X-Message-ID-Hash: OL5ECN5BAC2RQP4652QR44GJQI2WZTL5
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL5ECN5BAC2RQP4652QR44GJQI2WZTL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch set includes two updates for the MCHP SPDIF RX and TX drivers.
The patches remove the interface name from the stream_name, allowing the
interface name and index to be set in the Device Tree (DT) using the
sound-name-prefix string property.

Codrin Ciubotariu (2):
  ASoC: atmel: mchp-spdiftx: Remove interface name from stream_name
  ASoC: atmel: mchp-spdifrx: Remove interface name from stream_name

 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.34.1

