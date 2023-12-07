Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA0808C14
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 16:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0CB83E;
	Thu,  7 Dec 2023 16:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0CB83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701963836;
	bh=8O1xFEWx7Y+o9oiDa2zEGBGBjNqQ9BccsS9gOW/1NVM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LEBUPO5t93P9OFeJTHqbvdUwcRA0gFaTlPVPLyib1GkmxtGve5T8TGUu/A5u/pWxa
	 m67rQ9jdvxsIqRZ57by20hbn/E9oXtTogXAUSJ3a8Q9CKZu/N0RSsPUEEpVILSlWdG
	 Mcf2Ip+hAFEdUQaI6R5v9N6/VBnWc6zkIFoCMBdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E4BF80578; Thu,  7 Dec 2023 16:43:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87161F80571;
	Thu,  7 Dec 2023 16:43:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B52B6F8024E; Thu,  7 Dec 2023 16:43:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 00371F800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 16:43:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00371F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701963790556613445-webhooks-bot@alsa-project.org>
References: <1701963790556613445-webhooks-bot@alsa-project.org>
Subject: multichannel audio -- four out of 16 channels turned off by default
Message-Id: <20231207154313.B52B6F8024E@alsa1.perex.cz>
Date: Thu,  7 Dec 2023 16:43:13 +0100 (CET)
Message-ID-Hash: NLTIBWJT6LTGPTLBZXRPDO4MFLZUGUDV
X-Message-ID-Hash: NLTIBWJT6LTGPTLBZXRPDO4MFLZUGUDV
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLTIBWJT6LTGPTLBZXRPDO4MFLZUGUDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #22 was opened from jyrkialakuijala:

I'm using UMC1820 and Behringer ultragain digital to have 16 channels of output. I need to use them in 48000/24 bit to use all channels, 96000 can only use 12 channels.

It used to work well in early 2023. There was (likely) a software update around mid 2023 that turned off four channels automatically.

I was able to fix it by issuing commands:

$ amixer --card 2 cset numid=3,iface=MIXER,name='UMC1820 Output Playback Volume' 127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127

$ amixer --card 2 cset numid=1,iface=MIXER,name='UMC1820 Output Playback Switch' on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on

When I turned the audio device (UMC1820) off and back on, then I need to reissue those commands to have all 16 channels in use.

It was not easy to understand what was going on, it could have been a failure in the amplifier, line transformers, the ultragain box -- but turned out to be software config. When I looked at software configs I was first convinced that it was configured to 96000 rate because that also creates the same effect of only four channels being available on the extension box.

It would be nice if the devices were detected properly and all channels would be on by default, not just 12 first channels.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/22
Repository URL: https://github.com/alsa-project/alsa-tools
