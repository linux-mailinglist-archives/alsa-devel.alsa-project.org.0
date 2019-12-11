Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F811C069
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 00:11:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9731655;
	Thu, 12 Dec 2019 00:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9731655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576105872;
	bh=f+611B0nIpMx2RjWM7lfyzB7fRGX3W5xhfooOBcfpiI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zzb/8DDa5mhEzWY+qoAjTmGs/lV74sK009hNZGHd2qV7LJ5sPBnYwBoyuhe2VGMmF
	 eACF348gkZd92StOidz8uYZuXP+wozRXe6GZ3hP6tn2vHblA12voQj6mZkB8ZmrtoI
	 0dmlUopwimzjffpk/IFDcqR2/ftlq3ReQkmbZXZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E11E6F8021E;
	Thu, 12 Dec 2019 00:09:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB954F801F4; Thu, 12 Dec 2019 00:09:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD136F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 00:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD136F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LkIlXSQR"
Received: by mail-wm1-x335.google.com with SMTP id p9so160330wmc.2
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 15:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:mime-version:message-id:user-agent
 :content-transfer-encoding;
 bh=+KVhInttHCk8aRWpkeHbpGDkcc8DqG9qr5lNYLpkB+Q=;
 b=LkIlXSQRRleORMf3k4j0Yyq3SEEQdW30hvs2l5wJXpnGm69OqLRRVJob9A3Tv+sOBc
 C2LsnoWYQouQmOCMHz0YcNUVUFe0at5s3R4zEbXXN05Uahkehc68iWqp3pchzQ6DkToA
 EduMtgvVyBtiTG2y+7OPSnJ9rxXA3DuJ0MR/bUZaboged666N06XhMRYOMGhhOLa1wG+
 MFAzmVIaalwXJunMEG8nH5pDja0AOXcw0Xwbt2f8MmNIGcWuEq15fNWi4OfRgzSGjYE4
 tGz4w5hZ08Uv5lwSJ5WcF0GtKcBEmyySGiPHRXKOx4EyhP9aI4fAYg2aBxWc4LTmdVf2
 P2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
 :user-agent:content-transfer-encoding;
 bh=+KVhInttHCk8aRWpkeHbpGDkcc8DqG9qr5lNYLpkB+Q=;
 b=OqVRrwk4RLk3WdeA5m2j8tkH5XYcizeX7x+eyYq7Ihk9HiltAcH1atgzXQJMC1WeWc
 T5anocPJeNrN8QCyKkQzeiMBSWAV4JmikhcA4zsNSxRJNDRgurKkw4T1/mSre/Om5uup
 jCuSsYGzRAf50Y1rVSPWv5GBvon+G2J4lm7D6vhhIcLx63Q//vfjOlyvBNxOFuQXn+Rx
 ekILxnDOFbLAdilghswbYpSrj4UC6ORwBorYypntYSdjnLm4xw43ML4V1oKth2IJiEEp
 baXxnqhOuRz3aOx2QDKbkMP+ixl/n61DM11X/gCH26p7GANw/jfvQHlytme30L7S0pqm
 GW+Q==
X-Gm-Message-State: APjAAAU0NtmJ7ePIQhOVZoQMpndhDWrwAReMZfCCOMlla7/sFW1cSHXq
 dua968NwPBbjhV1e7bZHA2g=
X-Google-Smtp-Source: APXvYqzAA/fAeD8EPJ/WI2sdbDUFp8a+mD4mhBG/9aHEwPbxk3D6EVao+Y4pWSOQ8ZmApUr9WXpj8A==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr2579892wml.107.1576105763974; 
 Wed, 11 Dec 2019 15:09:23 -0800 (PST)
Received: from localhost ([5.59.90.131])
 by smtp.gmail.com with ESMTPSA id 16sm4025978wmi.0.2019.12.11.15.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 15:09:23 -0800 (PST)
From: Vicente Bergas <vicencb@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Date: Thu, 12 Dec 2019 00:09:21 +0100
MIME-Version: 1.0
Message-ID: <5708082a-680f-4107-aaf8-a39d76037d77@gmail.com>
User-Agent: Trojita
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] =?iso-8859-1?q?WARNING=3A_CPU=3A_3_PID=3A_1_at_=5F?=
	=?iso-8859-1?q?=5Fflush=5Fwork=2Eisra=2E47+0x22c/0x248?=
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

Hi,
since v5.5-rc1 four equal consecutive traces appeared that seem related to
rockchip sound. As i wasn't sure to whom sent the report just added
everybody from
./scripts/get_maintainer.pl sound/soc/rockchip/rk3399_gru_sound.c
which is the file containg one of the functions in the trace.

By the way, sound works fine. After all traces, there is this message that
could also be related:
[    0.625354] da7219 8-001a: Using default DAI clk names: da7219-dai-wclk, 
da7219-dai-bclk

Regards,
  Vicente.

[    0.607955] ------------[ cut here ]------------
[    0.607967] WARNING: CPU: 3 PID: 1 at __flush_work.isra.47+0x22c/0x248
[    0.607972] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc1 #1
[    0.607973] Hardware name: Google Kevin (DT)
[    0.607977] pstate: 00000005 (nzcv daif -PAN -UAO)
[    0.607980] pc : __flush_work.isra.47+0x22c/0x248
[    0.607982] lr : flush_delayed_work+0x34/0x58
[    0.607984] sp : ffff80001004b950
[    0.607985] x29: ffff80001004b950 x28: ffff8000109f47c8 
[    0.607989] x27: ffff800010b29890 x26: ffff800010acfdf0 
[    0.607992] x25: 0000000000000003 x24: 0000000000000001 
[    0.607994] x23: ffff0000f2779f00 x22: ffff800010c974f0 
[    0.607997] x21: 0000000000000000 x20: ffff800010c7ca48 
[    0.608000] x19: ffff0000f277f698 x18: 0000000000000014 
[    0.608003] x17: 000000007dad679e x16: 00000000be8a3c7e 
[    0.608006] x15: 0000000072509968 x14: 0000000000000000 
[    0.608008] x13: 0000000000000000 x12: 0000000000000000 
[    0.608011] x11: 0000000000000008 x10: 0101010101010101 
[    0.608014] x9 : 0000000000000000 x8 : 7f7f7f7f7f7f7f7f 
[    0.608017] x7 : ffff0000f3975800 x6 : 0080808080808080 
[    0.608019] x5 : dead000000000100 x4 : dead000000000122 
[    0.608022] x3 : 0000000000000000 x2 : 0000000000000000 
[    0.608025] x1 : 0000000000000000 x0 : ffff0000f277f698 
[    0.608028] Call trace:
[    0.608031]  __flush_work.isra.47+0x22c/0x248
[    0.608034]  flush_delayed_work+0x34/0x58
[    0.608040]  soc_free_pcm_runtime.part.19+0x40/0x60
[    0.608043]  snd_soc_remove_dai_link+0x54/0x60
[    0.608047]  soc_cleanup_card_resources+0x160/0x298
[    0.608050]  snd_soc_bind_card+0x248/0x978
[    0.608053]  snd_soc_register_card+0xf0/0x108
[    0.608057]  devm_snd_soc_register_card+0x40/0x90
[    0.608061]  rockchip_sound_probe+0x210/0x2e8
[    0.608066]  platform_drv_probe+0x50/0xa0
[    0.608070]  really_probe+0xd8/0x2f0
[    0.608073]  driver_probe_device+0x54/0xe8
[    0.608075]  device_driver_attach+0x6c/0x78
[    0.608078]  __driver_attach+0x68/0xe8
[    0.608082]  bus_for_each_dev+0x60/0x98
[    0.608085]  driver_attach+0x20/0x28
[    0.608088]  bus_add_driver+0x170/0x1d0
[    0.608091]  driver_register+0x60/0x110
[    0.608093]  __platform_driver_register+0x44/0x50
[    0.608098]  rockchip_sound_driver_init+0x18/0x20
[    0.608102]  do_one_initcall+0x70/0x148
[    0.608105]  kernel_init_freeable+0x1b4/0x254
[    0.608109]  kernel_init+0x10/0xfc
[    0.608113]  ret_from_fork+0x10/0x18
[    0.608117] ---[ end trace fc1c70d7fb870a47 ]---

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
