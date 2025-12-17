Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D3DCC74D2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 12:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBAA6022E;
	Wed, 17 Dec 2025 12:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBAA6022E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765970395;
	bh=7ZItnnwNP2Kw0tLRP+AS6SFLcSncWtSkyrbWD5o6pIQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nsQzlHZbTUxiEu3XjH+Ll32umcQKFoj6hNF8FbMFqduE7ncdy1bD6/X7vThksMwUN
	 BCX8Sjkl3gefnN/OHquD4VijG8GJ5RS5eiOKoyuRCs22hpN0t2hUMutD1bKaz5UQDl
	 HxKkGoqbspMrpdvaKB8ocpf/b+ZNcDbb4leH4s4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4471FF805D9; Wed, 17 Dec 2025 12:19:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BD5F805D5;
	Wed, 17 Dec 2025 12:19:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EABAF805A8; Wed, 17 Dec 2025 12:19:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8A7F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Dec 2025 12:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C8A7F8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1881fcadbdf71c00-webhooks-bot@alsa-project.org>
In-Reply-To: <1881fcadbd6eeb00-webhooks-bot@alsa-project.org>
References: <1881fcadbd6eeb00-webhooks-bot@alsa-project.org>
Subject: Dell XPS 14 9440 speaker don't work after update to v1.2.15
Date: Wed, 17 Dec 2025 12:19:14 +0100 (CET)
Message-ID-Hash: C7IZ6YWZCUKGC2DRP7II3RL2UGL3OALG
X-Message-ID-Hash: C7IZ6YWZCUKGC2DRP7II3RL2UGL3OALG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7IZ6YWZCUKGC2DRP7II3RL2UGL3OALG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #663 was opened from taaem:

Hello,

I have a Dell XPS 14 (9440) and after the last update (on openSUSE Tumbleweed) of `alsa-ucm-conf` the speakers disappeared in the system and pipewire only reports a `dummy-output`. 

For reference, the downstream bug, with all the logs is https://bugzilla.suse.com/show_bug.cgi?id=1255123, if needed I can provide additional logs or info!

Thanks

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/663
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
