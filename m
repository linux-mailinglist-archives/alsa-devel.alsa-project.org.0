Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C777322972
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 12:27:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF50C1676;
	Tue, 23 Feb 2021 12:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF50C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614079637;
	bh=UbaWOK60Y1s0FqA9xE88FfVEkn3WMc2HVe0Awl+WqjU=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kq8E1SLWp47psPmnBGewV7pY6mRwtESMSpOaSY4C5W8x8lEx2Cv9BS0xJgKeElmk3
	 acfK5OS5BmsTHEoYNLJvrA8bEcXeo5BO5bTTaCSOb1avuhCOYcPy6fiF+NsgPrQdTH
	 XnfvgzBg57b7BiWYy0kN3k956D0MBz1jSsSqlg3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE2AF8016D;
	Tue, 23 Feb 2021 12:25:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AE81F8016A; Tue, 23 Feb 2021 12:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77CB0F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 12:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77CB0F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="P9nEoA8v"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223112520euoutp023f43e7083d7fca9981078ef70c946ad8~mXMW2vRkS1099010990euoutp02b
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:25:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223112520euoutp023f43e7083d7fca9981078ef70c946ad8~mXMW2vRkS1099010990euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614079520;
 bh=UbaWOK60Y1s0FqA9xE88FfVEkn3WMc2HVe0Awl+WqjU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P9nEoA8vUNDIf3a8dLoT9vp6LKYNITO5JGiv9qtTEzx5UOvaTBBoDr0DNplESKPQq
 hj5cgySAzctWdKptMetGTbFy6OmPC8B/1mzwWZDlCmiZuANieiNn0HxGMVJTv8YXUy
 /o90CEWvFbMPwVA921l1LEnCKWjwP0hYV/LM9tmQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210223112519eucas1p2d77d9cdbba6416ee6ca64d1a1f1df14c~mXMVrYjzl1174011740eucas1p2U;
 Tue, 23 Feb 2021 11:25:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4E.F7.27958.F16E4306; Tue, 23
 Feb 2021 11:25:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210223112519eucas1p1dd9ee73818364038b0b41787bd77edcf~mXMVT1CGx2060620606eucas1p1M;
 Tue, 23 Feb 2021 11:25:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223112519eusmtrp1d0aa594936847ad0e14e9a526fecf144~mXMVTQ9Ls1429314293eusmtrp1q;
 Tue, 23 Feb 2021 11:25:19 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-18-6034e61fc910
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.C3.16282.E16E4306; Tue, 23
 Feb 2021 11:25:18 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223112518eusmtip13b9c102d4d067f11118c385ce633fd2c~mXMU0co4Z1221512215eusmtip1J;
 Tue, 23 Feb 2021 11:25:18 +0000 (GMT)
Subject: Re: [PATCH v2 6/6] ASoC: samsung: tm2_wm5510: remove shadowed variable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <2625c1b1-1e05-9d04-e414-252674688eee@samsung.com>
Date: Tue, 23 Feb 2021 12:25:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzneV35ZyYJBnMeiFhcuXiIyWLqwyds
 FufPb2C3+PX/GZPFy81vmBxYPTZ8bmLz2LSqk81j3slAj82nqwNYorhsUlJzMstSi/TtErgy
 1qyYzF7QxlTx/XF9A+N1xi5GTg4JAROJb1ePAtlcHEICKxglHs44wQaSEBL4wijRuJofIvGZ
 UaJvSRcLTMehllvsEEXLGSUWbymHKPrIKHHm2SuwscICgRJfrm8FKxIRiJNY/uU8mM0s4CMx
 79k7sEFsAoYSvUf7wOp5Bewkdi3ZwgxiswioSrSeb2QFsUUFkiT+/r7JBFEjKHFy5hOwXk4B
 L4mT188wQ8wUl7j1ZD4ThC0vsf3tHGaQgyQETnBIbPs0lx3iaheJC5veQ9nCEq+Ob4GyZSRO
 T+5hgWhoZpTo2X2bHcKZwChx//gCaChZS9w59wsYMBxAKzQl1u/Shwg7SnxdNxUsLCHAJ3Hj
 rSDEEXwSk7ZNZ4YI80p0tAlBVKtI/F41nQnClpLofvKfZQKj0iwkr81C8s4sJO/MQti7gJFl
 FaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmCCOf3v+KcdjHNffdQ7xMjEwXiIUYKDWUmE
 l+2uUYIQb0piZVVqUX58UWlOavEhRmkOFiVx3lWz18QLCaQnlqRmp6YWpBbBZJk4OKUamESt
 mm+nTZ3Actbz2EvO3MwTD1v25uq2v1wjy5lWJLbI3y/ghGzBHvcHZ0PDDL53bmX98nhxMStv
 Ys2iX4+KhI78tb197WLeATsmjdlW0jfqmpy7XwUuP97tYf6k8qO/t6Unl/TSff4zTv/cvilo
 h03xn2PTp5s9O/RjXtc9y96pNeYMu4r66lzjl9wyti2Yzy604UqAcCrvd39Nhci/x49zLj2r
 75gxibv/iEBZv8yVyRdMVxy9zpfhtu3U5YcXBbSUjBezi7KZXJsvVL+8ckv/4a7z6dML9r78
 9XT72s7P23oTbp/tuD5BMddC8oTj4T3h5r9KtQ/adhwWneq/ztHB/wzby49h3x+0fbk/daMS
 S3FGoqEWc1FxIgBPlmuznwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7pyz0wSDB5ts7a4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlrFkxmb2gjani++P6BsbrjF2M
 nBwSAiYSh1pusXcxcnEICSxllFjce4eti5EDKCElMb9FCaJGWOLPtS42iJr3jBInf6xiB0kI
 CwRKfLm+FcwWEYiT2L3wEAuIzSzgIzHv2TsWiIa7jBIXDsxmAkmwCRhK9B7tA9vMK2AnsWvJ
 FmYQm0VAVaL1fCMriC0qkCSxfvpNJogaQYmTM5+ADeUU8JI4ef0MM8QCdYk/8y5B2eISt57M
 Z4Kw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2M
 wJjaduznlh2MK1991DvEyMTBeIhRgoNZSYSX7a5RghBvSmJlVWpRfnxRaU5q8SFGU6B/JjJL
 iSbnA6M6ryTe0MzA1NDEzNLA1NLMWEmc1+TImnghgfTEktTs1NSC1CKYPiYOTqkGJp74S+uK
 yzctfOTzWWKTScdvjW/butaLbFwZuPrpsRlOnbMeLd54srowROBZuoNLyfID2UuOzGjcdo87
 hPtPRYan/rJHN+7rHD2/IlEq1jY7+LqF2LtMjSfNLacUrhX5eW3ddrdL4uulJU8DRPSk7L41
 7HbO8Zi4K95oxZmH+sJvtI4GdT+85pHBOd9M/NGD1XLMV69fmBN+YrNDs5j5Pqv1m5ytXsf+
 4s8MOLDPdJXHRQmNDS7rXSdpCXOIh6U6r76lsk/2yOrX/320b0W9bA/czmt8NebGfqlb35rz
 rob/3uUj9zAnmN1I/5y72dGUiVW5p//277lV0bdjymP/b9lV24/Zyf5x3HC6Ja78mJESS3FG
 oqEWc1FxIgC59D/4MgMAAA==
X-CMS-MailID: 20210223112519eucas1p1dd9ee73818364038b0b41787bd77edcf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213327eucas1p270af686a642a4cd31852635eed870c0c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213327eucas1p270af686a642a4cd31852635eed870c0c
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213327eucas1p270af686a642a4cd31852635eed870c0c@eucas1p2.samsung.com>
 <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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
> Move the top-level variable to the lower scope where it's needed.

Actually I like your original patch better as there is really no need
for multiple lower scope declarations in that fairly small function.
