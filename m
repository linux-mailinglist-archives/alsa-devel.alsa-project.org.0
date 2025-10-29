Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3985C19703
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Oct 2025 10:43:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A76D6601FF;
	Wed, 29 Oct 2025 10:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A76D6601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761731037;
	bh=ZEYIeMKiQhXCZtlZDF9DQpZAavgkjoP4Y1/DfINePIs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RlI9HPtLjsaERUFVc3o1rVLhJWvicHjKSRNUJTIvh9pOO6J2RnXajZ4YL/5F20XS+
	 DsxpwbyFUuvaTs5omnNkWZoR7vrM9Xe1lMLdqLHng590A3ZvHcDmQgdXucIEc80/7B
	 adi/o/bsGPIWuDzuVZ1P/OtPRaQ7BKfsBjKd+QLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6AB5F805D2; Wed, 29 Oct 2025 10:43:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C99F805C5;
	Wed, 29 Oct 2025 10:43:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0BA6F80423; Wed, 29 Oct 2025 10:42:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D0D6BF800C1
	for <alsa-devel@alsa-project.org>; Wed, 29 Oct 2025 10:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D6BF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1872ecf088f44b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/631@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/631@alsa-project.org>
Subject: Qualcomm: qcs615: Add TALOS EVK HiFi config
Date: Wed, 29 Oct 2025 10:42:04 +0100 (CET)
Message-ID-Hash: EBNCB7JMTUUCZI7KT5LZIDJGPTBNNLFY
X-Message-ID-Hash: EBNCB7JMTUUCZI7KT5LZIDJGPTBNNLFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBNCB7JMTUUCZI7KT5LZIDJGPTBNNLFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #631 was edited from mohsRafi:

Add UCM2 configs for the Qualcomm TALOS-EVK Board.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/631
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/631.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
