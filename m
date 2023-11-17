Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CE7EF46A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 15:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C012AE8;
	Fri, 17 Nov 2023 15:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C012AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700231241;
	bh=ra8TU//8GQtJeBI7U6EIbaMeeiY30lG/aap2py210dE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HIZfJr6xocjcveeOAXXaQYcXlZS8LGrdEEzsW73tU26g3ZLXoMEvxMjdoGpriRwvQ
	 2UqMvwQ/WNbPdvv1VzzQqizTJ4qxoSBHqILAh2EfNpm5cfPTnGBLw3wsl7RLg5QDuE
	 b90PD+cUQqWIOKmSU7RGRgvJPBDnaV8ymV1oLFv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF7C6F8022B; Fri, 17 Nov 2023 15:26:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45850F8022B;
	Fri, 17 Nov 2023 15:26:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83659F80249; Fri, 17 Nov 2023 15:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BB35EF80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB35EF80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700231172997710228-webhooks-bot@alsa-project.org>
References: <1700231172997710228-webhooks-bot@alsa-project.org>
Subject: Speexrate linking build artifacts in installation directory?
Message-Id: <20231117142625.83659F80249@alsa1.perex.cz>
Date: Fri, 17 Nov 2023 15:26:25 +0100 (CET)
Message-ID-Hash: 4YBWWCDENBRGWQYSR5K3ELE7MCUNLAXU
X-Message-ID-Hash: 4YBWWCDENBRGWQYSR5K3ELE7MCUNLAXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YBWWCDENBRGWQYSR5K3ELE7MCUNLAXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #55 was opened from MIvanchev:

It seems to me that the [Makefile](https://github.com/alsa-project/alsa-plugins/blob/master/pph/Makefile.am#L31) is linking build artifacts instead of copying them... Also the install hook is assuming those `.so` files exist which seems to be the case but should not be copied over when `--enable-static --disable-shared` is specified. It happens only for that plugin.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/55
Repository URL: https://github.com/alsa-project/alsa-plugins
