Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED46C9491
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 15:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D114A4B;
	Sun, 26 Mar 2023 15:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D114A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679837892;
	bh=r0+w3IAIIGwFmEIinWyy+fRqyJjb+dEWTCT4L0MbpwQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t1W1fbqrbhITTHvKP1ljYlDpUJ9RYs/GQ2M/0FHF4JtkPjpf4+L8okoL4P7XlpMQh
	 q84vHPajGLbuqU+Y5p6Vbsw1B1gPOcvEIBk1GRJoqOBSdU8H58pxWEPoQbOSuNFesN
	 ziKaX8ASoHAOzf4CNIuHk0GMCJVXifmvzRAfM+x0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C313F8024E;
	Sun, 26 Mar 2023 15:37:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B9AF80272; Sun, 26 Mar 2023 15:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A6740F8021D
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 15:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6740F8021D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679837832572262049-webhooks-bot@alsa-project.org>
References: <1679837832572262049-webhooks-bot@alsa-project.org>
Subject: 100% volume level on sc8280xp is too quiet
Message-Id: <20230326133716.01B9AF80272@alsa1.perex.cz>
Date: Sun, 26 Mar 2023 15:37:15 +0200 (CEST)
Message-ID-Hash: ESTYHMEKMHMXWYYOUZMUTSHCXBL74ZK3
X-Message-ID-Hash: ESTYHMEKMHMXWYYOUZMUTSHCXBL74ZK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESTYHMEKMHMXWYYOUZMUTSHCXBL74ZK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #296 was opened from shvetsnikita:

Hello!

I tested merged UCM configuration on Lenovo X13s (with t[his kernel](https://github.com/steev/linux/tree/lenovo-x13s-v6.3-rc3)) and found that even at 100% volume level is too low. Increase volume level 100% doesn't help (as if something is missing) - audio become more distorted but much louder.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/296
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
