Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A61263CA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 14:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CF01614;
	Thu, 19 Dec 2019 14:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CF01614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576762990;
	bh=z1yzRs0tLWcOG89S1nJdzNnoUEj5nxl9VPdPGgFxGRQ=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHbyqkvadR0FBxOSsZw1PmiRYgSf58gDS5tKuJGoo3BIG2hdQQva0MUYSP1c/lWvy
	 Fh7v9UwpDmYb4HWhJW/PRJ1xUmY8+NkILXRScRC5eJUlyzzwkU6iZzf3//x6maFSV4
	 wNio4iOvvk9wrs0qQb6RK1iASQyzfnh+sYeolTeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F5FF80218;
	Thu, 19 Dec 2019 14:41:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AEF9F80234; Thu, 19 Dec 2019 14:41:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61605F80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 14:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61605F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="P57IyR6e"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191219134118euoutp024df9a56fbb95d858d849058a57d52a30~hyXvwAE4Q2663026630euoutp02K
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 13:41:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191219134118euoutp024df9a56fbb95d858d849058a57d52a30~hyXvwAE4Q2663026630euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576762878;
 bh=0+bhEYmmShhkGih1TvIRBXxyncmEzRWx7fx8oj2UNiE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P57IyR6eRONAKv6Yw5W5c/z5E4VSTUpktWXiHcwLte9BxCGGWDz+hM3tCe7yD2Ab2
 AZvw0k4ceWPh20FQ+LXGEH8oppKax3lxNFTo+Zxc3+qnxhpC52lgAQWE7+D7wxdEA9
 2zBM54Ygc96vURPURQzmP3x63KcMOaZbsXLoiH6A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191219134118eucas1p21c6a9e9c76c40062b7d1c2a63285e4e4~hyXvmGmAC2022720227eucas1p2o;
 Thu, 19 Dec 2019 13:41:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.84.61286.EFD7BFD5; Thu, 19
 Dec 2019 13:41:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191219134118eucas1p1c41633ba54b742365ce73face4e33e9b~hyXvVk_sT2305123051eucas1p18;
 Thu, 19 Dec 2019 13:41:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191219134118eusmtrp25ea486dc1295596662fffc2da8ee0c95~hyXvU9hvC1783117831eusmtrp2N;
 Thu, 19 Dec 2019 13:41:18 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-46-5dfb7dfe16a8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5E.61.08375.EFD7BFD5; Thu, 19
 Dec 2019 13:41:18 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219134117eusmtip22c98e75f2dbe257d3b3e567006195c09~hyXuykVTn1986919869eusmtip2n;
 Thu, 19 Dec 2019 13:41:17 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
Date: Thu, 19 Dec 2019 14:41:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219130559.GE5047@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djPc7r/an/HGkzcKG9x5eIhJoupD5+w
 WZw43Mhs0T6zg9Hi/PkN7BavDu9itJhxfh+TxeE37awWLze/YbLYc/EVuwOXx4bPTWweCzaV
 emxa1cnm8e3MRBaPvi2rGD02n672+LxJLoA9issmJTUnsyy1SN8ugSvj9qlXjAVTWSsO3/nK
 3MDYwdLFyMkhIWAi0XV8HlsXIxeHkMAKRomWf5OhnC+MEtt2nWWEcD4zSny6c4wNpmX6l/tQ
 VcsZJea13YeqessosXjhEnaQKmGBPImDS1aDdYgIKEtc/b6XBaSIWaCPWeLUmxtgCTYBQ4mu
 t11gNq+AnURv809WEJtFQFXi6rIWoAYODlGBWImO5RkQJYISJ2c+AQtzChhJvFlZAxJmFpCX
 2P52DjOELS5x68l8JpBVEgKX2CUevZkBdbWLxKJjF6BsYYlXx7ewQ9gyEv93wjQ0M0o8PLeW
 HcLpYZS43DSDEaLKWuLw8YusIJuZBTQl1u/Shwg7Ssy+95kZJCwhwCdx460gxBF8EpO2TYcK
 80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1C8tksJO/MQvLOLIS9CxhZVjGKp5YW56anFhvmpZbr
 FSfmFpfmpesl5+duYgSmrNP/jn/awfj1UtIhRgEORiUeXoe037FCrIllxZW5hxglOJiVRHhv
 d/yMFeJNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoHRWuV5
 T4nu+2axtbue7Z1jdnvOQp23a5VeyqvPW2xhdWVRVo1O/LQDi9bzn5v5S/7klGUZjzjYYhcw
 ee7XedZcuf26Zbv/8XutvhH7r1r6pG5jcFzrrL5Pr7h27ibb32q+n8v9hIVtg1gy6l1uve80
 1VOY1LYx1zLO9++c6g9ONkIfPlVv72BTYinOSDTUYi4qTgQAbqUZ+lUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xe7r/an/HGsxr47W4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
 PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
 Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx+9QrxoKprBWH73xlbmDsYOli5OSQEDCRmP7lPlsX
 IxeHkMBSRomP/d+ZIBIyEienNbBC2MISf651QRW9ZpToXrgeLCEskCdxcMlqNhBbREBZ4ur3
 vSwgRcwCfcwSOy7PASsSEjjOIvFlShqIzSZgKNH1tgusgVfATqK3+SdYDYuAqsTVZS1gJ4kK
 xEp8X/mJEaJGUOLkzCdAcQ4OTgEjiTcra0DCzAJmEvM2P2SGsOUltr+dA2WLS9x6Mp9pAqPQ
 LCTds5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiBMbrt2M/NOxgvbQw+
 xCjAwajEw/sy+XesEGtiWXFl7iFGCQ5mJRHe2x0/Y4V4UxIrq1KL8uOLSnNSiw8xmgL9NpFZ
 SjQ5H5g+8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1ME76sWKn
 x7Rd+o495j84Tk5bcaQoyMFG+L5WoLtY5rLM9h2OskYq7xIuzPU/FLZTwsCB54ij+oLtfy1v
 n3gknLTt21Z1Od7YnQv2NMSoPTbgaw28+FIxL321+9nGNqY/QmxO9/UOzH5opTW941HyM7mY
 tLcazVplxscsZrSrp520lchPvi70T4mlOCPRUIu5qDgRADxLJ1vnAgAA
X-CMS-MailID: 20191219134118eucas1p1c41633ba54b742365ce73face4e33e9b
X-Msg-Generator: CA
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
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

On 19.12.2019 14:05, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 01:54:37PM +0100, Marek Szyprowski wrote:
>
>> I can do the bisect, but please let me know exactly what to bisect.
>> The initial bisection I did was from v5.5-rc1 to linux-next and pointed
>> to the $subject commit.
> You can't trigger this via any other mechanism, all the other controls
> are fine?  There's *clearly* no issue with what the commit is doing,
> it's just flagging up that the card is not set.

I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the 
issue is same.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
