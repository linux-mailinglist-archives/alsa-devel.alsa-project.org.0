Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3F486362
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D661878;
	Thu,  6 Jan 2022 12:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D661878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467007;
	bh=uhxIsfbgIKn8/IGo/+ldQ4u9+5aNAuUcESg7h08AJ24=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oHVjKCTggJItZ2QFcAg50Ma3iXRvwZURCTyzqh2hhGcvN5JQERKJJK3UjGROwBeZv
	 N0Wf3n/kDIBuRX/SaMSX3fN3WNXbpu1+qX9zdRVzY4T035V5maw0PopPKP2WQvuBoU
	 +OG8s4iFIxiNt75jagXOagoRjvwicLpzZITK8OV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E0CF804FA;
	Thu,  6 Jan 2022 12:01:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD1BF80161; Thu,  6 Jan 2022 12:01:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC367F80155
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC367F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fQzz04w8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KC1OCZZHUf03AEoZ1lwy96hV43haOFe5Zg4IAoX9q1Y=;
 b=fQzz04w8t+JoTzq5LVA+D7m8n2PQCzQdhpJh8B3jfrxn65q/gKv0sIgHM8dSuMjQN7LoV8
 l2vzYrVfmHhUYfg7XtrR10zcChP7jj6iCNWAcGAHtX/wTv69vjvJmw0eNg9Prh/57Nzamd
 k/8FYb+Uw77FO2HwhnYGO80uULDl3Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-4fDIvHk4PHeIUsRS6BT8LQ-1; Thu, 06 Jan 2022 06:01:33 -0500
X-MC-Unique: 4fDIvHk4PHeIUsRS6BT8LQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E509D18C8C00;
 Thu,  6 Jan 2022 11:01:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 814EF7E12C;
 Thu,  6 Jan 2022 11:01:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/6] ASoC: rt5640: 1 Bugfix + Add support for external GPIO
 jack-detect
Date: Thu,  6 Jan 2022 12:01:22 +0100
Message-Id: <20220106110128.66049-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Bard Liao <bard.liao@intel.com>
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

Here is v2 of my series to fix jack-detect not working on some x86 Bay
Trail devices. Now rebased on top of the latest broonie/sound.git/for-next.

New this version is a bug-fix for an issue which I noticed in the current
broonie/sound.git/for-next (patch 1 of the series).

Since this fixes a NULL-ptr deref in current for-next patch 1 should be
included into a pull-req for 5.17.

The rest of the series can go to either 5.17 or 5.18.

Regards,

Hans


Hans de Goede (6):
  ASoC: rt5640: Fix possible NULL pointer deref on resume
  ASoC: rt5640: Change jack_work to a delayed_work
  ASoC: rt5640: Allow snd_soc_component_set_jack() to override the codec
    IRQ
  ASoC: rt5640: Add support for boards with an external jack-detect GPIO
  ASoC: Intel: bytcr_rt5640: Support retrieving the codec IRQ from the
    AMCR0F28 ACPI dev
  ASoC: Intel: bytcr_rt5640: Add support for external GPIO jack-detect

 sound/soc/codecs/rt5640.c             | 71 +++++++++++++++++-----
 sound/soc/codecs/rt5640.h             | 11 +++-
 sound/soc/intel/boards/bytcr_rt5640.c | 86 +++++++++++++++++++++++++--
 3 files changed, 146 insertions(+), 22 deletions(-)

-- 
2.33.1

