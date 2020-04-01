Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A1319A891
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 11:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879C81675;
	Wed,  1 Apr 2020 11:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879C81675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585733073;
	bh=RgsFnvl/ltx+xGFFj2lIOw/EO6MymC554vwYUmKeM3E=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVJ4nAKqO8xiweufiwPVkrCKfQTTLJCdLMcznzICkp3nJ+FcJhm7Hw5zhJKN6W5Dj
	 UaOKcwy2BW3cjGvxej6FNcUpwRKxxOkMsM7dPuIgRxSGpRj4clCW7dcUZ6bNP14iey
	 K8NsPTSk7PTnapI/TVntkV6f+gVo+cO53PLoyCVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 983F6F80110;
	Wed,  1 Apr 2020 11:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5186CF8014B; Wed,  1 Apr 2020 11:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9098F80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 11:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9098F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XcRGPOke"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200401092239epoutp01d8c48301930e5b5eb210849db8877461~Bp7m4VxKZ0793007930epoutp01_
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 09:22:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200401092239epoutp01d8c48301930e5b5eb210849db8877461~Bp7m4VxKZ0793007930epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585732959;
 bh=RgsFnvl/ltx+xGFFj2lIOw/EO6MymC554vwYUmKeM3E=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=XcRGPOkeTguNErvDZNisbyg4SFciEgMz+2KFXMLKocrYJJvfTihw1LSy/vqTGp3sH
 7nGgfkxqjWeBkRCCVBpd3qDK/bjmaS0z/npekjELSqIJRQbq+JI4gO7+hEMKNl8eoH
 kddgtZ141zoMJCLmsXfqVh5zsbDZxJclg3AtmeOw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200401092239epcas2p21d49884b0b378a7676869ef00f25f4c2~Bp7mhh0Zd0645806458epcas2p2E;
 Wed,  1 Apr 2020 09:22:39 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.190]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48sghZ39Y2zMqYkV; Wed,  1 Apr
 2020 09:22:38 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.0C.04128.D5D548E5; Wed,  1 Apr 2020 18:22:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200401092237epcas2p4b7ccc055f043c4e787ab98d3f5fe5445~Bp7kSSbn81272912729epcas2p4A;
 Wed,  1 Apr 2020 09:22:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200401092237epsmtrp28c418cb01022590acc080f1d57cc1020~Bp7kRiydG1642016420epsmtrp2K;
 Wed,  1 Apr 2020 09:22:37 +0000 (GMT)
X-AuditID: b6c32a45-fb3ff70000001020-55-5e845d5d4f93
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.AE.04158.D5D548E5; Wed,  1 Apr 2020 18:22:37 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200401092236epsmtip22b09f864706b9876751bc1940edb1ee0~Bp7kInrFh0404504045epsmtip2Y;
 Wed,  1 Apr 2020 09:22:36 +0000 (GMT)
From: =?utf-8?B?7J206rK97YOd?= <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>
In-Reply-To: <20200401083708.GA4943@sirena.org.uk>
Subject: RE: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Date: Wed, 1 Apr 2020 18:22:36 +0900
Message-ID: <000f01d60807$15593750$400ba5f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLFZ6LVqTj+5cu33AVtTeNgzIpF3wFOYOMhAVdeZv2mcBBAUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XbOzma5OE2rFyMYx+iiTLfV9BgakVaL+kPoBpKukztsq93a
 mWFCkGnisuymlrOLEplY4iVLk+ziJVFRCpSySNLMUrvhtTCjbWeR//3e93se3vf5vk+MSW8T
 QWKjxcHaLYyJIhbgD5rXquWJiZlJih9lcrrnZZOAzh8YIugrD3JweronW0C3vrwpoKtmKhDd
 kp4n2CTSVE2cJDQPXe9EmppyJ6HJrS1HmsraXjxemGCKNrCMjrXLWEuyVWe06GOoHbu0sVp1
 hEIpV0bRkZTMwpjZGCpuZ7x8q9Hk3oOSHWVMKe5WPMNxVPjGaLs1xcHKDFbOEUOxNp3JplTa
 wjjGzKVY9GHJVvMGpUKhUruVB0yGzquFyHZKlDo7O4edQG+J08hPDOR6yBgtwU6jBWIpWY9g
 brAb54txBA9fPyP4YhrB1+fp2D/LzNlRn6oRQWPDsE81gqDuzE/kURGkGrLq+oUeDiRXQ2tN
 tdAjwsiLCO6nf/aK/EgVfOrrF3k4gNwOLe1OrwEnV0Jf8XkvS8goyHjSQfC8GNoLh3APY2Qo
 lJaM+VaSwa+Ppb5hm6HgTrlPEwhFzixvOiA/EFB2o0zIG+Igs3RMwHMAjLbVingOgolvjQRv
 yEDwreu37yAPgTNHyvM6qL3W4TaL3RPWQmVDuAeBDIaWN765iyC7eU7EtyWQneUzUlDd8UfA
 twGuV4nOI8o1L5hrXjDXvACu/6OKEV6OlrI2zqxnOZVNOf+1a5D3k4ZsqUdXunc2IVKMKH+J
 bENGklTIHOWOmZsQiDEqUFIUl5kkleiYY2ms3aq1p5hYrgmp3fd+AQtakmx1f3mLQ6tUqyIi
 FFFqWh2hoqllknsL+/ZLST3jYA+zrI21//MJxH5BJ1Dkd5ytazPaRaGPXvVXF+TsK+zaPXSr
 S/ZoMlurW0FNnisZmDqUsLxnePwL8aW3M/XJ8uJ1J98/zRs19Min7vgPau+OcAF/XqQFX2bS
 nuKTuobUzrrcihoy8cje/gs3Hu/JOhh+fFteEc6sydSv6rq0lCnNz4+ddW1iQo05zuSxexTO
 GRhlCGbnmL+hZUhMugMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvG5sbEucwfEbrBZXLh5ispj68Amb
 xYxt3SwW3650MFkcvbiYyWLD97WMFkcapzA5sHts+NzE5rFz1l12j02rOtk8+rasYvRYv+Uq
 SwBrFJdNSmpOZllqkb5dAlfGvhtTmAoms1Ysnz2PqYGxn6WLkZNDQsBE4nvvKzBbSGA3o8Sn
 HneIuITEh/ln2CFsYYn7LUdYuxi5gGqeM0osX7IYrIFNwFSibfs9VhBbREBd4uimjWA2s8As
 RomzLXIQDRsZJf4c3cEMkuAUMJJ4fvMe2FRhAU+JIyc7wRpYBFQkbi6YAGbzClhKNO8/xQZh
 C0qcnPmEBWKotsTTm0/h7GULXzNDXKcg8fPpMqgjnCSmrV4FVSMiMbuzjXkCo/AsJKNmIRk1
 C8moWUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4oLa0djCdOxB9iFOBg
 VOLhVbRqjhNiTSwrrsw9xCjBwawkwjvbpSVOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK98/rFI
 IYH0xJLU7NTUgtQimCwTB6dUA6OH11blz2KXL6y+HH79tRjjBJVvq7UiCty/Hso/djfIuU9g
 54PEK/OZLxsIvZ9w31N8+gYeY6FZy8xkrK8E7Nyuc4bNc/WU/eznKh3++1v9rl92PL/b1n2b
 iNqV0/LOXZc4s8O/yGpPX/A6WHc5T+uFvIL/ZdFfPRmmLz515lrjvO8GZ08e/5mlxFKckWio
 xVxUnAgAhT4TxqQCAAA=
X-CMS-MailID: 20200401092237epcas2p4b7ccc055f043c4e787ab98d3f5fe5445
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69
References: <CGME20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69@epcas2p2.samsung.com>
 <004c01d607be$68cd8b50$3a68a1f0$@samsung.com>
 <20200401083708.GA4943@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

On Wed, Apr 01, 2020 at 09:37:08AM +0100, Mark Brown wrote:
>On Wed, Apr 01, 2020 at 09:42:23AM +0900, =EF=BF=BD=CC=B0=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=20wrote:=0D=0A>>=20Current=20topology=20doesn't=20add=20prefix=
=20of=20component=20to=20new=20kcontrol.=0D=0A>=0D=0A>Please=20only=20numbe=
r=20patches=20if=20you=20are=20sending=20them=20as=20part=20of=20a=20patch=
=0D=0A>series,=20the=20purpose=20of=20numbering=20is=20to=20make=20sure=20t=
hat=20things=20get=20handled=0D=0A>in=20the=20right=20order.=20=20Without=
=20a=20series=20it=20looks=20like=20there=20are=20some=0D=0A>missing=20patc=
hes.=0D=0A>=0D=0AI'm=20trying=20to=20catch=20up=20the=20merge=20process=20n=
ow.=0D=0ALet=20me=20know=20if=20anything=20has=20gone=20wrong.=0D=0AI=20rem=
oved=20the=20patch=20number=20and=20re-sent=20the=20patch=20again.=0D=0A=0D=
=0ASorry=20and=20thank=20you=20for=20your=20review.=0D=0A=0D=0A
