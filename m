Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CB2BB296
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 19:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C559D1767;
	Fri, 20 Nov 2020 19:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C559D1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605896751;
	bh=YfQbyfTOlz2D8d2aUNp6HftGDpenJCbAuVUVsr/Gl9Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jq1F/AGCIZFH0UZSjI31DZ7PjAgdpAToqbPvxdWePXGDA8HdkuSsA/YOVoaZD/9Ca
	 kJ7i5woJtNP8vobW/iEi83rEG5V3/VKVvTkCV0GTtxPYFECYDNfNGivSIzqymOwIbU
	 iSK8eL4t0eL+uhmEpUCmXQAsJwtYIX6K/Bj4HwAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DA4F8016D;
	Fri, 20 Nov 2020 19:25:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E010BF8016E; Fri, 20 Nov 2020 19:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9562EF80168
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 19:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9562EF80168
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605896696222091913-webhooks-bot@alsa-project.org>
References: <1605896696222091913-webhooks-bot@alsa-project.org>
Subject: ucm2: add support to for Qualcomm RB5 Platform
Message-Id: <20201120182459.E010BF8016E@alsa1.perex.cz>
Date: Fri, 20 Nov 2020 19:24:59 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #63 was opened from Srinivas-Kandagatla:

This patchset adds support to The Qualcomm Robotics RB5 Platform Audio ports.
RB5 has 2 WSA881X smart speakers attached via Soundwire, HDMI and a DMIC0 on the board.
All the audio related patches are merged in ASoC tree.

Also to note that the driver name and long card names are fixed properly on all new and old machine drivers so that we can organise the ucm2 directories correctly. That is the reason for moving sm8250 out of Qualcomm folder.

Thanks,
srini

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/63
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/63.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
