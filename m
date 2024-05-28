Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630038D138B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 06:57:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880FC93A;
	Tue, 28 May 2024 06:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880FC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872219;
	bh=8SSAwmFnTPlKWWXU0Bq+nUBOlJk/2qyBY/+PZLaShQI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DJomlgPFHFf4ypUJ++6zA+1ofMkOEal0naFMgs+2JpF1efquDWeiEnk0jZi0K1WEe
	 RoslsIQ+0814Kr+O+peCzJFZfGuV6RQCbm+W4kztJojwWIzi54TrajTr9dBuxI038M
	 1NFxzS6IKFf2QHrRY1c360h+WM5wyQT2nPTgHJ/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE98EF80587; Tue, 28 May 2024 06:56:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB7B7F80588;
	Tue, 28 May 2024 06:56:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19672F80149; Tue, 28 May 2024 06:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA9FF8003A
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 06:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA9FF8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1716872096872649670-webhooks-bot@alsa-project.org>
References: <1716872096872649670-webhooks-bot@alsa-project.org>
Subject: Wcd937x support
Message-Id: <20240528045502.19672F80149@alsa1.perex.cz>
Date: Tue, 28 May 2024 06:55:02 +0200 (CEST)
Message-ID-Hash: YONTOMIG7WMPJ2TY6AJ3VEXGDYL35U46
X-Message-ID-Hash: YONTOMIG7WMPJ2TY6AJ3VEXGDYL35U46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YONTOMIG7WMPJ2TY6AJ3VEXGDYL35U46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #421 was opened from mohsRafi:

Add WCD937X codec support.

This change will add the default, enable/disable codec sequence for Headphone and Mic on WCD937x codec,

And move TX1 MODE mixer controller to WCD938x codec sequence.
The tx-macro is a common interface for WCD937x and wcd938x and also TX1 MODE setting is not applicable for WCD937x codec.
The TX1 MODE mixer controller is derived in WCD938x codec driver, so move the TX1 MODE mixer control to wcd938x.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/421
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/421.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
