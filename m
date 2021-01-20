Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824A2FC5F3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:38:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0EAE18D3;
	Wed, 20 Jan 2021 01:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0EAE18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611103128;
	bh=pv+rOrDxyJHGyoqG5R8Xorygzi2EgiAT8Ni0zDlL/F0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RgiXU7KxmydAM/raXDKYJEZB+W/iD4piz2ZDIOK0N9Zx7xvqBCGUStKhJ4d9+LSY2
	 DxgD7bdYKrSqW69IgBJNug0icteH0cECFgsS4P4bsA3SNgsuAZxD4qjga0piue/kRZ
	 5AIrxkDEU6cCde79asUEqAI3x3y3+KqMCr/4/95c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92813F80272;
	Wed, 20 Jan 2021 01:37:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC6B4F80273; Wed, 20 Jan 2021 01:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB5AF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB5AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="mkyAGhl2"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 7EA2AA13B0;
 Wed, 20 Jan 2021 01:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:message-id:mime-version:reply-to:subject:subject
 :to:to; s=srmailgate02; bh=g3peVLu/aEuE3zFN78uiHYXZs/lCyoR9D8SzT
 duAw8k=; b=mkyAGhl2jWeIn8aNb2TP5Oss8ufW4W6HuAgCnNCr52wtQe6hCk7Uy
 UN+7gIj3g6rJ4rJtak9LTd/DdfJ2tMOMGIGnnmAMs7JcwiobToyTL7jueJTw/AG/
 WXWL1HmD2MYs3SdbRT6l7NkdNAZWCdjsQSvcnEEhfEo7VX4PErCdCW7L4BPdoU3E
 9vtgkwxnOJIt3B0dwAEE2RZxRyVFdWuqHNHstVuI2b6+qMOO9UF7+8NXsSaCqDmg
 kx7o+Yc5678s8egVNx9eqbHB63YxyaNW5PeRfuMTghWEFPkakGtFi5dD5jEJQlm4
 f3dp2nRG+cnTlUq7St2vk3ZarHWvZ96Ng==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH 0/7] ALSA: add virtio sound driver
Date: Wed, 20 Jan 2021 01:36:28 +0100
Message-ID: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

This series implements a driver part of the virtio sound device
specification v8 [1].

The driver supports PCM playback and capture substreams, jack and
channel map controls. A message-based transport is used to write/read
PCM frames to/from a device.

The series is based (and was actually tested) on Linus's master
branch [2], on top of

commit 1e2a199f6ccd ("Merge tag 'spi-fix-v5.11-rc4' of ...")

As a device part was used OpenSynergy proprietary implementation.

Any comments are very welcome.

[1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git


Anton Yakovlev (7):
  uapi: virtio_ids: add a sound device type ID from OASIS spec
  uapi: virtio_snd: add the sound device header file
  ALSA: virtio: add virtio sound driver
  ALSA: virtio: handling control and I/O messages for the PCM device
  ALSA: virtio: PCM substream operators
  ALSA: virtio: introduce jack support
  ALSA: virtio: introduce device suspend/resume support

 MAINTAINERS                     |   8 +
 include/uapi/linux/virtio_ids.h |   1 +
 include/uapi/linux/virtio_snd.h | 361 +++++++++++++++++++
 sound/Kconfig                   |   2 +
 sound/Makefile                  |   3 +-
 sound/virtio/Kconfig            |  10 +
 sound/virtio/Makefile           |  13 +
 sound/virtio/virtio_card.c      | 593 ++++++++++++++++++++++++++++++++
 sound/virtio/virtio_card.h      | 121 +++++++
 sound/virtio/virtio_chmap.c     | 237 +++++++++++++
 sound/virtio/virtio_ctl_msg.c   | 293 ++++++++++++++++
 sound/virtio/virtio_ctl_msg.h   | 122 +++++++
 sound/virtio/virtio_jack.c      | 255 ++++++++++++++
 sound/virtio/virtio_pcm.c       | 582 +++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h       | 132 +++++++
 sound/virtio/virtio_pcm_msg.c   | 317 +++++++++++++++++
 sound/virtio/virtio_pcm_ops.c   | 524 ++++++++++++++++++++++++++++
 17 files changed, 3573 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/virtio_snd.h
 create mode 100644 sound/virtio/Kconfig
 create mode 100644 sound/virtio/Makefile
 create mode 100644 sound/virtio/virtio_card.c
 create mode 100644 sound/virtio/virtio_card.h
 create mode 100644 sound/virtio/virtio_chmap.c
 create mode 100644 sound/virtio/virtio_ctl_msg.c
 create mode 100644 sound/virtio/virtio_ctl_msg.h
 create mode 100644 sound/virtio/virtio_jack.c
 create mode 100644 sound/virtio/virtio_pcm.c
 create mode 100644 sound/virtio/virtio_pcm.h
 create mode 100644 sound/virtio/virtio_pcm_msg.c
 create mode 100644 sound/virtio/virtio_pcm_ops.c

-- 
2.30.0


