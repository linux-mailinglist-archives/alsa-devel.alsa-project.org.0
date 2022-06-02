Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FA53B699
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 12:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7B6173A;
	Thu,  2 Jun 2022 12:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7B6173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654164539;
	bh=kKRgMFkAcrOCwy0OIAu0DsgSEAF0xJnNKwKV277U+yY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pl9zHOhWUeWHOsPrN0+YoQylOoidScd1jpPKwZR7C2L1CVkf/4J2ZVrzEw2yon/D5
	 DNLhek1muJwH9Ya7PPyfxxv8eA+opBCaYvWhJvhmU10/cNqC2SLtNlzXAY61tGmujf
	 CFUmQp4v3SYPAX/DYsBjox+8NpJQl2y4oipEVML0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C91F804AB;
	Thu,  2 Jun 2022 12:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0004F80425; Thu,  2 Jun 2022 12:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9EDECF80272
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 12:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDECF80272
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654164450440290928-webhooks-bot@alsa-project.org>
References: <1654164450440290928-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/3] hwdep: define interface for hwdep device
Message-Id: <20220602100732.F0004F80425@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 12:07:32 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #73 was edited from takaswie:

The protocol in ALSA HwDep character device has common feature to each device. It's suitable for userspace implementation to have GObject interface for such features.

This patchset adds the interface. The implementation of interface should have four methods; open, get_protocol_version, get_device_info, and create_source. Additionally, it should emit handle-disconnection signal when detecting ENODEV error in the interation of source. It requires to notify userspace application since the application should release character device immediately.

```
Takashi Sakamoto (3):
  hwdep: use explicit value for iface type enumeration
  hwdep: device-common: add interface for common feature of ALSA HwDep device
  hwdep: add error domain for implementators of DeviceCommon interface

 src/hwdep/alsahwdep-enum-types.h |  89 +++++++++-------
 src/hwdep/alsahwdep.h            |   2 +
 src/hwdep/alsahwdep.map          |  10 ++
 src/hwdep/device-common.c        | 178 +++++++++++++++++++++++++++++++
 src/hwdep/device-common.h        | 106 ++++++++++++++++++
 src/hwdep/meson.build            |   2 +
 tests/alsahwdep-enums            |  10 ++
 7 files changed, 356 insertions(+), 41 deletions(-)
 create mode 100644 src/hwdep/device-common.c
 create mode 100644 src/hwdep/device-common.h
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/73
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/73.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
