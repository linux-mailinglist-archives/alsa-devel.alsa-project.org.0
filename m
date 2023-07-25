Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A56762602
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 00:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0B383A;
	Wed, 26 Jul 2023 00:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0B383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690323473;
	bh=ogMmzvdx+gk/bYwD7VK6gRImy0cqmKE0idPpcbWWkrU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bAlSdKbFj72RCS9g0QwPWltlJ8DqzM00wFoRkEDX3D8iNs94wOY7io8OhyOTIjZ3W
	 Y/Wjgq+oIH2FI94vM6dbkcvnxUfsvpXEzmstRnjcYt6DV5CFP/dSSjNovD/IZzfr3q
	 J1+tHOPkpPiiPyw8kNArPqSWubBU+cfdbKWK1f6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D2B9F8055A; Wed, 26 Jul 2023 00:16:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0256F80153;
	Wed, 26 Jul 2023 00:16:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E14B7F80548; Wed, 26 Jul 2023 00:16:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6BDF801F5
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 00:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6BDF801F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690323404415616035-webhooks-bot@alsa-project.org>
References: <1690323404415616035-webhooks-bot@alsa-project.org>
Subject: MSI MAG X570S TOMAHAWK MAX WIFI - microphone + front audio panel not
 working - attempt 2
Message-Id: <20230725221645.E14B7F80548@alsa1.perex.cz>
Date: Wed, 26 Jul 2023 00:16:45 +0200 (CEST)
Message-ID-Hash: WAPEFPPP7KS3AVWDH3ZXH2OYCOVMWMEB
X-Message-ID-Hash: WAPEFPPP7KS3AVWDH3ZXH2OYCOVMWMEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAPEFPPP7KS3AVWDH3ZXH2OYCOVMWMEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #337 was edited from motomyslen:

I tried with `alsa-ucm-conf-1.2.9` but microphone still not working. Front audio panel detects headphones but no sound and mic not working as well.

If I'm not wrong ID of my device is `0db0:a073` and it was added a year ago to `USB-Audio.conf` but still something is wrong. Do I need to install alsa-utils 1.2.9?

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12165950/alsa-info.txt)

Related https://github.com/alsa-project/alsa-ucm-conf/issues/186

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/337
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
