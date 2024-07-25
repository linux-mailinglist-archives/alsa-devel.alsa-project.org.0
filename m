Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC093BED7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 11:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0490F52;
	Thu, 25 Jul 2024 11:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0490F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721898951;
	bh=VYIdlkHXfvupXOxZkxAbDIIUevfv/4AwQx6d27AQhCQ=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=izMI4XFcqfZfoPxzrqel5z0SthVecz1C/hEpofg1O6xm0w3AFWbpTbNRlhp7pGK4w
	 BaeIoEv4SKbVW/TqJxWquWiiIgUvQ5mqllsvZSGfsRvzk57IUQ52DL3laEXSjeytIQ
	 94qLP+NoelDKnRuKN6jADnPZU4rIG7F5MTVQCxD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69F54F805B2; Thu, 25 Jul 2024 11:15:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09AFEF805AF;
	Thu, 25 Jul 2024 11:15:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 669C5F80579; Thu, 25 Jul 2024 11:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9939F800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 11:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9939F800C9
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C5C0B1A0507;
	Thu, 25 Jul 2024 11:13:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8DEAC1A04DF;
	Thu, 25 Jul 2024 11:13:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E6A20181D0FA;
	Thu, 25 Jul 2024 17:13:57 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_micfil: Check the difference for i.MX8 and
 i.MX9 
Date: Thu, 25 Jul 2024 16:54:52 +0800
Message-Id: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 527YX3ZBJHVZ23DDBQHDRFSY3SGRA47Z
X-Message-ID-Hash: 527YX3ZBJHVZ23DDBQHDRFSY3SGRA47Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/527YX3ZBJHVZ23DDBQHDRFSY3SGRA47Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are some register difference for i.MX8 and i.MX9
REG_MICFIL_FIFO_CTRL definition is updated.
REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID, REG_MICFIL_PARAM are added from
i.MX9

Shengjiu Wang (2):
  ASoC: fsl_micfil: Expand the range of FIFO watermark mask
  ASoC: fsl_micfil: Differentiate register access permission for
    platforms

 sound/soc/fsl/fsl_micfil.c | 20 +++++++++++++++-----
 sound/soc/fsl/fsl_micfil.h |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

