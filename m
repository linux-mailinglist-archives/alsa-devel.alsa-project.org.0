Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20DEC4755B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:49:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37ECB60329;
	Mon, 10 Nov 2025 15:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37ECB60329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786180;
	bh=tOMroa1xSvKfWn7TAO2OTvWdTUvzXj9eyPyMmDlgprE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dz51RKCTXiqJ6uVXP3WkrbEg3ETb2zdo+XNALeSjdjBIovifwwji6OqbNGtPwL4bd
	 bxHKYMPjuavSOCXalp4ZGBcVgpQb4jX7DltmhFuF5H1b/TclYUqm+h0DFjR+3pmS/P
	 gxnyjX7RsAgTSfYka/4uLA42UG528LGa9Rp02yc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D3EF805C4; Mon, 10 Nov 2025 15:42:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D608F897E3;
	Mon, 10 Nov 2025 15:42:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74881F8026A; Tue,  4 Nov 2025 08:26:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPOOFED_FREEMAIL,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,UNPARSEABLE_RELAY shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C928F800E5
	for <alsa-devel@alsa-project.org>; Tue,  4 Nov 2025 08:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C928F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Dfb2nEYL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=1QSw+y5HT3TcUyd3F/MxUjly0CwHD5TKPc20p//UxFU=;
	b=Dfb2nEYLHz9ugFUai5yaYyh41iCkUtEucW/HteS14/qsk5VLqFehetkHer7Ff+
	nUoMz3NzdnuIIVSRaQ4mMT6oal7cqK5mjaqqcuNzwdV3W8vY/pQ+gXISzoOjmGv1
	eTk0u6SNsBz9aC0dRPDcaRVlZrEDeFmNkRRZQ2BsDE10k=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDn74SuqglpdwI+Bg--.673S2;
	Tue, 04 Nov 2025 15:26:40 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: au88x0: Fix array bounds warning in EQ drivers
Date: Tue,  4 Nov 2025 15:26:36 +0800
Message-Id: <20251104072636.93214-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn74SuqglpdwI+Bg--.673S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF47JryDCrW7Cry8tr1kKrg_yoW8XFWfpr
	Z3C3s7ArWUJrsrCwnYva1UZ34UJFs8XayxAa12kws7Cws8JFWUGr90k3yDJw4IvrZxCF1F
	9FW7Xw13J3Z8JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEGYLsUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibhH7T2kJpNSSNwAAs+
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CWIL2YXSH2V4QAESPL25UGTVNPDNL7Y5
X-Message-ID-Hash: CWIL2YXSH2V4QAESPL25UGTVNPDNL7Y5
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:40:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWIL2YXSH2V4QAESPL25UGTVNPDNL7Y5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdich9700@163.com>

In file included from ../sound/pci/au88x0/au8830.c:15:
In function ‘vortex_Eqlzr_SetAllBandsFromActiveCoeffSet’,
../sound/pci/au88x0/au88x0_eq.c:571:9: error: ‘vortex_EqHw_SetRightGainsTarget’ reading 2 bytes from a region of size 0 [-Werror=stringop-overread]
	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));

Modified the array access in vortex_Eqlzr_SetAllBandsFromActiveCoeffSet() to use pointer arithmetic instead of array indexing.
This resolves a compiler warning that incorrectly flagged a buffer overread when accessing the EQ gain array.
The this130 array has fixed size 20 and the index is safely within bounds, making the original code correct but confusing to static analysis.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/au88x0/au88x0_eq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/au88x0/au88x0_eq.c b/sound/pci/au88x0/au88x0_eq.c
index 71c13100d7ef..81a63b5bb31c 100644
--- a/sound/pci/au88x0/au88x0_eq.c
+++ b/sound/pci/au88x0/au88x0_eq.c
@@ -568,7 +568,7 @@ static int vortex_Eqlzr_SetAllBandsFromActiveCoeffSet(vortex_t * vortex)
 	eqlzr_t *eq = &(vortex->eq);
 
 	vortex_EqHw_SetLeftGainsTarget(vortex, eq->this130);
-	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));
+	vortex_EqHw_SetRightGainsTarget(vortex, eq->this130 + eq->this10);
 
 	return 0;
 }
-- 
2.25.1

