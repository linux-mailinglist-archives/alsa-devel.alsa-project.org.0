Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F253D5AB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 07:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD541820;
	Sat,  4 Jun 2022 07:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD541820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654321095;
	bh=XWBgYq8cTfSQUy1RNoUd/BMH2uotnJ+Jta7Ovpr0g30=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHtDxh7WWe4N/BnI46mKpC9kYqDTDqBLutQkX7rp28j3+Kxribz3nUFODlPwX5Wja
	 q491VLbhhdPAj/CIqqqVwNMLZPpc31XXoKD9mnCJrtZANEkEDv/qhm704wMQ/DxfPD
	 RYflOhUBpGzYGQqCOQiezwDxW5O3Xg+icAn+tHrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 905F0F801EC;
	Sat,  4 Jun 2022 07:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F295EF8016D; Sat,  4 Jun 2022 07:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 769A4F800E8
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 07:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 769A4F800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654321030337070942-webhooks-bot@alsa-project.org>
References: <1654321030337070942-webhooks-bot@alsa-project.org>
Subject: Fixes for veyron chromebooks
Message-Id: <20220604053714.F295EF8016D@alsa1.perex.cz>
Date: Sat,  4 Jun 2022 07:37:14 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #164 was opened from jenneron:

Add PlaybackVolume and JackControl. I didn't add JackControl for headset mic because internal mic breaks after switching to headset and back

Add symlink to VEYRON-I2S, so ucm config will get probed

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/164
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/164.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
