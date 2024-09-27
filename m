Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8798803C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 10:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C75BB71;
	Fri, 27 Sep 2024 10:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C75BB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727425435;
	bh=E9/0H/vSBWXLEeUtFMFK08Pxw6HXo9GeLL06pi1jcEc=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fj2S479NSC+kvZunLbxF+bCk9WjZyMyRWnYRy8ZVnzJoCVf7bZT5wEUIDuDNHQPOn
	 yf3E8iWYl3e9I1BC13BjdvxHY6rUfmsy7P3/Z+4EV1TNjzJB6xOB6I6M6ScvJ7GATu
	 TORxVDNq5d8zJlvhbQ9uixW4KokEX2athGAOJT1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72BF3F805AC; Fri, 27 Sep 2024 10:23:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97ADBF8059F;
	Fri, 27 Sep 2024 10:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55DCAF802DB; Fri, 27 Sep 2024 10:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88772F80107
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 10:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88772F80107
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 82269201A43;
	Fri, 27 Sep 2024 10:23:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4764F201A16;
	Fri, 27 Sep 2024 10:23:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 92B6E183DC02;
	Fri, 27 Sep 2024 16:23:10 +0800 (+08)
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
Subject: [PATCH 0/3] ASoC: fsl_micfil: fix and improvement
Date: Fri, 27 Sep 2024 16:00:28 +0800
Message-Id: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: FRJYWNI37QZR4TUTE27WICN5MQ4MFJZV
X-Message-ID-Hash: FRJYWNI37QZR4TUTE27WICN5MQ4MFJZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRJYWNI37QZR4TUTE27WICN5MQ4MFJZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the usage of regmap_write_bits().
Move mclk clock enablement to late stage.
Enable the micfil error interrupt.

Shengjiu Wang (3):
  ASoC: fsl_micfil: fix regmap_write_bits usage
  ASoC: fsl_micfil: Add mclk enable flag
  ASoC: fsl_micfil: Enable micfil error interrupt

 sound/soc/fsl/fsl_micfil.c | 49 ++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

-- 
2.34.1

