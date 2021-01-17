Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0ED2F9573
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 22:24:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ECC41759;
	Sun, 17 Jan 2021 22:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ECC41759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610918682;
	bh=Xji7LGKGDvU0URPlz+sFbNQ00D7ypSDEKKTbZiGgMTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JHNZV3mTfMxRHOqFcl9T+SCxJckpdAn/ryZMGO9XsUOkt2EkwKiSOIucc+WcjP1JZ
	 4bAHYU4+BJE+gjH+OPVgeaVWgXJJm+FHioQrXeo8GjPLj+2vDGi7E46NI2uXCn7xZO
	 NXPynJkwpvocpBnp/6NA5VstvFlorgQyIUUE7JEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88270F8026A;
	Sun, 17 Jan 2021 22:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07292F8026A; Sun, 17 Jan 2021 22:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23BF9F8010B
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 22:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BF9F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="jOmJMocF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610918582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xji7LGKGDvU0URPlz+sFbNQ00D7ypSDEKKTbZiGgMTA=;
 b=jOmJMocFyRtZkA5yxC9YKfsYcf3syRMTZI/MSRQU6phGjQf0It2GSqtOTaiCrsjM3CNRUv
 ZqhoITy73HmhjepypaNnMQ8fwrkg/j4gA7ZvN+fhHq+LV8SLnSBfsQU3C6d78B4Q6X8Ayz
 LX2hZIJVKK9BwH0A/JMV1vk9/h/Fre0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-bX1NwOqNN_St8pKGKFEyAQ-1; Sun, 17 Jan 2021 16:22:58 -0500
X-MC-Unique: bX1NwOqNN_St8pKGKFEyAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D4E800D53;
 Sun, 17 Jan 2021 21:22:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 748FF100AE2F;
 Sun, 17 Jan 2021 21:22:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/5] MFD/ASoC: Add support for Intel Bay Trail boards with
 WM5102 codec
Date: Sun, 17 Jan 2021 22:22:47 +0100
Message-Id: <20210117212252.206115-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Here is v3 of my series to add support for Intel Bay Trail based devices
which use a WM5102 codec for audio output/input. New in v3 is that the
compile error when CONFIG_ACPI is unset should be gone. Everything else
is the same as in v2, see the cover-letter of v2 below:

This was developed and tested on a Lenovo Yoga Tablet 1051L.

The biggest difference from v1 is that, based on all the discussions about
the jack-detect stuff, I've decided to split this into 2 series.
One series adding the basic support for this setup, which is this series.

And a second series which reworks the extcon driver into an arizona-jackdet
library and then modifies the codec drivers to use that directly, replacing
the old separate extcon child-device and extcon-driver.

The are 2 reasons for the split:

1. With the new jack-det rework, the series really address 2 separate
(but related) enhancements.

2. I expect this series to be ready for merging, while the jack-det stuff
likely will need a couple more revisions.

Other then the split there are some minor changes addressing various review
comments, see the individual patch changelogs.

The MFD and ASoC parts can be merged independent from each-other (both must
be merged to get working sound on these boards, but that is only a runtime
dependency and a part missing won't have any bad side-effects). Or the
entire series could be merged through the MFD tree if people prefer that.

Regards,

Hans


