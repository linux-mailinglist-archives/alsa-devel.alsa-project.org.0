Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B4904C1A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34639B6A;
	Wed, 12 Jun 2024 08:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34639B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175507;
	bh=r669ch1jn1copLyRkWU8QWFyTgWYCgtbSASXN3rWsto=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OpHxspCv9jOg0LJkXMmqDOPdBaB64VStJv6qIj5L6u3EGpWT0YUea1jfZOEnQeoXe
	 NHRxYCJNr1KUQaIGTVdPIDPnfnDJWlMaLIas+xh6jBpkugR0yzaCgmqmaha4eQKOUp
	 P2lA5g8cvaodmrDyA4YamqzMNYks8jJC0ZbrP+U4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48630F805B1; Wed, 12 Jun 2024 08:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3386FF805AB;
	Wed, 12 Jun 2024 08:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 331ACF80587; Wed, 12 Jun 2024 08:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 597B7F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 597B7F80448
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 98E5C2018C0;
	Wed, 12 Jun 2024 08:57:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4A3CA2018BC;
	Wed, 12 Jun 2024 08:57:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EFA27181D0F9;
	Wed, 12 Jun 2024 14:57:41 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com
Subject: [PATCH 0/3] ASoC: imx-audmix: Split capture device to be a new device
Date: Wed, 12 Jun 2024 14:40:49 +0800
Message-Id: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: ZSEZCLB7WTI3QRKYRT2CM5FKSRX73VA2
X-Message-ID-Hash: ZSEZCLB7WTI3QRKYRT2CM5FKSRX73VA2
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSEZCLB7WTI3QRKYRT2CM5FKSRX73VA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The transmitter and receiver part of the SAI interface need to be
configured with different master/slave mode, especially to work
with the audiomix module.

The SAI1 TX is in master mode, but SAI1 RX is in slave mode.
So add another two DAIs for TX and RX separately in fsl_sai driver.

There will be three devices for audiomix sound card, hw:x,0 is
the playback device for one SAI, hw:x,1 is the playback device
for another SAI, hw:x,2 is the capture device for audmix
output.

Shengjiu Wang (3):
  ASoC: fsl_sai: Add separate DAI for transmitter and receiver
  ASoC: fsl_audmix: Split playback and capture stream to different DAI
  ASoC: imx-audmix: Split capture device for audmix

 sound/soc/fsl/fsl_audmix.c |  16 ++---
 sound/soc/fsl/fsl_sai.c    | 141 +++++++++++++++++++++++++++----------
 sound/soc/fsl/fsl_sai.h    |   4 +-
 sound/soc/fsl/imx-audmix.c |  79 ++++++++++++---------
 4 files changed, 155 insertions(+), 85 deletions(-)

-- 
2.34.1

