Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12BD6C0CDF
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 10:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F431F3;
	Mon, 20 Mar 2023 10:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F431F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679303611;
	bh=eJDi7VmCJPwdhn51rls84NY3kMe6hLd/04eqYQ7vwx4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pK0wlmiyCjyXVTXjBmzOOZfmI65bHuKh58PugvP0L/3z6uOTEa59BsMObnqg0511k
	 PUyFdN9KJ9nabsrPXGXkWHeCadZXenjSjfkDj7QLj6vGPt0a4yq7jyv2RaO+WBrohr
	 T/kyQ91QGhJREVXq4EI9bxq10tHYNI9+OAirJGhk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA852F80254;
	Mon, 20 Mar 2023 10:12:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1002F8027B; Mon, 20 Mar 2023 10:12:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF3EF800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 10:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF3EF800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679303549731095314-webhooks-bot@alsa-project.org>
References: <1679303549731095314-webhooks-bot@alsa-project.org>
Subject: Using mili/micro/nanoseconds in split files
Message-Id: <20230320091235.B1002F8027B@alsa1.perex.cz>
Date: Mon, 20 Mar 2023 10:12:35 +0100 (CET)
Message-ID-Hash: WLWWZJQBYWKDCQFK7SPEB7HHC6GHJ3OJ
X-Message-ID-Hash: WLWWZJQBYWKDCQFK7SPEB7HHC6GHJ3OJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLWWZJQBYWKDCQFK7SPEB7HHC6GHJ3OJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #15 was opened from kfilipan:

This is more of a feature request rather than an issue. When using `arecord` with `--max-file-time` and `--use-strftime`, one cannot get nanoseconds in the file name. This is however available in the e.g. `date` command `date +"%Y-%m-%d_%H-%M-%S.%N"` (`%N` gives nanoseconds). This would be useful for testing sound card recording time delays because having only seconds is not precise enough, e.g. it could take days or weeks for even slightly better sound cards to experience a second of delay. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/15
Repository URL: https://github.com/alsa-project/alsa-tools
