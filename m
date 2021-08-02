Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA563DDAF4
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9F716DC;
	Mon,  2 Aug 2021 16:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9F716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627914405;
	bh=bdSl2/cEPMLDtEsoqgSQxwB+nsDVOZNNHVnigGBUkgo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rt4lgixuEf5BC9tWWGsSIqSauxYpG77PNUd4xteAUkoV4OMAY6PYSEwPCuEb3QS7B
	 5PoOh/4AfpIrdlxE3/n0py45ra0AEDnprFoR+IFsqOrrs3GaWtIAGoyg/EoHHV/q8b
	 5zfMtZgX9vSX2rpdcFRTVsbhrDfnRJEcuyGGV9Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF67F8025F;
	Mon,  2 Aug 2021 16:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F3EF8025F; Mon,  2 Aug 2021 16:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FAB5F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAB5F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cfHMPYrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627914310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beIOn7aC4F2vu0MuXEu6aMFgKFQns6oXTTw2fbqieqU=;
 b=cfHMPYrcJ91gbzaKmy9zdEtPl8ia5Q6ZabmMg6dGvTU9oaDmB+q8bYFS1aQ9uv33j3p9ur
 OVzKsJc6mewrPrniF+h+tmry+hLtISIbYGdue16hp8E/sgOlmiLDzem3oLnV7zVIDvWoCE
 ZPIrdVMVih8jyDOz2wpeXvk+7FdWJ2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-avgmhGK9PKeq_UnUSqYECg-1; Mon, 02 Aug 2021 10:25:09 -0400
X-MC-Unique: avgmhGK9PKeq_UnUSqYECg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5DE1006C88;
 Mon,  2 Aug 2021 14:25:07 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A464660C9D;
 Mon,  2 Aug 2021 14:25:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/6] ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2
 audio routing
Date: Mon,  2 Aug 2021 16:24:55 +0200
Message-Id: <20210802142501.991985-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Changes in v2:
- Only set lineout_string if BYT_RT5640_LINEOUT is set, since
  BYT_RT5640_LINEOUT_AS_HP2 only works if the lineout is enabled in
  the first place

Original cover-letter:

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

 sound/soc/intel/boards/bytcr_rt5640.c | 118 ++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 16 deletions(-)

-- 
2.31.1

