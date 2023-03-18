Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1D6BFA93
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 14:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A19BC0;
	Sat, 18 Mar 2023 14:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A19BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679147621;
	bh=61ac7KqP10rdbFvJF+l/UIV1LFJuSVtlmUsAQzrJFNY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vR9nYNJjfEIIzoh/xWFgzT8c5RZUGYd2z/eWKa67uIgQQuGr0+3f8skk39nrzn+wX
	 useHb36aTzeTlwft90rgSnRePNx161r4lO+rbsoewanBAEVaeZBL8i1tXB0R00bwaX
	 +KRPBoviXoPInsIZYlgjzs8R/IdhdugRMVSPnD50=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA70F8032D;
	Sat, 18 Mar 2023 14:52:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FB8CF80423; Sat, 18 Mar 2023 14:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23F43F8016C
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 14:52:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23F43F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jQZavzbP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679147558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8JKKCoHtsIdOT+kL0un84AUvIlxjWeKq5FTVFUrPKc8=;
	b=jQZavzbPWANKQpnr/2PFA8K4P6BJXWqSqOQtk7bmv3E9DRekvJuTMcXJbT6EBRkxpYFG3e
	eoIixJltzQbpqZLzLigyT1Q+UNHgaKY+F9dutzSgCgc9hAmtruMAXD4ZpHCglDiC99/fkS
	5tCxDELBH4uT3VmFsn7UDS4U1+ieBbY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-3CQ8qsQbPH-NbwFTOoDHLA-1; Sat, 18 Mar 2023 09:52:35 -0400
X-MC-Unique: 3CQ8qsQbPH-NbwFTOoDHLA-1
Received: by mail-qt1-f197.google.com with SMTP id
 fz25-20020a05622a5a9900b003d6c5910689so4037541qtb.9
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679147555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JKKCoHtsIdOT+kL0un84AUvIlxjWeKq5FTVFUrPKc8=;
        b=y6CRuNwyTle6T1NAt8dyQMgQ0OW425WwKqzhpS4N2hIYgAA/9phdZoSW3+p0CcyRpS
         MT+3X0m4qadlMQdlf9wG4bEqPCCupHr82BNpLoJwBjJrmv+VGKjdk3TWB7xUWn5Sgz8C
         NPV33r080C9XiTYqCkWyp0Vq4PlAms8H2y6c/Tq5sDREw8NTHgzGMLWvHzcJC2kpn/hF
         MOEfilqD+W31jZP51SoJekgyiJDjzZxR/kFCZVt33jCm3K+oRJn1jgUYP9aTzXo1Y8LN
         fIlNOdHqwAiB/LC6kL/aaNDDKIfDgVkUtlMCWwnXLCtbT/h2gJSnxM0LBKe6rOKD1MJK
         7Mjg==
X-Gm-Message-State: AO0yUKWS/tdwjwUXxylnhe8RekAsgfZh+mA4Xv7kGHfoqFUmvmO/aTej
	HEdDSHi/XhghFO2ju67GtF8mk1kUd/awmVUsN+rnoWl3tcG5Jf7zVXTl9jTNZOjLGtd721CBRS7
	pSMAa0fNryOGcDWh1M9x4ues=
X-Received: by 2002:a05:622a:110a:b0:3bf:cd81:399f with SMTP id
 e10-20020a05622a110a00b003bfcd81399fmr18628200qty.3.1679147554776;
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
X-Google-Smtp-Source: 
 AK7set8IGPXW4iPtLnhcFdeE5DBfD6algKbXB9t7jslQwB7wD2STcpXKORYgPtCB7dq5QEEc6Kgcjw==
X-Received: by 2002:a05:622a:110a:b0:3bf:cd81:399f with SMTP id
 e10-20020a05622a110a00b003bfcd81399fmr18628176qty.3.1679147554463;
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 t72-20020a37464b000000b00725d8d6983asm3626195qka.61.2023.03.18.06.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: [PATCH] ALSA: portman2x4: remove unused portman_read_command,data
 functions
Date: Sat, 18 Mar 2023 09:52:29 -0400
Message-Id: <20230318135229.1685266-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: R4HJDCCRXV4TJLSF5TEF7HELJXCBFVP4
X-Message-ID-Hash: R4HJDCCRXV4TJLSF5TEF7HELJXCBFVP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4HJDCCRXV4TJLSF5TEF7HELJXCBFVP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang with W=1 reports
sound/drivers/portman2x4.c:185:18: error: unused function
  'portman_read_command' [-Werror,-Wunused-function]
static inline u8 portman_read_command(struct portman *pm)
                 ^
sound/drivers/portman2x4.c:195:18: error: unused function
  'portman_read_data' [-Werror,-Wunused-function]
static inline u8 portman_read_data(struct portman *pm)
                 ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/drivers/portman2x4.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 52a656735365..4cdf56a0eb65 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -182,21 +182,11 @@ static inline void portman_write_command(struct portman *pm, u8 value)
 	parport_write_control(pm->pardev->port, value);
 }
 
-static inline u8 portman_read_command(struct portman *pm)
-{
-	return parport_read_control(pm->pardev->port);
-}
-
 static inline u8 portman_read_status(struct portman *pm)
 {
 	return parport_read_status(pm->pardev->port);
 }
 
-static inline u8 portman_read_data(struct portman *pm)
-{
-	return parport_read_data(pm->pardev->port);
-}
-
 static inline void portman_write_data(struct portman *pm, u8 value)
 {
 	parport_write_data(pm->pardev->port, value);
-- 
2.27.0

