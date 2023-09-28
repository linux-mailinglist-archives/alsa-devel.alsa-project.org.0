Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51F7B181B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 12:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D95DED;
	Thu, 28 Sep 2023 12:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D95DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695895967;
	bh=NUVrMuTERkRUqkLoHkNn/nCAdzFLoMG18ztUkR0CXu8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=V5M0RUVgsKhNljF6mS9ie5dcTDN9FRikhbKk0z1DLkZPM4mo+OcZ49czg30kB+vYF
	 mdtM0Wzl5+Z9WMTWIfHJrETg9MVfLk9NTgtwg+yX+/X0fYissWfgR55f7bvNH+6eYg
	 EIp0+MFIKEB0Ci1uQxWMNjvQPE65HjN0E4oRuLog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EAF7F80290; Thu, 28 Sep 2023 12:11:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AFBFF8016A;
	Thu, 28 Sep 2023 12:11:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1502CF801D5; Thu, 28 Sep 2023 12:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F679F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 12:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F679F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695895907421766043-webhooks-bot@alsa-project.org>
References: <1695895907421766043-webhooks-bot@alsa-project.org>
Subject: Gapless support
Message-Id: <20230928101153.1502CF801D5@alsa1.perex.cz>
Date: Thu, 28 Sep 2023 12:11:53 +0200 (CEST)
Message-ID-Hash: 4PXXPOYBXRVHCY3522K5BFPPZYXM3BI6
X-Message-ID-Hash: 4PXXPOYBXRVHCY3522K5BFPPZYXM3BI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PXXPOYBXRVHCY3522K5BFPPZYXM3BI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/tinycompress pull request #24 was opened from mohsRafi:

Gapless playback support with codec profile switching

Request URL   : https://github.com/alsa-project/tinycompress/pull/24
Patch URL     : https://github.com/alsa-project/tinycompress/pull/24.patch
Repository URL: https://github.com/alsa-project/tinycompress
