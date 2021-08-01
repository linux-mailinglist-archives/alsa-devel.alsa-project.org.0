Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74C3DCDD9
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4B917E7;
	Sun,  1 Aug 2021 23:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4B917E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627851974;
	bh=ujgaP/Iur+ipjFptpDUGI9mNQAWGVcwvDvl8qDYE6/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uRcSYbZXbu2nuTZTxUcVyCrJWMcWD9iAlw3MdKPFw9J1ffiNUo9KGE8mc8B9LFQU5
	 Bqk6qoGw+owHyV4R6NSrFlV3DSEJAnpHUYILdgLSOltEA+ELe9upA6es8RLOVdagjG
	 jyDhoSP45bURle6KEcJpilZzCbk7RucoDum6GWOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA617F8016D;
	Sun,  1 Aug 2021 23:04:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 295BAF8032C; Sun,  1 Aug 2021 23:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 080A1F8014D
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080A1F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HqFo/GI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yOr6tcmXRQp/nRfKFU6oDZTbs5/c58j1zvHc+VJFHDU=;
 b=HqFo/GI3twjWRE1yLAxnF8OZIOzuPmlhVZNzACRyu9lOH65BViypPB4URf5+kDQb3L0SuX
 Yq6HrYzQNI6C5R8eXcjgj22diXXpolfNtkIERwyXZ3elvz5E38H9NbjgxwhSdarn2cMYYL
 QaXKqEvaorzirtNvtlkF6zzUPev1jbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-n8PTwUkKOB-Eykq4GFv7sg-1; Sun, 01 Aug 2021 17:04:36 -0400
X-MC-Unique: n8PTwUkKOB-Eykq4GFv7sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB49F34820;
 Sun,  1 Aug 2021 21:04:34 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35456608BA;
 Sun,  1 Aug 2021 21:04:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/6] ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 audio
 routing
Date: Sun,  1 Aug 2021 23:04:25 +0200
Message-Id: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

The HP Elitepad 1000 G2 has 2 headset jacks:

1. on the dock which uses the output of the codecs built-in HP-amp +
the standard IN2 input which is always used with the headset-jack.

2. on the tablet itself, this uses the line-out of the codec, combined
with an external HP-amp + IN1 for the headset-mic.

This series adds support for this, resolving:
https://bugzilla.kernel.org/show_bug.cgi?id=213415

Note this series does not add jack-detect support. I plan to add that
with a follow-up series when I can make some time to implement that.

Regards,

Hans


Hans de Goede (6):
  ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes to the maps
    for the matching in-/output
  ASoC: Intel: bytcr_rt5640: Add line-out support
  ASoC: Intel: bytcr_rt5640: Add a byt_rt5640_get_codec_dai() helper
  ASoC: Intel: bytcr_rt5640: Add support for a second headphones output
  ASoC: Intel: bytcr_rt5640: Add support for a second headset mic input
  ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 quirk

 sound/soc/intel/boards/bytcr_rt5640.c | 116 ++++++++++++++++++++++----
 1 file changed, 100 insertions(+), 16 deletions(-)

-- 
2.31.1

