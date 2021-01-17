Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B762F93B5
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 16:49:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65DBE1735;
	Sun, 17 Jan 2021 16:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65DBE1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610898548;
	bh=QiBlg/LRTf+7zZ0Dh7vt02GWJNSjL1FrHu3EJ+bfA0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CHwO0UWyuK7O03Z7YhTwZHL2U4OYb6xWhKuTybTgifYdDqAODE2Fy+PYsL7FR7c8G
	 GWx7VbYEemhEaScl+2gkykF5GjGUlrdzJNt0eT7M7PQXUTL+Tlhwj7UTsDkbq4oIyV
	 uJ9pj98yyxeiPMa5urlSYh3tXlAhQXaiFYU3ofCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16BDBF80272;
	Sun, 17 Jan 2021 16:47:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99239F8026A; Sun, 17 Jan 2021 16:47:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 991A3F80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 16:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991A3F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OFT6nbtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610898445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QiBlg/LRTf+7zZ0Dh7vt02GWJNSjL1FrHu3EJ+bfA0o=;
 b=OFT6nbtwShU9Xsz1KvdC3eCpFVuKts2v+wvsQWZWc8K3maMQeTlDbfYwEMUUX36iwGyUPG
 91nz9I50iO+0S1kzFIPAuRrKjwGcuGfaW10thviSKeq9CX38vwonenC9iIFVg75hJdrKSv
 W9VhTN00vz9v0bNH1b/eJ3r14+xwnY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-7auhgNBcPMSsYKnq8EkRJw-1; Sun, 17 Jan 2021 10:47:23 -0500
X-MC-Unique: 7auhgNBcPMSsYKnq8EkRJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8651005D60;
 Sun, 17 Jan 2021 15:47:21 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1FA19C44;
 Sun, 17 Jan 2021 15:47:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/5] MFD/ASoC: Add support for Intel Bay Trail boards with
 WM5102 codec
Date: Sun, 17 Jan 2021 16:47:12 +0100
Message-Id: <20210117154717.77969-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Here is v2 of my series to add support for Intel Bay Trail based devices
which use a WM5102 codec for audio output/input. This was developed and
tested on a Lenovo Yoga Tablet 1051L.

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

