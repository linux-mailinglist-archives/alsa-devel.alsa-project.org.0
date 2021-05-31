Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13918395733
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 10:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D25F15E0;
	Mon, 31 May 2021 10:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D25F15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622450419;
	bh=sUyw3qRFVZ0he+3CQK1awOGUOMdBj9id6DFe10ZuP/s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ke2aMVx/hQBADMaP7D0FQr6vowfJH4qbfve5y7nq009CQA8yBRgCIgcvWqi310OmY
	 aFCjSbjh4Rd5nGM+glVDiCrU8x/AlCFKWsgLeIFAg2zada3ZJBdrN7Ol8MDWhDK7PV
	 6YiXFU31ggDfTkTdzMzwMpZF3ZEIoGiyteLkJ2Js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABE8F80430;
	Mon, 31 May 2021 10:39:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3705F80425; Mon, 31 May 2021 10:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 56BBBF80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 10:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BBBF80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622450363140326023-webhooks-bot@alsa-project.org>
References: <1622450363140326023-webhooks-bot@alsa-project.org>
Subject: Add UCM for Nvidia Tegra HDMI Audio
Message-Id: <20210531083925.D3705F80425@alsa1.perex.cz>
Date: Mon, 31 May 2021 10:39:25 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #94 was edited from clamor-s:

This were used to have audio over HDMI on Asus Transformers. You may find original configs [in pmOS](https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-asus-tf201/ucm) and paths used [here](https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/device-asus-tf201/APKBUILD#L30-38). I have adjusted them to use syntax 4 and re-use common codecs. 

This ucm is universal for all Tegra 3 devices and hopefully Tegra 2 as well.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/94
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/94.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
