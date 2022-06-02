Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11553B64F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83857172E;
	Thu,  2 Jun 2022 11:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83857172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654163088;
	bh=/UbzQ8hLVpSvmYolL/vcTujEcBjFzu2I12SgSs0aIis=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZYRx0Vy8eBfATq3u1g8cuyKjVYo6oFEZIP8OaBgb6PmsDJ/S/6JXevUmOMKiF3mop
	 zb6UVIBrc+httdCf16KNeq+7Hf6fmfJGC2nytFzSATQBszeZZwG9KUn0E/OyZ1k/CL
	 d1lDvRBpuDTAdX0CoYdtxFy+B8DaTxtn6TwCbS4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 049A6F8025E;
	Thu,  2 Jun 2022 11:43:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA155F80236; Thu,  2 Jun 2022 11:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7FEA2F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FEA2F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654163027056525946-webhooks-bot@alsa-project.org>
References: <1654163027056525946-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/2] hwdep: define interface for hwdep device
Message-Id: <20220602094349.DA155F80236@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 11:43:49 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #73 was opened from takaswie:

The protocol in ALSA HwDep character device has common feature to each device. It's suitable for userspace implementation to have GObject interface for such features.

This patchset adds the interface. The implementation of interface should have four methods; open, get_protocol_version, get_device_info, and create_source. Additionally, it should emit handle-disconnection signal when detecting ENODEV error in the interation of source. It requires to notify userspace application since the application should release character device immediately.

```
Takashi Sakamoto (2):
  hwdep: use explicit value for iface type enumeration
  hwdep: device-common: add interface for common feature of ALSA HwDep device

 src/hwdep/alsahwdep-enum-types.h |  67 +++++++---------
 src/hwdep/alsahwdep.h            |   2 +
 src/hwdep/alsahwdep.map          |   6 ++
 src/hwdep/device-common.c        | 128 +++++++++++++++++++++++++++++++
 src/hwdep/device-common.h        | 102 ++++++++++++++++++++++++
 src/hwdep/meson.build            |   2 +
 6 files changed, 267 insertions(+), 40 deletions(-)
 create mode 100644 src/hwdep/device-common.c
 create mode 100644 src/hwdep/device-common.h
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/73
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/73.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
