Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC4B4866F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Sep 2025 10:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0148E601E4;
	Mon,  8 Sep 2025 10:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0148E601E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757318937;
	bh=csA1ZfgV59jsGciUetHhqmzAijEyVnodEmwUtEegdOA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EA7fx0oi1vSBimnnPbCiQLZZQl0LgoNZMk6wCWoEwOBLhrBqvRULKJqp5g9AuLunP
	 E+GVr6O3klKzqLQZqBwXS1KUNej7s9fezUHZZdWg37SHhQLEFzQJpazaaS15rDjX80
	 33x4akHfehAC6iTvAU+DpgeVboKSUmHwjthvwy5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55ECBF805C5; Mon,  8 Sep 2025 10:08:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B27DF805C9;
	Mon,  8 Sep 2025 10:08:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CE6F80185; Mon,  8 Sep 2025 10:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 10727F80169
	for <alsa-devel@alsa-project.org>; Mon,  8 Sep 2025 10:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10727F80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18634037e1943c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/610@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/610@alsa-project.org>
Subject: UCM2: Intel: sof-hda-dsp: HiFi: IPC3 mono DMIC is exposed as stereo
 PCM
Date: Mon,  8 Sep 2025 10:08:12 +0200 (CEST)
Message-ID-Hash: WBIGPABNEHYOKMX77UFZUGZYDEY2H4PP
X-Message-ID-Hash: WBIGPABNEHYOKMX77UFZUGZYDEY2H4PP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBIGPABNEHYOKMX77UFZUGZYDEY2H4PP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #610 was opened from ujfalusi:

With IPC3 the DMIC PCM is stereo even in case of a single (mono) DMIC connection.

Make the `CaptureChannels 1` conditional to IPC4 only.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2393552
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2384324
Closes: https://github.com/thesofproject/linux/issues/5528
Fixes: 56cbdfd04339 ("UCM2: Intel: sof-hda-dsp: HiFi: Fix handling of mono DMICs")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/610
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/610.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
