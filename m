Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FA6BFA44
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 14:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B2A8A4F;
	Sat, 18 Mar 2023 14:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B2A8A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679146374;
	bh=7InbK17Ckv7kSV9KcHqA1uRBMwDQgo91D+FWHQ7nShI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L8KAVSkf1SsBpaeL9R3mG51fphceEo7hWc0HL/9ezr9vgTOwa0PHEwQCGgZY/D4HM
	 M4PUhw9P+1h4EPRXn8SqHlD5ovLw2+zhTup629LH0Fq6HWnH52KMxrK5Ag8VyUdbLH
	 8WMYClSRwna6mihkLhD0SIYjWnKD71bU9MbrzMco=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8314AF80425;
	Sat, 18 Mar 2023 14:32:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40360F80423; Sat, 18 Mar 2023 14:31:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB4F4F8016C
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 14:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4F4F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=D4H/xXT6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679146311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UUlLexOxTlL2rJRhRjOGMCzDKj9OAhc0E+V/p5S5fiE=;
	b=D4H/xXT6QNhMcvKvRUTmdRQXP8AWMTOL6ECfhO2vNokoQe6LmVSvu79CfbLT3bco9RM4pl
	GssN0LD2AyotOXZO5rAXQ8B9IVZFRcOXdtLibPC/dFssZWRliwgoPCmpT4vFPyJsZHEbuL
	AHDHHBZ6MnyqpQTY2U3c475OMGac7TE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-KFK5-uCYOt-Z3beJQZgbeA-1; Sat, 18 Mar 2023 09:31:49 -0400
X-MC-Unique: KFK5-uCYOt-Z3beJQZgbeA-1
Received: by mail-qk1-f200.google.com with SMTP id
 b28-20020a05620a127c00b00745f4772ca0so3719173qkl.7
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679146309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUlLexOxTlL2rJRhRjOGMCzDKj9OAhc0E+V/p5S5fiE=;
        b=ekwK7DYj9s++TxpRVBMrJKADT3DdEk8Qr/pfZpxhCp09pOLBoocYMbkbeaC4AfXnqF
         qO+HFcydlqxbeD0hUx558jyyKV99xek7M5JVeO7QVQrKCulZiaqP7aUtpaqVCwkbReXW
         XRaugx6eX43WPYnRIr9Jx3CpbIwYvI5ARJ65R1xATDnlr5pktTJpiJif92f0PzGZjaOC
         C30gXwvM/EsZMPVbqnYB2S2IQIPpdh2odwkplGbodwaBin8eQ4beQGJT/JksTU/BcOEj
         NiaBIXOOg+VcrLTrRb3MC/Tb7iNPiXwFprBP9/WA2nKauu2H4QPAphUICEadl2d2y9kD
         kxAA==
X-Gm-Message-State: AO0yUKW+ZU0UgZ6EmBgL0EXwE5BCWk2jZSfhDswdrIxb1hKhA15cDWfP
	fhPM35xQ/JCd0t4MlXv3hsAhA1M+WgJjMjEOXbw85c26qez0YPZrxactgzR0XEUirT/5sNNxGfD
	UrzFIx98uePAJlCOnoLwizyc=
X-Received: by 2002:a05:6214:5281:b0:56e:bc62:e151 with SMTP id
 kj1-20020a056214528100b0056ebc62e151mr46569176qvb.7.1679146309324;
        Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
X-Google-Smtp-Source: 
 AK7set+PZFX2mVoz7k+s6UMIaLaX9bdTOGY4ZLkhjSi2vKRtz+hqyRNo8gymhk+SaWflKTunQ1zwDg==
X-Received: by 2002:a05:6214:5281:b0:56e:bc62:e151 with SMTP id
 kj1-20020a056214528100b0056ebc62e151mr46569138qvb.7.1679146309006;
        Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b00746476405bbsm3566936qkp.122.2023.03.18.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:31:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: [PATCH] ALSA: ymfpci: remove unused snd_ymfpci_readb function
Date: Sat, 18 Mar 2023 09:27:08 -0400
Message-Id: <20230318132708.1684504-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: TSXC5WEEFWJKHPUUGPC25NACQW63D6ZO
X-Message-ID-Hash: TSXC5WEEFWJKHPUUGPC25NACQW63D6ZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSXC5WEEFWJKHPUUGPC25NACQW63D6ZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang with W=1 reports
sound/pci/ymfpci/ymfpci_main.c:34:18: error:
  unused function 'snd_ymfpci_readb' [-Werror,-Wunused-function]
static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
                 ^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/ymfpci/ymfpci_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index c80114c0ad7b..2858736ed20a 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -31,11 +31,6 @@
 
 static void snd_ymfpci_irq_wait(struct snd_ymfpci *chip);
 
-static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
-{
-	return readb(chip->reg_area_virt + offset);
-}
-
 static inline void snd_ymfpci_writeb(struct snd_ymfpci *chip, u32 offset, u8 val)
 {
 	writeb(val, chip->reg_area_virt + offset);
-- 
2.27.0

