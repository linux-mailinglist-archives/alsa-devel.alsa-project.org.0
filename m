Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3201A0CFA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 13:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 433C0886;
	Tue,  7 Apr 2020 13:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 433C0886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586259715;
	bh=qmfYaCjYSO9v0AgYv7gqAX/sppYLzVsOGIRyueH2r+I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVq9Gxk2GK67EInctwp28bX1F3b+txUKPEtSuVNxV1daYNGwICcHRsVr8ktHWo5OY
	 yV6mpQcwTILjmF7gj2BzcHl/EwwuFHpKooiW+5kgY3piPYeAiyThOSEz+1678AihLh
	 Gd0bLwQ+BanhJ22QZ47l5M56hJqqqmqN+JZmwSFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60984F801DA;
	Tue,  7 Apr 2020 13:40:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25BA9F800F0; Tue,  7 Apr 2020 13:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 196AFF800F0
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 13:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 196AFF800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586259604151940107-webhooks-bot@alsa-project.org>
References: <1586259604151940107-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: Add shared library to operate ALSA hwdep character
 device
Message-Id: <20200407114012.25BA9F800F0@alsa1.perex.cz>
Date: Tue,  7 Apr 2020 13:40:12 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #15 was opened from takaswie:

This patchset is to add a new library, libalsahwdep, to operate ALSA hwdep
character device.

ALSA hwdep interface is designed to execute driver-dependent code from user
space application. Therefore there're a few common operations. Furthermore,
some of the operations are just for ALSA snd-usb-usx2y driver for TASCAM
US-122, US-224 and US-428, as of Linux kernel v5.6. The library doesn't
support the device-dependent operations.

The library has 4 global APIS. ALSAHwdep.get_device_id_list() returns the list
of numerical IDs of hwdep device in a card. ALSAHwdep.get_hwdep_sysname() and
ALSAHwdep.get_hwdep_devnode() returns sysname and devnode for the card and
hwdep device. ALSAHwdep.get_device_info() returns ALSAHwdep.DeviceInfo
GObject-derived object which represents the information of hwdep device of
the card. The object has some properties, one of which is a enumeration in
ALSAHwdep.IfaceType to represent the type of hwdep device.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/15
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/15.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
