Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 550407A18E7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB48E73;
	Fri, 15 Sep 2023 10:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB48E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766784;
	bh=74gKOM0V0y5u596d0Ym8zR6EbA2xua4lcyhFXs9xeeo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HV/8SiOEPkreb6jZw/krzycWLSJjxX5s2uwnPaMB7hJiJI158NcSL4xoI3Oitio/u
	 Ctbpy6+G02IWg/wGTEUt/1pB4A8qGbIW934u8R66gVnl8v9sgl0piUuZ817Erxq4+r
	 EzqDMdNRUNXn3hmhMALSjaVQCh7J//hmbDvGXNo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F08F80607; Fri, 15 Sep 2023 10:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A45F80600;
	Fri, 15 Sep 2023 10:28:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0A9EF805C2; Fri, 15 Sep 2023 10:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88BF8F8055A
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88BF8F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1CXyouo7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jp+bojQh
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C0B01F8AB;
	Fri, 15 Sep 2023 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWfAWtIwS+XBYDB/cr3DPp7t1T1jDMwuqzSJKm3yX2A=;
	b=1CXyouo7KNRn3TBQkHtIpqVYh9aTVphB51VDKFzxJ3BJN3exm3g0iz5MPgAXxpYK+be5ts
	DZtZ0R8erYTvFrNk6B178QnE5XT4dvjVYBbtZDPWlCkjnfRfWKeSnAQRDPgq6t38U/9XFq
	yyXR661i6UKhKN3iURLmD5KmTuP1h3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWfAWtIwS+XBYDB/cr3DPp7t1T1jDMwuqzSJKm3yX2A=;
	b=jp+bojQhkIL/lj375n5OD3eQXABG6s1NQ9GzTQnqJz2oAVNUCb1mgjIyOklk1Jp7bH0ziS
	WUwkRKBtYGhDOkAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FB0A1358A;
	Fri, 15 Sep 2023 08:28:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eDlhBpgVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/13] ALSA: hda: generic: Check potential mixer name string
 truncation
Date: Fri, 15 Sep 2023 10:28:02 +0200
Message-Id: <20230915082802.28684-14-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IRCIWY5YQHPWSLM63PVPWDPLIAUKTGSI
X-Message-ID-Hash: IRCIWY5YQHPWSLM63PVPWDPLIAUKTGSI
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRCIWY5YQHPWSLM63PVPWDPLIAUKTGSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

add_control_with_pfx() constructs a mixer name element with the fixed
size, and it got compile warnings with -Wformat-truncation.

Although the size overflow is very unlikely, let's have a sanity check
of the string size and returns the error if it really doesn't fit
instead of silent truncation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index dbf7aa88e0e3..bf685d01259d 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -998,7 +998,11 @@ static int add_control_with_pfx(struct hda_gen_spec *spec, int type,
 				const char *sfx, int cidx, unsigned long val)
 {
 	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	snprintf(name, sizeof(name), "%s %s %s", pfx, dir, sfx);
+	int len;
+
+	len = snprintf(name, sizeof(name), "%s %s %s", pfx, dir, sfx);
+	if (snd_BUG_ON(len >= sizeof(name)))
+		return -EINVAL;
 	if (!add_control(spec, type, name, cidx, val))
 		return -ENOMEM;
 	return 0;
-- 
2.35.3

