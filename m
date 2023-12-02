Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D1801CD2
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Dec 2023 14:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCFBDF3;
	Sat,  2 Dec 2023 14:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCFBDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701522143;
	bh=pomtRmFR8I4ujqlK0gRPBuLMGcF3R7GDwM7/i8p2YRo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ESThzvyBY44aX/IFze9EP4cpacP/Gzpvhj5scYJbhBxaWjFupRtbmoTrv5MHLZnv9
	 d0ZZsG3qZDd3d5WEuNatHPTCx8pMdOD35feWMUFmFNZqLRCt+FVcv2RZUva5UJSAdV
	 Ywb9FUuwCnPQRjiYtnew/7jtO6WI+TXYyQXc83Ss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7052F8057C; Sat,  2 Dec 2023 14:01:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB577F80570;
	Sat,  2 Dec 2023 14:01:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C192F80104; Sat,  2 Dec 2023 13:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85244F80104
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 13:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85244F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AFpdhqV5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701520801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jYIjP1tv31I8bjNFhnLugsRB0qNs3sNqCxwdk1gxsOc=;
	b=AFpdhqV54ICVGP56+ct0BK99QtW+wCBO95hvVnyvT0m9NX6YOOhDesopdSxSC5QQVhCNAX
	NuLPPPp3XVTDdBJkMPYkRY3B99f0pXSWh2fOLlV0mqvdWhXZi1QmOvgYh1iMuCjtRVCXRM
	s1v+KpG3zwxlCM9Jo2bclrXnfGe7Yn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-1dnlarr6PVOJ5VYb46kZaQ-1; Sat, 02 Dec 2023 07:39:58 -0500
X-MC-Unique: 1dnlarr6PVOJ5VYb46kZaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FE5B8314F8;
	Sat,  2 Dec 2023 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E8F92026D4C;
	Sat,  2 Dec 2023 12:39:55 +0000 (UTC)
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
Subject: [PATCH v2 0/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing
 through ACPI DSM
Date: Sat,  2 Dec 2023 13:39:42 +0100
Message-ID: <20231202123946.54347-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: CRUW6YARO7JTZVDNM7SE4T6SITOZMY4Q
X-Message-ID-Hash: CRUW6YARO7JTZVDNM7SE4T6SITOZMY4Q
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRUW6YARO7JTZVDNM7SE4T6SITOZMY4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

This takes some of the work done to auto-configure quirks/routing
for ESS83xx codecs by getting the info from ACPI from:
https://github.com/thesofproject/linux/pull/4112

And then builds on top of this to add auto-configuration to
the bytcht_es8316 board driver.

Changes in v2:
- Move es83xx-dsm-common.c back to sound/soc/codecs like the original
  version from: https://github.com/thesofproject/linux/pull/4112/

Note compared to the pull-request, which deals with the ES8336, this
series deals with the ES8316 (for which I have several devices to test
on) and this moves handling of the _DSM from the codec driver to
the board driver since with the ES8316 the board driver takes
care of setting up various routes for things like the mic and
speakers.

After this series audio now works properly on a CHT Chuwi Hi12
tablet without needing to add an extra quirk for that model.

This has also been tested on the following devices, where things
are unchanged from before (the ACPI autoconfiguration gives the
same results as the old defaults) :

Onda V80 plus (CHT)
GP-electronic T701 (BYT)

I also tested this on a Nanote UMPC-01, here the _DSM result
for PLATFORM_SPK_TYPE_ARG wrongly returns 1 (mono) while
the device actually has 2 speakers, so this model needs to keep
its DMI quirk.

I don't have an IRBIS NB41 nor a TECLAST X98 Plus II,
so the DMI quirks for those are left in place too on
a better safe then sorry basis.

Regards,

Hans


Hans de Goede (2):
  ASoC: Intel: bytcht_es8316: Add is_bytcr helper variable
  ASoC: Intel: bytcht_es8316: Determine quirks/routing with codec-dev
    ACPI DSM

Pierre-Louis Bossart (2):
  ASoC: es83xx: add ACPI DSM helper module
  ASoC: Intel: bytcht_es8316: Dump basic _DSM information

 sound/soc/codecs/Kconfig               |   4 +
 sound/soc/codecs/Makefile              |   2 +
 sound/soc/codecs/es83xx-dsm-common.c   |  89 ++++++
 sound/soc/codecs/es83xx-dsm-common.h   | 393 +++++++++++++++++++++++++
 sound/soc/intel/boards/Kconfig         |   1 +
 sound/soc/intel/boards/bytcht_es8316.c |  71 ++++-
 6 files changed, 557 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/codecs/es83xx-dsm-common.c
 create mode 100644 sound/soc/codecs/es83xx-dsm-common.h

-- 
2.41.0

