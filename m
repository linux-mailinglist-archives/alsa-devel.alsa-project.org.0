Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C42FA340
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 15:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141A21832;
	Mon, 18 Jan 2021 15:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141A21832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610980802;
	bh=km2mBrQImcI4BrI+utdNg4TKMiLeAxeP0I3vcppUG3Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+/nRS7LpH53wLMdBnemDJtoaw9TcNg6nf52GtWGoQX2Qlx4xsB844zw6WBBCiVHr
	 wttbvUs9ZQ3+h98XJGXRn/otRe0qtYiTNOQdiPaUCNiRF9Eev2F7APVzKFVM0amiUl
	 69lW8DzFUozxpwfkPA52POPetneVAzfJI1oijrSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B01EF800C0;
	Mon, 18 Jan 2021 15:38:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE1CF8016E; Mon, 18 Jan 2021 15:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C9A9CF800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 15:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A9CF800E7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610980695620155096-webhooks-bot@alsa-project.org>
References: <1610980695620155096-webhooks-bot@alsa-project.org>
Subject: chtnau8824: Add support for using the SOF driver
Message-Id: <20210118143824.EFE1CF8016E@alsa1.perex.cz>
Date: Mon, 18 Jan 2021 15:38:24 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #74 was opened from perexg:

The old (and currently the default) SST driver uses TDM 4 slots 24 bit
as wire format to the codec. Where as the new SOF driver uses standard
I2S 2 channel 24 bit.

Normally this should not impact the UCM settings, but on the NAU8824
the "DAC Right Channel Source" mixer setting must be set to 1 when
using TDM 4 slots and to 0 when using I2S 2 channel mode.

Getting this wrong (in either case) results in the right channel not
outputting any sound.

This commit introduces a RightOutputChannel variable which gets
set to 0/1 depending on the driver and then uses that for the
"DAC Right Channel Source" mixer setting so that we do the right
thing depending on the driver.

This has been tested on the following devices:

Medion E2215T:    Stereo speakers, analog mic
Medion E2228T:    Stereo speakers, stereo digital mics
Cube iWork 8 Air: Mono speaker, analog mic

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/74
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/74.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
