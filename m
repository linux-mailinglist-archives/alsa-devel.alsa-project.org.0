Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6222F6C5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 19:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04451169F;
	Mon, 27 Jul 2020 19:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04451169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595871414;
	bh=3KhX4gTSTTYi080pnBPjvvigHVL5ay3Crc2gyhTtCz0=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dST1gUZP0yPl6rmJkcouZ+A5QYKdmC8xhKjZUDFUmeUHhVWMW6iRhkGhZ4oOA3Tvm
	 pCknGZ4MmI/Y9KuA4qurOdTyrZnI67IMBKG/eMD9wyfuT7X83emv7Uz3PNEWnXl/2J
	 S1M7B0SUHtsi+Q6ZeGoy9sK/5mTq/m1C+SKcaioY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0C0F80171;
	Mon, 27 Jul 2020 19:35:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C73AF80171; Mon, 27 Jul 2020 19:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B1BF800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 19:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B1BF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="nA8ll4ov"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200727173454euoutp0243204afe325d3892365080cffd47d89a~lrHzDfMke1899018990euoutp02j
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:34:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200727173454euoutp0243204afe325d3892365080cffd47d89a~lrHzDfMke1899018990euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595871294;
 bh=DPIsTcFj/GmRHGK9eB6V1JsDF43BAwnQ4GrYpgFXVlc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nA8ll4ovg1vQ18csql6HRLL4ru1Qb3J1wdYZu+XVXTj5b/OIQKQxad3+SBwb3KGiS
 /0/GdVrVcazgK2l15Gdjp9ktxTRW2hpS4qeVaPGDrEMjsgwudKW46hCWrmt7apljp9
 hGPQJhdbjKRrTzYLhIS73lmks3QA3skcrD0YkXrI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200727173454eucas1p1f10194a61bc0a961a599411d778e7f2f~lrHysoQSO0766507665eucas1p1d;
 Mon, 27 Jul 2020 17:34:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 65.D0.05997.E301F1F5; Mon, 27
 Jul 2020 18:34:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200727173453eucas1p20c8335a997c175d8a2694b7557f218ee~lrHyOs7I60366203662eucas1p2u;
 Mon, 27 Jul 2020 17:34:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200727173453eusmtrp1f655b19d9b162ac1c075163ae6f734e0~lrHyOF66m1928319283eusmtrp1k;
 Mon, 27 Jul 2020 17:34:53 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-32-5f1f103e40e8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3C.F8.06017.D301F1F5; Mon, 27
 Jul 2020 18:34:53 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200727173453eusmtip145a05451e07e1c8b885c219ccc0684d6~lrHxaFs3g2983629836eusmtip1S;
 Mon, 27 Jul 2020 17:34:53 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] ASoC: samsung: Document DT bindings for Midas
 sound subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <0045d784-2dd2-1e0e-7495-fa335a32e46f@samsung.com>
Date: Mon, 27 Jul 2020 19:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727171520.GB3507@kozik-lap>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTtm/fmzZvJ0ee4XSwXhqSF0kx/PChsQXD6U+qvUNRGfYySG/Nc
 84/kUi6pZKIObhiYTJo6mZqp0TjlMjlTKCiahTBEmpahUS4tznxF/jvn3nu451wuTch6hO50
 Yko6p05RJskpCdn7ctN8IojxijnZv+XKTr/RC9ju2k4hW71oodgmg0nIms1dIrbWPCxgOwwL
 IrZwyCBie17NU+fEiq71G5RCpy2mFAWdOkpR3qNFinWdZ6gwQnImnktKzOTUfkFXJQmrG8NE
 Wq8gO78iPA9ZUAmiaWACobH+SAmS0DKmDcH7e49EmGwgWJn5SGGyjmBiZ3OXiG2Kx0VmIW7c
 R/CpeJTE5CuC9i81yDrlxERCQ8dNm8KZOQozP7/bFAQzhaBqbI2wNijGH26/KLcJpEwQ6Efq
 bJhkfGDQoCOt2IWJhs6lPgGecYTxOgtpNS5mfKH0G28tE4wbzFmaBBh7Qd9qPWHdBYxeBF2b
 gwS2HQzdU2UIYydYHu0RYXwQjFVlJBbkIyh7Oi/CpHL3HKPNfxWn4a1pi7JuJnbjdA744fJ5
 2Kg1CfEl7WF21RGbsIc7vTUELkvhVpEMTx+CbW2NAGN3KLX8JiuRXLMnmWZPHM2eOJr/e5sR
 qUVuXAafrOL4Uylcli+vTOYzUlS+canJOrT7S8Zfoxv9aGAnVo8YGsntpAnPPGNkQmUmn5Os
 R0ATcmfphUljtEwar8y5zqlTY9QZSRyvRwdoUu4mDWhZipIxKmU6d43j0jj1v66AFrvnIfG+
 1OnJgLOHc1ea7Def3A2e8Bj7zG+Htz9vW27wsCucyBspbv0QlxYWOB4R5Z3oEXE57ErrcfNs
 Vdq7rZAt1dwalEYV1O2PkYek85rXF6vzHIa0O1S/JdB4SeXUaKxoySIeKEPlDyPNE96Lsa4L
 HT8aTA5GXXxukU9DNmEKcJGTfILS/xih5pV/AF0pbhFHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7q2AvLxBhPOGllcuXiIyWLjjPWs
 FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gttpy5zebA6bHhcxObx6ZVnWweLes3
 sXn0bVnF6PF5k1wAa5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpq
 TmZZapG+XYJextsv+5gLtjFVNPcHNTA+Yexi5OSQEDCR2Np2nrWLkYtDSGApo8S+GxvZuhg5
 gBJSEvNblCBqhCX+XOtig6h5zygx7855sGZhgWiJuWvb2UBsEQFNiet/v4MNYha4zChx6clS
 JoiOTYwSN86sAKtiEzCU6D3aB9bNK2AncejwTDCbRUBVYs+RTSwgtqhAnMTyLfPZIWoEJU7O
 fMICchGngJ5E99dikDCzgLrEn3mXmCFscYlbT+YzQdjyEtvfzmGewCg0C0n3LCQts5C0zELS
 soCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgHG479nPLDsaud8GHGAU4GJV4eA8clIsX
 Yk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6DfJjJLiSbnA1NEXkm8oamh
 uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxutqb+/VF2vGBF0vq7+bpD0/
 x4/5dMaO9D+TVhavWhy4cr2W4M3HWZf7nXtu3uEtc7TqqmjYevJOm9j3OLu0+e9fejfnzlj0
 5cefvmMnprX7veT5r1xULn6hrmvmzobl2yZ23hB3+Wkh+u3OHMWYtQ43NkR+sP37wdsn/DuH
 f+OP7Bm1Jkua1JRYijMSDbWYi4oTASgWb8LZAgAA
X-CMS-MailID: 20200727173453eucas1p20c8335a997c175d8a2694b7557f218ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e
References: <CGME20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e@eucas1p1.samsung.com>
 <20200727163027.9242-1-s.nawrocki@samsung.com>
 <20200727171520.GB3507@kozik-lap>
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On 27.07.2020 19:15, Krzysztof Kozlowski wrote:
>> +  cpu:
>> +    type: object
>> +    properties:
>> +      sound-dai:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array

> I think it is just a phandle, not an array?

Yes, indeed. I will fix it and resend.

-- 
Thanks,
Sylwester
