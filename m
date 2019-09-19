Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FCB78D6
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 14:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1FB7167B;
	Thu, 19 Sep 2019 14:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1FB7167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568894556;
	bh=RrjIk7JyIxRe1SisoXX+57YmaO1w9Mg8YljzIqvvVDA=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZlk7KvIEX66Pf2Y9Ale+WgoywXBFLzbQ0r+gW0MwAz5x6ZtXF8GrOxiEOvwCYxl4
	 RZsXDioHr/zpGYN/5SzoxflEWtZdddlgsixRPh8n4UPP/Ya6wjnQK9k0rkRwGb6ebq
	 hOmG+5Ru6hEHLgQzajT2mN0241LDT85l3AxvWZzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6395CF80292;
	Thu, 19 Sep 2019 14:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7144F80361; Thu, 19 Sep 2019 14:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5C17F80292
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C17F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dqYn92od"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919120020euoutp01f4360c21165d8fa8a8e5c4c5810e5469~F1Snc8BzL0969509695euoutp015
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 12:00:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919120020euoutp01f4360c21165d8fa8a8e5c4c5810e5469~F1Snc8BzL0969509695euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568894421;
 bh=DerDbGAWoiR6Y2JqjtLtX7C9VItryXDf729+0qeS3uY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dqYn92odx2yP0HzliXFh0DCn6rXMML3tGhR4UgBel1lHgeUbR2nGJ6FySBqqNTq6l
 lBiP9xRe+RiCaPrUu8gXxey3r7E+MTSZe/+RuyYwoYZWfK38cZXUvwln1dtpAsBPW+
 b6e5z2VekeOygVnMTQbUyAFNKpKFLjfo/T4fcXn0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919120020eucas1p20bc03814d56763aea29ff973422e227b~F1Sm98Znp1387613876eucas1p2R;
 Thu, 19 Sep 2019 12:00:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5E.62.04374.4DD638D5; Thu, 19
 Sep 2019 13:00:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190919120019eucas1p10c2b11d19c92a1b1000e085a43abaece~F1SmTnfar0334803348eucas1p1Y;
 Thu, 19 Sep 2019 12:00:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919120019eusmtrp1271d47a0355dd49e526ba8a51b2d8db1~F1Sl6L4XO1335613356eusmtrp1B;
 Thu, 19 Sep 2019 12:00:19 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-56-5d836dd4de89
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.F9.04166.2DD638D5; Thu, 19
 Sep 2019 13:00:18 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919120018eusmtip1912f25e61f8d362b50fbaf09a381e6e3~F1SkxAugH1163111631eusmtip1T;
 Thu, 19 Sep 2019 12:00:18 +0000 (GMT)
To: Charles Keepax <ckeepax@opensource.cirrus.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <342d08ce-d14a-02b2-a590-13b28c8c5154@samsung.com>
Date: Thu, 19 Sep 2019 14:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTud+/uQ21ynZYnC8NlRUaaWXKhkgqpS0FPetqwqReNnMqmlmkU
 LkvNQrLSppCrIDM2bZlapuU01wMd1gwxMkXRXA6rrYe93a6R/33nfN95fIdD45IXhB99MCmV
 VybJE6Wku6i2bbxjiUWhli3VWT1YS6cRY2+XVBHsxf5BkrXkGBB7pbWDYM3maor9YsnFWMPA
 K4ItMTdhrK71DcXaxx4SbE5jK8V2VjiwNWKu2p5Ncvc0byjOUJlHcneuH+eKy/4g7lxNJeLs
 Bv+t1D73VXF84sF0XhkSccA9oWvoGpkyho48abyAn0CNKB/RNDDLoXRkZj5ypyVMBYKe/hFc
 CBwISi1FmBDYEVw2GycYN1eFbtSInFjC3ECgHZgniGwICs9qSSfhzWwH7fdnmBP7MMvgo6nH
 1QlnjBgMD3YRToJkQuHs43OuTmImAnof9LoKRMx8eNvc5tLMYPbAp74WQtB4wdPLgyIndmNW
 Q17OGdcwnPGFbMdNQsBzoc5W5vIAjI2C8eZ8TFg7ErrL1ZPYG6ymGkrAc+B5UYFIKFAjKGh4
 TQlBIYK3pnIkqFZCi6mTcJ4MZxZB1f0QIb0WjPpSXLikJ3TbvIQlPOF8bfFkWgy5pySCOhB+
 VBZPruAHZwb/iAqRVDPFmmaKHc0UO5r/c8uRqBL58mkqRTyvCkviDwer5ApVWlJ8cGyywoAm
 Pu35b9PnetT0M8aIGBpJp4u/LcyWSQh5uipDYURA41IfcdmKiZQ4Tp5xlFcmRyvTEnmVEc2m
 RVJfcea0vigJEy9P5Q/xfAqv/MditJvfCdS+/lTD7oDhqA+PdmT1rjNbZ3KB+/SjMbF7v264
 lTyceax+S5uj1xI5rF6cOrRJv3GsS+ujC29OizgZsm7OL3Xd/Ok79fs9/FfmkLWS8OrTGb/1
 J9t3vZ/1clx6KTJFl8xprXtksooF5VeDZL8stbEBR95Fs4HbwoqIsLubuz9lhUdJRaoEeWgQ
 rlTJ/wK48vSOZQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qXcptjDS516lpcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHuUnk1RfmlJqkJG
 fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbVZ4vZCt4zVpzYO4W5
 gXEvYxcjJ4eEgInE2jeHgGwuDiGBpYwSb5fvYe9i5ABKSEnMb1GCqBGW+HOtiw2i5jWjxM4j
 bUwgCWGBIImFv06B2SICRhIfj99iAiliFjjEJPHmw3J2iI4vjBILri8Aq2ITMJToPdoHtppX
 wE7i3p57YHEWAVWJ+wePsYLYogIREod3zIKqEZQ4OfMJC4jNKWAr0dnazQZiMwuoS/yZd4kZ
 whaXaPqykhXClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS
 9ZLzczcxAqN427Gfm3cwXtoYfIhRgINRiYf3h3pTrBBrYllxZe4hRgkOZiUR3jmmQCHelMTK
 qtSi/Pii0pzU4kOMpkDPTWSWEk3OByaYvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZ
 qakFqUUwfUwcnFINjJlqCWJp58wdpfOvN7Nw/F3s/Ytdr+HAmw/34u87h0fva2KYecB/huPv
 XA9tvb1fDHKYgr1qa16vmanXoz19p4TNyxfB4XKrsmb2dzCpr2WcELDru5XYXHmRVxfvC/1t
 PdbwK3uKvPy03YoTH9ubr1rG2vH/83rzHotd2/z/Z7Esu3P3r+zDvUosxRmJhlrMRcWJAB51
 dOn4AgAA
X-CMS-MailID: 20190919120019eucas1p10c2b11d19c92a1b1000e085a43abaece
X-Msg-Generator: CA
X-RootMTR: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
 <20190918104634.15216-8-s.nawrocki@samsung.com>
 <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 krzk@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 7/9] ASoC: samsung: arndale: Add support
 for WM1811 CODEC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/18/19 16:45, Charles Keepax wrote:
> If your removing the of_match_ptr below I think the
> __maybe_unused should be removed as well.

Good point, I will remove the now unneeded __maybe_unused as well.

--
Thanks,
Sylwester

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
