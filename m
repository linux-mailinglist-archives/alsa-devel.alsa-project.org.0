Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CD78183A
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Aug 2023 10:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AB1DEB;
	Sat, 19 Aug 2023 10:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AB1DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692432392;
	bh=cSE4Wisr9qGEguljwlpNzVHYKsAKxk2jZ+tD8VNq+/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=paGNI45kw8Va3zJ41m9Y2zvYHGoYu7s/KjMej2nEKNMvLSrhMfU7+VGPjUmBjwZ+8
	 wB/vYsBMKDROgLvz9BdHxkhxbIPOfEu3rYuyOh9NgqjtBS9v/EkaoFEzq+Vbl/ykF+
	 HlJvh1h8DA+StCR76lr2GUYaAhGsF0Cvk2I+X9Vs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E31FCF80272; Sat, 19 Aug 2023 10:05:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3319EF8025F;
	Sat, 19 Aug 2023 10:05:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C6C0F80579; Sat, 19 Aug 2023 10:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 687E8F80567
	for <alsa-devel@alsa-project.org>; Sat, 19 Aug 2023 10:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687E8F80567
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692432217406877995-webhooks-bot@alsa-project.org>
References: <1692432217406877995-webhooks-bot@alsa-project.org>
Subject: ucm2 profile for Universal Audio Volt 2
Message-Id: <20230819080339.0C6C0F80579@alsa1.perex.cz>
Date: Sat, 19 Aug 2023 10:03:39 +0200 (CEST)
Message-ID-Hash: 5H5QU5SFPQZJM5J24GWZ6DDPN2SL4H4X
X-Message-ID-Hash: 5H5QU5SFPQZJM5J24GWZ6DDPN2SL4H4X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5H5QU5SFPQZJM5J24GWZ6DDPN2SL4H4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #340 was edited from z411:

This adds a profile for the (relatively recent) Universal Audio Volt 2 USB audio interface. It has a Stereo output and 2 mono inputs that are (like most budget interfaces) combined into a stereo input. This profile effectively splits these inputs into two Line inputs. These inputs can be used interchangeably for XLR microphones, Line level signals or Hi-Z instruments.

The only weird thing is that in my machine the Mono Input 2 appears first in order but pretty sure I defined the prorities in the configuration file just fine. Everything works well on my machine.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12385352/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/340
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/340.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
