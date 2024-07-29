Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20793FDAF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 20:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9555C846;
	Mon, 29 Jul 2024 20:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9555C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722278792;
	bh=A2ziWHlvD2UqtZc/TdmJtZdiZ8FElPEFq2cpKy5ndEI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gwywReQ11tRa2YpGk2l5yga83mCzjssp49G36/3Vgr3Yj5GcWmKz9m1rH1tl8sF9H
	 hQQJXfW5fqaIlCyhma7BD6fpANauF4l8VqpwLU7srTZnUaFK54ulb1DOpm9CRYSaoG
	 diinseCKulHu0ewnzyHcpQxsfaQF6lpsfB/cigpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34474F805A9; Mon, 29 Jul 2024 20:46:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C70BF80588;
	Mon, 29 Jul 2024 20:46:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B09C1F802DB; Mon, 29 Jul 2024 20:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 30DA3F800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 20:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DA3F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722278603789749622-webhooks-bot@alsa-project.org>
References: <1722278603789749622-webhooks-bot@alsa-project.org>
Subject: ASUS RoG Strix Z790-F: SPDIF (PCM) has wrong channels | how to get
 passthrough working?
Message-Id: <20240729184334.B09C1F802DB@alsa1.perex.cz>
Date: Mon, 29 Jul 2024 20:43:34 +0200 (CEST)
Message-ID-Hash: ACZN2YLKA7FZFKC4XJD2IYEUUJGRKOZM
X-Message-ID-Hash: ACZN2YLKA7FZFKC4XJD2IYEUUJGRKOZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACZN2YLKA7FZFKC4XJD2IYEUUJGRKOZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #434 was opened from Nightwing0815:

Hi there,

finally, [after a long journey,](https://github.com/alsa-project/alsa-ucm-conf/issues/350) yesterday I did an update from linuxmint to newest version 22, based on ubuntu 24.04 (I'll attach alsa-info and a system info).

Now it's no big problem any more, to get SPDIF working: I just selected the right device and muted all others in alsamixer, except the pcm signal.
But hey, there's a new problem:
With a speaker-test -c6, I'm not able to hear my rear channels and the lfe channel, where they should be. Rear coming on front speakers...
So, what do I have to do?
Further, I'm asking for help to configure a pcm signal passthru for dts and (e)ac3 soundfiles. My teufel receiver recognices only a 5.1 stereo source, not an DD5.1 or DTS signal...

[alsa-info.txt](https://github.com/user-attachments/files/16417700/alsa-info.txt)
[sysinfo.txt](https://github.com/user-attachments/files/16417724/sysinfo.txt)


Thanks in advance for getting this problems solved,

ToM

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/434
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
