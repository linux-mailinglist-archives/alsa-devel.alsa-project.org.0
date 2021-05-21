Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7938CBBF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1DA16BB;
	Fri, 21 May 2021 19:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1DA16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617363;
	bh=AX5MkElynMa5o7CIUbFQPiVs8T41pfsF4eR1FO4WuUU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ViqaKgw8aNvGhU0lfg+kFmQ9CEgrZJNJzqnmy3OwNamEjtymQ/e9JcQycLg1onlNk
	 +epuWxOvLj3/2v/JxDQaQkkTEgQelsQoCHOj796xAlAngEIfuDo46qt7hjKK0hsB3b
	 60SzEiC7I/GZ5gSTlwJ8c8qqtuIqtvXcAOUtgQz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F185F8025D;
	Fri, 21 May 2021 19:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD94AF80246; Fri, 21 May 2021 19:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F86F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F86F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UDQW3U7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pCgaqDw5Xoc3eJxJfY7O89kRCc0yBN0WDqkGQNlmEqk=;
 b=UDQW3U7SGYJorKTjB88Df5l1NjFMbN8DYBZyTKh56WhEO2zAy6vGgbnor7H1ixNnwNm6wd
 lcRPbQuxDlk58yfp2pN11rY1O/aUI0Skw47SUpMKRkCQ/JevaP3m/KTwcPNxLaLO9Cnymy
 AJ0fP5ZT0sRGlnfX0A4IrAp8oAFFamg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-oof1jAQOO12a2qpiSgeZyw-1; Fri, 21 May 2021 13:14:23 -0400
X-MC-Unique: oof1jAQOO12a2qpiSgeZyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3F9104FB62;
 Fri, 21 May 2021 17:14:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 057B810013D6;
 Fri, 21 May 2021 17:14:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/8] iio: accel: bmc150: Add support for yoga's with dual
 accelerometers with an ACPI HID of DUAL250E
Date: Fri, 21 May 2021 19:14:10 +0200
Message-Id: <20210521171418.393871-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, Jeremy Cline <jeremy@jcline.org>,
 Hans de Goede <hdegoede@redhat.com>
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

Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
to allow the OS to determine the angle between the display and the base
of the device, so that the OS can determine if the 2-in-1 is in laptop
or in tablet-mode.

We already support this setup on devices using a single ACPI node
with a HID of "BOSC0200" to describe both accelerometers. This patch
set extends this support to also support the same setup but then
using a HID of "DUAL250E".

While testing this I found some crashes on rmmod, patches 1-2
fix those patches, patch 3 does some refactoring and patch 4
adds support for the "DUAL250E" HID.

Unfortunately we need some more special handling though, which the
rest of the patches are for.

On Windows both accelerometers are read (polled) by a special service
and this service calls a DSM (Device Specific Method), which in turn
translates the angles to one of laptop/tablet/tent/stand mode and then
notifies the EC about the new mode and the EC then enables or disables
the builtin keyboard and touchpad based in the mode.

When the 2-in-1 is powered-on or resumed folded in tablet mode the
EC senses this independent of the DSM by using a HALL effect sensor
which senses that the keyboard has been folded away behind the display.

At power-on or resume the EC disables the keyboard based on this and
the only way to get the keyboard to work after this is to call the
DSM to re-enable it (similar to how we also need to call a special
DSM in the kxcjk-1013.c accel driver to re-enable the keyboard).

Patches 5-7 deal with the DSM mess and patch 8 adds labels to the
2 accelerometers specifying which one is which.

Regards,

Hans


Hans de Goede (8):
  iio: accel: bmc150: Fix dereferencing the wrong pointer in
    bmc150_get/set_second_device
  iio: accel: bmc150: Don't make the remove function of the second
    accelerometer unregister itself
  iio: accel: bmc150: Move check for second ACPI device into a separate
    function
  iio: accel: bmc150: Add support for dual-accelerometers with a
    DUAL250E HID
  iio: accel: bmc150: Move struct bmc150_accel_data definition to
    bmc150-accel.h
  iio: accel: bmc150: Remove bmc150_set/get_second_device() accessor
    functions
  iio: accel: bmc150: Add support for DUAL250E ACPI DSM for setting the
    hinge angle
  iio: accel: bmc150: Set label based on accel-location for ACPI
    DUAL250E fwnodes

 drivers/iio/accel/bmc150-accel-core.c |  87 ++----------
 drivers/iio/accel/bmc150-accel-i2c.c  | 192 +++++++++++++++++++++-----
 drivers/iio/accel/bmc150-accel.h      |  66 ++++++++-
 3 files changed, 239 insertions(+), 106 deletions(-)

-- 
2.31.1

