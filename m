Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75682644C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 14:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193DAEC1;
	Sun,  7 Jan 2024 14:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193DAEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704635053;
	bh=1E6OxTI4LEd70SuYapVw2/LXdFCB9hEjcEGCr1ax5sc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K/zf2Lb8lYRwpC6qjL4wm3OZCl/0pCS5+6BmIuPU+vigvVN7RhvgqN4cIcWJpWCMj
	 d8eNxZqnqkl07w4BWvQQa9vfmh18jLq22Cxi4UcHTHuKA7an8AD//a5PF8bNmPPbt1
	 Sbfi+eM481lRefn7LtHkZyq8+qPAmwdgs3zLyQ7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2775BF802DB; Sun,  7 Jan 2024 14:43:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8577F80567;
	Sun,  7 Jan 2024 14:43:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A49F80246; Sun,  7 Jan 2024 14:43:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB45F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB45F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704635010390335798-webhooks-bot@alsa-project.org>
References: <1704635010390335798-webhooks-bot@alsa-project.org>
Subject: Clang: fix versioned symbol build errors
Message-Id: <20240107134336.F1A49F80246@alsa1.perex.cz>
Date: Sun,  7 Jan 2024 14:43:36 +0100 (CET)
Message-ID-Hash: ZUGRCPLNN4AOXT7IK3YMJGIUM2JUO3YL
X-Message-ID-Hash: ZUGRCPLNN4AOXT7IK3YMJGIUM2JUO3YL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUGRCPLNN4AOXT7IK3YMJGIUM2JUO3YL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #376 was opened from nvinson:

When building alsa-lib with the following settings
```
CFLAGS='-O3 -pipe'
CXXFLAGS='-O3 -pipe'
LDFLAGS='-Wl,-O1 -Wl,--as-needed -fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind'
```
the build fails with errors similar to
```
ld.lld: error: version script assignment of 'ALSA_0.9.5' to symbol 'alsa_lisp' failed: symbol not defined
```
This PR corrects that issue and additional issues found while making corrections so alsa-lib will successfully build using clang and ld.lld.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/376
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/376.patch
Repository URL: https://github.com/alsa-project/alsa-lib
