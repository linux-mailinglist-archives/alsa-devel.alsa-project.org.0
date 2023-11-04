Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611D7E0FE2
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Nov 2023 15:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC1E823;
	Sat,  4 Nov 2023 15:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC1E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699107951;
	bh=cJWB87nOyYTPRO4fDffAOWzCQn+1/8jz0SK8FjeR1tI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FbhYGGwOwLARf8wQe+lwNZ5wXQ1HELrPPdDnBZMD5hAPehcmYuf6gwftoVB6eiAiQ
	 JQo/fhwya3ksDw+KUU/0KeVQFbQl/M9S+v3lfq5/UulfhLimW2ScJK0X0aQCPNJykF
	 XIPVzbc+N1X003SPs/Fyo5iVDbgx6eDUSfWuy/vM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2B0F8055B; Sat,  4 Nov 2023 15:25:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B621F80537;
	Sat,  4 Nov 2023 15:25:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7FC4F80557; Sat,  4 Nov 2023 15:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91C16F8003C
	for <alsa-devel@alsa-project.org>; Sat,  4 Nov 2023 15:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C16F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=gLEoGr+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699107886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FjLibaee7ve80/nVwEtTtrHgkP3g0wts6ERGTigb2dQ=;
	b=gLEoGr+aYSMZAQts6ttfZPXKJCGGVz2WJPlHA+uQ03+k0bdRwzjFvoUQNgIK4qfzQHDeI6
	zjSq9dZ13M9fjLSv5FVS6BwjBki3BaF0D7Rh4j6oKipooXo6SuSDU48c1IEYyGY3Up5dc6
	doWvPRq+pageXF4R2Yy0CIrDmgr/Uv4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-VgoU7bdYP6qLLrCfwRo9WQ-1; Sat,
 04 Nov 2023 10:24:44 -0400
X-MC-Unique: VgoU7bdYP6qLLrCfwRo9WQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B44EB380627D;
	Sat,  4 Nov 2023 14:24:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1384B25C0;
	Sat,  4 Nov 2023 14:24:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing
 through ACPI DSM
Date: Sat,  4 Nov 2023 15:24:35 +0100
Message-ID: <20231104142439.21983-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: KIRIZ6XI6GXRH2IUVN2CBEHNQ4DIXVKF
X-Message-ID-Hash: KIRIZ6XI6GXRH2IUVN2CBEHNQ4DIXVKF
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIRIZ6XI6GXRH2IUVN2CBEHNQ4DIXVKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

This takes some of the work done to auto-configure quirks/routing for
ESS83xx codecs by getting the info from ACPI from:
https://github.com/thesofproject/linux/pull/4112

And then builds on top of this to add auto-configuration to
the bytcht_es8316 board driver.

Note compared to the pull-request, which deals with the ES8336, this
series deals with the ES8316 (for which I have several devices to test
on) and this moves all handling from the codec driver to the board
driver where this IMHO belongs.

After this series audio now works properly on a CHT Chuwi Hi12 tablet
without needing to add an extra quirk for that model.

This has also been tested on the following devices, where things
are unchanged from before (the ACPI autoconfiguration gives the
same results as the old defaults) :

Onda V80 plus (CHT)
GP-electronic T701 (BYT)

I also tested this on a Nanote UMPC-01, here the _DSM result
for PLATFORM_SPK_TYPE_ARG wrongly returns 1 (mono) while
the device actually has 2 speakers, so this model needs to keep
its DMI quirk.

Regards,

Hans


Hans de Goede (2):
  ASoC: Intel: bytcht_es8316: Add is_bytcr helper variable
  ASoC: Intel: bytcht_es8316: Determine quirks/routing with codec-dev
    ACPI DSM

Pierre-Louis Bossart (2):
  ASoC: Intel: es83xx: add ACPI DSM helper module
  ASoC: Intel: bytcht_es8316: Dump basic _DSM information

 sound/soc/intel/boards/Kconfig             |   5 +
 sound/soc/intel/boards/Makefile            |   2 +
 sound/soc/intel/boards/bytcht_es8316.c     |  71 +++-
 sound/soc/intel/boards/es83xx-dsm-common.c |  89 +++++
 sound/soc/intel/boards/es83xx-dsm-common.h | 393 +++++++++++++++++++++
 5 files changed, 557 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/intel/boards/es83xx-dsm-common.c
 create mode 100644 sound/soc/intel/boards/es83xx-dsm-common.h

-- 
2.41.0

