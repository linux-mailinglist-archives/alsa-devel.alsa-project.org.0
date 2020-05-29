Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A41E7D3E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 14:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADC217C4;
	Fri, 29 May 2020 14:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADC217C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590755465;
	bh=hvXaZNvRJQsI05Ra9VADtEJ/lylwxLwJtH1niglP6+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1j8OZjVvG1WzpsMQ03Bjw3skUe6ylMfYhDwScUt0d7BcRkvJkZij2Mi2QApwoRfI
	 gUjzt55M1WW29jrMYuCBkX7jk86qYsyT0yfqD4ckhEdQyS+LrxycyJMPwRIZVVSItt
	 S0X8pijATMdmNqzA4ZhrEW/5CDiy6sH9Pwnc4UoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0276EF8021E;
	Fri, 29 May 2020 14:28:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1370CF8016F; Fri, 29 May 2020 14:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59C19F80149
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 14:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C19F80149
IronPort-SDR: 9HYyHkhQJ2B1RjlcCXal6zLAIcwVH4PXjR4iprN7Ij/bBkfyb7XAFlpWuChqnshpK9zmQDJkfU
 JD8aZ/jw3zsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:28:22 -0700
IronPort-SDR: zMtV7l3rT/ygSqlG/FCEiuY5GM0YKGy0lDqVHNpDBRMNOZ8ORD3TQeT0IF5mn3rwzT+2kK6td4
 3pJZc7yC6zeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="469491465"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 05:28:21 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH 1/2] pcm: add documentation for -ENODATA error code
Date: Fri, 29 May 2020 15:28:16 +0300
Message-Id: <20200529122817.1198-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529122817.1198-1-kai.vehmanen@linux.intel.com>
References: <20200529122817.1198-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

This error code can be used e.g. with echo reference PCM devices
(the SND_USE_CASE_MOD_ECHO_REF UCM token).

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 src/pcm/pcm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 1064044c9812..488a8dd0493d 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -292,6 +292,14 @@ This error can happen when device is physically removed (for example
 some hotplug devices like USB or PCMCIA, CardBus or ExpressCard
 can be removed on the fly).
 
+\par -ENODATA
+
+This error can happen if the device data transfer is dependent on
+an external condition and that condition is not met. For example,
+PCM device for echo reference as described by SND_USE_CASE_MOD_ECHO_REF
+UCM token, may return -ENODATA if the linked playback stream has not been
+started.
+
 \section pcm_params Managing parameters
 
 The ALSA PCM device uses two groups of PCM related parameters. The hardware
-- 
2.26.2

