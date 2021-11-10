Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5B44C22A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 14:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF72D1661;
	Wed, 10 Nov 2021 14:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF72D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636551276;
	bh=UMzeeiMKbbduQq5SlIzTxxB8riPCaDwxR+mUsvDLfM4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxmnKTnOyxWTX0hWAaeNwJbqlqTOtARpRpCW1cQEeGgiPDOf4kT8waGZBCLo19LiP
	 d4kYL3yu1/4HbuVXRDn3DPn0z41NT2sxr1dv+lLFTuVDlhjzalih4jFpzeDm+DVkmW
	 JPPTo9967uKV2lNnAQr/SbGp9ZvUsv7FfmpEs9S0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5697DF800C1;
	Wed, 10 Nov 2021 14:33:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CFBF8049E; Wed, 10 Nov 2021 14:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B7C7F80054
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 14:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7C7F80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636551191426469088-webhooks-bot@alsa-project.org>
References: <1636551191426469088-webhooks-bot@alsa-project.org>
Subject: ucm2: Add support for SC7180 Trogdor Lazor Chromebooks
Message-Id: <20211110133318.81CFBF8049E@alsa1.perex.cz>
Date: Wed, 10 Nov 2021 14:33:18 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #118 was edited from kholk:

Almost all Trogdor Chromebooks are using RT5682 for headphones/headset
on 3.5mm jack, internal microphone and headset microphone, and MAX98357A
for the internal speakers (Lazor and Limozeen).

This adds support for the sc7180-rt5682-max98357a-1mic sound card found
on the aforementioned Chromebooks.

`Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>`

Tested on sc7180-trogdor-lazor-limozeen-nots.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/118
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/118.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
