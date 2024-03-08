Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D61876A3C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913F4B71;
	Fri,  8 Mar 2024 18:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913F4B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920374;
	bh=J64dE3WP+PZYmP2KxggN7FPTEDJqMClbq9ewdZ6bQpc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k8PvxEJegrAGopY33vonvtbu5tkLChGGHKkhU7pFKK7DoH6QcJJ6il0LROI5KCHtw
	 i0NX46yR9IaYh/c6r+m6SWT7xicK9Yhgq+/7cxfSi/v30jZaqoAgk6cHO41IDXvgvX
	 5dMs1InuJSh1MDVeD5XQ+uvSIsuaY5MvT4eAJV68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 890DDF805C5; Fri,  8 Mar 2024 18:51:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3AAF805C5;
	Fri,  8 Mar 2024 18:51:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80924F804B0; Fri,  8 Mar 2024 18:46:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id EB9DBF80087
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9DBF80087
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000767FD.0000000065EB4DED.0020A5AB;
 Fri, 08 Mar 2024 18:42:05 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 0/5] ALSA: hda/tas2781: restore power state after
 system_resume
Date: Fri,  8 Mar 2024 18:41:39 +0100
Message-ID: <cover.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: FN5QKQZBRCW6FSM2UACNAOOCE4J6HGIQ
X-Message-ID-Hash: FN5QKQZBRCW6FSM2UACNAOOCE4J6HGIQ
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FN5QKQZBRCW6FSM2UACNAOOCE4J6HGIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series makes some simplifications, speeding up the start of the 
playback and restoring the power state of the amplifiers after 
system_resume.

Gergo Koteles (5):
  ALSA: hda/tas2781: use dev_dbg in system_resume
  ALSA: hda/tas2781: add lock to system_suspend
  ALSA: hda/tas2781: do not reset cur_* values in runtime_suspend
  ALSA: hda/tas2781: do not call pm_runtime_force_* in
    system_resume/suspend
  ALSA: hda/tas2781: restore power state after system_resume

 sound/pci/hda/tas2781_hda_i2c.c | 35 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 18 deletions(-)


base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
-- 
2.44.0

