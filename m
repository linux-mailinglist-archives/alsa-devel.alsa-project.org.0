Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DB41FE38
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 23:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3BEA168A;
	Sat,  2 Oct 2021 23:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3BEA168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633209393;
	bh=dWy9kz+zpssawsp+27m2RbsKM7MUC6yclwrtJkkfNy8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CIdBnsBSSvIwAmnyXz/82/nsuhxL70G/2OUSJOVzIAreM0Vwx8NXkvTih7jZ8bOkM
	 K3LSXxU97zPQ52pUkMw9rjIOz/PpJ4l48f/uNyrrw7iwzR/FuZBEx1kkc9GIqat06j
	 ZT2G1OcrxqjadzQN8gvYYSpvFyAnk8znl4p7GMRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C3CF800D8;
	Sat,  2 Oct 2021 23:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08315F804BC; Sat,  2 Oct 2021 23:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D5CF800D8
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 23:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D5CF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="e2fuCl2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633209306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XWWVhLhA6ufXVCMx8Wc6ZsJlOeUN/hutt2bi6gLAjIQ=;
 b=e2fuCl2aFGx2cRSVVZKMneZGAI/uzywM8N5Z+WjyP0ApaaaY2G7IANIoifkb/Y8M1TFI/w
 qlGCIzLmyvRQx2AH32Jga6400EnzZQ0CsMc1ASKiDDtxng/PnbrbtePCuMKtO6wWtGb3w8
 F6LWGdPjYzImw7Mvt0hjzivHJjnNcJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-N7vMoBJfMR2xo0oRIA_xCQ-1; Sat, 02 Oct 2021 17:15:05 -0400
X-MC-Unique: N7vMoBJfMR2xo0oRIA_xCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36801180830B;
 Sat,  2 Oct 2021 21:15:04 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CF115C1CF;
 Sat,  2 Oct 2021 21:15:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: nau8824: Fix NAU8824_JACK_LOGIC define
Date: Sat,  2 Oct 2021 23:14:56 +0200
Message-Id: <20211002211459.110124-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The NAU8824_JACK_LOGIC define was wrong, for active high jack-detect
to work bit 1 needs to be set, rather then bit 0.

The correct bit was found in the Android kernel source dump for
a Cyberbook T116 tablet; and this was also tested on that same tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/nau8824.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
index 1d7bdd8e0523..6e61405f623b 100644
--- a/sound/soc/codecs/nau8824.h
+++ b/sound/soc/codecs/nau8824.h
@@ -197,7 +197,7 @@
 /* JACK_DET_CTRL (0x0D) */
 #define NAU8824_JACK_EJECT_DT_SFT	2
 #define NAU8824_JACK_EJECT_DT_MASK (0x3 << NAU8824_JACK_EJECT_DT_SFT)
-#define NAU8824_JACK_LOGIC		0x1
+#define NAU8824_JACK_LOGIC		(0x1 << 1)
 
 
 /* INTERRUPT_SETTING_1 (0x0F) */
-- 
2.31.1

