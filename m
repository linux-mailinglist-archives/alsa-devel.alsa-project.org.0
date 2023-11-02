Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A77E0697
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:30:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 121FAE7D;
	Fri,  3 Nov 2023 17:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 121FAE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699029058;
	bh=B4f9gfNCb0R3FOBzKEiBOAlW2H3Az9cyoly0CjbDIQA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MdwBu30ZGmuvliTIvsFsc4WOgoLaaOROlY3h04apBoknJW7TYDlCKF34NeEbijEB4
	 BDT1LaYFqsQFWwm4AmCOrP1i8XnLpTul3ZTlqen42XWtqceysiVvpP03LgWgoF/xmF
	 9+AydgzMrjPuWJgdpqAaY5U5F393f8cCHw7adzfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B2AF8055A; Fri,  3 Nov 2023 17:27:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D65F8060C;
	Fri,  3 Nov 2023 17:27:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D7DBF80290; Thu,  2 Nov 2023 20:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB0E7F8014B
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 20:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB0E7F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HBJ4spvI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698951806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m+72lU2is0RjPg3Ej03EzBiDP42Tb65So4vdSCepZ9s=;
	b=HBJ4spvI5WLl3FTgKWfkN4GE+RJNqyZDS91rnR9xdlYHlZLHBmuiG9YshKPQRVSwRp7YUN
	phrm1RiyGhorPyUskqvUs8GjukgXCsh++87VNtZZMsEAZz5JZs2/nizZh2/mri9BfQh/Kx
	7bJQrlQLGXnuxmMqaZ+5n93O9O1eBIs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-DYCt1PSNO72-B89UGxujdA-1; Thu, 02 Nov 2023 15:03:23 -0400
X-MC-Unique: DYCt1PSNO72-B89UGxujdA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32fabf96aa5so168095f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Nov 2023 12:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951802; x=1699556602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+72lU2is0RjPg3Ej03EzBiDP42Tb65So4vdSCepZ9s=;
        b=GStM8BErItPR5y85rDFjKiOzpIXHotVlSwB/Mf1jhBYi8yYLnoBSVIOyOUe22Ey9fi
         hMuK2pdVoaJVGy7BLFUVGh/hysYnJnvpui8U2SB8cXjBWDvDpGTzCMNsKFEKMZ6vrNBK
         gnjVs24KUced4bpMzPnXepzOTlQvEHUsBvVlw1n1En8+zphe9ckb76C9h6KEeg4nMoe4
         GShZFcQSppjvUczrv14yuWobJoQbfnUDYco7hJLggwor2H+dtDL1P2luV+gb1ptIOmxi
         BGaw4lAMD/SZqdGO3dGhl7RigPDoL+I8bF+SuuFBDiDKHSkjFCrzqt83ci0J+9Oy8+i/
         jnNg==
X-Gm-Message-State: AOJu0YyLQAc6U+mBn5xcZhjjCMF5JpTvDRiCSkRjgUKQA4GVFoNqIVEX
	s//IK5fEC5+C/hbkK54sBHePN4RD3RQorAf3dR5E54zcZv+GemcfKfyfuqAdAqss8zxuC112L3N
	Jempb8Zz2rf2Tc4wp4fN5bzk=
X-Received: by 2002:a5d:5c11:0:b0:32f:8a45:93a7 with SMTP id
 cc17-20020a5d5c11000000b0032f8a4593a7mr9124226wrb.0.1698951802590;
        Thu, 02 Nov 2023 12:03:22 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFUPZRT8I8iw/CcEcUptKDDx7966nYE1/uugb6+QE4ZoKiWbmft1KG9gyqtzE1rFEHqmKpeCw==
X-Received: by 2002:a5d:5c11:0:b0:32f:8a45:93a7 with SMTP id
 cc17-20020a5d5c11000000b0032f8a4593a7mr9124209wrb.0.1698951802240;
        Thu, 02 Nov 2023 12:03:22 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32c5:d600:227b:d2ff:fe26:2a7a])
        by smtp.gmail.com with ESMTPSA id
 l22-20020adfa396000000b0032f7d1e2c7csm62660wrb.95.2023.11.02.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:21 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH] sound/isa/wavefront: copy userspace array safely
Date: Thu,  2 Nov 2023 20:03:10 +0100
Message-ID: <20231102190309.50891-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-MailFrom: pstanner@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CUYXW7AWWZQR6X7I5UHSRD5IR4EM3PPE
X-Message-ID-Hash: CUYXW7AWWZQR6X7I5UHSRD5IR4EM3PPE
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:27:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wavefront_fx.c utilizes memdup_user() to copy a userspace array. This
does not check for an overflow.

Use the new wrapper memdup_array_user() to copy the array more safely.

Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 sound/isa/wavefront/wavefront_fx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/isa/wavefront/wavefront_fx.c b/sound/isa/wavefront/wavefront_fx.c
index 3c21324b2a0e..0273b7dfaf12 100644
--- a/sound/isa/wavefront/wavefront_fx.c
+++ b/sound/isa/wavefront/wavefront_fx.c
@@ -191,9 +191,9 @@ snd_wavefront_fx_ioctl (struct snd_hwdep *sdev, struct file *file,
 					    "> 512 bytes to FX\n");
 				return -EIO;
 			}
-			page_data = memdup_user((unsigned char __user *)
-						r.data[3],
-						r.data[2] * sizeof(short));
+			page_data = memdup_array_user((unsigned char __user *)
+						      r.data[3],
+						      r.data[2], sizeof(short));
 			if (IS_ERR(page_data))
 				return PTR_ERR(page_data);
 			pd = page_data;
-- 
2.41.0

