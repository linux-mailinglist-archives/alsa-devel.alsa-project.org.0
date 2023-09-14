Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD67A0BCF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 19:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66323852;
	Thu, 14 Sep 2023 19:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66323852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694712769;
	bh=Z/3gzOplXRX+9abTKEpoWPKmdr7KQJa8iaK4W0cGTKM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dxy+cnyesX4NHujMxiuGf5wQvpbaOSNbhC9RLwakfDdZYs7Bf+E5o2w6FAdFRyMQw
	 KWSohCl7L317mKxcH5IjXRd44geSyZndRrtZA1mnZQtEJ1ofiD0NFAypkuoPjPt62w
	 rUzfRoXlSIf+Ph7ACv7SnGm/71Mqg7q5cSqnlQoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1CC2F80425; Thu, 14 Sep 2023 19:31:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B48BF80246;
	Thu, 14 Sep 2023 19:31:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4F2F80425; Thu, 14 Sep 2023 19:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C91D5F80212
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 19:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91D5F80212
Received: by m.b4.vu (Postfix, from userid 1000)
	id 7273A604F298; Fri, 15 Sep 2023 03:01:37 +0930 (ACST)
Date: Fri, 15 Sep 2023 03:01:37 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Philippe Perrot <philippe@perrot-net.fr>
Subject: [PATCH 0/4] ALSA: scarlett2: Driver updates
Message-ID: <cover.1694705811.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: QOYIGDNDVD7A4AZAHHVRJ7HKASMFAXQN
X-Message-ID-Hash: QOYIGDNDVD7A4AZAHHVRJ7HKASMFAXQN
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOYIGDNDVD7A4AZAHHVRJ7HKASMFAXQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

I think it's time to enable this driver by default because:

- Early versions of this mixer driver did not work on all hardware, so
  out of caution the driver was disabled by default and had to be
  explicitly enabled with device_setup=1.

- Since commit 764fa6e686e0 ("ALSA: usb-audio: scarlett2: Fix device
  hang with ehci-pci") (21/May/2021) no more problems of this nature
  have been reported.

- Therefore, patch 1 in this series proposes to enable the driver by
  default, but provide a new device_setup option to disable the driver
  in case that is needed.

Patch 3 adds support for the Clarett 8Pre USB. This is the first
device supported by this driver which is controlled identically to
another, so patch 2 first allows sharing the device_info struct
between models.

Patch 4 adds the specific product series name (like "Scarlett Gen 2")
to various messages so the text is correct without being unwieldy &
generic (like "Scarlett Gen 2/3/Clarett USB/Clarett+").

Geoffrey D. Bennett (4):
  ALSA: scarlett2: Default mixer driver to enabled
  ALSA: scarlett2: Move USB IDs out from device_info struct
  ALSA: scarlett2: Add support for Clarett 8Pre USB
  ALSA: scarlett2: Add correct product series name to messages

 sound/usb/mixer_quirks.c        |   1 +
 sound/usb/mixer_scarlett_gen2.c | 148 ++++++++++++++++++--------------
 2 files changed, 83 insertions(+), 66 deletions(-)

-- 
2.41.0

