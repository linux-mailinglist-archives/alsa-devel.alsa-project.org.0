Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9D877033
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B2A846;
	Sat,  9 Mar 2024 11:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B2A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709978820;
	bh=0Qce3EgeLPkKjkHYKQFnccarXSgWI3VcDD+V67lSULE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kt1SjscdyRI2C6S79/A9eV6na2DY7BqaERtph3lXBMJ5DjuIh/gLyi647SP5xyyGL
	 D2GbXHF+j5DcOTi8GwXO7UKgGCBYEOFevK1raPA15TQteEk0Z0Pg2g3sjqtF1s59LE
	 xCWnv2dZ5RUg9ZbD6AnOO5d4hmmlUvu4yrXdr1aM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BF81F8058C; Sat,  9 Mar 2024 11:06:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F385F805A0;
	Sat,  9 Mar 2024 11:06:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF48CF801C0; Fri,  1 Mar 2024 02:19:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by alsa1.perex.cz (Postfix) with ESMTP id 67586F800F0
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 02:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67586F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=RYoHruyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8eX63
	ggw/SlvICRxbqzBzag4pSVNVLQSaMXoM3yRais=; b=RYoHruypxU2y8XMLNwpfe
	x82VogKFQ52DfiQ8DY2anUkdfP78KsUwqx73O6sGczzQ/Fv6zuv7XIb/I7zRBMWr
	3RuR6RY72Rui/vcvrkeVGlzukpUiym0GYEK3F/12VWsbUbMelVwosdMOT+mSrhx+
	p/I57hKRFvYLYNlvy88co0=
Received: from localhost.localdomain (unknown [111.48.58.12])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id
 _____wCHb57yLOFlXN+REw--.49146S2;
	Fri, 01 Mar 2024 09:18:43 +0800 (CST)
From: songxiebing <soxiebing@163.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	soxiebing@163.com,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: hda: optimize the probe codec process
Date: Fri,  1 Mar 2024 09:18:41 +0800
Message-Id: <20240301011841.7247-1-soxiebing@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <878r35huf0.wl-tiwai@suse.de>
References: <878r35huf0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHb57yLOFlXN+REw--.49146S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wry7tFW5Kw43KFW5Cr1DGFg_yoW8KF18p3
	W7Cr1fGayxtF4akFs7Gw43Ka4xWa4vqan8Jw1Yyw13Zwn7Kr1fXr9YyrW8AFW8ur4I9r1Y
	vw4UK3WkX3s8CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piwIDrUUUUU=
X-Originating-IP: [111.48.58.12]
X-CM-SenderInfo: 5vr0xvpelqwqqrwthudrp/1tbiJxaUw2XAkqqxxgAAsM
X-MailFrom: soxiebing@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MJLROUQJ6DO3RVYS23VJPNSAD4WXSVEK
X-Message-ID-Hash: MJLROUQJ6DO3RVYS23VJPNSAD4WXSVEK
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:06:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJLROUQJ6DO3RVYS23VJPNSAD4WXSVEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: songxiebing <songxiebing@kylinos.cn>

In azx_probe_codecs function, when bus->codec_mask is becomes to 0(no codecs),
execute azx_init_chip, bus->codec_mask will be initialized to a value again,
this causes snd_hda_codec_new function to run, the process is as follows:
-->snd_hda_codec_new
-->snd_hda_codec_device_init
-->snd_hdac_device_init---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_SUBSYSTEM_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_REV_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_NODE_COUNT) 2s
when no codecs, read communication is error, each command will be polled for
2 second, a total of 10s, it is easy to some problem.
like this:
  2 [   14.833404][ 6] [  T164] hda 0006:00: Codec #0 probe error; disabling it...
  3 [   14.844178][ 6] [  T164] hda 0006:00: codec_mask = 0x1
  4 [   14.880532][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0000
  5 [   15.891988][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0000
  6 [   16.978090][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0001
  7 [   18.140895][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0002
  8 [   19.135516][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0004
 10 [   19.900086][ 6] [  T164] hda 0006:00: no codecs initialized
 11 [   45.573398][ 2] [    C2] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [kworker/2:0:25]

Here, when bus->codec_mask is 0, use a direct break to avoid execute snd_hda_codec_new function.

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
Changes in v2: fix some non-ASCII comma letters.
---
 sound/pci/hda/hda_controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index e5c53ad..e1ece0a 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1474,6 +1474,9 @@ int azx_probe_codecs(struct azx *chip, unsigned int max_slots)
 				dev_warn(chip->card->dev,
 					 "Codec #%d probe error; disabling it...\n", c);
 				bus->codec_mask &= ~(1 << c);
+				/* no codecs */
+				if (bus->codec_mask == 0)
+					break;
 				/* More badly, accessing to a non-existing
 				 * codec often screws up the controller chip,
 				 * and disturbs the further communications.
-- 
2.7.4

