Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41244993EED
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 08:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7622C852;
	Tue,  8 Oct 2024 08:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7622C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728370310;
	bh=c8dAsjEgz+rM/JfDG0uTZuE9KWHF+zylVqyXZSipnds=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uaKVklFPjqO1iVJawW3gx/VMgEDGUH+K4KurYXtTLbct+gFKBBK6lNOzvzmAKAtH4
	 tMdfLrGqLaVm2qRI4HcxAFrRn0CElV95tUwKparQSsVJ6yoNC8XXuAC6cqluWGJuLH
	 jB8BrCTa1oskDw2C5AOe1OMvJCVTNQpRqY9qPJjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B8B3F805AC; Tue,  8 Oct 2024 08:51:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5793F805B0;
	Tue,  8 Oct 2024 08:51:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF1ABF80568; Tue,  8 Oct 2024 08:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4341CF80104
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 08:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4341CF80104
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 122451A245B;
	Tue,  8 Oct 2024 08:51:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CD7DF1A2466;
	Tue,  8 Oct 2024 08:51:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2EF8E183B720;
	Tue,  8 Oct 2024 14:51:02 +0800 (+08)
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
Subject: [PATCH 0/2] ASoC: fsl_xcvr: enable some interrupts
Date: Tue,  8 Oct 2024 14:27:51 +0800
Message-Id: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: MONKZKWE7A2RT5VTOXLDTI5FLTXCMVIN
X-Message-ID-Hash: MONKZKWE7A2RT5VTOXLDTI5FLTXCMVIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MONKZKWE7A2RT5VTOXLDTI5FLTXCMVIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable interrupt of cmdc status update and the interrupts for
wrong preamble received.

Shengjiu Wang (2):
  ASoC: fsl_xcvr: enable interrupt of cmdc status update
  ASoC: fsl_xcvr: reset RX dpath after wrong preamble

 sound/soc/fsl/fsl_xcvr.c | 94 ++++++++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_xcvr.h |  5 +++
 2 files changed, 86 insertions(+), 13 deletions(-)

-- 
2.34.1

