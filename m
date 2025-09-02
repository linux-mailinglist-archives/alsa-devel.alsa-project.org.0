Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE1B3F1D4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Sep 2025 03:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7561060192;
	Tue,  2 Sep 2025 03:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7561060192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756775718;
	bh=z+nrP/CGHfIczy8NYRAeOfhIstSp3j1+ASMAZ572qPc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CtPigQKOeAtN1JMv1Fp481s3sh70WWMlzfV2OqFTL70RjFLK9XIU6SnF1+0bl/n0X
	 45qo6T773bAWjE4s6GRJWForkHrjE3v+ROZLGijPLAfbOuFX+0ttnj8bnk0dsdldBA
	 1EnWkiOP/uzptkffy/JtMIFrA/OJJogKIux5XcA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B832CF805C7; Tue,  2 Sep 2025 03:14:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CECCF805D2;
	Tue,  2 Sep 2025 03:14:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CFA0F80254; Tue,  2 Sep 2025 03:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 61936F801F5
	for <alsa-devel@alsa-project.org>; Tue,  2 Sep 2025 03:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61936F801F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <186152202a01d900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/474@alsa-project.org>
References: <alsa-project/alsa-lib/pr/474@alsa-project.org>
Subject: tlv: ignore xdir when type is DB_MINMAX_MUTE
Date: Tue,  2 Sep 2025 03:13:52 +0200 (CEST)
Message-ID-Hash: SFAGAQUINIPD6O6SEVVB3PPQB25VA36L
X-Message-ID-Hash: SFAGAQUINIPD6O6SEVVB3PPQB25VA36L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFAGAQUINIPD6O6SEVVB3PPQB25VA36L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #474 was opened from qaqland:

Muting caused by rounding is meaningless, and it is also inconvenient for upper-layer applications to handling muting issues caused by DB_MINMAX_MUTE or xdir. Thus, the restriction on xdir is removed.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/474
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/474.patch
Repository URL: https://github.com/alsa-project/alsa-lib
