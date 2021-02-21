Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812023209FF
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0524C1679;
	Sun, 21 Feb 2021 12:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0524C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613907137;
	bh=aT5n6iM4fMxttWsZ9F5StVT2gqR+htc/hSSgfW3r9Mw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uk2YstSfoXyLnn+gaIADhKuNUpJURgdAwFNvtbIIpCNn3aBdApjD8IqeGzcLlg20a
	 sK6uLwsBTjoBFu8Cxk8BqGD2FA5J3+G4Ghm6POE4qONzk5AtNK+jXr1n3/or3TgWtC
	 6uGDtetxBhHU/i/Uqcitgryqtzv7EwtpZCutiPoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AD49F801F5;
	Sun, 21 Feb 2021 12:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE93F800F3; Sun, 21 Feb 2021 12:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E504F800F3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E504F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Y26WC8BC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613907040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MZlTRmZQt9QPuv8Q8awd1An02/w9Dcd5phz5eoWqnTk=;
 b=Y26WC8BCf1UCLIJqDpcAGgxoHVAhnbQ2DFNywHEYCIU0welTWLZmO2ic7aMSWoz/Qh9jB2
 qfoQJJV/hlFBi1eMKC6XQ01CnWHg7pnKtjqzx1Q7g5u5E0jxXmtP9UypuicKghoIU81OR4
 /a1+R2Sz6yJgLyEO2m/3HI23nzTDvSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-UBIdroTzNGaC9cjTTm0jqA-1; Sun, 21 Feb 2021 06:30:36 -0500
X-MC-Unique: UBIdroTzNGaC9cjTTm0jqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBFE10066EF;
 Sun, 21 Feb 2021 11:30:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0E55100164C;
 Sun, 21 Feb 2021 11:30:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 0/3] HID: elan: Mute LED handling fixes and improvements
Date: Sun, 21 Feb 2021 12:30:26 +0100
Message-Id: <20210221113029.103703-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
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

Here is v2 of my series with mute LED handling fixes and improvements
for the hid-elan driver.

New in v2:
- Add Marek Behún's Reviewed-by to all patches,thank you for all the
  reviews Marek.
- Improve error handling in patch 1/3 to return -EIO when ret != 3 and >= 0

Regards,

Hans


Hans de Goede (3):
  HID: elan: Silence mute LED errors being logged when the device is
    unplugged
  HID: elan: Set default_trigger for the mute LED
  HID: elan: Remove elan_mute_led_get_brigtness()

 drivers/hid/hid-elan.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.30.1

