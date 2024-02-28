Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AD86B16D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:14:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EEE086F;
	Wed, 28 Feb 2024 15:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EEE086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129688;
	bh=u84TQ2oYytZsBuH/zcjVZljLTWPVxv1MJltl+gVYCDc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jj/tQsjSsCYIcs8MKgPBeCDNNWIZqgPvZUi/zWUAFmbQ4My2DVuIJfNnHwGtDjQ9J
	 ETBwpr0i9j+9XfinE0/aoFbjA6YQH1m+pc2WC97nE/wz4Hc/d78lbBMEpYahZ1GIjD
	 qUf14T+0OvTztSh61PVYOylIQM8vF42vy0bHUPDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BCEAF805E6; Wed, 28 Feb 2024 15:13:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AADB8F805F7;
	Wed, 28 Feb 2024 15:13:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5D26F8024C; Wed, 28 Feb 2024 08:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by alsa1.perex.cz (Postfix) with ESMTP id 8234FF801C0
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 08:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8234FF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=PqujgYET
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=ZJ1CeXr5L+70RmndFbrJnevySNkuujkOo+h0+Lv9h0U=;
	b=PqujgYETxj5f7eV9lUrTkoUzayo9LMbSPGWyHOPRvIQDbxPQP1lCJA5gQGeIjU
	mOrersbX7qIPd8kNbxGZqZSDU/ToKHAHBMu7JpoBQxo7DOOjQjVwUS6OiOfXdzVV
	6qq1pkk5xVjb1OQgQlXgMK8qxTXJ45WlpwEL3srKXnuWs=
Received: from localhost.localdomain (unknown [111.48.58.12])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id
 _____wDH7ou1495l4CPFFQ--.17527S2;
	Wed, 28 Feb 2024 15:41:41 +0800 (CST)
From: songxiebing <soxiebing@163.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	songxiebing <songxiebing@kylinos.cn>
Subject: [PATCH v1] ALSA: hda: optimize the probe codec process
Date: Wed, 28 Feb 2024 15:41:38 +0800
Message-Id: <20240228074138.23679-1-soxiebing@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDH7ou1495l4CPFFQ--.17527S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wry3Jr4UAFW7Ar1UJrWxtFb_yoW8Kr1Up3
	W3Cr1fG3yxtF4akFs7Gw43Ka4xWa4kXan8Jw4Yyw13Xwn3Kr1fXr9YyrW8AFW8Cr429r1Y
	vw4UK3WkX3s8CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0iifUUUUU=
X-Originating-IP: [111.48.58.12]
X-CM-SenderInfo: 5vr0xvpelqwqqrwthudrp/xtbB0BqSw2WXwG99aQAAsS
X-MailFrom: soxiebing@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DZUCMXQ2J7BSRP3IORV5AHWMFOT5AZBT
X-Message-ID-Hash: DZUCMXQ2J7BSRP3IORV5AHWMFOT5AZBT
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:13:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZUCMXQ2J7BSRP3IORV5AHWMFOT5AZBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: songxiebing <songxiebing@kylinos.cn>

In azx_probe_codecs function，when bus->codec_mask is becomes to 0(no codecs),
execute azx_init_chip, bus->codec_mask will be initialized to a value again，
this causes snd_hda_codec_new function to run, the process is as follows:
-->snd_hda_codec_new
-->snd_hda_codec_device_init
-->snd_hdac_device_init---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_SUBSYSTEM_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_REV_ID) 2s
		       ---snd_hdac_read_parm(...AC_PAR_NODE_COUNT) 2s
when no codecs, read communication is error, each command will be polled for
2 second，a total of 10s, it is easy to some problem.
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

