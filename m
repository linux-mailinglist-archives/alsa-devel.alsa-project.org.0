Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB62467CF
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 20:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB82A1876;
	Fri, 14 Jun 2019 20:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB82A1876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560537926;
	bh=jbM2hco/oL31B/CX88PZMUp3hwjjnI8AhHMNT27pvwY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e/GAbRuK0t68JDKeeSaOL4iNcZCfnW+fp8RSclJ/RSnsIz4Gd8lKXHPZadJWW8KJZ
	 LyfDo2uR4NSGk9+3GDoxv9WScP7fwuI+8ta6rGa3yduuRBXRGcrhdcrzaURSa3v/Ss
	 DYGdEO5T/a6+S2NummHZMSy4t2M3PdH+YYHutTKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629D5F80794;
	Fri, 14 Jun 2019 20:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F298F896E0; Fri, 14 Jun 2019 20:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE4EF80764
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 20:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE4EF80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ft6ZMiZj"
Received: by mail-io1-xd42.google.com with SMTP id u19so7878634ior.9
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qKO3KiNOmtvrogfrG3Ga2A0QL8IaxVgARBNmgmMqWbc=;
 b=ft6ZMiZjBwIplcyAR+g+GEB64WpoIXpj9T3gnADsfMXy4KR2J0boLvfDGXxYF4qiPj
 LH4W9w7AXIBs+77tDpLgl+tTThFHueDp8GOw8AK5bgVXjqsoYYoLqrV31og1bu65FsS9
 G7VHMBuaAnS4isoJw+Lp6GqYekNA95B+u9Anc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qKO3KiNOmtvrogfrG3Ga2A0QL8IaxVgARBNmgmMqWbc=;
 b=LEd8Qvdff4jEPsjWbw3L1+tUdk0bAqkVZRnEjG8sPhw81/5zzRKHxgQdE/pZ8thqbg
 20Z35sbBuLohf4V4u5EfR/db7TkSimigJgvi+yGrMwpt4obnnI1ClJiclOHpBaTNHq6D
 ufNOhKPaHu3N9P6CU78ByVMYU9niVd/WBTi7Qwebpm2cq1Efbjk2f84r3+1EIRztTLyk
 NtG3wdwBNstq24vUk7z/fIqWEZN1xvgMXjb48WjfEji29H4o9GWP97gBtttv4FsmPqlW
 cM4y/v0ACq0LfbO5kjD8wsEzHkPnsgpC02fPmxts15uWzcGbukGfTGC1Qz637W8QA5DX
 iJ3g==
X-Gm-Message-State: APjAAAU9xZgE9VqZMrXwU5KyLXQEsvXasx8ISLN2AHqGrdJN7TgI6n83
 Cq3Jzl6vFzXpIBnD1e5LIXT+PA==
X-Google-Smtp-Source: APXvYqyADjshUqx1mOX6CwWzohHayg06LftIBPOdzuzPhD7JJhu591jYGb0mR06hhorrST0f9GKoUA==
X-Received: by 2002:a6b:14c2:: with SMTP id 185mr48082904iou.69.1560537813409; 
 Fri, 14 Jun 2019 11:43:33 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id w23sm5655338ioa.51.2019.06.14.11.43.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 11:43:32 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 12:43:11 -0600
Message-Id: <20190614184315.252945-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v6 0/4] Fix jack detection for Chromebook Pixel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

** resending due to corrupted patch **

Headphone/mic jack detection doesn't work on the Chromebook Pixel 2015.

This patch changes the irq implementation to support polarity flipping
and fixes the configuration code so that correct GPIO pins are read
from ACPI.

With this series, plugging and unplugging the headphone jack switches
between headphones and speakers automatically, and headset microphones 
are also detected.

v6:
  - Move refactoring into its own patch
  - Reorder patches so that DT property names patch is first
  - Clarify commit message for patch which implements irq handler
  - Remove unused work struct 
  - Make IRQ function return IRQ_HANDLED only if IRQs actually fire

v5:
  - Fix void* parameter to devm_request_threaded_irq

v4:
  - Fix incorrect void* cast in rt5677_irq() 

v3:
  - Update commit message for patch 1/3 to clarify why we implement
    our own irq_chip.

v2:
  - Split IRQ change into two patches: adding and fixing potential race
  - Change config reading code to try both DT and ACPI style names

Ben Zhang (2):
  ASoC: rt5677: clear interrupts by polarity flip
  ASoC: rt5677: handle concurrent interrupts

Fletcher Woodruff (2):
  ASoC: rt5677: fall back to DT prop names on error
  ASoC: rt5677: move jack-detect init to i2c probe

 sound/soc/codecs/rt5677.c | 319 ++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5677.h |  13 +-
 2 files changed, 236 insertions(+), 96 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
