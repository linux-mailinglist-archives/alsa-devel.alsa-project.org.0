Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC36CC7D6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 18:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49AA01F0;
	Tue, 28 Mar 2023 18:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49AA01F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680020695;
	bh=Cmt6dYB1i08BY8RgvHW0foGfwvEI5SrF8P9HKbnL9nQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=b2jgSRyHdeewEjMrvHuLhVGM/B59wBBkkxlGdkWRvDl5fd568UCmGlkOTw3zBKLSV
	 06QrCwvcalREOT5Lr46kUOCgjTue9Ak12xzEtJHHN6EiQAi2DOnccU5r29MKDsHta4
	 TJKH+/h1drP9LQDgGPhzsuYmvvy8IrhEs9WMhVTA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B033F8024E;
	Tue, 28 Mar 2023 18:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E924BF80272; Tue, 28 Mar 2023 18:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 66257F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 18:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66257F80114
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680020639345186234-webhooks-bot@alsa-project.org>
References: <1680020639345186234-webhooks-bot@alsa-project.org>
Subject: Headphone jack volume on ALC287 (Thinkpad X1 extreme gen 5) is too
 low unless the speaker channel's volume is past a certain threshold.
Message-Id: <20230328162400.E924BF80272@alsa1.perex.cz>
Date: Tue, 28 Mar 2023 18:24:00 +0200 (CEST)
Message-ID-Hash: LL7QV2SNHEDDPFAES6IRJ3X7GOCGWWC6
X-Message-ID-Hash: LL7QV2SNHEDDPFAES6IRJ3X7GOCGWWC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LL7QV2SNHEDDPFAES6IRJ3X7GOCGWWC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #298 was edited from Noted-Jrelvas:

First of all, apologies for the verbose title.

I've ran into a very interesting issue with my Thinkpad X1 extreme gen 5's audio. For whatever reason, the headphone jack's sound output is very quiet unless I raise the speaker channel's volume past a certain threshold.

The headphone jack sounds very quiet...
![image](https://user-images.githubusercontent.com/55360900/228303084-57945125-59ba-4daf-befb-bb9e18b6f491.png)

...but raising the speaker channel's volume fixes the issue:
![image](https://user-images.githubusercontent.com/55360900/228303657-30efa3c3-2965-4b3b-a870-b4ae6e803aba.png)

I suggest automatically setting the speaker channel's volume to 100% when the headphones are plugged in and restoring it to its original volume once they're plugged out.

Here's the output given by `alsa-info.sh`:
http://alsa-project.org/db/?f=21904435b29e0eb23d2d0b30bbabe15734df7ad7

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/298
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
