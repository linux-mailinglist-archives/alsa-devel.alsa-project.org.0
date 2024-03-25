Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F288B2B4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 22:26:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD491914;
	Mon, 25 Mar 2024 22:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD491914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711401994;
	bh=k9v5Ltm9l7F5/wZwQ/APUya5hmjRVWK8DhyYFYiswFc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RHRc5QchKWV3YE6EDcad/nfXalWgZJrV6PlAE45sINpkvob+p4coNhSLQbGnixSIZ
	 p2B16wSAMqCZx2tW61G00bXV8S7VrGQefd0IE/iHrorcpFh0Ut43hojp/Gab61mWdK
	 PQWCW2+mJS4WHvcc6tSZ/6f+EjuyCFagy5lXYE/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 387DEF80563; Mon, 25 Mar 2024 22:26:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BABAF805A8;
	Mon, 25 Mar 2024 22:26:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39436F8025F; Mon, 25 Mar 2024 22:25:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 76D13F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 22:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D13F80074
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000770A7.000000006601EBDC.0023A883;
 Mon, 25 Mar 2024 22:25:48 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 0/3] ALSA: hda/tas2781: fixes for 6.9-rc1
Date: Mon, 25 Mar 2024 22:25:32 +0100
Message-ID: <cover.1711401621.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: OEYYX7XAU6VCY5SDGSSQC5A4725R6Z7I
X-Message-ID-Hash: OEYYX7XAU6VCY5SDGSSQC5A4725R6Z7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEYYX7XAU6VCY5SDGSSQC5A4725R6Z7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series removes the no longer needed digital gain kcontrol, which 
caused problems in tas2563, because the register does not exists there.

This series also adds locking and debug statements to the other 
kcontrols. They sometimes ran in parallel with tasdev_fw_ready, and 
caused weird sound problems.
https://github.com/tomsom/yoga-linux/issues/58

Regards,
Gergo

Gergo Koteles (3):
  ALSA: hda/tas2781: remove digital gain kcontrol
  ALSA: hda/tas2781: add locks to kcontrols
  ALSA: hda/tas2781: add debug statements to kcontrols

 include/sound/tas2781-tlv.h     |   1 -
 sound/pci/hda/tas2781_hda_i2c.c | 103 +++++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 36 deletions(-)


base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.44.0

