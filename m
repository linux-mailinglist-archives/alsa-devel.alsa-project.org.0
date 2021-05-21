Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFD38CBEF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F3816B5;
	Fri, 21 May 2021 19:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F3816B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617555;
	bh=EnKioEr84xeWwukdCIRVjRBK4DvVfD4iQNrhqHHxvg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRvqGUUlLmrxV+uBWcVHiO0BCLUoSh3FWXcYJQmRnnC0z5MVcKbENWj0ZAxhoq3wd
	 w7nfaP7AgRvO5j6l176v1IpP7g22Kub0CB1jPD60K9jG/TgS8LYykJ6Ww4gTSO3SBE
	 y48y8JjXHQbwIYUrQp3DNwZohyHrXf7A1W5tdddM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B26F804ED;
	Fri, 21 May 2021 19:14:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B02F804D1; Fri, 21 May 2021 19:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65FF7F804B4
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65FF7F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Gh2OqwR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EumFKksjDikSz13aw1z4DlMrdgBtjs5Kx9HhT7YtI0=;
 b=Gh2OqwR1O8/GEQTPM/uXzdi+3KAz7Jbis+hTB+fTzS6wP3U00HWJMV7USXAPoRGXWdmiDj
 7S8M5N/zkDbKmDvSCmjAPwPx1FHV0J8rIVDqXFYLEZL5Oov750Z6Q6kqNqT3fPhpVWqjov
 DkQAT3VQHkdGpeqZrGaOKeHM0j15fIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-yd4dNnUpPHisDRHoviwtOw-1; Fri, 21 May 2021 13:14:40 -0400
X-MC-Unique: yd4dNnUpPHisDRHoviwtOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744BE8015F8;
 Fri, 21 May 2021 17:14:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808FF10013D6;
 Fri, 21 May 2021 17:14:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 8/8] iio: accel: bmc150: Set label based on accel-location for
 ACPI DUAL250E fwnodes
Date: Fri, 21 May 2021 19:14:18 +0200
Message-Id: <20210521171418.393871-9-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-1-hdegoede@redhat.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
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

Some Yoga laptops with 1 accelerometer in the display and 1 in the base,
use an ACPI HID of DUAL250E instead of BOSC0200.

Set the iio-device's label for DUAL250E devices to a value indicating which
sensor is which, mirroring how we do this for BOSC0200 dual sensor devices.

Note the DUAL250E fwnode unfortunately does not include a mount-matrix.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 932007895f18..08966ee82e43 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -397,6 +397,17 @@ static bool bmc150_apply_acpi_orientation(struct device *dev,
 	acpi_status status;
 	int i, j, val[3];
 
+	/* Special case for devices with a "DUAL250E" HID */
+	if (adev && acpi_dev_hid_uid_match(adev, "DUAL250E", NULL)) {
+		if (strcmp(dev_name(dev), "i2c-DUAL250E:base") == 0)
+			label = "accel-base";
+		else
+			label = "accel-display";
+
+		indio_dev->label = label;
+		return false; /* DUAL250E fwnodes have no mount matrix info */
+	}
+
 	if (!adev || !acpi_dev_hid_uid_match(adev, "BOSC0200", NULL))
 		return false;
 
-- 
2.31.1

