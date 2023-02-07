Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397268E4A9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:54:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F701EB;
	Wed,  8 Feb 2023 00:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F701EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675814061;
	bh=fiHwx1QeMPt+DsYxhkk7Rh8I9hMhkeRIK9B2EQA/e1o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PYJNeD0XdqAVA8KnDtjpUNPGfIY11uDO+XcmSnZL/mibpa0+f7hezeZJV0pE3cH6Y
	 lxvlVEPbNP+kYrkSC+Fz9zoKgV0GnANrva8wPCK7fk/MimujrpoOTxCimI4a5JLMwj
	 dI5IYx8zfvM9guOZw8JuhOOeWvvhDhsYpfyHO0MU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C10B5F80529;
	Wed,  8 Feb 2023 00:52:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E708EF8012B; Wed,  8 Feb 2023 00:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AA5DF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA5DF80095
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTVE-0008RO-Dk; Tue, 07 Feb 2023 20:19:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV7-003Lv6-9E; Tue, 07 Feb 2023 20:19:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV7-001ew5-M9; Tue, 07 Feb 2023 20:19:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] ALSA: core: Make some functions return void
Date: Tue,  7 Feb 2023 20:19:04 +0100
Message-Id: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fiHwx1QeMPt+DsYxhkk7Rh8I9hMhkeRIK9B2EQA/e1o=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4qQba27+3E/GrUTCtoY8yibTKJga/4v6pQi9yw9y
 8kw05T+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KkGwAKCRDB/BR4rcrsCSE8B/
 kB3nfLGneK7JgKBpkJOKm715kZQQMwmDYOvxE2w1QqfLmP6AizVyYscXzABq7ILR8Xvn+9/h9qV+T3
 ijinLE8JYkwqFju+23tc63hZO/R2W2qsf+ktqWxUKhM7dtuCeN4k/rLBlxQosqp3Y2p15xbyVF8C7B
 o+n6nRReddxVoFQY8y39Ur2YlPP9tVYke+5oTGtDBp2+ZqCWQKShnKAB28Qlz4skEmLHud/nMyZ64n
 iZU//pEqdZ+gEUZ8QWhYb53qfmyx2vNA0epaqPcjdEx8byNHVz6xvRMNUt/kcj7NIOjfMqAZupVZAY
 mf7oYTZ0vibp7ftk9H6/st8cosaCe7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: HSTLJ2NCPFPA6PO4BY2DD4GHNH5CGU6X
X-Message-ID-Hash: HSTLJ2NCPFPA6PO4BY2DD4GHNH5CGU6X
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSTLJ2NCPFPA6PO4BY2DD4GHNH5CGU6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

while checking in which cases hda_tegra_remove() can return a non-zero value, I
found that actually cannot happen. This series makes the involved functions
return void to make this obvious.

This is a preparation for making platform_driver::remove return void, too.

Best regards
Uwe

Uwe Kleine-König (3):
  ALSA: core: Make snd_card_disconnect() return void
  ALSA: core: Make snd_card_free_when_closed() return void
  ALSA: core: Make snd_card_free() return void

 include/sound/core.h      |  6 +++---
 sound/core/init.c         | 40 ++++++++++++++-------------------------
 sound/pci/hda/hda_tegra.c |  6 ++----
 sound/ppc/snd_ps3.c       |  4 +---
 4 files changed, 20 insertions(+), 36 deletions(-)


base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
-- 
2.39.0

