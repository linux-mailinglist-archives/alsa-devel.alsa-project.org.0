Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F82431FD8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDC71779;
	Mon, 18 Oct 2021 16:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDC71779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634567701;
	bh=1GKyIvIQDQkAjukrqwX2R+JnnwwRi4E5ihRdhc1aWT0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DRDAjFgnqOD34tXp9Zu8cZIq3/XLBhsP61HuUSJ9jQXiFf/G9b1b1X2jvq+vw7l9S
	 FCp8iM4SUB/dT4BKAqHRU5efjfJu924ZNNxdVKb1iy9cUxBlokBZlq+5+4ZMFWosaB
	 jcs+okz3rfX7NZeArVJdAoVdzGvBSiLdN20jukqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53492F802DF;
	Mon, 18 Oct 2021 16:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C8ACF80111; Mon, 18 Oct 2021 16:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6BCCF80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6BCCF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Mz2XcuS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634567616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zX7HGUsCfiKjj+VA4N3UsOYAYrUUNC8LJO4AASrIqXk=;
 b=Mz2XcuS/Kb4V/LJ17mAyDYCSU3n7JwOHQ91mnJPIZGJVMzutE0Y/muRu5DDF2zfGhwy9ZX
 PuJK0uEqG5sIKQ+MJjY3H3PxfWFkHM6N2Fv+4dcZHwRnWRbNiISM86btkrFT9aiIcnymod
 YVj5cmeJH6WWEb/uGxO/qr/OeS7OQR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-iRruZ8zyOyCALMFvMuOiqg-1; Mon, 18 Oct 2021 10:33:30 -0400
X-MC-Unique: iRruZ8zyOyCALMFvMuOiqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0A4101B4A0;
 Mon, 18 Oct 2021 14:33:28 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7A6C100E809;
 Mon, 18 Oct 2021 14:33:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*()
 helpers
Date: Mon, 18 Oct 2021 16:33:21 +0200
Message-Id: <20211018143324.296961-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
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

We have been open-coding x86_match_cpu() checks for enabling some
SoC specific behavior in various places.

The sound/soc/intel drivers used to also open-code this but this was
cleaned up a while ago introducing a number of soc_intel_is_*() helpers.

This series moves the definition of these helpers to a more public place
and uses it in a couple of more places outside the sound tree.

Mark, I know we are a bit late in the cycle, but if you can pick up
patch 1/3 (assuming on one objects) for 5.16, then the rest can be
applied after 5.16-rc1 is out.

Regards,

Hans


Hans de Goede (3):
  ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
  platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
    helpers
  Input: axp20x-pek - Use new soc_intel_is_cht() helper

 drivers/input/misc/axp20x-pek.c            | 26 ++-------
 drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
 include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
 sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
 4 files changed, 75 insertions(+), 81 deletions(-)
 create mode 100644 include/linux/platform_data/x86/soc.h

-- 
2.31.1

