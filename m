Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1353BA6A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2588717C9;
	Thu,  2 Jun 2022 16:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2588717C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178525;
	bh=4lepozIVNN8uFqiMSDUGNSkfecEbe+qT7hKfMntI6VU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZKoT6u00g4GobhxHSov0Xs2xRWfwDYZl9+sVg6T8sooUVIAVtFhu1qVCxghV2tDu
	 nMq7ycvlvJzxafgprA3tJqS8V05sF3W1FdF6HXJUsbE0rMGecE+Qhl085CrebUtfOB
	 3qU1UXxhrdggriy3oT97SGrCP4L/YGzJqV1zx+ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 821F0F80425;
	Thu,  2 Jun 2022 16:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7458CF804AB; Thu,  2 Jun 2022 16:00:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 12B31F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 16:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B31F80089
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654178450465586901-webhooks-bot@alsa-project.org>
References: <1654178450465586901-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/4] hwdep: define interface for hwdep device
Message-Id: <20220602140053.7458CF804AB@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 16:00:53 +0200 (CEST)
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
Takashi Sakamoto (4):
  hwdep: use explicit value for iface type enumeration
  hwdep: device-common: add interface for common feature of ALSA HwDep device
  hwdep: add error domain for implementators of DeviceCommon interface
  hwdep: device-info: allow to set property at instantiation

 src/hwdep/alsahwdep-enum-types.h |  89 +++++++++-------
 src/hwdep/alsahwdep.h            |   2 +
 src/hwdep/alsahwdep.map          |  10 ++
 src/hwdep/device-common.c        | 178 +++++++++++++++++++++++++++++++
 src/hwdep/device-common.h        | 106 ++++++++++++++++++
 src/hwdep/device-info.c          |  38 ++++++-
 src/hwdep/meson.build            |   2 +
 tests/alsahwdep-enums            |  10 ++
 8 files changed, 389 insertions(+), 46 deletions(-)
 create mode 100644 src/hwdep/device-common.c
 create mode 100644 src/hwdep/device-common.h
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/73
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/73.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
