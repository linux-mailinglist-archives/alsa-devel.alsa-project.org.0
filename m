Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91382F0623
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 20:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19AD91657;
	Tue,  5 Nov 2019 20:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19AD91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572982704;
	bh=Z2WJkXTqpbaWg4ofT+T7RxKdCjTeti/ATE01nJWGcBY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dW2Hhjd9cxPXN84zjEcz20suFKP6hflNaas2JysrBqt5T1myOBxnz5n1AkFqpvEHG
	 Z1Nr6KVz+nmkhzqBt7RoxbMr8H0AmKvFqM3d5ul487RLS0M22is7+tD9nUYD86QNQ1
	 x57r5nJS5olOX8dAXQ1ZLfuXbaGCCiWEzk+6tTvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68527F80446;
	Tue,  5 Nov 2019 20:36:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F26F8049B; Tue,  5 Nov 2019 20:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A82FF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 20:36:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2CB8CA0046;
 Tue,  5 Nov 2019 20:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2CB8CA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572982593; bh=2QiXkSpDlsvNbEerEGtOn/8jtahb6G0ZCDS2Jt2QPoc=;
 h=From:Subject:To:Cc:Date:From;
 b=ajeUze+4RpPqGp8gJIgpFNlDBStAIJGiGfJGrbyoeEFW1wue+T1fWfCSpKBed+mn3
 JNWEfj0lclF5aTFI7Tvs3+Gz861HH6uZ3XXle1RuKsy85C/Xib+WpAE1qqqjnGkH+8
 uYpb2KIJzrKx+FBPlT2ZDq1zRRGlZzUDbC5/Tg7Y=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  5 Nov 2019 20:36:28 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Message-ID: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
Date: Tue, 5 Nov 2019 20:36:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] UCM extensions
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

	I make some internal ucm code cleanups in alsa-lib and added three major 
extensions to allow more complex configurations which we require for the SOF 
kernel driver.

	The first thing is the added substitution for the value strings:

https://github.com/alsa-project/alsa-lib/commit/f1e637b285e8e04e6761248a070f58f3a8fde6fc

	The second thing is the If block:

https://github.com/alsa-project/alsa-lib/commit/985715ce8148dc7ef62c8e3d8ce5a0c2ac51f8df

	The third thing is the card / hardware like specifier passed as the ucm name 
to snd_use_case_mgr_open() to support multiple card instances:

https://github.com/alsa-project/alsa-lib/commit/60164fc5886cdc6ca55eeed0c2e3f751a7d2b2c0

	All those patches (with other cleanups) are in the ucm2 branch on github for 
comments:

https://github.com/alsa-project/alsa-lib/commits/ucm2

	The proposed SOF UCM config diff is here:

https://github.com/alsa-project/alsa-ucm-conf/commit/723b6da881721488229154e923ed36413955a051
https://github.com/alsa-project/alsa-ucm-conf/commits/ucm2

	I added everything to keep the interface backward compatible, so the current 
applications should not observe any different behavior. The applications like 
pulseaudio should use the 'hw:CARD_INDEX' specifier for the open call in the 
future and snd_use_case_parse_ctl_elem_id() helper for the element control names.

	If you have another ideas to address those issues, please, let me know.

	BTW, Mark: The SOF UCM configs relies on the driver name changes, so it might 
be worth to send "ASoC: intel - fix the card names" patch to 5.4 to make 
things stable more quickly:

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-5.5&id=d745cc1ab65945b2d17ec9c5652f38299c054649

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
