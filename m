Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F16977E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF74F51;
	Fri, 13 Sep 2024 13:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF74F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226089;
	bh=LhFedJCR94M2rhZThQJpmVrhF9jDCYHsq2BK8/AdHs4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hnJzWwT6rTT7RFK0ey8q9qsZrenYcHyETY7xV7sIiOVbgX2rI+kN2P0CKnNIW0tYX
	 INKfOHolT8ffwqDNlDcbThnndfnz3wARMVwyuTDDpkREunTTtJoyrBVPaIeFnYU+LD
	 3i4TvikR9SK/FIn33EbTrhKuSD97T1Y/hlj/3NuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7060BF8071C; Fri, 13 Sep 2024 13:12:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47501F80707;
	Fri, 13 Sep 2024 13:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1767FF801F5; Wed, 11 Sep 2024 13:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RDNS_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by alsa1.perex.cz (Postfix) with SMTP id 3DD10F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 13:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD10F80027
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 7A6326096305A;
	Wed, 11 Sep 2024 19:54:58 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: herve.codina@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: avoid possible garbage value in
 peb2466_reg_read()
Date: Wed, 11 Sep 2024 19:54:50 +0800
Message-Id: <20240911115448.277828-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: suhui@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VXZRBDQ7V233BFM2RYTDXIXEVLBSKR2P
X-Message-ID-Hash: VXZRBDQ7V233BFM2RYTDXIXEVLBSKR2P
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXZRBDQ7V233BFM2RYTDXIXEVLBSKR2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang static checker (scan-build) warning:
sound/soc/codecs/peb2466.c:232:8:
Assigned value is garbage or undefined [core.uninitialized.Assign]
  232 |                 *val = tmp;
      |                      ^ ~~~

When peb2466_read_byte() fails, 'tmp' will have a garbage value.
Add a judgemnet to avoid this problem.

Fixes: 227f609c7c0e ("ASoC: codecs: Add support for the Infineon PEB2466 codec")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 sound/soc/codecs/peb2466.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 76ee7e3f4d9b..67ea70cef0c7 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -229,7 +229,8 @@ static int peb2466_reg_read(void *context, unsigned int reg, unsigned int *val)
 	case PEB2466_CMD_XOP:
 	case PEB2466_CMD_SOP:
 		ret = peb2466_read_byte(peb2466, reg, &tmp);
-		*val = tmp;
+		if (!ret)
+			*val = tmp;
 		break;
 	default:
 		dev_err(&peb2466->spi->dev, "Not a XOP or SOP command\n");
-- 
2.30.2

