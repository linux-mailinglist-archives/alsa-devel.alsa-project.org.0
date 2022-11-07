Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07561F4BE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 14:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B123820;
	Mon,  7 Nov 2022 14:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B123820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667829580;
	bh=FbgUgNrok5YxX2wuvbecZHkyZaCgZEp/txYLw8ERlxQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dG+bLjlP0mGIlVyZeB8WXxMmhf0wJIihAnG/IanfVHYwMFrqngX7WHp+E0KoeQZE8
	 il/xT1o8RDk+5vVnO9CXCI5LbLkws8RLdE7p45H1PbTOg9lPxVEQSocXf6WYUhtURG
	 +uDWpJZWVh99DFS7I40y1DZnM94tgCezoiV4phCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1712F80116;
	Mon,  7 Nov 2022 14:58:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59261F8025A; Mon,  7 Nov 2022 14:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A2A49F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 14:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A49F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667829521171492100-webhooks-bot@alsa-project.org>
References: <1667829521171492100-webhooks-bot@alsa-project.org>
Subject: ALC1220 DualCodec no optical out
Message-Id: <20221107135844.59261F8025A@alsa1.perex.cz>
Date: Mon,  7 Nov 2022 14:58:44 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #239 was opened from Almoped:

With current pipewire and alsa-ucm 1.2.8 I am unable to select profiles which has iec958 output, actually I am unable to select any card profile at all in pavucontrol. This is possibly because all the electrical output jacks are disconnected and optical out does not have jackdetect. Or maybe DualCodecs/HiFi.conf does not configure optical out.

If I remove alsa/ucm2/HDA/DualCodecs/HiFi.conf it uses alsa-card-profile/mixer/profile-sets/default.conf, goes on a probing mission I get a working optical out and the possibility to select an array of other card profiles in pavucontrol.
Can anyone recommend a better way to solve this?



I've attached pactl list cards output with working and nonworking optical out.

[pactl_no_optical.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9952236/pactl_no_optical.txt)
[pactl_working_optical.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9952238/pactl_working_optical.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/239
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
