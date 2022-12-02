Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387636402BE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 09:59:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FD617F1;
	Fri,  2 Dec 2022 09:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FD617F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669971549;
	bh=0+/uEzFKdIeOQDdGLf+UJNG5nK6OtNSiBMBMP911Ujk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IbfOAQ5LQJoXojrnvq8mwBTDgckaDLBeSBlp1yfdAPVDLKCSlO8aHmXuDIF3lGF8a
	 ExSjDlY5UVr7Y7PTdhnBVlMeON3tjk1ZDQIHcAzRigRLtfJkNUQi4T5VUnzkEcKv8p
	 SzqCn224qPevLTqPgIEUE+F1dMQq6HV0iTpWaGlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF9DF800BD;
	Fri,  2 Dec 2022 09:58:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C80F800BD; Fri,  2 Dec 2022 09:58:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B54BF800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 09:58:05 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 77B22A0040;
 Fri,  2 Dec 2022 09:58:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 77B22A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1669971485; bh=+T1hHk5yytZNhOvSZXVQTvkZacFlMWaHn/qEabjovXk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rq7JA8Lppg/Ra7HWAxn5Ihz7Qc4zr3JlpLoNHL9lHk84TwbfkboU+YSduKJcVwnvi
 +UdUuWyzlpZompztic1mTFBo6kos1/VhFZh8WAaaleRd7V+7vzVK0Am4kcaQ5wXD4+
 m0BUsTOXzMYMtwf7lUM2Si4c2zJZ56cN4Ipm6VNY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  2 Dec 2022 09:58:00 +0100 (CET)
Message-ID: <9501fe01-4a3f-f83a-f9aa-153410a94f7e@perex.cz>
Date: Fri, 2 Dec 2022 09:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/7] kselftest/alsa: pcm-test improvements
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Shuah Khan <shuah@kernel.org>
References: <20221202001749.3321187-1-broonie@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20221202001749.3321187-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02. 12. 22 1:17, Mark Brown wrote:
> This series provides a bunch of quick updates which should make the
> coverage from pcm-test a bit more useful, it adds some support for
> skipping tests when the hardware/driver is unable to support the
> requested configuration, support for providing user visible descriptions
> and then expands the set of cases we cover to include more sample rates
> and channel counts.  This should exercise switching between 8kHz and
> 44.1kHz based rates and ensure that clocking doesn't get confused by
> non-stereo channel counts, both of which are I expect common real world
> errors, at least for embedded cards.
> 
> v3:
>   - "Rebase" onto Takashi's current tree (with a revert).
>   - Include Jaroslav's changes to specify all tests in the configuration
>     file parsing.
>   - Add a new "description" field to the configuration instead of trying
>     to name the tests.
>   - Always run both default and per-system tests, logging our success at
>     setting the per-system configurations as a separate test since they
>     shouldn't fail.
> v2:
>   - Rebase onto Takashi's current tree.
>   - Tweak the buffer sizes for the newly added cases, don't be quite
>     so ambitious in how big a buffer we request for 96kHz and don't
>     go quite so small for 8kHz since some devices start hitting lower
>     limits on period size and struggle to deliver accurate timing.
> 
> Jaroslav Kysela (1):
>    kselftest/alsa: pcm - move more configuration to configuration files
> 
> Mark Brown (6):
>    kselftest/alsa: pcm - Drop recent coverage improvement changes
>    kselftest/alsa: pcm - Always run the default set of tests
>    kselftest/alsa: pcm - skip tests when we fail to set params
>    kselftest/alsa: pcm - Support optional description for tests
>    kselftest/alsa: pcm - Provide descriptions for the default tests
>    kselftest/alsa: pcm - Add more coverage by default
> 
>   tools/testing/selftests/alsa/Makefile         |   2 +-
>   tools/testing/selftests/alsa/alsa-local.h     |   3 +
>   tools/testing/selftests/alsa/conf.c           |  26 ++-
>   .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  |  43 ++--
>   tools/testing/selftests/alsa/pcm-test.c       | 205 ++++++++++++------
>   tools/testing/selftests/alsa/pcm-test.conf    |  63 ++++++
>   6 files changed, 250 insertions(+), 92 deletions(-)
>   create mode 100644 tools/testing/selftests/alsa/pcm-test.conf
> 
> 
> base-commit: 7d721baea138696d5a6746fb5bce0a510a91bd65

All looks good. I would probably do some things differently, but the goal is 
same. I am fine with all changes.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
