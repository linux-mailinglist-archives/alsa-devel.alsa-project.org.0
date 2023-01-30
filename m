Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A484268166A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D339086E;
	Mon, 30 Jan 2023 17:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D339086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675096239;
	bh=pNJivev3JZ0VXVhk2bqrCvURTkZIl3WIkXlauPLBFs8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XsNTKUhuLBvMv3TnCsN1jkv9uucVqYxnxzPF35gB4eC0YeCqkRt1vV1dPqSSlwC8z
	 6N7HmWfYWf3NmK7diFe9IzmYAXxxxOty0Io7yuN0SdeM4WoAj5x/rAnrp6M6OdcFL0
	 tGl5SKAsQ8J/wqN8dS9V5xzm986iibIVGRyFCG3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49834F8007C;
	Mon, 30 Jan 2023 17:29:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFDE2F8032B; Mon, 30 Jan 2023 17:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A8D7F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A8D7F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RQfeahdO
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90050240008;
 Mon, 30 Jan 2023 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675096165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ttbkmJmfqMZ8rvI1K8Fpp/EYFmvyqrJCorPDwJm4m78=;
 b=RQfeahdOmqvClK8WcknKv+Vf5vhB11258ZbUQF0vuna0+IElaueM7GcIXzYgNRlWwth91t
 ryakmqmpmgbVkKMZfn+QthR3wAHnMO0HG2LtHtriYi2WRdi/0IYSpb6JlXrA9LFXujG1Wn
 KUhaGH8R3FKIGE8fNg3NQoG7Si2THyF04GXVlAJ64hlNABMXwTYVJwcw6q5PzaC18Fan3E
 iwU+jYgIAgdhZj4YDkGInEDg53M2ffBYb8C80Bcb5WimtWD6pxVgAieoU5vvs8kINiZc2T
 dUod2aevqFQByjZa/0vRhYRoNI+XbTcciRVmtvhe/8c8dHYNgBlMZ+Yny48DQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH RESEND] ALSA: doc: Fix PCM interface section typos
Date: Mon, 30 Jan 2023 17:29:24 +0100
Message-Id: <20230130162924.119389-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix two mistakes in the PCM interface section:
1/ Members of the snd_pcm_hardware structure are channels_{min,max}
   and not channel_{min,max} (mind the 's').
2/ Another sentence is incomplete as the reference to one structure
   member (period_bytes_max) is missing.

There is no relevant 'Fixes:' tag to apply as both typos predate the
Git era.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Hello, I wrote and sent this patch in 2019 but I likely only Cc'd Jon
and the doc ML, which might have not been enough, so just in case, here
is a resend.
Link: https://lore.kernel.org/linux-doc/20190829145512.3752-1-miquel.raynal@bootlin.com/

 .../sound/kernel-api/writing-an-alsa-driver.rst        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 07a620c5ca74..5c9523b7d55c 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1720,16 +1720,16 @@ Typically, you'll have a hardware descriptor as below:
 -  ``rate_min`` and ``rate_max`` define the minimum and maximum sample
    rate. This should correspond somehow to ``rates`` bits.
 
--  ``channel_min`` and ``channel_max`` define, as you might already
+-  ``channels_min`` and ``channels_max`` define, as you might already
    expected, the minimum and maximum number of channels.
 
 -  ``buffer_bytes_max`` defines the maximum buffer size in
    bytes. There is no ``buffer_bytes_min`` field, since it can be
    calculated from the minimum period size and the minimum number of
-   periods. Meanwhile, ``period_bytes_min`` and define the minimum and
-   maximum size of the period in bytes. ``periods_max`` and
-   ``periods_min`` define the maximum and minimum number of periods in
-   the buffer.
+   periods. Meanwhile, ``period_bytes_min`` and ``period_bytes_max``
+   define the minimum and maximum size of the period in bytes.
+   ``periods_max`` and ``periods_min`` define the maximum and minimum
+   number of periods in the buffer.
 
    The “period” is a term that corresponds to a fragment in the OSS
    world. The period defines the size at which a PCM interrupt is
-- 
2.34.1

