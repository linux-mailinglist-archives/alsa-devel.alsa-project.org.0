Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE257394
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 23:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A231D16B6;
	Wed, 26 Jun 2019 23:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A231D16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561584325;
	bh=h2zK9bXI59qNs9seColfW5hsk2jP/52OTdxCMJ7qx0k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ibbG1kaEDMpGM64JOZH89RZ2S04yh0D/00Q+N58mLzCltMak20Y5jsyqR/eNhMGOW
	 0lWrcJ7abtMfrYqHJJjopy+C8hD7ohnBrkowzPm9grsfhA0SH2PxH0ySInZrtr8A5H
	 QW776134M/bN7E6DablR0pDRCqAfviIA3sJj08+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA505F8972F;
	Wed, 26 Jun 2019 23:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0461DF89701; Wed, 26 Jun 2019 23:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCE0F896B7
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCE0F896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AxObSdEA"
Received: by mail-pl1-x643.google.com with SMTP id e5so10889pls.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ij4y5UDfEbG2jo5JYyvAwzXVxT7kJpB2+6FE5/HNPYw=;
 b=AxObSdEA5QIyp/BHvcsUBVQDhF9QON4UnumA5yV/WsAbRMHm19Cbi9O/ddxhZKwrLa
 VC/rG0o3A6HrcSOJkJZW3gaqzTLNMaxZk0ItDnArCuNTT0UhYrQF4IX0OpjGvgMuWHro
 SbE7n5O3FQV3LK5Ye8V7EoZrh/Iylzxd8wRwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ij4y5UDfEbG2jo5JYyvAwzXVxT7kJpB2+6FE5/HNPYw=;
 b=ClLERVzmSbZtGlGy6lEqZT5YfuoGytDr2xEUGFOlxidCq5bV8n415+SL2nmWYvlNTy
 BhSttzNXaUR5uVtXo4yVuAu8YVC0pX2lQKg9qPlgxyc5KGpZGENP3EjPYPAkOdJJFS8B
 YgsoEuCRIiRZwCHG3AWUryoSDVBIF13Kd71CBwJ58XQaG7gyY4zUk5jUOcTHoxQJVtoI
 qUwIpJ8bORRNdD6+XpPrHHIDwRrmAnW3JyjIuZhoDJ69Ei1YwexWEYI+KEJF0AF3X2Xs
 DSlsU2BmxwwIvu9+3jzcm6fO671p+hbSn6GHeOOp/vl/mWqj8KAa7G5Ow6qOkc9Q1rxO
 45tg==
X-Gm-Message-State: APjAAAVYf56d5d7nrYHxYLz4U21nMZRiNOgK6t7SiRPyDSU+EPs9WmxF
 9KcazEYKdJ18flYX4bWAcgJqsA==
X-Google-Smtp-Source: APXvYqyQMLLaw2qO9OPg0J5QL+TcHGSSxLFnpN4KkIk93CubD3Dw4953ZpgAbVu9v74l3nBfiMJ7+g==
X-Received: by 2002:a17:902:8649:: with SMTP id
 y9mr190931plt.289.1561584163195; 
 Wed, 26 Jun 2019 14:22:43 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id h6sm170323pfn.79.2019.06.26.14.22.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 14:22:42 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Wed, 26 Jun 2019 14:22:18 -0700
Message-Id: <20190626212220.239897-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 0/2] ALSA: hda: Widget memory fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


This series fixes concurrency issues with the sysfs widget array. The first
function patches up the locking that was introduced recently to protect more
of the data structure. The second patch fixes a race between a reinit and the
initial population of the array which could result in a length and array
getting out of sync.


Changes in v2:
- Introduced widget_mutex relocation

Evan Green (2):
  ALSA: hda: Fix widget_mutex incomplete protection
  ALSA: hda: Use correct start/count for sysfs init

 sound/hda/hdac_device.c | 21 ++++++++++++++-------
 sound/hda/hdac_sysfs.c  | 18 ++++++++++--------
 sound/hda/local.h       |  3 ++-
 3 files changed, 26 insertions(+), 16 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
