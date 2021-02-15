Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD92631BAE8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:23:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B1615E0;
	Mon, 15 Feb 2021 15:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B1615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399015;
	bh=3dek+m/kb4CHtQpib3Sjw2d9XGdjQEIHFLzgnpsUw44=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u6mSQ4oA69BvnGGbiGCdr5u4qUwW4pvF6gBbd/w1Yu3KGgEg5+PhL9TAk2VuPZRRz
	 iTi0FS6+3H+oizVVJjcl43nvG4qyI9pKdMVItyitiCrx7/uK3Fo/EifHr4ElfY6u+J
	 yArU07wVA+H9a2enu1WlA/GozPF617W3cBCeZSr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A68F800C1;
	Mon, 15 Feb 2021 15:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B622AF80268; Mon, 15 Feb 2021 15:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D77F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D77F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DmDQGU3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ikRXlJGliLU/7IxNvAcRF47EmiREHfEkN3hCNa3RQs=;
 b=DmDQGU3hBdNZSabJGfXZy9tXR4v2MSjQEomDliNRNJ28eFGKbUKN52dKXRWq27bndj6cwz
 je97RwMxfck5KZrgj+r097TvHQwb3ZWlDUrwPcPQfTVwTPdnmBd0A3i7APXrzj9d4zMG8T
 T/NAmUcueFU5EK5LNF7+gmCiAZEF6S4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-R990HCuSPBW6MuAaa7f-Nw-1; Mon, 15 Feb 2021 09:21:24 -0500
X-MC-Unique: R990HCuSPBW6MuAaa7f-Nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8133B107ACC7;
 Mon, 15 Feb 2021 14:21:22 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E33095D9CC;
 Mon, 15 Feb 2021 14:21:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 0/4] ASoC: rt5670: Various kcontrol fixes
Date: Mon, 15 Feb 2021 15:21:14 +0100
Message-Id: <20210215142118.308516-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bard.liao@intel.com>
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

While working on adding hardware-volume control support to the UCM
profile for the rt5672 and on adding LED trigger support to the
rt5670 codec driver. I hit / noticed a couple of issues this series
fixes these issues.

Regards,

Hans


Hans de Goede (4):
  ASoC: rt5670: Remove 'OUT Channel Switch' control
  ASoC: rt5670: Remove 'HP Playback Switch' control
  ASoC: rt5670: Remove ADC vol-ctrl mute bits poking from Sto1 ADC mixer
    settings
  ASoC: rt5670: Add emulated 'DAC1 Playback Switch' control

 sound/soc/codecs/rt5670.c | 110 +++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/rt5670.h |   9 ++--
 2 files changed, 101 insertions(+), 18 deletions(-)

-- 
2.30.1

