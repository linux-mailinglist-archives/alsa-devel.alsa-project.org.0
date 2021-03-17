Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09C33EB56
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 09:22:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1C218F0;
	Wed, 17 Mar 2021 09:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1C218F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615969372;
	bh=r41FwmZSVBTo7X6lIa5Y2YhhNVKvf/dkMmAVCufO0tg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B2xG2menHT5i0ldvzkbg9rr2Uct1ASfTCgurXQ2UKgT9HXqoNUWgwkD07Ib+sWzRB
	 SKknC1UCg1Bhl7oAbZeC7WlnOn6y3VmdczHXcKx8VrfGSD3DT9yu0tvt+wKxpsJEbY
	 VPd3jU/vb9XUA796j7do50XEFGRjuhBAPrr1YB8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29987F8023C;
	Wed, 17 Mar 2021 09:21:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 104A3F8021C; Wed, 17 Mar 2021 09:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57047F8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 09:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57047F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TqDnxtX7"
Received: by mail-qk1-x72c.google.com with SMTP id 130so38024335qkh.11
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pKHnvJF8GKWqxZYX1hN/UxcWN7XcmcInbyUM1lbcj0=;
 b=TqDnxtX7iDH0paPGGkFHA51US+WQvkQDByiaGjbylpTY2gQqITJEsY75EzXKW+HAdx
 WBayuy0MqmAS5gRJHbD+ytZHHCwp6U7D9h3SMGJfTUyBqksSeyVIaxEshYuDfuiZ4hIA
 Oaa6tMR/o3niG5iXAmMAUSU4yLitE4mm2kTSjd6Ib2ZIQUw+p47cy9cQCLyZmXVwmiIf
 bPv5iNadkfMwmgjljvxyzyRYieGXHPI9n4YceIaksSzh6HZIf7MBMyekJ1qDq/L+9vJP
 nQ9JwFSkGXN5zZV37rNO4PxvRRUYHwqDh9rTboT6N5DY4DfJJiscgMDk1kONHAvnO1oG
 CXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pKHnvJF8GKWqxZYX1hN/UxcWN7XcmcInbyUM1lbcj0=;
 b=fPtceu0fEl28F5bqdpavBF4jYbkvbFSC2K/sWZo0c3I72J83VNqw+lDvkqsQ2cTlJP
 Uv99tXJvfKYjla5B7bVMuDNEegRoVWpuuM4SIXSDUAZV1HZEyQGKVDnpRAMgjZA1/kaK
 w7VQPxUgTwGolO441MHV0yMuhagLglMFdRt2p3oYuDNT4G38CMRfyOSCCX/e/mQbZOzo
 gDmRAPbpzEvM0sOioerBgRNy5hASw00qa5Coso+VbrZ+hRI4ezEO/xIGvygWJ6eg58bu
 iBrD+MkxQw0gkWzNI1+JjrdG+MFLs+br5W/7Y7mru+7hmPxfV/wXistyt2Tmvmqi266O
 0Pzg==
X-Gm-Message-State: AOAM533F96Cvf2pQeguWP9QExt1Fsf/M6t9xmQTitjSJ2pYDb0vIn3yC
 quhb3/rUqR6FToYr5bGKl80=
X-Google-Smtp-Source: ABdhPJwW5k2v1wp4ueAZtzhESlZaksiEMNAkMs4VK1ezINAJtD2Uq7zGgrB8paQT22yJxl7GjpDNYw==
X-Received: by 2002:a05:620a:85e:: with SMTP id
 u30mr3497320qku.427.1615969268021; 
 Wed, 17 Mar 2021 01:21:08 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.48])
 by smtp.gmail.com with ESMTPSA id g74sm17121063qke.3.2021.03.17.01.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 01:21:07 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc: ti: Fix a typo in the file ams-delta.c
Date: Wed, 17 Mar 2021 13:50:42 +0530
Message-Id: <20210317082042.3670745-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
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


s/functonality/functionality/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 sound/soc/ti/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 57feb473a579..31462587f922 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -408,7 +408,7 @@ static struct tty_ldisc_ops cx81801_ops = {

 /*
  * Even if not very useful, the sound card can still work without any of the
- * above functonality activated.  You can still control its audio input/output
+ * above functionality activated.  You can still control its audio input/output
  * constellation and speakerphone gain from userspace by issuing AT commands
  * over the modem port.
  */
--
2.30.2

