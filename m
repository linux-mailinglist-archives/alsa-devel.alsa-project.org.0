Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2E4F04EA
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 18:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A67163D;
	Sat,  2 Apr 2022 18:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A67163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648917125;
	bh=wiF1VbmTmLEiqvXK4Vx8+vWb7XkA3M1V80Ka5xhaEQQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vh9HXlsz2Sz5eT/61zKl/VuE0mItGL+z+hl54h+HHIsdevBKFHjxW3MblBDP/oDJs
	 2P7XKuccE6R8luo5DbJKHkci9Fhy+r4s1Tnae0NMjI/QqzgZil5EODrvfWtOZFCjm8
	 jm+oj009RlYdRSH+wg0T+g5G/EEjQl9XU8SfM4sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB687F80310;
	Sat,  2 Apr 2022 18:30:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB574F802DB; Sat,  2 Apr 2022 18:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_147,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9446FF80100;
 Sat,  2 Apr 2022 18:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9446FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gnuweeb.org header.i=@gnuweeb.org
 header.b="PtbQBaOm"
Received: from integral2.. (unknown [182.2.36.61])
 by gnuweeb.org (Postfix) with ESMTPSA id 79AA37E36C;
 Sat,  2 Apr 2022 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1648917047;
 bh=wiF1VbmTmLEiqvXK4Vx8+vWb7XkA3M1V80Ka5xhaEQQ=;
 h=From:To:Cc:Subject:Date:From;
 b=PtbQBaOmsD7TPu+tSK6umCGW2L124av1ZoCUX4bV9PXjax1EUnM+//DzYLKxwMNJM
 QfOmB0H1a69JczAj+C4KoiZuEFVlnxMy+nN0hym6UJSy8uVlJYexfU3y6lNSYRYZ1l
 3cZSa6rPpMUKsKM7Nc3NNocNaYWOpybqpZRM1aDXtEt6l8lh+hWxNF+brFeozYZIBw
 jJpME2s+r1y6aZDmFBv3VOpdf/illmU4jSGLgypuyYH5SOPSePGcKwENlVSOGBj5dN
 lNSsZx82W9NXLMQnb5KZ76sZ3FB6f0GPZgXv7hQqwoJEx8SkrL3xMHfXERyjalNy+R
 OniJkQBx9yQ2A==
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH for-stable] ASoC: SOF: Intel: Fix NULL ptr dereference when
 ENOMEM
Date: Sat,  2 Apr 2022 23:30:26 +0700
Message-Id: <20220402163026.11299-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, gwml@vger.gnuweeb.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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


Hello Greg,

commit b7fb0ae09009d076964afe4c1a2bde1ee2bd88a9 upstream.

Please take these two backport patches:
1. For Linux 5.4 LTS.
2. For Linux 5.10 LTS.

Both will be sent as a reply to this email.

Thank you!

=====

5.4 failed report:
https://lore.kernel.org/stable/164889915082249@kroah.com/


5.10 failed report:
https://lore.kernel.org/stable/164889914960214@kroah.com/

-- 
Ammar Faizi

