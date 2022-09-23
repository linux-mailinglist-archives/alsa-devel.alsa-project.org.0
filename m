Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A509D5E8444
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 22:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA6F1FC;
	Fri, 23 Sep 2022 22:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA6F1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663965814;
	bh=EyrIap7lV8bAvAmLPvWewQ4czIT/OO6lvtH1Ryrb07g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfN7HKOGLwaPDxz15brNcRujKKRovtGK6vCyFybNvDpIhDMIb7+O8m/SaAfoThDTt
	 l9hy1s+9SxsjbwizPp05T/sGrpnqtnHJYBxPEMVkuXSzTwdFyKFMng+ZN/6LBos2M+
	 lRsvYJhxF8nXrGkpFJIly/RcUMYyTUi+RwsTPUWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A468FF80431;
	Fri, 23 Sep 2022 22:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B438F801EC; Fri, 23 Sep 2022 22:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DD8EBF801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 22:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD8EBF801EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1663965752360434055-webhooks-bot@alsa-project.org>
References: <1663965752360434055-webhooks-bot@alsa-project.org>
Subject: MSI MPG Z690 CARBON WIFI DDR5 S/PDIF No Audio
Message-Id: <20220923204235.5B438F801EC@alsa1.perex.cz>
Date: Fri, 23 Sep 2022 22:42:35 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #219 was opened from nphil:

Hello,

This motherboard uses realtek-alc4080 chipset, going by some of the other related issues I found the USB ID as follows:

`$ lsusb | grep 0db0`
`Bus 001 Device 003: ID 0db0:005a Micro Star International USB Audio`

Added `005a` to my USB-Audio.conf (running Manjaro) and rebooted. 

I now have audio through my optical port working just fine. Not sure how to do a pull request properly, just thought I'd share this here.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/219
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
