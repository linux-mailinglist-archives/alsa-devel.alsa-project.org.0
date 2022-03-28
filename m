Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B624E8E8D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 09:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA5A816CD;
	Mon, 28 Mar 2022 09:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA5A816CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648450957;
	bh=qPqTglZzv2WzkdZOEREayYTwlnrOHbxuIYeNJeixqTk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XGRA4NXOr2ahnwpdyKj749JY7qqE1VfY7aS6hH0zKcglO41Z3dxI1BovxPUZ+ttNP
	 3eIQYFbi2TMi03z1hpRpOv4ODgQiH7Pz6YmHjoeCADuqr4S9Sfy7owjJ6fmjlW9T5k
	 dhe96OTgHSHWdUyA2T05rAG7bhpJs8DOb1u6f1TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C467F8026A;
	Mon, 28 Mar 2022 09:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FA6F8024C; Mon, 28 Mar 2022 09:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4605F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 09:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4605F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="K8GPKklf"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220328070118epoutp01dc8d152f647c32b67dba3e0794e98e34~geVb6dkIL1686616866epoutp01l
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 07:01:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220328070118epoutp01dc8d152f647c32b67dba3e0794e98e34~geVb6dkIL1686616866epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648450878;
 bh=ckaaGXC3Z4N6x0E1WUzn1rOi3ngWDnyWQtaDpQ7xS6I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K8GPKklfPlDwQAZ1YvDI6jilyI3v8TxPNIY/lxen7y13Ci/8mcXAJFrWL4YlpkwyJ
 yGHEjSw2Kub2eh1CzX/qgJEyKNvqkIEIj4cA2gychzccpPHWrhcCg6R+ZhYUTbmVT8
 YfuXB6lfW9KrWXicue5gIwO4xDsZiA7/QeAYSfZ8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220328070117epcas2p2a2239fc05f298325273b3b25d854ea6f~geVbj7-663087130871epcas2p2v;
 Mon, 28 Mar 2022 07:01:17 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4KRkBL2B3sz4x9Q9; Mon, 28 Mar
 2022 07:01:14 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.1E.10444.83D51426; Mon, 28 Mar 2022 16:01:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20220328070112epcas2p273f20afe2eab2439a040006cbb1064c9~geVWb7G6i0189101891epcas2p2K;
 Mon, 28 Mar 2022 07:01:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220328070112epsmtrp1f7ade8155ab540fdb4264b0700b1cf3c~geVWbEArc0702707027epsmtrp1K;
 Mon, 28 Mar 2022 07:01:12 +0000 (GMT)
X-AuditID: b6c32a45-513ff700000228cc-11-62415d38e66d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.E0.03370.83D51426; Mon, 28 Mar 2022 16:01:12 +0900 (KST)
Received: from ubuntu (unknown [12.36.155.120]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220328070111epsmtip279460651083344b8b28306102aa8ed09~geVWOUn102385423854epsmtip2I;
 Mon, 28 Mar 2022 07:01:11 +0000 (GMT)
Date: Mon, 28 Mar 2022 15:59:46 +0900
From: Oh Eomji <eomji.oh@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 3/3] sound: usb: Exynos usb audio offloading driver
Message-ID: <20220328065946.GA150140@ubuntu>
MIME-Version: 1.0
In-Reply-To: <6f2a3a99-0727-cf72-d512-332ca5731568@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmqa5FrGOSwcKJchZXLh5ismhevJ7N
 4vz5DewWU34tZba4vGsOm8WBP4vZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exeazfcpXF4/MmuQD2qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWF
 vMTcVFslF58AXbfMHKCrlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5
 xaV56Xp5qSVWhgYGRqZAhQnZGXdO32Yv+CpY8XftcbYGxs18XYycHBICJhKTlnSydjFycQgJ
 7GCUWLzzDjOE84lRYumiSywQzmdGiTdvD7PAtBxYswEqsYtRYmpbDzuE84RR4t7TjWwgVSwC
 qhK9b9aB2WxA9vRl2xlBbBEBTYnrf7+DLWQW6GaS2PLuGhNIQljAS2LB9W3MIDavgI7EqWsf
 mSBsQYmTM5+AreYUsJNo+v4AKM7BISqgIvHqYD3ERb0cEnebxCBsF4mvG/5DXSos8er4FnYI
 W0riZX8blF0scXDBczYIu0bi7cFWqLixxKxn7Ywg45kFMiQ2H44HMSUElCWO3AKbyCzAJ9Fx
 +C87RJhXoqNNCKJRSWJSUycThC0hseJzE5TtITF97l5o6HQySRzfcpVpAqP8LCR/zUJYNgts
 g47Egt2f2CDC0hLL/3FAmJoS63fpL2BkXcUollpQnJueWmxUYAiP6uT83E2M4OSq5bqDcfLb
 D3qHGJk4GA8xSnAwK4nwyp61TxLiTUmsrEotyo8vKs1JLT7EaAqMpInMUqLJ+cD0nlcSb2hi
 aWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1OqganQ8BLDpM85yzpvpRzT8brw
 r4ndTG3+tPVs3B0N0fv6Fxp+Nd8lzNnOuf3YQTvfJcetJ8gvjfZed6szwtwvbdsU8Q+zuVx/
 iVdZNJ47bLLkM4/Cj3+xHzZmi59YpzVtQkH41RXNpTe33Bdf9vRtsH7n8g6hJuUpURme0o+a
 6k+Vvv3deLbxVqdBmpKDguK7Uo/9cn+FDwq+sPrYMWFeg8xjkYXLDZhi2pdNN+w7tLqCnfGN
 oX9HqcRKhzDFwDmPLyXtz25OWvZMW1RvHtO5786/Ynpurqpu3PNU2F9LXMxJOadRSu3Qfkub
 Jw2abCJzj9/y2/C77fhcs4rIk3cm1AWrzfAXC33ouO3zquiSb0osxRmJhlrMRcWJADW6Qug3
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvK5FrGOSwYs9bBZXLh5ismhevJ7N
 4vz5DewWU34tZba4vGsOm8WBP4vZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exeazfcpXF4/MmuQD2KC6blNSczLLUIn27BK6MQ3cPMRds5a848eo8awNjD08XIyeH
 hICJxIE1G1i6GLk4hAR2MEqc2dfHApGQkFjQ9ZoZwhaWuN9yhBWi6BGjxLqd38ASLAKqEr1v
 1rGB2GxA9vRl2xlBbBEBTYnrf7+zgtjMAr1MEle7qkBsYQEviQXXt4H18groSJy69pEJYmgn
 k8S2LTNYIBKCEidnPmGBaNaSuPHvJVARB5AtLbH8HwdImFPATqLp+wOwsKiAisSrg/UTGAVn
 IWmehaR5FkLzAkbmVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwRGipbWDcc+qD3qH
 GJk4GA8xSnAwK4nwyp61TxLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampB
 ahFMlomDU6qB6Yq1Xe1r+8Cj8m7c12ep7jWb+Sb01gWPw9nWzbMuLhM0zEmI61Bx1OcKOCQ7
 iW/JP40ca50MC7trT5TiF3wS+vjyd3TOEuvFj2/ffBK8pnZi3pKLOvuX+Lxbc3ou85J3rv+9
 T+1cIeXKm36kU657tg6riYrt++SrERlJdzvXhk/w4zTX2292pTh58/nDe2T75ffWWdRpbuAo
 yns6ZR/zCdFFX7bGiv1d+67q/e7TTLPLPWd+NLe/1uzyyv+P1LxVWivnhK9QTPF6KqjOrbHT
 7JF5WvMHbZ3XuivLNzxffHfukszHS6bXB/219121zM76nNSq2jM87Jt3d8QZMK2ed4dp75Ne
 hWdGnoekCznEopVYijMSDbWYi4oTAdesKbr/AgAA
X-CMS-MailID: 20220328070112epcas2p273f20afe2eab2439a040006cbb1064c9
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----ONjdBwygxer2qCWpL6Cfkdc2CTGKeo01bleMSM1m.vqr4jSS=_1e8ed_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220324081350epcas2p227458cb1b530f04a9990bcfc8c3b5703
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081350epcas2p227458cb1b530f04a9990bcfc8c3b5703@epcas2p2.samsung.com>
 <1648109444-196321-4-git-send-email-eomji.oh@samsung.com>
 <6f2a3a99-0727-cf72-d512-332ca5731568@kernel.org>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pavel Skripkin <paskripkin@gmail.com>
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

------ONjdBwygxer2qCWpL6Cfkdc2CTGKeo01bleMSM1m.vqr4jSS=_1e8ed_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 25, 2022 at 07:44:31PM +0100, Krzysztof Kozlowski wrote:
> On 24/03/2022 09:10, Oh Eomji wrote:
> > This is for usb audio offloading. usb audio offloading processes usb
> > audio stream data directly from the audio box even if ap usb enters
> > suspend, there is no problem in stream data transmission. This obtains
> > power saving effect while using usb audio device.
> > 
> > AP usb and audio usb f/w communicate via AUDIO IPC. By performing AUDIO
> > IPC in the vendor operations, abox can access and control the xhci to
> > transmit the data directly.
> > 
> > The types of commands and data delivered through AUDIO IPC include the
> > following (AP USB <-> AUDIO USB f/w) :
> > 1. usb audio connection/disconnection status
> > 2. xhci memory information
> > 3. full descriptor for usb audio device
> > 4. UAC(usb audio class) control command
> > 
> > Signed-off-by: Oh Eomji <eomji.oh@samsung.com>
> > ---
> >  sound/usb/Kconfig            |   9 +
> >  sound/usb/Makefile           |   2 +
> >  sound/usb/exynos_usb_audio.c | 560 +++++++++++++++++++++++++++++++++++++++++++
> >  sound/usb/exynos_usb_audio.h | 150 ++++++++++++
> >  4 files changed, 721 insertions(+)
> >  create mode 100644 sound/usb/exynos_usb_audio.c
> >  create mode 100644 sound/usb/exynos_usb_audio.h
> 
> Similar pattern as XHCI submission - it looks like you do not work on
> mainline kernel, but some other, private tree with other modifications.
> It seems you created this series based on that private tree.
> 
> This is not the proper process.
> 
> Please rebase all your work on recent mainline kernel (v5.18-rc1,
> linux-next) and work there.
> 
> Then you can start using get_maintainers.pl...
> 
> BTW, this v2, not v1, so please version it correctly. Add also changelog
> to your series in cover letter.
> 
> Best regards,
> Krzysztof
>
Okay, I will rebase and modify the patch version in the next patch.

Thanks,
Eomji Oh

------ONjdBwygxer2qCWpL6Cfkdc2CTGKeo01bleMSM1m.vqr4jSS=_1e8ed_
Content-Type: text/plain; charset="utf-8"


------ONjdBwygxer2qCWpL6Cfkdc2CTGKeo01bleMSM1m.vqr4jSS=_1e8ed_--
