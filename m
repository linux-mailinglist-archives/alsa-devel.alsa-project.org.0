Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0BD8A6CE8
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 15:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F5FC14DC;
	Tue, 16 Apr 2024 15:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F5FC14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713275701;
	bh=oVnQKmFrKUUieYoWd1XKfPjpvZNpFUGNsOfz7XhIunk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SNvDbKeqPhwOYOx6PqVnThjCd2FcLQV0rfMN7ZN9uSykt+M6hBaUgag6orbhqCn7e
	 zlm7p0bsjb48opj+50da7ciWCeG9j5/ZTLf3JN+0daCECgC+q/tqZ1i8F64VK4qHXo
	 WZ6Uni3YPz+PYT4LS/9+EtFVlf9J2SylAboYzdXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18003F80124; Tue, 16 Apr 2024 15:54:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC46AF8057C;
	Tue, 16 Apr 2024 15:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF70BF8025A; Tue, 16 Apr 2024 15:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0CFF80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 15:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0CFF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713275660532002449-webhooks-bot@alsa-project.org>
References: <1713275660532002449-webhooks-bot@alsa-project.org>
Subject: ucm2: HDA: Use Master volume control for dual speakers
Message-Id: <20240416135424.CF70BF8025A@alsa1.perex.cz>
Date: Tue, 16 Apr 2024 15:54:24 +0200 (CEST)
Message-ID-Hash: H3JV2U2UF7GHWUBSRJFH4DH3EY25YIRJ
X-Message-ID-Hash: H3JV2U2UF7GHWUBSRJFH4DH3EY25YIRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3JV2U2UF7GHWUBSRJFH4DH3EY25YIRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #410 was opened from tuxedoxt:

This PR extends the existing 'activate Bass Speaker' case with additional configuration

- Use Master mixer for volume control (instead of only using Speaker)
- Configure Speaker Volume and Bass Speaker volume to max since Master volume regulation is used

It fixes a case where only the first speaker volume is changed using the system volume control.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/410
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/410.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
