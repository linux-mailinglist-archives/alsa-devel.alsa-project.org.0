Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04C6FA14D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8797D12AB;
	Mon,  8 May 2023 09:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8797D12AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531887;
	bh=YPv1Q0rzhbwS6Owc8R5ePJZQX211Tf9J18pUNWZlWqc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ry35aK87XYfyNXi9NbCNj31WfsWTRoRSJK5nY4MFn3Fl4JFFQluipM86kYyx8wqLq
	 mu7zQysR0X0TkDAcKYEHp2JbekQvXJCOyG1dGUP9qQ7aCVv95sbS0p76j0ApdXJrl/
	 BLuxpr7QbORZ8mj/xMesIL72Ef7GMEpQb/8q6cdI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E92A4F80310;
	Mon,  8 May 2023 09:43:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 044DEF8049E; Thu,  4 May 2023 08:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23DC4F800EC
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 08:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23DC4F800EC
Received: from dd-virtual-machine.localdomain ([183.202.113.128])
	(user=u202112092@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3446pF6h014815-3446pF6i014815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 4 May 2023 14:51:25 +0800
From: Ruliang Lin <u202112092@hust.edu.cn>
To: Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Karsten Wiese <fzu@wemgehoertderstaat.de>
Subject: [PATCH] sound: caiaq: input: Add error handling for unsupported input
 methods in `snd_usb_caiaq_input_init`
Date: Thu,  4 May 2023 14:50:53 +0800
Message-Id: <20230504065054.3309-1-u202112092@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: u202112092@hust.edu.cn
X-MailFrom: u202112092@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XIH5U7KNERTSEDIKFVHZ4HXXXDT4WLEY
X-Message-ID-Hash: XIH5U7KNERTSEDIKFVHZ4HXXXDT4WLEY
X-Mailman-Approved-At: Mon, 08 May 2023 07:43:53 +0000
CC: hust-os-kernel-patches@googlegroups.com,
 Ruliang Lin <u202112092@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 Daniel Mack <daniel@caiaq.org>, Jaroslav Kysela <perex@suse.cz>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIH5U7KNERTSEDIKFVHZ4HXXXDT4WLEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Smatch complains that:
snd_usb_caiaq_input_init() warn: missing error code 'ret'

This patch adds a new case to handle the situation where the 
device does not support any input methods in the 
`snd_usb_caiaq_input_init` function. It returns an `-EINVAL` error code 
to indicate that no input methods are supported on the device.

Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
Signed-off-by: Ruliang Lin <u202112092@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
The issue is found by static analyzer. The patched code has passed
Smatch checker, but remains untested on real device.
---
 sound/usb/caiaq/input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 1e2cf2f08eec..84f26dce7f5d 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -804,6 +804,7 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 
 	default:
 		/* no input methods supported on this device */
+		ret = -EINVAL;
 		goto exit_free_idev;
 	}
 
-- 
2.25.1

