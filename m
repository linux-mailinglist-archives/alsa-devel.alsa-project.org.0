Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A34E7EBA
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Mar 2022 04:10:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3C516D9;
	Sat, 26 Mar 2022 04:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3C516D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648264214;
	bh=YGl5J9QOIN29CsIQuA8zAXwHa8KHnzrTQRRxQyiSjHY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBQaQxAHI7NAJE9gEQP+ddSxMoGi7NCxSzxOAOYPZ3KK7R7X53hiQABD1qprs2Znn
	 JGXkZl5yTPzzf/fHSoqxuxTIqpX+5QVk3zbkmsm98BB3xh40mzRt6NEW2u4iP0mGBa
	 1eOig66da6KziBuLhG02g8VWkD4r6M3XqYT9zIzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE4CF80115;
	Sat, 26 Mar 2022 04:09:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21DA6F8019D; Sat, 26 Mar 2022 04:09:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 22C5BF80115
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 04:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C5BF80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648264137404253006-webhooks-bot@alsa-project.org>
References: <1648264137404253006-webhooks-bot@alsa-project.org>
Subject: Add UCM for PinePhone
Message-Id: <20220326030906.21DA6F8019D@alsa1.perex.cz>
Date: Sat, 26 Mar 2022 04:09:06 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #134 was edited from tomfitzhenry:

Fixes https://github.com/alsa-project/alsa-ucm-conf/issues/124.

This PR adds support for the https://wiki.pine64.org/index.php/PinePhone 

This PR contains:
* This UCM config copied from https://gitlab.com/pine64-org/pine64-alsa-ucm/, which was developed by many developers ( https://gitlab.com/pine64-org/pine64-alsa-ucm/-/merge_requests/1 ) and is BSD-3-Clause licensed.
* Fix paths to be relative to alsa-ucm-conf root.
* Some refactoring of the UCM config, incl. removing duplicate directives, and moving volume directives to BootSequence.
* Updating the playback/boost volumes, in response to comments on this PR.

I have tested:

* HiFi
    * Record audio via the headset.
    * Record audio via the internal mic.
    * Play audio on the headphones.
    * Play audio on the speaker.
    * Play audio on the internal speaker.
* Voice Call
    * Speak on the headset.
    * Speak on the internal mic.
    * Listen on the headphones.
    * Listen on the speaker. This induces an echo, and given the audio routing is entirely on chip, and the chip doesn't advertise echo cancellation, I don't see how this is avoidable.
    * Listen on the internal speaker.

See also:
* `alsa-info`: https://alsa-project.org/db/?f=5e331f5ef10bd167b3bd7640bfcf0e879100f80d
* `pa-info`: [pa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8015083/pa-info.txt)
* https://gitlab.com/pine64-org/pine64-alsa-ucm/-/issues/3
* Schematics/code
    * The device-tree configuration has had a unique audio card name since 5.14: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi?h=v5.14#n436
    * http://files.pine64.org/doc/PinePhone/PinePhone%20v1.2%20Released%20Schematic.pdf
    * https://xnux.eu/devices/feature/audio-pp.html
    * https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
    * https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
    * https://github.com/torvalds/linux/blob/master/sound/soc/sunxi/sun50i-codec-analog.c
    * https://files.pine64.org/doc/datasheet/pine64/Allwinner_A64_User_Manual_V1.0.pdf
    * https://static.chipdip.ru/lib/126/DOC001126567.pdf

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/134
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/134.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
