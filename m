Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 232475FD5A6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 09:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD2B5720;
	Thu, 13 Oct 2022 09:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD2B5720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665646916;
	bh=e+rq1njXLDIFGJ1L7vYSkmDJlLwS5MpZBrXAFM5oqEA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fzx3qrml7OOXesOtqRtNecTSNGzgYpTyc3wHtVlQ2UrYnMlXOmdjYG7H/HVmaJ3N7
	 L/y4Qu3sR98M2jZQFJckfsTLG+gWelT93POhO5DsnUC2Nw4eYl7uCJhHHacjlXAGZ9
	 Gu8Zu6WtvLfFExLNXImAtKEvyl4vHzK9TRTnEpf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE158F8053D;
	Thu, 13 Oct 2022 09:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 354E1F8053C; Thu, 13 Oct 2022 09:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E755AF80431
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 09:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E755AF80431
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665646843754724979-webhooks-bot@alsa-project.org>
References: <1665646843754724979-webhooks-bot@alsa-project.org>
Subject: ALC4080 - ASRock X670E Taichi
Message-Id: <20221013074046.354E1F8053C@alsa1.perex.cz>
Date: Thu, 13 Oct 2022 09:40:46 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #229 was edited from hendrikb-101:

This board's ALC4082 seems to be sitting here:
`26ce:0a06 Generic USB Audio`

After trying out the latest UCM configuration I also tried adding this to my USB-Audio.conf:
`# 26ce:0a06 ASRock X670E Taichi
Regex "USB((26ce:0a06)|(0414:a00e)|(0b05:(1996|1a(16|2[07])))|(0db0:(005a|151f|1feb|419c|82c7|a073|a47c|b202)))"`

but no dice (still recognized as "Generic USB Audio" and ports don't work). Sound works in Windows 11 and manually playing a sound like that works:
`aplay -D plughw:Audio,1 /usr/share/sounds/alsa/Front_Left.wav    ` 

Is there anything else different on this board besides the device's id?!

This is my [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9771968/alsa-info.txt).

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/229
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
