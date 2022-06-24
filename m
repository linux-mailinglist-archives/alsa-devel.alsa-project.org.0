Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6455A256
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 22:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EACC517F4;
	Fri, 24 Jun 2022 22:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EACC517F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656101267;
	bh=TAZd7oM1NtfCWCTVMrZc5jkxU0ChSJ7lS6B+Mki79B0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7WPo6KL6oz3cOc12dJLTwYvqwpnSigyGOP/DnrP7TZwIXqJTOF9VK4n+gPphPSac
	 4h2vWWvnRqE2x+27T1cw+YGhm94fE1Lx5SVlVSUhKWpgg52tooNY8kbbAOgpSWdoFR
	 +7jcDB2m4Aml83oMfJ7rTKMMz9P592uhNFrJYyDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C5FF80165;
	Fri, 24 Jun 2022 22:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42A42F80139; Fri, 24 Jun 2022 22:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AFC91F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 22:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC91F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656101200391197920-webhooks-bot@alsa-project.org>
References: <1656101200391197920-webhooks-bot@alsa-project.org>
Subject: sof-soundwire: broken settings for RT711 and RT711-SDCA
Message-Id: <20220624200646.42A42F80139@alsa1.perex.cz>
Date: Fri, 24 Jun 2022 22:06:46 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #179 was opened from plbossart:

[plb@fedora ~]$ alsaucm -c sof-soundwire set _verb HiFi
ALSA lib main.c:826:(execute_sequence) unable to execute cset 'name='PGA2.0 2 Master Capture Switch' 0'
ALSA lib main.c:2573:(set_verb_user) error: failed to initialize new use case: HiFi

There's not such thing as a switch here:

amixer -Dhw:0 sget 'PGA2.0 2 Master',0 
Simple mixer control 'PGA2.0 2 Master',0
  Capabilities: cvolume
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 80
  Front Left: Capture 80 [100%] [30.00dB]
  Front Right: Capture 80 [100%] [30.00dB]

In addition, it makes no sense to use an SOF control to set the volume/switch on the headset codec side. The volume control should be done in the codec, not in the SOF firmware.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/179
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
