Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD79330271
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 16:06:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77D101EF1;
	Sun,  7 Mar 2021 16:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77D101EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615129611;
	bh=sPADAQhJmJJEL0LnHQkuP6XS2Rx1rPEc7dZI1pVdGgU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TaWaHvBZf1pJZ+2f9mSc20dewKZViPhZrx4J7SObRvxp4hkJ9aMPwv+q1gcvFuELJ
	 AyQzPc2yFbSRkbfuzWgkWfoLcrVQULKS/orw0yXCU5PscHfcEnl9CqZNAkojWHWWA1
	 jD8h3qjx0R2eTIuQGpD2SO3adKM2+I7ppJEh2yp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DB5F8025A;
	Sun,  7 Mar 2021 16:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04002F80139; Sun,  7 Mar 2021 16:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22D3EF80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 16:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D3EF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EsDEnSIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615129510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MVpvh/I+r+LfoD5A+8Glawk6nht9twE7tZ8S13Z0ONs=;
 b=EsDEnSIsce0Fmu5xR4ILLZvQQBpGGiPvctTOfY74tuHbVr1lXDZGOrY5lSXCNP8Zq3NtZj
 hCSJu43g8q/c6wHJK6cffMPH+aR8p8NK8h3pBK+RibkQpYQ+YGUsH2OIlytw3E22+5LTA7
 XB6WpwpMA4ht/qthU8O36AxWEG/Aa4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-X8kMlwUwOHWtRMF6lMCIjw-1; Sun, 07 Mar 2021 10:05:08 -0500
X-MC-Unique: X8kMlwUwOHWtRMF6lMCIjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CD881433D;
 Sun,  7 Mar 2021 15:05:06 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDD119D7C;
 Sun,  7 Mar 2021 15:05:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH resend 0/2] AsoC: rt5640/rt5651: Volume control fixes
Date: Sun,  7 Mar 2021 16:05:01 +0100
Message-Id: <20210307150503.34906-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

Here is a resent of the remaining patches from my
"[PATCH 0/5] AsoC: rt5640/rt5651: Volume control fixes" series,
with the controversial "[PATCH 3/5] ASoC: rt5640: Add emulated
'DAC1 Playback Switch' control" patch dropped, and these
remaining 2 patches rebased to still apply with that patch dropped.

Regards,

Hans


Hans de Goede (2):
  ASoC: rt5640: Rename 'Mono DAC Playback Volume' to 'DAC2 Playback
    Volume'
  ASoC: Intel: bytcr_rt5640: Add used AIF to the components string

 sound/soc/codecs/rt5640.c             |  6 +++---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 ++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.30.1

