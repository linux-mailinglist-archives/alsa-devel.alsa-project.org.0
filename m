Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899212772D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 09:30:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B54515E0;
	Fri, 20 Dec 2019 09:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B54515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576830632;
	bh=re/H7sj3EsHr/DbrTyY6R2fO7wlw+t2ezzk55KRw0qk=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQjreJvAJ3Y7A7tXH/4Ie/RMkq4c/S6AmqPQBdA1CQk1QSK9Ffiu9VmuF0F/PRZGf
	 5+XlZt6PPPEIFbYNcHCQ17xDTPfmN357NygASAtS1uzbXeHBwG2BGpq72D0k1QIJiQ
	 BlTcdFuFSsNLMlmX6A3jn/6WhmM0Kzj0BkB6z6p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8200AF8022C;
	Fri, 20 Dec 2019 09:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B07FBF8015A; Fri, 20 Dec 2019 09:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A94CF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 09:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A94CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="tRUP7rDk"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191220082839euoutp020784fdd5f3696c472a1ff69dad723f7b~iBwCzSnoN2840528405euoutp02T
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 08:28:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191220082839euoutp020784fdd5f3696c472a1ff69dad723f7b~iBwCzSnoN2840528405euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576830519;
 bh=+fa0VU87LNjewzBV03NeQEIkxBkcNBaM2uAVq3jruXE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=tRUP7rDk7d5T+jDQq7Bc42Umj31C6vOmlyNtvWOaZpWPs6mwpTHjVA9mWZ3Vepb1j
 cc2pjpya1thQTx/aklyyFC7Ffa7jg1nT6vdSix97YDerJeSqdLsst+X3T+6V6xeocK
 8DC6eTvlF5zjINb7My3P9q/nIWuYeezipfEInMOo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191220082838eucas1p2c070513a60a859c6c85a4534a6b69aa5~iBwCkcyYQ2497524975eucas1p2u;
 Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.34.61286.6368CFD5; Fri, 20
 Dec 2019 08:28:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191220082838eucas1p13ba949e3210f0fa5c396f0092f48618a~iBwCJ-vQv1087710877eucas1p1V;
 Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191220082838eusmtrp1abcac6023feae756a829554344ec32ec~iBwCJVD6a1762117621eusmtrp1H;
 Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-8e-5dfc86366d41
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1E.DD.07950.6368CFD5; Fri, 20
 Dec 2019 08:28:38 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191220082837eusmtip249439c67bc00a5328281c16a93ddfce8~iBwBnE9qf1898618986eusmtip2b;
 Fri, 20 Dec 2019 08:28:37 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
Date: Fri, 20 Dec 2019 09:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219191646.GH5047@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTURjGObvX3etodp2aL2ZfE4MCtZXEhUKUCvZHhBEVBatm3lScU3bV
 0rDMTNcw8QNRp5aVMTH8YK5ZYplfLV05XU0spdBmqcwircQSye1q+d/znvd3nuc8cEhM1OHm
 R8YpkxmVUq4Q8wW48cWCJWhvzqJsV9NHCf12sJNHl4zZ+fTLrmsYnVuuRrTF0kTQ012tiC6z
 POPRXY5cN3qq2cGj2waniXCBtGkuiy+t1qdI9XU3+dJfrwpxab6hDkmbzZelc/rNkcRpwf5o
 RhGXyqhCws4JYtuf96CkcuLSRMF3IhO9c9MgdxKoUGgoNixrASmiahGM3J7HuOEHgppFA+KG
 OQQ9LY3Y6hVTh5HPLXQI7n6tWqFmENgWS3An5UUpoaPmId+pvakAsM0/xZ0QRuVj0OcYdi34
 lAQ0MxqXFlJhMGtwLGuSxKlA0A1FOqUPJQO1LpYjPKG33O6yd6d2w7iFc8GoLdAyU4lx2hfe
 2+/wnFFADREwMVqLOX2AOgjqWwqugBdMmwwEp/3BXJyHc/x1BGP99QQ35CF4k1WGOGofjPb/
 dr0No3ZAY2sIdxwBbfVdBOfvAcMzntwbPKDIWLoSKwR1joijt4PW1PAvtmPAihUgsXZNM+2a
 Nto1bbT/c6sRXod8mRQ2IYZhJUrmYjArT2BTlDHB5xMT9Gj5Y5mXTLOP0U9rVCeiSCReJwy/
 8EcmcpOnsmkJnQhITOwtHFEvyETCaHlaOqNKPKtKUTBsJ9pI4mJf4Z57UzIRFSNPZuIZJolR
 rW55pLtfJoopNB7S6kblI6cqLfjS4XG271FoQN+GkqvdR6u36U/o1nv0BFc0e7UpcjPjonQ+
 kxPxIeqTNfePfeuNDnToz/QWCcMPRB7J0PSma/wzKoKyfL88sX0ucnQnfdiafbxo0t1mHaAl
 EcdnH1QNxQk/NdpN5hul7a/t2UYf65XmTdiIGGdj5ZKdmIqV/wX9ge+NVAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7pmbX9iDS7sELG4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
 PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
 Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJex/8BRxoKZ7BVPJ3xkb2C8ydrFyMkhIWAicfzgNrYu
 Ri4OIYGljBKn9+5mh0jISJyc1gBVJCzx51oXVNFrRon5j6cwgySEBfIkDi5ZzQZiiwgoS1z9
 vpcFpIhZoI9ZYsflOawQHV9ZJObO/w02lk3AUKLrbRdYB6+AncSnLW+AbA4OFgFVieXXAkDC
 ogKxEt9XfmKEKBGUODnzCQuIzSlgJPHo/A2wVmYBM4l5mx8yQ9jyEtvfzoGyxSVuPZnPNIFR
 aBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwCjdduznlh2MXe+C
 DzEKcDAq8fA6pP2OFWJNLCuuzD3EKMHBrCTCe7vjZ6wQb0piZVVqUX58UWlOavEhRlOg3yYy
 S4km5wMTSF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkb2G3F1
 6iLnKkOSsqwuOCds2HzowGmL71tu96ZEL5Pvzk7+v2HGz8ZdLAWz/Q3SThx5s8UmvznM6/dF
 3+p9jVtuFlhcFLXpCWp/ekON7an9CqU1n1K/lpxMrZ2olvEk4b2Uxi2ntdxTD5vrsx6pWBp0
 d1cTz6MFoYInE3oeeKiJus9s/q9f80KJpTgj0VCLuag4EQBm5HxR6AIAAA==
X-CMS-MailID: 20191220082838eucas1p13ba949e3210f0fa5c396f0092f48618a
X-Msg-Generator: CA
X-RootMTR: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
References: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

Hi Mark,

On 19.12.2019 20:16, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 02:41:17PM +0100, Marek Szyprowski wrote:
>> On 19.12.2019 14:05, Mark Brown wrote:
>>> You can't trigger this via any other mechanism, all the other controls
>>> are fine?  There's *clearly* no issue with what the commit is doing,
>>> it's just flagging up that the card is not set.
>> I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the
>> issue is same.
> Yeah, there were a lot of refactorings in the last merge window so that
> doesn't entirely surprise me.  The commit should backport futher than
> that I think?

I've tried initially to cherry-pick it to v5.4, but the the code didn't 
compile due to lack of some macros, so I've gave up trying. I will check 
that now and backport needed macros too if you think this would help.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
