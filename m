Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7B2E3715
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 13:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA501706;
	Mon, 28 Dec 2020 13:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA501706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609158107;
	bh=VDesvarqFmTNv353FzQSNpo19ZpMichzC96ONasgYwc=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbuLjpTxZm5DlwNjFkfBfDLTZ233dQ8b6OdkB23RrYYrzmhus29CSnfY4jJ6pilhA
	 pbXBDgPyMmFKHBXh5bC/rVm1ujYO7+yFcVCREU2cV6M1UxJrb5+Aq5W9f13hhB/3C8
	 7Wbbd3seit58Q+fOkoZV/Fl9mrg42oJ0k5WYdb8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F226F801ED;
	Mon, 28 Dec 2020 13:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B4AF801F5; Mon, 28 Dec 2020 13:20:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64725F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 13:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64725F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="eM1ryiPe"
Received: from epcas3p2.samsung.com (unknown [182.195.41.20])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201228122001epoutp0451d487d3d75b98ab07232af3e6d2da62~U4K1Qlkt23244732447epoutp04N
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 12:20:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201228122001epoutp0451d487d3d75b98ab07232af3e6d2da62~U4K1Qlkt23244732447epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1609158001;
 bh=VyQD8fRZvpo5VaueWpf979fbEfFaB66sVWb9/VfA0Fs=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=eM1ryiPeXsQ0nJjX1pwTjVKAj08Zanxo5LPdHU4qkSFBbKNpow/OOgiGFIFLZfoiv
 YKD5ZxkyIMn5+Nc6GZYYLS/gnJ6geNBHOAJ7pLoNtuLZduyfc/6+5rpra3Po1IJSZ0
 zaPv3jjGUKr4n6cESDgAwia4x9DvXIbtqYO7B0hA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20201228122001epcas3p4e5d9e39ecd2b1c9033d6a6fff039cd05~U4K09zAcV1261212612epcas3p4L;
 Mon, 28 Dec 2020 12:20:01 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4D4Gp92YGdz4x9Pv; Mon, 28 Dec 2020 12:20:01 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20201228112315epcas2p46266c89ffb53b307a1d751a590d06ad0~U3ZQnyDAs0384903849epcas2p4n;
 Mon, 28 Dec 2020 11:23:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201228112315epsmtrp2f22511ca48cf2bb0e77acba6f03f6a5c~U3ZQmRL3R0418404184epsmtrp2x;
 Mon, 28 Dec 2020 11:23:15 +0000 (GMT)
X-AuditID: b6c32a2a-73fff70000002229-ba-5fe9c023f9b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CC.47.08745.320C9EF5; Mon, 28 Dec 2020 20:23:15 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201228112315epsmtip20a1fd4f32864fecac6d825970da64ae2~U3ZQYadWU1446414464epsmtip2h;
 Mon, 28 Dec 2020 11:23:15 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <broonie@kernel.org>, <cpgs@samsung.com>
In-Reply-To: 
Subject: [PATCH v3 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Mon, 28 Dec 2020 20:23:14 +0900
Message-ID: <1891546521.01609158001314.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbJUeENUhUsXEa3TZiLDsAvVI+A+AIogZowAsXqHPA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsWy7bCSvK7ygZfxBos+c1hcuXiIyWLqwyds
 Fi8PaVrc/WFuMWNbN4tF470JbBarr25hsnh1eBejxbcrHUwWv/4/Y7I4enExk0XD3WZ2i5eb
 3zBZHGmcwuTA57HhcxObx85Zd9k9Nq3qZPOYdzLQ49uZiSwefVtWMXpsPl0dwB7FZZOSmpNZ
 llqkb5fAldH/ZBpjwTSeisXbFjM2MD7g7GLk5JAQMJG4sfo4SxcjF4eQwA5GiRXn7jJDJCQk
 Psw/ww5hC0vcbznCClH0nFHi7I4eNpAEm4CuxJd7d8AaRASyJF7+B2nm4mAWeMckMXHNRxaQ
 hJAAj8SrDfsZuxg5ODgFeCUm/LMGCQsLeEmc+X2WCcRmEVCVeHLxPyOIzStgKbH9/AkoW1Di
 5MwnLCCtzAJ6Em0bwcLMAvIS29/OgbpTQeLn02WsICUiAlYS57amQ5SISMzubGOewCg8C8mg
 WQiDZiEZNAtJxwJGllWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMHRqaW1g3HPqg96
 hxiZOBgPMUpwMCuJ8H5ieR4vxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTU
 gtQimCwTB6dUA5Oi6TLN6paAqzqlOy08Iq7sZv+2Z+GM3ZfN/9xQ3RTV2R71qjbkQFqlFGPh
 pB9PqiofCnj6z7S3OsS97VHVv/tpf9zu7ZmdvkKb/8N2jzWrzz+Rc3+y5Zh25LI5nJdPbesK
 u7H35utpJ2tvbr6Wd8Fd5HVUYKzP55XyX6Pl1s+rNzGV2PhePerwqx+JIW8fiBd8P1rV/LA7
 9bP+sYmR9YtVvxQ1J97zd7zwKL1l3SVucbaIhdf5I19Z6q5/Nnkfxy317svfLayy+O5fCTpU
 fzXlyfTmB3kzee/Kx09alK70TiXuycJS6X1mn1ri4pb11CivPJRjXsReJur3ZOmtSS2Lfddd
 8VlYJ7ZF/LvBqmMmSizFGYmGWsxFxYkALZhHeT0DAAA=
X-CMS-MailID: 20201228112315epcas2p46266c89ffb53b307a1d751a590d06ad0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201228112315epcas2p46266c89ffb53b307a1d751a590d06ad0
References: <CGME20201228112315epcas2p46266c89ffb53b307a1d751a590d06ad0@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>, lgirdwood@gmail.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 kimty@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 cpgs@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

>Hi Gyeongtaek
>
>Thank you for your help
>
>> I tried to find out some change from the history.
>> However, I saw that dpcm_lock never be held in dpcm_be_dai_trigger() from the beginning.
>> So, I just fixed some miss from the commit comment and resend.
>> If you have another suggestion or request, just let me know.
>
>OK, thanks.
>I just thought it was related to recent (especially mine :) patch.
>
>BYW, your posted v2 still doesn't have alignment on log.
>Is it mailer issue ?
Sorry.
I didn't fully understand what alignment means.
I fixed the log by looking at some previous commits.

Thank you so much.

Gyeongtaek Lee
>
>> And I have a question.
>> This patch can?t be applied to stable branches directly by conflict.
>> I found out following commits are needed to apply this patch into the 5.4 stable.
>>  ASoC: soc-pcm: remove snd_soc_dpcm_be_get/set_state()
>>  ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate code
>> In this case, what should I do when stable maintainer requests resolving conflict to me?
>> Should I send those patches to the maintainer?
>> Or rewrite the patch on the latest of the each stable?
>
>Mark, please help him
>
>Thank you for your help !!
>
>Best regards
>---
>Kuninori Morimoto
>

Gyeongtaek Lee (1):
  ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()

 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)


base-commit: fa02fcd94b0c8dff6cc65714510cf25ad194b90d
-- 
2.21.0



