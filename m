Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354A6C2CB8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 09:41:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F301F0;
	Tue, 21 Mar 2023 09:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F301F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679388112;
	bh=rxuGKv2YcjFLtsBtnVhbCaKDkGJ/hHLI0wgKkHAFxVo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WneApQE5CH8umhKqmTvF/WTozpyugnd1XM4IuZQjkXorULBZcm9Yp2tvD0AKySr0X
	 v6T8KFwiL7q4nJR77X064GPy7vR5sSN0gqlGNQXftWf+g0GpYwLUvZuOSgMfnreMP7
	 05dijfLtiog+YCr2u/N6rAeDprL53IfmuGJ8jNL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 290B3F80254;
	Tue, 21 Mar 2023 09:40:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64DEDF80105; Tue, 21 Mar 2023 09:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD45F80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 09:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD45F80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679388002632436514-webhooks-bot@alsa-project.org>
References: <1679388002632436514-webhooks-bot@alsa-project.org>
Subject: ALC4080 - ASRock X670E Taichi
Message-Id: <20230321084010.64DEDF80105@alsa1.perex.cz>
Date: Tue, 21 Mar 2023 09:40:10 +0100 (CET)
Message-ID-Hash: 4CVVPTKKSNAIOG4HWYJQJCHQC6YFEAV4
X-Message-ID-Hash: 4CVVPTKKSNAIOG4HWYJQJCHQC6YFEAV4
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CVVPTKKSNAIOG4HWYJQJCHQC6YFEAV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #229 was reopened from hendrikb-101:

This board's ALC4082 seems to be sitting here:
`26ce:0a06 Generic USB Audio`

After trying out the latest UCM configuration I also tried adding this to my USB-Audio.conf:
`# 26ce:0a06 ASRock X670E Taichi`
`Regex "USB((26ce:0a06)|(0414:a00e)|(0b05:(1996|1a(16|2[07])))|(0db0:(005a|151f|1feb|419c|82c7|a073|a47c|b202)))"`

but no dice (still recognized as "Generic USB Audio" and ports don't work). Sound works in Windows 11 and manually playing a sound like that works:
`aplay -D plughw:Audio,1 /usr/share/sounds/alsa/Front_Left.wav    ` 

Is there anything else different on this board besides the device's id?!

This is my [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9771968/alsa-info.txt).

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/229
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
