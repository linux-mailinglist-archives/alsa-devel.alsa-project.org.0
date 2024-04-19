Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C728D8AA62D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 02:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F63284C;
	Fri, 19 Apr 2024 02:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F63284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713485673;
	bh=cpQNWYPYZq34zo861X+lTCccGCggEgIE3zj2gp9PjeY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LLeQ0+Qbs+0xSr+tpeb3Bc8h0a5j98ymfsVpV+kKz65ZRmYwWAonTKEMACjF/8R4s
	 wcx6HA16tXHlVAjqY24ZAqMIBryaqGIUZpEF5vPi8w3dhUzweh91B6hBiHW4MaSeLO
	 y8ievhSKlQ9TNUvRv6Oi8utN6HIehFwBvubyXPXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41A72F8057D; Fri, 19 Apr 2024 02:14:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D4DAF8057D;
	Fri, 19 Apr 2024 02:14:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B38A6F8025A; Fri, 19 Apr 2024 02:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A3BF80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 02:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A3BF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713485627439746857-webhooks-bot@alsa-project.org>
References: <1713485627439746857-webhooks-bot@alsa-project.org>
Subject: FIXES: alsamixer lowering volume control widget past 0 causes hostile
 volume spike to 100
Message-Id: <20240419001356.B38A6F8025A@alsa1.perex.cz>
Date: Fri, 19 Apr 2024 02:13:56 +0200 (CEST)
Message-ID-Hash: Y4C5UP2V5UDNFL3BWSNNMWFJO6DOZX2L
X-Message-ID-Hash: Y4C5UP2V5UDNFL3BWSNNMWFJO6DOZX2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4C5UP2V5UDNFL3BWSNNMWFJO6DOZX2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #266 was opened from genbtc:

bug: lowering volume below 0 causes volume to overflow and spike to 100% volume hurting my ears.

to reproduce:  when holding down z,x,c to lower the volume, the volume spikes to 100% and then down to 0% over and over

background:
when volume is already 0 and direction is -1 (lowering volume) - but lower than 0 is impossible
the function `set_normalized_volume` @ volume-mapping.c is eventually still called anyway
`value = lrint_dir(6000.0 * log10(volume), dir) + max;`
and volume is 0, so
log10(0) resolves to negative infinity, so
value overflows past infinity. 9223372036854775802
![alsamixer-alsa-utils-volumemap-bug3_2024-04-18_13-27-23](https://github.com/alsa-project/alsa-utils/assets/3683744/d382c59b-0e71-420f-8495-4d5d863f3734)


my fix:
this function `change_volume_relative` function will now skip execution of the set_normalized_playback_volume function when volume is 0 and the dir is -1 
TLDR: (stop trying to set a lower volume than 0)

Request URL   : https://github.com/alsa-project/alsa-utils/pull/266
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/266.patch
Repository URL: https://github.com/alsa-project/alsa-utils
