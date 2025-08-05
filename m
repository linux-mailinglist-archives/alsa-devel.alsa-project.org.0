Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD47B1BAFA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Aug 2025 21:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882006028E;
	Tue,  5 Aug 2025 21:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882006028E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754422506;
	bh=3sMxSgjFfJ460l84+Lrud67k5m+2M/zqErgiuJI6h1I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p9doTxGLoVC501FzHykM+T6x8wHkDHljch83P/KBeT2pmDVFgmts2LSRV3zPyIuC+
	 XP/ffhysarb+DI8MqLUyyuXD4AEmL2F8MVzDQ45gm/Ch0EdPREpSI2J6DuKrAP+T8/
	 4DSu6Fb/SFaegn6IoAY8/uN5XIt/VsTbhqCeCJ+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04D16F805C2; Tue,  5 Aug 2025 21:34:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35992F805C5;
	Tue,  5 Aug 2025 21:34:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9526DF804B0; Tue,  5 Aug 2025 21:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 344A0F800FE
	for <alsa-devel@alsa-project.org>; Tue,  5 Aug 2025 21:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 344A0F800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1858f5ec2fc2a600-webhooks-bot@alsa-project.org>
In-Reply-To: <1858f5ec2d6da300-webhooks-bot@alsa-project.org>
References: <1858f5ec2d6da300-webhooks-bot@alsa-project.org>
Subject: hdajackretask.desktop missing icon
Date: Tue,  5 Aug 2025 21:34:13 +0200 (CEST)
Message-ID-Hash: IQ4JDQJMD4RD34TBQLNDJBX2S6NA73T7
X-Message-ID-Hash: IQ4JDQJMD4RD34TBQLNDJBX2S6NA73T7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQ4JDQJMD4RD34TBQLNDJBX2S6NA73T7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #38 was opened from Dejweed:

The hdajackretask.desktop file doesn't have the `Icon=hdajackretask`.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/38
Repository URL: https://github.com/alsa-project/alsa-tools
