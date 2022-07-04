Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360945658A4
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 16:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA85F171F;
	Mon,  4 Jul 2022 16:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA85F171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656944996;
	bh=4gOBBpMT8mnYbGaetCMvKDwBPbdf6lnnBtVmjLpmCds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EVgRwDeAhDlVJGrVmlzodeDDNzg3ias1z64/oZWInWIfpJdUVYz8KhE1gZJkp3Kfl
	 q3QyiN0sB5Js4ClHbG+ileeabwkFA4AK3olUJx925+5T0h244e/ADxlcmekHMQS04C
	 uPtzfBq6FQfMyqqs5AWQUZ1JVjUqZuWyrP4Pnju0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 134C2F80165;
	Mon,  4 Jul 2022 16:28:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9410BF8014E; Mon,  4 Jul 2022 16:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C6D3F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 16:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6D3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SVB8icQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656944928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RfGDyGyf0h7jOOxTntBYYgzFfxJM0cp4xXoHrS6OslQ=;
 b=SVB8icQUiBJ+OJC7bU2XvpUDYXTDQRJvd0UWN0DMGRUAVpZHTwCJSIVTo/XZI9FONlAWed
 T0AB4KQJ93zOBAvzlrmUPTjNwq9VFdJ3gHDvLh2FbyYwnC1gkdFoFHDsoZhA4xiMMb4IiB
 gOhA93mHYw5vtMAOX1ohSj27sNtS8RQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-mChhlN0FNr6ed0MhrdJ6rA-1; Mon, 04 Jul 2022 10:28:47 -0400
X-MC-Unique: mChhlN0FNr6ed0MhrdJ6rA-1
Received: by mail-qk1-f198.google.com with SMTP id
 186-20020a3708c3000000b006af306eb272so8843293qki.18
 for <alsa-devel@alsa-project.org>; Mon, 04 Jul 2022 07:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfGDyGyf0h7jOOxTntBYYgzFfxJM0cp4xXoHrS6OslQ=;
 b=pFPIYuvsZDwm8PsvHLvsB3TVx/PGhgWmFsVHGBxkcat6rpbLBpkiBIqrtU/PSzQ2Oi
 A9LdKuZGEAIwxoUmqoirck1NUV5Ha1jrF5j/od5dsFiBTItUV4YVkaWkp0nVlqGTqtUk
 nUlZw2ioNqvkhPy6zmp/YfpW9Flwky9iIKEv/tMLx8f/U6YUqOputWRey19V+y6Oy2vx
 2D/gFkYfqXUOb1Qn4aRlo3RIe6LfnGOEuQl8PHpH6ZUr1uquMpr2AcZXvRE6ETAJXUIy
 vsqi2JHRyponl4iHnF75++S2GagIsEV4JwL9mHtJEthL1/BNFEM2KuvlKKfmLD0GxykC
 GIQQ==
X-Gm-Message-State: AJIora/i8R4gnRsAA0kclmQ8PRN9pebLGgFimN3cOuDWyHn/xhcMYdWs
 1wEuDMxfFv2ivBq4lIYf0F7pCT6e5B//58u0iorSJXgnIXka9wStaln3MdGuu6URKOCSF9ADHf2
 iBckJttrrwkJj89+Gt3drXxg=
X-Received: by 2002:a05:6214:1cc7:b0:470:5371:26ff with SMTP id
 g7-20020a0562141cc700b00470537126ffmr27195895qvd.9.1656944926579; 
 Mon, 04 Jul 2022 07:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+cEeW2gwRYkbbRPlZwD0FkOkBtidH1s2JRvmcGTy0BEjr0apvXTfAN7/HCYrLoY47LtCk4Q==
X-Received: by 2002:a05:6214:1cc7:b0:470:5371:26ff with SMTP id
 g7-20020a0562141cc700b00470537126ffmr27195865qvd.9.1656944926191; 
 Mon, 04 Jul 2022 07:28:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ae9e902000000b006a6a6f148e6sm24374082qkf.17.2022.07.04.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 07:28:45 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz, tiwai@suse.com, vitalyr@opensource.cirrus.com,
 sbinding@opensource.cirrus.com, tanureal@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cs8409: change cs8409_fixups v.pins initializers to
 static
Date: Mon,  4 Jul 2022 10:28:36 -0400
Message-Id: <20220704142836.636204-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

sparse reports
sound/pci/hda/patch_cs8409-tables.c:79:25: warning: symbol 'cs8409_cs42l42_pincfgs_no_dmic' was not declared. Should it be static?

cs8409_cs42l42_pincfgs_no_dmic is only used by cs8409_fixups table as an
initializer for the hda_fixup element v.pins.  Both are defined in the
patch_cs8408-table.c file but only cs8409_fixups is used externally in
patch_cs8409.c.  So cs8409_cs42l42_pincfgs_no_dmic should have a static
storage class specifier.

The other v.pins initializers in cs8409_fixups table, though declared
extern in patch_cs8409.h are also only used in patch_cs8409-tables.c.
So change all the v.pins initializers to static.

Fixes: 9e7647b5070f ("ALSA: hda/cs8409: Move arrays of configuration to a new file")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 6 +++---
 sound/pci/hda/patch_cs8409.h        | 2 --
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 4f4cc8215917..e0d3a8be2e38 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -68,7 +68,7 @@ const struct hda_verb cs8409_cs42l42_init_verbs[] = {
 	{} /* terminator */
 };
 
-const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
+static const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
 	{ CS8409_PIN_ASP1_TRANSMITTER_A, 0x042120f0 },	/* ASP-1-TX */
 	{ CS8409_PIN_ASP1_RECEIVER_A, 0x04a12050 },	/* ASP-1-RX */
 	{ CS8409_PIN_ASP2_TRANSMITTER_A, 0x901000f0 },	/* ASP-2-TX */
@@ -76,7 +76,7 @@ const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
 	{} /* terminator */
 };
 
-const struct hda_pintbl cs8409_cs42l42_pincfgs_no_dmic[] = {
+static const struct hda_pintbl cs8409_cs42l42_pincfgs_no_dmic[] = {
 	{ CS8409_PIN_ASP1_TRANSMITTER_A, 0x042120f0 },	/* ASP-1-TX */
 	{ CS8409_PIN_ASP1_RECEIVER_A, 0x04a12050 },	/* ASP-1-RX */
 	{ CS8409_PIN_ASP2_TRANSMITTER_A, 0x901000f0 },	/* ASP-2-TX */
@@ -279,7 +279,7 @@ const struct hda_verb dolphin_init_verbs[] = {
 	{} /* terminator */
 };
 
-const struct hda_pintbl dolphin_pincfgs[] = {
+static const struct hda_pintbl dolphin_pincfgs[] = {
 	{ 0x24, 0x022210f0 }, /* ASP-1-TX-A */
 	{ 0x25, 0x010240f0 }, /* ASP-1-TX-B */
 	{ 0x34, 0x02a21050 }, /* ASP-1-RX */
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 260388a6256c..2a8dfb4ff046 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -358,13 +358,11 @@ extern const struct snd_pci_quirk cs8409_fixup_tbl[];
 extern const struct hda_model_fixup cs8409_models[];
 extern const struct hda_fixup cs8409_fixups[];
 extern const struct hda_verb cs8409_cs42l42_init_verbs[];
-extern const struct hda_pintbl cs8409_cs42l42_pincfgs[];
 extern const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[];
 extern const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[];
 extern struct sub_codec cs8409_cs42l42_codec;
 
 extern const struct hda_verb dolphin_init_verbs[];
-extern const struct hda_pintbl dolphin_pincfgs[];
 extern const struct cs8409_cir_param dolphin_hw_cfg[];
 extern struct sub_codec dolphin_cs42l42_0;
 extern struct sub_codec dolphin_cs42l42_1;
-- 
2.27.0

