Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4144C6E74
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 14:41:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0E01706;
	Mon, 28 Feb 2022 14:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0E01706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646055709;
	bh=YoM/yQHp4Xiv0MMoxIJ5CBJ6QSA1IY+dj32ko2t0BiU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoC0+KX0s6xFDSR29HxlJkuDQO+ZGI8614uboxqEn/Sac2hmFzd67C+RXSZLad50S
	 fjRVPbVilkI3oeNnrt8ERpfxBQvGlhTabsXf4D2h03zP1AXRTUzLFqEvgiDotWawix
	 F3x1VpYLmSUURiKXzEVEXO1MQmU1GGeFk8+XifKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0A2F80154;
	Mon, 28 Feb 2022 14:40:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3A0F80125; Mon, 28 Feb 2022 14:40:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A1B09F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B09F80128
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1646055634912770987-webhooks-bot@alsa-project.org>
References: <1646055634912770987-webhooks-bot@alsa-project.org>
Subject: Add UCM for PinePhone
Message-Id: <20220228134041.9F3A0F80125@alsa1.perex.cz>
Date: Mon, 28 Feb 2022 14:40:41 +0100 (CET)
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

The device-tree configuration has had a unique audio card name since 5.14:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi?h=v5.14#n436

This UCM config is copied from https://gitlab.com/pine64-org/pine64-alsa-ucm/, which was developed by many developers ( https://gitlab.com/pine64-org/pine64-alsa-ucm/-/merge_requests/1 ) and is BSD-3-Clause licensed.

I have tested that with this PR, the PinePhone has the expected HiFi and VoiceCall profiles.This testing found that the `File` directive in `SectionUseCase` needs to be absolute (for the symlink to work). I've fixed this in this PR: https://github.com/alsa-project/alsa-ucm-conf/pull/134/commits/5059e57a2197bb38848bbec10f589637df64679e.

See also:
* `alsa-info`: https://alsa-project.org/db/?f=5e331f5ef10bd167b3bd7640bfcf0e879100f80d
* `pa-info`: [pa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8015083/pa-info.txt)
* https://gitlab.com/pine64-org/pine64-alsa-ucm/-/issues/3

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/134
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/134.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
