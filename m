Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905182E212
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 22:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32FB210;
	Mon, 15 Jan 2024 22:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32FB210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705352640;
	bh=WxT81O9m47wdla6K62bupTwUH+ibo1r+yI2yYZ4vypc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Bv/1c5H4h7axUQb8q3RASpBOjMGFlijef5s9gAIA0Rm4F3yDlTC5i1ISN19qekofW
	 lncJw1++sTl++W0mhXW+zLZLdfrgNfKYzMldtjrRPRgFYKyX7C3jaGz9/4EILGzk2S
	 Zkcc1qO+JG/X+d5hrSKnZSvJnb2TPT1HovhumRx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB45F8057C; Mon, 15 Jan 2024 22:03:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 509FAF8057D;
	Mon, 15 Jan 2024 22:03:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8FD0F801F5; Mon, 15 Jan 2024 22:03:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 85230F800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 22:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85230F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705352597892427683-webhooks-bot@alsa-project.org>
References: <1705352597892427683-webhooks-bot@alsa-project.org>
Subject: UCM is not supported for this HDA model (HDA NVidia at 0xfc080000 irq
 130) - how to disable HDA Nvidia?
Message-Id: <20240115210324.B8FD0F801F5@alsa1.perex.cz>
Date: Mon, 15 Jan 2024 22:03:24 +0100 (CET)
Message-ID-Hash: YUQYV23IJNF2WX5FOFVOBQ5NEIRGV7DD
X-Message-ID-Hash: YUQYV23IJNF2WX5FOFVOBQ5NEIRGV7DD
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUQYV23IJNF2WX5FOFVOBQ5NEIRGV7DD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #384 was opened from motomyslen:

I upgraded my system and all microphones stopped working. Before that I had loaded custom UCM configs to make my microphone working.
Upgrades which can be related to the issue:
- `alsa-ucm-conf:all 1.2.6.3-1ubuntu1.4 1.2.6.3-1ubuntu1.9`
- `nvidia-driver-510:amd64 510.108.03-0ubuntu0.22.04.1 525.147.05-0ubuntu0.22.04.1`

After OS upgrade I loaded again all latests UCM configs from the repo. I also tried older which I had but the error is the same.

First issue:
```
alsaucm reload;
ALSA lib parser.c:2021:(parse_master_file) Incompatible syntax 6 in HDA-Intel.conf
ALSA lib main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -22
alsaucm: error failed to open sound card hw:0: Invalid argument
```
I fixed it by changing syntax from 6 to 4 in HDA-Intel.conf. It worked for me before OS upgrade.

Next issue:
```
$ alsaucm reload;
ALSA lib parser.c:243:(error_node) UCM is not supported for this HDA model (HDA NVidia at 0xfc080000 irq 130)
ALSA lib main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6
alsaucm: error failed to open sound card hw:0: No such device or address
```
I tried to disable HDA Nvidia module from loading by adding `snd_hda_codec_hdmi` to `/etc/modprobe.d/blacklist.conf` but it didn't work.

How to solve this issue? I don't need audio through HDMI. It would be nice to have it working without any hacks but disabling it is enough for me. Can I somehow disable HDA Nvidia in UCM?
I can't downgrade Nvidia driver because I need that.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/13942996/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/384
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
