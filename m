Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1F78D60F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 15:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00283E8;
	Wed, 30 Aug 2023 15:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00283E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693401194;
	bh=FGfVTKd3BDUMxpuHfxAoT8OUd83NN9kkKgZ5Ad5Trg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jF2VVAWgiytf1ZKISPj68ePA9gUl57FAiCxvf2tqT4qF32eoVysyGLxwE5xPW9ICi
	 0nZCPPfbmW9Zei88wvdShktWZWaGf8Mat/GmJq2x1ZkiUySTBKPLLn1NUIyMJVtB+W
	 ANua6IpDjPizSKluJSdH3rAzusILyqP+0xa+CrRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97775F804DA; Wed, 30 Aug 2023 15:12:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27761F800F5;
	Wed, 30 Aug 2023 15:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA204F80155; Wed, 30 Aug 2023 15:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 432EDF800D1
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 15:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432EDF800D1
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbKzA-0006CX-Ln; Wed, 30 Aug 2023 15:11:52 +0200
Message-ID: <6c272652-9689-4826-6e84-8aa23086c6ac@leemhuis.info>
Date: Wed, 30 Aug 2023 15:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Content-Language: en-US, de-DE
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, regressions@lists.linux.dev
References: <ZO8oNb2hpegB6BbE@debian>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZO8oNb2hpegB6BbE@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1693401117;fa84ddfc;
X-HE-SMSGID: 1qbKzA-0006CX-Ln
Message-ID-Hash: YMB2JVXW5L5OW2N5D526PHVBT2LNDF2K
X-Message-ID-Hash: YMB2JVXW5L5OW2N5D526PHVBT2LNDF2K
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMB2JVXW5L5OW2N5D526PHVBT2LNDF2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30.08.23 13:29, Sudip Mukherjee (Codethink) wrote:
> 
> The latest mainline kernel branch fails to build alpha, csky and s390
> allmodconfig with the error:

Thx for the report and involving regzbot.

FWIW, 0day bot noticed this earlier and Charles Keepax (now CCed) afaics
even submitted a fix a bit more than a week ago, but that didn't get any
further it seems:
https://lore.kernel.org/all/202308212225.fGjY1rr6-lkp@intel.com/
https://lore.kernel.org/all/20230822114914.340359-1-ckeepax@opensource.cirrus.com/

Ciao, Thorsten

> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~
> 
> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> I will be happy to test any patch or provide any extra log if needed.

P.S.:

#regzbot monitor:
https://lore.kernel.org/all/20230822114914.340359-1-ckeepax@opensource.cirrus.com/
#regzbot monitor:
https://lore.kernel.org/all/202308212225.fGjY1rr6-lkp@intel.com/
#regzbot fix: mfd: cs42l43: Use correct macro for new-style PM runtime ops
