Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D778CA40
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777F01E3;
	Tue, 29 Aug 2023 19:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777F01E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693328909;
	bh=H/SBJJL3bftT6r2w486GfdFXrwsljuG92yitKJRkVKU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JKrG25Uk8IW54+R7T8l518C7c5/31TzDVk5RV2a/nzhFkxDQ9yQ0gaKQ4rDACPZaO
	 Bpx+c+YOvWX+ypiNaaZMRcREyapErlQtgp5yOnb36aoxZcL3FEwiE6BXSuUpgWuJCj
	 4cKdJ8G3/cTtw68dLuF0XewjuG98aqepMo/91izc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F970F80094; Tue, 29 Aug 2023 19:07:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFC5F80155;
	Tue, 29 Aug 2023 19:07:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A74F80158; Tue, 29 Aug 2023 19:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B911CF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B911CF800D1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693328847275744200-webhooks-bot@alsa-project.org>
References: <1693328847275744200-webhooks-bot@alsa-project.org>
Subject: Front 3.5mm panel not recognized (MSI X370 Gaming Pro & MSI B450-A
 Pro)
Message-Id: <20230829170734.B3A74F80158@alsa1.perex.cz>
Date: Tue, 29 Aug 2023 19:07:34 +0200 (CEST)
Message-ID-Hash: MCVBF3WBTAPK6EELH5WUICMADV4QHJ2J
X-Message-ID-Hash: MCVBF3WBTAPK6EELH5WUICMADV4QHJ2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCVBF3WBTAPK6EELH5WUICMADV4QHJ2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #344 was opened from fiftydinar:

Realtek ALC892 soundcard on both.

alsa-info.sh (MSI X370 Gaming Pro)
http://alsa-project.org/db/?f=26d6d5ef7701fabf260fd75e0d2bd135976019dd

alsa.info.sh (MSI B450-A Pro)
http://alsa-project.org/db/?f=621f405abe6c94f4a3069caba7ab7cb802d03563

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/344
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
