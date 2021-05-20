Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67045389FEE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 10:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B944B1679;
	Thu, 20 May 2021 10:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B944B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621499768;
	bh=mcZxyHe9Rtk4F5k0SdyefvLAED8uANoneyfkYvoKQOk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VCEUkRtwqT3Fm5IfpN94gznK66xhSTO5OQiFT3vBzb8Mx7FnwdAtHp+G6q0UpBrZE
	 5UkwgEHxm2UUpIq2Fpu1CHICu+texLKdldwkvJWWdW2cBt07NJdY4iGrA2/2TqpKUy
	 z0ZwshLyX2R/CFKYrlcEF3s2rRSof3h48hDnFbGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B1EF800C1;
	Thu, 20 May 2021 10:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B498F80217; Thu, 20 May 2021 10:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52C0BF800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 10:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52C0BF800C1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lje8P-00027g-0B; Thu, 20 May 2021 08:34:25 +0000
From: Colin King <colin.king@canonical.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: firewire-lib: Fix uninitialized variable err issue
Date: Thu, 20 May 2021 09:34:24 +0100
Message-Id: <20210520083424.6685-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

Currently in the case where the payload_length is less than the
cip_header_size the error return variable err is not being set
and function parse_ir_ctx_header can return an uninitialized
error return value. Fix this by setting err to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/firewire/amdtp-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index af5c3629f1ac..242b1147d768 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -663,6 +663,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		} else {
 			// Handle the cycle so that empty packet arrives.
 			cip_header = NULL;
+			err = 0;
 			*data_blocks = 0;
 			*syt = 0;
 		}
-- 
2.31.1

