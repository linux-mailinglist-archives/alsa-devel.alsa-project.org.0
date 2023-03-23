Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AE6C71A9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 21:28:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD454EC7;
	Thu, 23 Mar 2023 21:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD454EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679603301;
	bh=7McAtlpiTIJ/qPfl0S591XONIYCvSDGLAHR1eivCLu4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UIEI7lDaiAbefsM5p+mEi7sA794HdyjqD/ec0gd/OiE/kkAf+KZtyrwVtDvF+HhHZ
	 R8cEoE4D4DlLgseeJ6OP1d88HoPzcONPyOuqgQdMNAVynZ+7N3Dfv+EVKBl7Fjcpj5
	 QvSvM5ClXJBshM+IKlQW2Q4NDMghhn5rxCnDYlbA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9FDF8027B;
	Thu, 23 Mar 2023 21:27:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2507F80482; Thu, 23 Mar 2023 21:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94BEDF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 21:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94BEDF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GYA/WoHr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679603239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OhYpZ8KzjW1wsLxHwkxEX6G5RCZGyESus86bamUc+qA=;
	b=GYA/WoHrCEf+zKj6VDe789jdN/Njn5G3pwcA4v9Zxe4PO49p2CuRQJhp7HJdKQTAIhyDH8
	kN5dBuuSC3tm8um51IICJQoOVkK+0iblR1GOnLskk0D1ONXMCJHSYV95F/z6+WoDtVmsdR
	QE967qFrhI0+HbZc71n93DXfHlKy0mk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-00ZLgfjyOYKxvTx0PXII9A-1; Thu, 23 Mar 2023 16:27:17 -0400
X-MC-Unique: 00ZLgfjyOYKxvTx0PXII9A-1
Received: by mail-qv1-f72.google.com with SMTP id
 f3-20020a0cc303000000b005c9966620daso11211qvi.4
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 13:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679603236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhYpZ8KzjW1wsLxHwkxEX6G5RCZGyESus86bamUc+qA=;
        b=NteqSnr0CMbu/FOXO5h20U4Dc10F8yi8+ptJLG+E6WPZhyBWxmyUMbJVfSFvH2dC9v
         qc8TQ2RAuVGiPbR8jWX1hUwucJg4vWKctINAQ89mkASsz2tENOSlaw9z3jHT6HXMH+Rx
         idf9ITBegLMMMbgO4MZI8/859HaF9/VCm4nHzVAbmDV9Zst5Hv87jBSouhHbdRMOp6Br
         SJwn04QRcJS87TqH6BUeuNOaeU8tg/uhSdv88B/ukmszTgAkseB6GNiTkQCuJ/Xwmj/d
         qdDb7LjvLbZQLizHIwwMjM8eid7bl6UDwah1bkfezKJxoLqOlwi+ugl3OjVHYRWZRNq2
         OlEQ==
X-Gm-Message-State: AO0yUKUflOuIiAdM7LsQJgSyJr2wWer09RCGFgGxoQoBn5hRrWn4aWnR
	SxtPsuABnBuOUcYzq8JMwHu2khJFdoMiv9r1G2gbbTFtg5tE7j4ABBEgFfNWYemUQuYpu8aRHk4
	gCHetQfK5dcyHDh/t4Qw7zXU=
X-Received: by 2002:a05:622a:b:b0:3e3:87b8:8d44 with SMTP id
 x11-20020a05622a000b00b003e387b88d44mr1268801qtw.21.1679603236559;
        Thu, 23 Mar 2023 13:27:16 -0700 (PDT)
X-Google-Smtp-Source: 
 AK7set9nfcaOOPG+v24oW8TGCbt1FFZkuvDD8XTlbtr5XxZmlwYWNwjdxerj/TRLmVhphIi/iVJv0A==
X-Received: by 2002:a05:622a:b:b0:3e3:87b8:8d44 with SMTP id
 x11-20020a05622a000b00b003e387b88d44mr1268751qtw.21.1679603236138;
        Thu, 23 Mar 2023 13:27:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 f9-20020ac84709000000b003e0c94a6af0sm7986298qtp.53.2023.03.23.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:27:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: [PATCH] ALSA: hdspm: remove unused copy_u32_le function
Date: Thu, 23 Mar 2023 16:27:13 -0400
Message-Id: <20230323202713.2637150-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: Z6BPZTMXARYZUOAU2LEW3HDHM6BLDCWI
X-Message-ID-Hash: Z6BPZTMXARYZUOAU2LEW3HDHM6BLDCWI
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6BPZTMXARYZUOAU2LEW3HDHM6BLDCWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang with W=1 reports
sound/pci/rme9652/hdspm.c:6149:19: error: unused function
  'copy_u32_le' [-Werror,-Wunused-function]
static inline int copy_u32_le(void __user *dest, void __iomem *src)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/rme9652/hdspm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index fa1812e7a49d..267c7848974a 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6146,12 +6146,6 @@ static int snd_hdspm_hwdep_dummy_op(struct snd_hwdep *hw, struct file *file)
 	return 0;
 }
 
-static inline int copy_u32_le(void __user *dest, void __iomem *src)
-{
-	u32 val = readl(src);
-	return copy_to_user(dest, &val, 4);
-}
-
 static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 		unsigned int cmd, unsigned long arg)
 {
-- 
2.27.0

