Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A0708172
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 14:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B871F7;
	Thu, 18 May 2023 14:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B871F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684413576;
	bh=QXdT4jcTb8TT2qW3uu7V4FbYXbbRaUiI4+Krn5nKndI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mgA0O+vGazvrK82M/YwHa5QbMLMilBZTzDkgxOZqzNM2HuWBnQ4Dc+6q1OxSJZIia
	 VVi1Co/XFucSGK9Pm1LQXZtWHTAOBF/ACrjaRWs9wD1Hb4vr/tG4v+ddwvN8i2MjHy
	 cOPGaqx7V0rmCnvMiZFQi2z5fb9Abh2IQART4ISw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F66FF80549; Thu, 18 May 2023 14:38:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A011CF8025A;
	Thu, 18 May 2023 14:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E26AF80272; Thu, 18 May 2023 14:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6704F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 14:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6704F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hKsF2SKY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684413512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iXttdsHRrBGhxoXcQIavREPe5niy9TzGkhXZVV3/EiI=;
	b=hKsF2SKY23p+3cHgRFgBOaMp62PzTCNG7gO3EGGXZie9xJ4LwYOS7ot3zOYx5zEQsleE9F
	Yqb6ZKELRKHl99ndyuQA38TtOysOvshau2xYNkp89L3VQF28yvP844obMjPNhlomHz8rSX
	8lGrTatvTW2eCYFt6uExcu6SpvjGABY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-9gEpEO3_P8avTQ0zGeWO5w-1; Thu, 18 May 2023 08:38:30 -0400
X-MC-Unique: 9gEpEO3_P8avTQ0zGeWO5w-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6238c3bf768so15463826d6.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 05:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684413510; x=1687005510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXttdsHRrBGhxoXcQIavREPe5niy9TzGkhXZVV3/EiI=;
        b=CkFMWZHHzn8tGvKMQ51gEkIM6knZAj/Z4ro6ul6TB0QjxBM3Igw9GXH6qTJCBJdGS0
         cIRXWE1219zPqmMFLTD5fDqAKsKXKiU1kq02V6Y8FuhvppKauEXA2qmDt7YA8u7BmrPp
         V7AA+XVWwdXAQ0+8Ghb4JEXTjCMVAB+jW2yFoaWqcuNLCI10a2e6TQ078qcafYopalo8
         +8lN0cKOxv9i7ss9TDDS0u+vmAzp/kMSpRN8B9lhBDhEwKSVzjLnJIqziAka1efastjZ
         y67lnDYLa78I+yp9nuCTySzSricFWFgVENx3lvSeaZPAo6z8UWMEW0RhO9ou706BfIHI
         KqdQ==
X-Gm-Message-State: AC+VfDy/8qwLGS8xGnB7IfwLlQdRe3bS0eB7tIBf8nUrN5L9gN3rRkO9
	wWJqrOWSdNfK+B984BHTD6D/lQfhSwNnXzXIuvc3VET/QB5Rn5f9Vv0UxtCbKvDOffQvSEjiBOT
	1r4rIL5s4+uMdvamqN+CdNHg=
X-Received: by 2002:a05:6214:202b:b0:61b:6e43:b20 with SMTP id
 11-20020a056214202b00b0061b6e430b20mr5362286qvf.42.1684413510100;
        Thu, 18 May 2023 05:38:30 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ5yU7z5+Y8txA5JcquWFfOHmX3HJcabkENvEp12Ss0OfnIsUQ1AwMea69zuwfEISdq/mtjwyw==
X-Received: by 2002:a05:6214:202b:b0:61b:6e43:b20 with SMTP id
 11-20020a056214202b00b0061b6e430b20mr5362245qvf.42.1684413509712;
        Thu, 18 May 2023 05:38:29 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 m10-20020ae9e00a000000b0074e21136a77sm358162qkk.127.2023.05.18.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:38:29 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	oswald.buddenhagen@gmx.de
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: emu10k1: set variables emu1010_routing_info and
 emu1010_pads_info storage-class-specifier to static
Date: Thu, 18 May 2023 08:38:26 -0400
Message-Id: <20230518123826.925752-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: VNDTQUZPNX7W3D6XPBL7II6A5YMC4NQQ
X-Message-ID-Hash: VNDTQUZPNX7W3D6XPBL7II6A5YMC4NQQ
X-MailFrom: trix@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNDTQUZPNX7W3D6XPBL7II6A5YMC4NQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

smatch reports
sound/pci/emu10k1/emumixer.c:519:39: warning: symbol
  'emu1010_routing_info' was not declared. Should it be static?
sound/pci/emu10k1/emumixer.c:859:36: warning: symbol
  'emu1010_pads_info' was not declared. Should it be static?

These variables are only used in their defining file, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/emu10k1/emumixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 3a7f25f81504..26ed7e2fe053 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -516,7 +516,7 @@ struct snd_emu1010_routing_info {
 	unsigned n_ins;
 };
 
-const struct snd_emu1010_routing_info emu1010_routing_info[] = {
+static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 	{
 		/* rev1 1010 */
 		.src_regs = emu1010_src_regs,
@@ -856,7 +856,7 @@ struct snd_emu1010_pads_info {
 	unsigned n_adc_ctls, n_dac_ctls;
 };
 
-const struct snd_emu1010_pads_info emu1010_pads_info[] = {
+static const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 	{
 		/* rev1 1010 */
 		.adc_ctls = snd_emu1010_adc_pads,
-- 
2.27.0

