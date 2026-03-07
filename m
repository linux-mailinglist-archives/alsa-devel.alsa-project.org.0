Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHadDASUrmmmGQIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:56 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE813236361
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7170760297;
	Mon,  9 Mar 2026 10:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7170760297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773048835;
	bh=joziPWiE3PN09cE7Z7ea6ybTiB8yhHZT7NiXD9Z05q8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b34S3edYq4SzLdQpHdyPz1v2qV+7DFHLi6fWb9o7hmpT3ZFWtEm69SAWurbUYchjO
	 dKWpdl0K6DGOklzQQd1kBcXYuyDmLKM0FkVVrV5cOgL/gEogRX15PANVX+WlCfqjzl
	 rzIiOltlPLbycUnA/Kv2Rs6b3iupJeoBKY5OlYGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E71A8F80697; Mon,  9 Mar 2026 10:32:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99393F80693;
	Mon,  9 Mar 2026 10:32:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87994F804F3; Sat,  7 Mar 2026 02:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22329F8001F
	for <alsa-devel@alsa-project.org>; Sat,  7 Mar 2026 02:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22329F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=uzair.is-a.dev header.i=contact@uzair.is-a.dev
 header.a=rsa-sha256 header.s=zmail header.b=AyYiO84s
ARC-Seal: i=1; a=rsa-sha256; t=1772846883; cv=none;
	d=zohomail.com; s=zohoarc;
	b=daKyuPZHuDehoM5yZsp8c64YTkrfHlTFIWIgFe70wBI/re/YjUVx3Nca3245uTjAC2rA9HrhoNK9IBoJMSZn3AZBj5QcTQT2PhXytQZGd0bXrRt/b7wcwSNe8YUAUkccMTRPUAUOeo5S7WyKiA5fyVzeeNDEHxRrY68G9cz7RnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1772846883;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=2nMpKzN0PvbS5x1/emJdoYxSvhyxtrsfhSj4Ds2COjs=;
	b=lRlHdDL9JS7cqmaDZ2oo0Rez7PVuUxozYzLBPkUUXJFFj2aGANPf0gzk4WYUYK5u6IbNcGDNKHP2qntImp9Bi3x/Aw5V3iLsLvuzH+IYBmuh7jyOaMGbj4Uc6uFXh5ZuPCdb8iyayhem2/iBEbUmzleBlfpkA+P3m6lDPweK6fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=uzair.is-a.dev;
	spf=pass  smtp.mailfrom=contact@uzair.is-a.dev;
	dmarc=pass header.from=<contact@uzair.is-a.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772846883;
	s=zmail; d=uzair.is-a.dev; i=contact@uzair.is-a.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2nMpKzN0PvbS5x1/emJdoYxSvhyxtrsfhSj4Ds2COjs=;
	b=AyYiO84sQbk0lt91Tagj1OHhpQQ5R3ut3t2Ti7KRCGhhfy4P2BLjnZ4GV+jz2f1l
	S5dtXQY4C2alGlc3tfTwc2P9VILLW8IbLpwpVBIoAmmXEcL7GJc+69J6ynLOep+Rime
	BNGQZXaGoIXtjxtQtzrdtU2ul1I4YTvvSmFWHxlM=
Received: by mx.zohomail.com with SMTPS id 1772846881830608.3768348870922;
	Fri, 6 Mar 2026 17:28:01 -0800 (PST)
From: Uzair Mughal <contact@uzair.is-a.dev>
To: tiwai@suse.de
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uzair Mughal <contact@uzair.is-a.dev>
Subject: [PATCH] ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
Date: Sat,  7 Mar 2026 06:29:06 +0500
Message-ID: <20260307012906.20093-1-contact@uzair.is-a.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-MailFrom: contact@uzair.is-a.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation
Message-ID-Hash: E753PAINUGB7BTY5CXJTRQNR6O2DDAII
X-Message-ID-Hash: E753PAINUGB7BTY5CXJTRQNR6O2DDAII
X-Mailman-Approved-At: Mon, 09 Mar 2026 09:32:32 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E753PAINUGB7BTY5CXJTRQNR6O2DDAII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: CE813236361
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	DATE_IN_PAST(1.00)[56];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,uzair.is-a.dev:s=zmail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:perex@perex.cz,m:alsa-devel@alsa-project.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:contact@uzair.is-a.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[uzair.is-a.dev];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER(0.00)[contact@uzair.is-a.dev,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[contact@uzair.is-a.dev,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,uzair.is-a.dev:+];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,uzair.is-a.dev:dkim,uzair.is-a.dev:email,uzair.is-a.dev:mid]
X-Rspamd-Action: no action

The Lenovo ThinkPad X390 (ALC257 codec, subsystem ID 0x17aa2288)
does not report headset button press events. Headphone insertion is
detected (SW_HEADPHONE_INSERT), but pressing the inline microphone
button on a headset produces no input events.

Add a SND_PCI_QUIRK entry that maps this subsystem ID to
ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK, which enables
headset jack button detection through alc_fixup_headset_jack()
and ThinkPad ACPI integration. This is the same fixup used by
similar ThinkPad models (P1 Gen 3, X1 Extreme Gen 3).

Signed-off-by: Uzair Mughal <contact@uzair.is-a.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6998,6 +6998,7 @@
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x17aa, 0x2288, "Thinkpad X390", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-- 
2.43.0
