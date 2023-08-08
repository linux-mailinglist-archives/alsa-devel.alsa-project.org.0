Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9877381A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 08:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C2882B;
	Tue,  8 Aug 2023 08:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C2882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691475142;
	bh=T+Udz3DC01tLozg32TYg4PZ4UA2/xxUQAUeLy5wtsVw=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qopqOCwqwvqDqkahfLvNOeyLlLjiIoDzyvtuYSPhNZdTAjEcRXKvcNramutytGLgA
	 cYKt3g9eZhx9Ay4g2KLmfD06GPFu6yQA/RP5IsmMM0oRXpKj4dngS4krLc1P362HKh
	 s6f8Rxgu55iCerQvR1aimsO7QvIGfwVVwmi/36WU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E8EDF80548; Tue,  8 Aug 2023 08:11:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B925F8016B;
	Tue,  8 Aug 2023 08:11:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851EFF8016D; Tue,  8 Aug 2023 08:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98B7CF8016A;
	Tue,  8 Aug 2023 08:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B7CF8016A
Received: from [185.238.219.21] (helo=[192.168.44.45]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qTFvd-00072q-6h; Tue, 08 Aug 2023 08:10:49 +0200
Message-ID: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
Date: Tue, 8 Aug 2023 08:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Regression fix not progressing towards mainline/stable
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org, LKML
 <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alsa-devel <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1691475054;c3e8c558;
X-HE-SMSGID: 1qTFvd-00072q-6h
Message-ID-Hash: SHDXAEFNEQB5JNUZ6YDTZY43JK6XBTZT
X-Message-ID-Hash: SHDXAEFNEQB5JNUZ6YDTZY43JK6XBTZT
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi everyone, I noticed a regression fix that afaics lingers in the
thesofproject's git repo instead of progressing towards the stable trees
and wondered what's up here.

I'm talking about about the fix "ASoC: SOF: intel: hda: Clean up link
DMA for IPC3 during stop" for this ticket:
https://github.com/thesofproject/linux/issues/4455

Two more tickets about it:
https://github.com/thesofproject/linux/issues/4482
https://bugzilla.kernel.org/show_bug.cgi?id=217673

It seems the fix is ready and reviewed for two weeks now, but not even
in -next by now. That's not how it should be for regression fixes, as
per https://docs.kernel.org/process/handling-regressions.html it ideally
should be in -stable soon or already. Is this a mistake, am I missing
something, or is there a good reason for this?

Ciao, Thorsten
