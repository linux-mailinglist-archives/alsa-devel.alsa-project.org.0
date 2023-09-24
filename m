Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55E7AC719
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Sep 2023 10:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682BB82A;
	Sun, 24 Sep 2023 10:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682BB82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695542509;
	bh=W/9voQN79FrjMOxz3vZgkMORwOQRKyTjBJtCLs0fKUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oM3e49+sJIH7D/7Yei+KGpowNH/svGu0beBgivX3Np9jXTWUH3wo2xzh7nNLusivo
	 JWr9Ozv/JyE7GWazzUFDlRy6W5sqLGvfxS6P1Ym3OF7QtXufM4lxh50x2+Nne0HJ70
	 Il229GZiE1V+boo3Sh8tUh0LeAAiIfNkJtY3rmVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5914F8016A; Sun, 24 Sep 2023 10:00:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46535F80130;
	Sun, 24 Sep 2023 10:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B28B2F8016A; Sun, 24 Sep 2023 09:58:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 642F8F800AA
	for <alsa-devel@alsa-project.org>; Sun, 24 Sep 2023 09:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 642F8F800AA
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qkK0m-0004u2-NT; Sun, 24 Sep 2023 09:58:40 +0200
Message-ID: <20663b9e-8ff3-4e50-ba89-6cc028ab0981@leemhuis.info>
Date: Sun, 24 Sep 2023 09:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Content-Language: en-US, de-DE
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, regressions@lists.linux.dev
References: <ZO8oNb2hpegB6BbE@debian>
 <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: 
 <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1695542324;f4977549;
X-HE-SMSGID: 1qkK0m-0004u2-NT
Message-ID-Hash: EIWTSOXNJKJ3X2DZWGUN7MOQCST3B6ND
X-Message-ID-Hash: EIWTSOXNJKJ3X2DZWGUN7MOQCST3B6ND
X-MailFrom: regressions@leemhuis.info
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIWTSOXNJKJ3X2DZWGUN7MOQCST3B6ND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23.09.23 17:02, Sudip Mukherjee wrote:
> On Wed, 30 Aug 2023 at 12:29, Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Hi All,
>>
>> The latest mainline kernel branch fails to build alpha, csky and s390
>> allmodconfig with the error:
>>
>> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>>  1106 | static int cs42l43_resume(struct device *dev)
>>       |            ^~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>>  1076 | static int cs42l43_suspend(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~
>>
>> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> Since its almost time for v6.6-rc3, so just a quick reminder that this
> build failure is still not fixed.

Are you sure? I had expected eb72d5207008db ("mfd: cs42l43: Use correct
macro for new-style PM runtime ops")[1] that was merged this week would
have fixed this. Or am I mixing different problems up here?

Ciao, Thorsten

[1]
https://lore.kernel.org/all/20230919110320.1388527-1-u.kleine-koenig@pengutronix.de/
