Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA031322904
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 11:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B1421678;
	Tue, 23 Feb 2021 11:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B1421678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614077394;
	bh=XQMvTzE9+I++tTNMWCCh7ZQSBMTW6Dt0C+twBkcLSfw=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+IahmBinfJLCxhuPR9bB3lWDNkSYeHIHVGfewvdRPdR7vQ2mHwyd1cIRLV+SCYBM
	 W4jCIa0GcqttsPxM2sxkZUdanG9ipCkYB9QBW8sgvOwxbvUP56f7wUG6d5/D/a7uVb
	 2hVADMp5dPBUkCkjpIYbT5NPCMRaGXfDHMRne9Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD53F8016D;
	Tue, 23 Feb 2021 11:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFECF8016A; Tue, 23 Feb 2021 11:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C0AF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C0AF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="CstA0S+n"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223104756euoutp02cb9cc614052ea51658e1faa64792016e~mWrslrXyb2142721427euoutp02M
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:47:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223104756euoutp02cb9cc614052ea51658e1faa64792016e~mWrslrXyb2142721427euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614077276;
 bh=O18C7NkrVUWOEXXqkIut9+cUmQ4gaqnLQQ/SVXsnk28=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=CstA0S+nuB4zTK47VHs2cu3k/6k0dzkVIH2APTnxg0Kh9yF///F22ZaNiwW8ATC+q
 8gUOWIudZoTZUd1nYiTsXhkjzH8Gp2TmApa8T4ZYB26JoCeqIsEhrfDwFVAu2ALLBM
 Z8tEFnAPMsfFJC0Q2jmMPOkISsQv3gcOF0dPmM/I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210223104756eucas1p17c2ef81948ba50b3030d516ff7bcdde4~mWrsdThNO2852828528eucas1p1R;
 Tue, 23 Feb 2021 10:47:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FC.61.44805.C5DD4306; Tue, 23
 Feb 2021 10:47:56 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210223104755eucas1p2cbacf24a50c0a2ff0098a6a2e45beb58~mWrr1qcAx2396623966eucas1p2I;
 Tue, 23 Feb 2021 10:47:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210223104755eusmtrp289c505fe6d85712a4ad06fe5617db20e~mWrr0-PHh2053320533eusmtrp2J;
 Tue, 23 Feb 2021 10:47:55 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-d3-6034dd5ce89d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.5D.16282.B5DD4306; Tue, 23
 Feb 2021 10:47:55 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223104755eusmtip1b6ecabb9ce0ad0d1fb6cd9605e141e16~mWrrbHxIB2343923439eusmtip1N;
 Tue, 23 Feb 2021 10:47:55 +0000 (GMT)
Subject: Re: [PATCH v2 1/6] ASoC: samsung: tm2_wm5510: fix check of of_parse
 return value
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <2c96aa88-2a53-3eca-e9d7-24ea9afe63a7@samsung.com>
Date: Tue, 23 Feb 2021 11:47:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-2-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7oxd00SDFbOYrG4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLBRsfMVq83PyGyYHNY8PnJjaPTas62TzmnQz02Hy62uPzJrkA1igum5TU
 nMyy1CJ9uwSujK4rv1gKrnJVHH96nK2B8QtHFyMnh4SAicTSy8cYuxi5OIQEVjBKTNsxjwUk
 ISTwhVHi/kJ2iMRnRol1B1YwdzFygHV8fxkPEV/OKPGqbQYrhPORUaJlzxqwbmGBaIk11zYx
 g9giAnESy7+cZwexmQXSJDac/w9WwyZgKNF7tI8RxOYVsJO4vHQFK4jNIqAqsfvsdbB6UYEk
 ib+/bzJB1AhKnJz5BKyXU8BL4vOiKYwQM8Ulbj2ZzwRhy0tsfzuHGeQgCYErHBI/j31jg/jT
 RWL6szZGCFtY4tXxLewQtozE/50gzSANzYwSPbtvs0M4E4D+P74AqsNa4s65X2wg/zMLaEqs
 36UPEXaUeHVqFRMkWPgkbrwVhDiCT2LStunQ0OKV6GgTgqhWkfi9ajoThC0l0f3kP8sERqVZ
 SF6bheSdWUjemYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzApHP63/EvOxiX
 v/qod4iRiYPxEKMEB7OSCC/bXaMEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxJW9bECwmkJ5ak
 ZqemFqQWwWSZODilGpg8Ml7YXNy/0IB3dlja83OeL+dm5btJb1yxPYz3fk/kZOvQurYVpsWP
 uq/tu1b3aIPo79isHx9u7zGMfnN5TX3Q/8p2S+F7QilclzMtvmh+m1Qlcduh4PhMxbJ7rNmO
 jAs5RFLyFnHLBK08JecqesTBmme1iPxlvUPidtfnh1ns4b0qud26cv7UY6E/Fh0Qs2hzcM66
 Yc724x+Ty+f/D3m0HgS8PjdpZSvXieLz4vFXZP3OBspXXToibtFX63BEI+fc+tKi+zcnPrd/
 dNTqFI+jvPTWR36cVY+UNlXbyLLKPLMMn62ceOBp1Ukvx/KS73J3nBWErd1kZ66/4bVJVP14
 oo5xnYtEe8sZiWOz2pRYijMSDbWYi4oTAd0sRWSpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7rRd00SDO6el7S4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLBRsfMVq83PyGyYHNY8PnJjaPTas62TzmnQz02Hy62uPzJrkA1ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jK4rv1gKrnJV
 HH96nK2B8QtHFyMHh4SAicT3l/FdjFwcQgJLGSVae+6zQcSlJOa3KHUxcgKZwhJ/rnWxQdS8
 Z5ToPfCTFSQhLBAtsebaJmYQW0QgTmL3wkMsIDazQJrEvpcn2UBsIYG7jBLfLySB2GwChhK9
 R/sYQWxeATuJy0tXgM1hEVCV2H32OjuILSqQJLF++k0miBpBiZMzn4DN5BTwkvi8aAojxHx1
 iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73i
 xNzi0rx0veT83E2MwBjbduznlh2MK1991DvEyMTBeIhRgoNZSYSX7a5RghBvSmJlVWpRfnxR
 aU5q8SFGU6B/JjJLiSbnA6M8ryTe0MzA1NDEzNLA1NLMWEmc1+TImnghgfTEktTs1NSC1CKY
 PiYOTqkGJhYGhRUHU8XWrpOWWfF+7lMF75X3e5fOFVXMO7GhmEkzm9uk4PHmGQVSJ4L/LLzv
 avlfWr0t+aVJgT/T0y8Konnbp0wrSxJ1nFp4RuSQpFyamNaVgIIwtrlrtnV+/ngw+9n192qv
 bpTsPODT83GDweNcNbe6kh+xu+oO9MxdUdthXBAtcu5u417VYLFOs1/Tf4kevf5hwUMTP+kI
 kaDeyEV867O3bBIVr+5I2P7/kXhFonSejGPbrivKX0xZLXcvnfBunX9nh71v1vvJfIF955yn
 t35+Hqjw3fKcmnDa6tzac8tmbbAoMQhkO5KutHdlxftA3iNWH5e5cwVcV3p732md955wvl/3
 2+JUzNPmK7EUZyQaajEXFScCAPLdrwo6AwAA
X-CMS-MailID: 20210223104755eucas1p2cbacf24a50c0a2ff0098a6a2e45beb58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213325eucas1p18611358dee29234661ceeac6ac29ce52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213325eucas1p18611358dee29234661ceeac6ac29ce52
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213325eucas1p18611358dee29234661ceeac6ac29ce52@eucas1p1.samsung.com>
 <20210222213306.22654-2-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
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

On 22.02.2021 22:33, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/tm2_wm5110.c:605:6: style: Variable 'ret' is
> reassigned a value before the old one has been
> used. [redundantAssignment]
>  ret = devm_snd_soc_register_component(dev, &tm2_component,
>      ^
> sound/soc/samsung/tm2_wm5110.c:554:7: note: ret is assigned
>   ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>       ^
> sound/soc/samsung/tm2_wm5110.c:605:6: note: ret is overwritten
>  ret = devm_snd_soc_register_component(dev, &tm2_component,
>      ^
> 
> The args is a stack variable, so it could have junk (uninitialized)
> therefore args.np could have a non-NULL and random value even though
> property was missing. Later could trigger invalid pointer dereference.
> 
> This patch provides the correct fix, there's no need to check for
> args.np because args.np won't be initialized on errors.
> 
> Fixes: 75fa6833aef3 ("ASoC: samsung: tm2_wm5110: check of_parse return value")
> Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
> Cc: <stable@vger.kernel.org>
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thank you for fixing all those issues.
