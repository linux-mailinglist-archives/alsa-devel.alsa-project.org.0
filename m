Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081678D88D9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 20:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF3A7F1;
	Mon,  3 Jun 2024 20:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF3A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717440398;
	bh=dg+ZcCauZkEo45zBUHmDJoaf7BTTOaIzcsU6m7Pu+pA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sKD7nLgQNiE6qE/w3gB5qdu6ZK/uzP8DnQuCG5qqvFerONbWxJHkxmg31MURUqo2P
	 FnmqIs5ysQpKKMow0Ea6wjH4ZDqWBtkuh9434nZQ+gEFVfrAl9CVOU8A4FxntFsIFv
	 vEBpWCv+AquybhdbhgSSdg9TwzO4WR+QrlMYmqjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E782F80579; Mon,  3 Jun 2024 20:46:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43556F80589;
	Mon,  3 Jun 2024 20:46:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F26A1F8025A; Mon,  3 Jun 2024 20:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 75638F800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 20:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75638F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1717439437545063972-webhooks-bot@alsa-project.org>
References: <1717439437545063972-webhooks-bot@alsa-project.org>
Subject: [Question] how to get underlying file descriptors
Message-Id: <20240603183240.F26A1F8025A@alsa1.perex.cz>
Date: Mon,  3 Jun 2024 20:32:40 +0200 (CEST)
Message-ID-Hash: W5JAHK2L6QXCFRCMDMVBZMR5ELJVU6DJ
X-Message-ID-Hash: W5JAHK2L6QXCFRCMDMVBZMR5ELJVU6DJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5JAHK2L6QXCFRCMDMVBZMR5ELJVU6DJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #399 was opened from pfeatherstone:

I would like to use Alsa with the asio c++ library. I think all I need is the underlying file descriptor(s) for the device which I can then pass to Asio for polling and do all my asyncio. At the moment you're forced to use pollfd using snd_pcm_poll_descriptors(). Can I just read the fds or are there subtleties? Cheers

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/399
Repository URL: https://github.com/alsa-project/alsa-lib
