Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9C1C2EE0
	for <lists+alsa-devel@lfdr.de>; Sun,  3 May 2020 21:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE58316D1;
	Sun,  3 May 2020 21:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE58316D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588535482;
	bh=uTz38PFH6n0m/DKbimjQc71mo8YcAzpPGXSToB0tvwI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3CYoCwRxnnqmnzL5k7HLpsLpXGNth3kziLt7CUmieEIkLHm09f0xAZMkkiOfoNWw
	 pu4pQ0KztlUilDzLcYv/DtvLQ3/NnR0I5z7v24JO0XDbKunJhy033havsFbTeev8fj
	 jFIfhDgiNHLaaASp6G007HZu0Fkqao0Oo9Ya1+mA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A85E3F8015B;
	Sun,  3 May 2020 21:49:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFDF3F8015F; Sun,  3 May 2020 21:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B8D14F800DA
 for <alsa-devel@alsa-project.org>; Sun,  3 May 2020 21:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D14F800DA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588535370792690992-webhooks-bot@alsa-project.org>
References: <1588535370792690992-webhooks-bot@alsa-project.org>
Subject: Add initial support for Realtek ALC1220 TRX40 motherboards
Message-Id: <20200503194939.CFDF3F8015F@alsa1.perex.cz>
Date: Sun,  3 May 2020 21:49:39 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #25 was opened from maximlevitsky:

Tested with TRX40 Designare but should work on most TRX40 motherboards
Tested with pulseaudio 13.99.1 (from fedora 31 package)
Tested with kernel 5.7.0-rc3

The following are the notes of the testing and implementation

* Back speaker works in 5.1 mode, however
  pulseaudio doesn't know how to handle mixer controls with
  8 channels, thus 'PlaybackMixerElem' is for now commented out
  This profile at least makes pulseaudio to set volume on this mixer
  element to 100% when it boots
  7.1 mode doesn't work due to lack of jack retasking in the kernel

  Also pulseaudio refuses to set any postive volume on subwoofer on unknown grounds,
  even though on the kernel level it works.

* SPDIF is not tested physically yet. The SPDIF mute mixer control is recognised by
  pulseaudio correctly

* PlaybackPrioriry/CapturePriority seems to have no effect to pulseaudio,
  it doesn't autoswitch inputs when jacks are insterted. You need to switch manually

* When all capture inputs are disconnected, pulseaudio thinks that the UCM2 profile
  is invalid and doesn't use it by default. It can be forced to use it by selecting
  it in the pavucontrol. Or you can for now comment out one of 'JackControl' statements,
  to make it think that one of the jacks is always plugged in.

* Front mic is alway working in mic mode due to lack of jack retasting as well.

* PulseAudio doesn't take advantage of EnableSequence/DisableSequence fully.
  It just enables all the devices regardless of the jack status, and it will disable
  them only when you swith the device profile to Off

* The default volume on capture devices is set to 59% which roughtly repesents
  0 dB amplification according to alsamixer

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/25
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/25.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
