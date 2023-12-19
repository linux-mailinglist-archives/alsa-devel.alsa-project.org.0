Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434B818E42
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:37:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DADAE9;
	Tue, 19 Dec 2023 18:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DADAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007424;
	bh=e/UNKbPhTi5ST9qlQ0Xv12lypg48PBIM/GFa+gI/EHM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M1voCS+0Hg2VS9KVSOCM3NmL56F7JjSb6T8BH4fRH3SjtyLAES+LJ8cRl+MkETEF7
	 0KyPfk14PrnLeJR60R56RD82Bf1GunIB0LAlAbiKtTPlgk1DJ2MzYsjwObY/c1H3m7
	 KTf/qW1n3nWd3sQK2CHcenBf40/F5UzcXmCINBEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 726F4F8059F; Tue, 19 Dec 2023 18:36:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE9DF8057A;
	Tue, 19 Dec 2023 18:36:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 930DAF80425; Tue, 19 Dec 2023 18:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 805D6F800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805D6F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=TZEGIu7Q
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6B491604B9CB; Wed, 20 Dec 2023 04:06:04 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6B491604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007364; bh=4eLcQ5V9ALrS4VsOP0meqfbpIaC59gpIW/vF7BsylRo=;
	h=Date:From:To:Cc:Subject:From;
	b=TZEGIu7QRR7qyDsBr5xd4II5i+QTlRwpvjMZJ5rD1upmsbGH3WfLageloC7yGh7q2
	 BZlSV2LOumC2FZnYq/odMV6rlCKNHewns9cVSFTb+Ldeu4dQzw5JNPNi6MZzaoS6TI
	 94s55hFAgQcVQ37/Yrb5WlMYz7plnSp9jHaWIYh1QMFGeqhJM05SBfr7gDbwUTuacb
	 V6c04cO9xXYZlkx1pjr5DuCkgg52Qfj5epJEcl0F3uYGJdYto21qInaN/GmLa0E7Jn
	 jXOHgNyOVth0FbnAky2iEN2wr3+LQdNshxEnNwb5E6I9ZHq5kSxthlidmDDAYAnjtJ
	 5wSKFNkwLu5Tg==
Date: Wed, 20 Dec 2023 04:06:04 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 00/11] ALSA: scarlett2: Firmware Upgrade and Error Handling
 Improvements
Message-ID: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: UCBMEMGRFXFA2AK353LPWOGSEIT3QL7C
X-Message-ID-Hash: UCBMEMGRFXFA2AK353LPWOGSEIT3QL7C
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCBMEMGRFXFA2AK353LPWOGSEIT3QL7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

11 patches to improve error handling and add firmware upgrade support
to the scarlett2 driver. The notes below incorporate your feedback &
include answers to your questions in response to my previous RFC v2
email.

Patch 1 adds GitHub links for the repo where I share this code before
submission here, and for issue reporting.

Patches 2-5 add missing error/bounds checks.

Patch 6 adds a missing lock.

Patches 7-11 add support for firmware upgrades.

The usage of the hwdep interface is as per my previous proposal:

- ioctl pversion to check the protocol version
- ioctl select_flash_segment SCARLETT2_SEGMENT_ID_SETTINGS
- ioctl erase_flash_segment
- ioctl get_erase_progress (optional)
- ioctl select_flash_segment SCARLETT2_SEGMENT_ID_FIRMWARE
- ioctl erase_flash_segment
- ioctl get_erase_progress (optional)
- write() the firmware
- ioctl reboot

Notes on the hwdep interface:

- Conflicting mixer operations are denied with EBUSY.

- The hwdep interface is marked as exclusive so there can't be
  conflicting hwdep operations.

- Invalid sequences of operations (e.g. erase before select, write
  before erase) return an error.

- The erase operation is asynchronous, and the progress can optionally
  be monitored by calling get_erase_progress.

- If the erase progress is not monitored then subsequent hwdep
  operations will wait until the erase is complete.

- The write operation is synchronous, but <1KB can be written per
  call, and it returns very quickly. On the user-side it looks like
  this with error checking omitted:

  while (offset < len)
    offset += snd_hwdep_write(hwdep, buf + offset, len - offset);

- By using a subset of the firmware-upgrade steps, other useful
  high-level operations can be performed: reset-to-factory-defaults,
  reset-to-factory-firmware, or just reboot.

- I considered combining the select and erase operations, but that
  would prevent a future read-flash operation if that ever become
  possible.

- I considered separate one-shot ioctls for reset-to-factory, etc.,
  but that prevents providing progress feedback.

- In case the purpose of the other firmware segments is discovered in
  the future, this implementation would be able to support
  erase/write/read of them with minimal changes.

Here is a user-space implementation of all of the above:
https://github.com/geoffreybennett/scarlett2

This has been tested by me on every supported Scarlett 2nd, 3rd, 4th
Gen and Clarett+ device, and tested by a handful of others on their
Scarlett 4th Gen devices.

Thanks,
Geoffrey.

Geoffrey D. Bennett (11):
  ALSA: scarlett2: Update maintainer info
  ALSA: scarlett2: Add missing error check to scarlett2_config_save()
  ALSA: scarlett2: Add missing error check to scarlett2_usb_set_config()
  ALSA: scarlett2: Add missing error checks to *_ctl_get()
  ALSA: scarlett2: Add clamp() in scarlett2_mixer_ctl_put()
  ALSA: scarlett2: Add missing mutex lock around get meter levels
  ALSA: scarlett2: Add #defines for firmware upgrade
  ALSA: scarlett2: Retrieve useful flash segment numbers
  ALSA: scarlett2: Add skeleton hwdep/ioctl interface
  ALSA: scarlett2: Add ioctl commands to erase flash segments
  ALSA: scarlett2: Add support for uploading new firmware

 MAINTAINERS                    |   7 +-
 include/uapi/sound/scarlett2.h |  54 ++
 sound/usb/mixer_scarlett2.c    | 914 ++++++++++++++++++++++++++++++---
 3 files changed, 901 insertions(+), 74 deletions(-)
 create mode 100644 include/uapi/sound/scarlett2.h

-- 
2.43.0

