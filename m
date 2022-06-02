Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29D53BA68
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BF017A0;
	Thu,  2 Jun 2022 16:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BF017A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178493;
	bh=kKRgMFkAcrOCwy0OIAu0DsgSEAF0xJnNKwKV277U+yY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2c3FpkTArSne0ZfpPoDOSmyIzLtsBsp2c9k2ZToacUBR+9e7wmokgF1S3Pv0AP3+
	 MbB5jSZLQXJd6B7zCgzVTDoxOKoE+eoDM9g7t00QK9RgqlUCSoF7FdCO/9MMyLR0ST
	 14l5jTlepHBn6oCDFSAH75aKMdw+jHj1PdL84w+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA096F8025E;
	Thu,  2 Jun 2022 16:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CB16F80158; Thu,  2 Jun 2022 16:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C8DA8F80236
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 16:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8DA8F80236
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654178429799552917-webhooks-bot@alsa-project.org>
References: <1654178429799552917-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/4] hwdep: define interface for hwdep device
Message-Id: <20220602140034.0CB16F80158@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 16:00:34 +0200 (CEST)
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
