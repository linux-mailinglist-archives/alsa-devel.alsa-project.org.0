Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32E5B1894
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED4916FB;
	Thu,  8 Sep 2022 11:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED4916FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629100;
	bh=cx5X+wVm6dSMN6il93uJYRQl28d0fBwTptrXa8Rk1CQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6NXCd0CJjN8wCH6U4O0X8nDAgF1BqVMLVwMgrWdgVDkmwri0hEd9QZ8lOhqSlStI
	 RwK4PGAqt2SYAuYC9NXeRfFCWfsHmKeS3NvX5B58N7/j+On0mOY1d7CGjDbEL1zbXh
	 OExrkbn+ZOo+5uqyS66mNeSCZe7o7DXA8AjSWLbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4586F805C0;
	Thu,  8 Sep 2022 11:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F69F805BB; Thu,  8 Sep 2022 11:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F521F80587
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F521F80587
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662628810500739098-webhooks-bot@alsa-project.org>
References: <1662628810500739098-webhooks-bot@alsa-project.org>
Subject: ucm2: Add support for MT8195 Cherry Tomato Chromebook with SOF
Message-Id: <20220908092018.63F69F805BB@alsa1.perex.cz>
Date: Thu,  8 Sep 2022 11:20:18 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #213 was edited from kholk:

Add support for the Acer Chromebook Spin 513 CP513-2H, powered by MediaTek Kompanio 1380 (MT8195) with a HiFi 4 Audio DSP running SoundOpenFirmware.
This machine uses MT6359 PMIC, with RT1019 and RT5682 as headphones and speaker codecs/amps.

This configuration has been successfully tested on Debian 11 with PipeWire 0.3.56 + wireplumber.

`Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>`

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/213
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/213.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
