Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE032734F
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Feb 2021 17:14:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3491667;
	Sun, 28 Feb 2021 17:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3491667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614528888;
	bh=wwGcXiCR+sf909zWA6F+l9YWekOCoQ3vyWkXCnjvoNs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XwuEGDrIIpQgVI3l5WpgpLa8fi1bnANSTeJpGwsjcTe9lqp0gTZRjphp82XYvwBe2
	 wbtfQcVfF+e2NYynVfQ+KDXYDik1GgYZjrNRDEl7AnqxEz7xya/ArEXxDzfiBU/yrP
	 fcojYnU7caE1Wbo1aknPOuq3pf/uio1Z0f1Y/Ids=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95FD7F8025B;
	Sun, 28 Feb 2021 17:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE6ACF80271; Sun, 28 Feb 2021 17:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7E7EF8010A
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 17:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E7EF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AOEC812B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614528791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ajWbcWt+G2Y7QBoHv4g0EEKtFgfnFh+pA0+cA1++zx0=;
 b=AOEC812B3zS/gmsyr+FNx/tDkAJSLbZQgwCQdlyqqdQZXxJBZGNiDSXYBPRihAbTEpiPGa
 kIsUUb5xiDeIDwGdm5FmpNsBWFGCMBZxoRfp7ZKrouDEU/o37Qa623KvEgfuiMNiTBdFNE
 wLbp/mIMUC4tt1QP228Mw3oeuSnBYe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-oRR1doWtNTyzHZVLjN7raw-1; Sun, 28 Feb 2021 11:13:07 -0500
X-MC-Unique: oRR1doWtNTyzHZVLjN7raw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468B2C288;
 Sun, 28 Feb 2021 16:13:06 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50AC65D9CC;
 Sun, 28 Feb 2021 16:13:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 0/3] mixer: Volume control fixes
Date: Sun, 28 Feb 2021 17:13:01 +0100
Message-Id: <20210228161304.241288-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>
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

Hi All,

Here is v2 of my series of alsa-lib volume-control fixes which I wrote
while working on adding hw-volume control to UCM profiles for various
x86 ASoC setups.

New in v2 is adding an extra entry to the capture_volume_names array
for the "ADC PGA Gain Volume" control used in the es8316 codec driver
in patch 3/3.

Note that patch 3/3 is not strictly necessary to make hw-volume control
work. At least the PA hw-vol-control code does not care if the controls
are wronly marked as global-volume-controls instead of
capture-volume-controls. I mostly wrote patch 3/3 because for
correctness reasons, so if it is deemed controversial we can drop it.

Regards,

Hans


Hans de Goede (3):
  mixer: Unify simple_none: base_len() exception handling
  mixer: Add exception for non " Volume" suffixed capture vol-ctls used
    in ASoC realtek codec drivers
  mixer: Add exception for some capture-vol-ctls which have a " Volume"
    suffix

 src/mixer/simple_none.c | 83 +++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 19 deletions(-)

-- 
2.30.1

