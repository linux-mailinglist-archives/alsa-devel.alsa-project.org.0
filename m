Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54514A7787
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 19:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330A91755;
	Wed,  2 Feb 2022 19:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330A91755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643825315;
	bh=Wc4WAWLoRpMqsE3UzQvYDSJkXKyuTIAa5yNsYl2WkB4=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fvbWdCJia4tOqmsWARZVxl7eyokKxGadZbQSF58CL6AXxUZ8KolrgyfXwTcXUY+75
	 m6wWCoiGjj4225nz8gwJEUkSzIE8YIHYF0zLXJAU7Bt8td/CPYUsUWXkGlAtgHLWNA
	 3SIpMyaKUnxLFA6bDQXgKlS4ZTnBA9scpGm9WSB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD75F804B1;
	Wed,  2 Feb 2022 19:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AD7F804B0; Wed,  2 Feb 2022 19:07:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBDCBF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 19:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDCBF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ijXKeIqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643825240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m3aJbLwpYHN269fbcuY9B5J6QMlrbznLlNBdaK07iJY=;
 b=ijXKeIqiMPjlyBPA+h635le6G4Dw47pV1JIetqOqrexblJlmkdkLWZz5ikQDAqKCvyyGQe
 XFHoqPZ91EEryH7GBxzffwA4zDqR8VbaE9s9p4JAyCpJN5X7D4DPVYD9g8mz3hqGi258wE
 1NiSIdzxRtrIgF/buz2r+UYPgsujLdg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-Ksvl33-sNfyY4jOetgJucQ-1; Wed, 02 Feb 2022 13:07:19 -0500
X-MC-Unique: Ksvl33-sNfyY4jOetgJucQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 q3-20020a17090676c300b006a9453c33b0so10235ejn.13
 for <alsa-devel@alsa-project.org>; Wed, 02 Feb 2022 10:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:cc:content-transfer-encoding;
 bh=m3aJbLwpYHN269fbcuY9B5J6QMlrbznLlNBdaK07iJY=;
 b=1X/sXVeA5qIlrVZwbvCoQLqJtBHeMPFHU7ooBkbsllu92rOV4bnQOgYRV6zmyOf5Ro
 QZeAlytG6Rdzo411vPtBKHZK7MTdjnvCOAzv4ajxnV2moC3R3hxOSVHxbsmeiY+CTWyG
 7PZw7rRl90F7Hgh+APiLIClu1QVkYY9Jj86FVwlvtLSAxA+quLt5WFibnKZFolkOtwkz
 3Y80aKr2vI1WacCjp1sB7oqehdLxOzugO8nzbPMGFU7rQbHAma98MoIm7l1DMiyhQN7X
 k7yYxEfgWcN0qJrn9xoXkTvk4vLqghFl46AXYwYEOO08ro3W2t4RghVd5LJIwQtFUvbA
 nvgQ==
X-Gm-Message-State: AOAM531UGIjc9CvLa+Q1aK1SWuWXecm7L5DnTT2S3GLyzel2/vgwUcrE
 0EhLr4tUsTu+zjIe3PW34rAlciLO1UjVI3NwOONCrMUfPMc+89M4dOWf1sxlgFojv5GdyE+YIWR
 kg4EgNly7WkY2ut74qTWs0/g=
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr31423363edw.140.1643825237844; 
 Wed, 02 Feb 2022 10:07:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweD3gxij9jg7L3yrFZZFg9hltu+qep/l9q69NHRkppYMewyNPwVAu1zpXVSRoramDOs2xfJw==
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr31423346edw.140.1643825237668; 
 Wed, 02 Feb 2022 10:07:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id y5sm21774349edw.45.2022.02.02.10.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 10:07:17 -0800 (PST)
Message-ID: <2062f567-9756-1e13-bb50-89c7211955fd@redhat.com>
Date: Wed, 2 Feb 2022 19:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Takashi Iwai <tiwai@suse.de>, "Rafael J . Wysocki" <rafael@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch with spi in i2c-multi-instantiate changes
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
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

Hi Takashi, Rafael,

As discussed here is a pull-req for an immutable branch with all the changes
from the "[PATCH v6 0/9] Support Spi in i2c-multi-instantiate driver"
series, including one ALSA change, in case you want to merge this to
avoid conflicts.

Regards,

Hans


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-serial-multi-instantiate-1

for you to fetch changes up to d9c01c530cc5e3b6d5bdfeae12c3d0f33fae7498:

  ACPI / scan: Create platform device for CS35L41 (2022-02-02 18:12:41 +0100)

----------------------------------------------------------------
This branch contains 5.17-rc1 + the SPI tree's spi-acpi-helpers tag +
the other patches from the "[PATCH v6 0/9] Support Spi in
i2c-multi-instantiate driver" series.

----------------------------------------------------------------
Lucas Tanure (4):
      platform/x86: i2c-multi-instantiate: Rename it for a generic serial driver name
      platform/x86: serial-multi-instantiate: Reorganize I2C functions
      ALSA: hda/realtek: Add support for HP Laptops
      ACPI / scan: Create platform device for CS35L41

Stefan Binding (5):
      spi: Make spi_alloc_device and spi_add_device public again
      spi: Create helper API to lookup ACPI info for spi device
      spi: Support selection of the index of the ACPI Spi Resource before alloc
      spi: Add API to count spi acpi resources
      platform/x86: serial-multi-instantiate: Add SPI support

 MAINTAINERS                                     |   4 +-
 drivers/acpi/scan.c                             |  16 +-
 drivers/platform/x86/Kconfig                    |  12 +-
 drivers/platform/x86/Makefile                   |   2 +-
 drivers/platform/x86/i2c-multi-instantiate.c    | 174 ------------
 drivers/platform/x86/serial-multi-instantiate.c | 348 ++++++++++++++++++++++++
 drivers/spi/spi.c                               | 137 ++++++++--
 include/linux/spi/spi.h                         |  20 ++
 sound/pci/hda/patch_realtek.c                   |  43 ++-
 9 files changed, 550 insertions(+), 206 deletions(-)
 delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c
 create mode 100644 drivers/platform/x86/serial-multi-instantiate.c

