Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C929CA2B5E
	for <lists+alsa-devel@lfdr.de>; Thu, 04 Dec 2025 08:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5ADD60201;
	Thu,  4 Dec 2025 08:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5ADD60201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764835004;
	bh=mg08xd9lJYMsUX+XoFOYQ2R/x0a76A4Jr847X9GV5dA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cEjSC8s6ety6HdCJjB9mYw0p/K9HSqnREJwKZdf07SWIbTVn2axj+iVOmQ/pDxc1w
	 kGeZqoYgZ0R3mRllwNNjVJDyCFNvOUI5K/xx80+3Lai9FhcIlFMVBucqYK87EV5JPK
	 Zl1e+eaynDU1eanBCMINS2rsD0hpOLQQErXtUgUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23302F805D5; Thu,  4 Dec 2025 08:56:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91AD6F805C1;
	Thu,  4 Dec 2025 08:56:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE658F80542; Thu,  4 Dec 2025 08:55:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6629AF8025E
	for <alsa-devel@alsa-project.org>; Thu,  4 Dec 2025 08:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6629AF8025E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187df4091567b900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/653@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/653@alsa-project.org>
Subject: ucm2: sof-soundwire: fix a case MultiCodec1 string is in
 HeadsetCodec1 string
Date: Thu,  4 Dec 2025 08:55:58 +0100 (CET)
Message-ID-Hash: T5JWJ4FRACMFKFGJELLZFTPKHPKU4MAJ
X-Message-ID-Hash: T5JWJ4FRACMFKFGJELLZFTPKHPKU4MAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5JWJ4FRACMFKFGJELLZFTPKHPKU4MAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #653 was opened from shumingfan:

ucm2: sof-soundwire: fix a case MultiCodec1 string is in HeadsetCodec1 string

The component string is
Components    : 'HDA:80862822,80860101,00100000  cfg-amp:1 iec61937-pcm:7,6,5 hs:rt713-sdca mic:rt713 spk:rt1320'
Therefore, HeadsetCodec1 string is 'rt713-sdca' and MultiCodec1 string is 'rt713'.
The Regex and String should be swapped and check again.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/653
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/653.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
