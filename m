Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8D7346EF
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Jun 2023 18:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCD382B;
	Sun, 18 Jun 2023 18:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCD382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687104896;
	bh=WFfPVNMWxZ3w0gRNCF/bvczW291vPoK51BW1AGr5Uz8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tu2w4AWzfTF7b2ZnWgfTGu9u2PnVsUrYwAV+RxKvTj/PVIKeICLPT1VWbwo91bw3g
	 PYA3Wq2HdVgbemUVOcHtUF8HzrV1BPKnhns+tmdLzBfSXIVh8QrIcNcEXEJOliixW5
	 hsbTh2c9NfN0cW3GBYW5HZX69VtbEX+Zj94/Ubcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E059F80548; Sun, 18 Jun 2023 18:14:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD02F80130;
	Sun, 18 Jun 2023 18:14:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEE97F80132; Sun, 18 Jun 2023 18:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 702FFF800BA
	for <alsa-devel@alsa-project.org>; Sun, 18 Jun 2023 18:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 702FFF800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687104836378144503-webhooks-bot@alsa-project.org>
References: <1687104836378144503-webhooks-bot@alsa-project.org>
Subject: fix three compile warnings
Message-Id: <20230618161400.EEE97F80132@alsa1.perex.cz>
Date: Sun, 18 Jun 2023 18:14:00 +0200 (CEST)
Message-ID-Hash: WNZHP74RC3LXANC4IEQX4XBCPRDVTF3M
X-Message-ID-Hash: WNZHP74RC3LXANC4IEQX4XBCPRDVTF3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNZHP74RC3LXANC4IEQX4XBCPRDVTF3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #221 was opened from critkitten:

fix three compile warnings

Request URL   : https://github.com/alsa-project/alsa-utils/pull/221
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/221.patch
Repository URL: https://github.com/alsa-project/alsa-utils
