Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB737E87CF
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Nov 2023 02:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267AE86F;
	Sat, 11 Nov 2023 02:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267AE86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699667016;
	bh=P5HZ7s+l6NUhmyZQcEFL6VWfV/218ZhLUbsf7Ch4tzI=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ib4/+Ud0YykoagJVQSCHc74yIVxBV0MvISUyUeID7HsDSGVSHkKf+KTX0zGnLKLQe
	 h6/ORH4S/R4FOirVlcfsRHyfkCZmc+G0U0rGvAte1p+3lecXBOFRw7ZS0aNmpq/twz
	 GM9t2Rgci7TJ/7RFfDTMQaF40K1M1TJz29bLfUTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06481F80557; Sat, 11 Nov 2023 02:42:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B2FF80100;
	Sat, 11 Nov 2023 02:42:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9189EF80169; Sat, 11 Nov 2023 02:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E885BF80100
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 02:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E885BF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=R2tkRYJs
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231111014213epoutp018e8c7da3f9c8b3838e4799ead9711919~WbhI64j3M2751327513epoutp01U;
	Sat, 11 Nov 2023 01:42:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231111014213epoutp018e8c7da3f9c8b3838e4799ead9711919~WbhI64j3M2751327513epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699666934;
	bh=47JpdoiCIBnduYi/juvLB335AT7aST3DRTII55/sYZM=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=R2tkRYJsOrk/9psjfFcxUtHyVbpZCU3kqiwf0s2FUcCys/gVz8DdL/nsOvGiuw6Aq
	 LbA+sf6g3kTaytN0QloIiT6f7OecKxNvTXHtcZIhSowp1xAaXxIAzkAmclFGVOy6aR
	 bkEUZpL7DXZyin/ILi+YoapyYo2xUZFdHMQLhM2E=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231111014213epcas5p250646a2545cdfbaee266630c117d6def~WbhIKBdIl2264622646epcas5p2_;
	Sat, 11 Nov 2023 01:42:13 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SRz2W4wLjz4x9Pp; Sat, 11 Nov
	2023 01:42:11 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	78.7D.09672.3FBDE456; Sat, 11 Nov 2023 10:42:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231111014211epcas5p4b26dc900621444ea64a82f649b928e02~WbhGRQL1h1252412524epcas5p4Q;
	Sat, 11 Nov 2023 01:42:11 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111014211epsmtrp1c4dbcb52a95c27f5798fa8fb05e0d4eb~WbhGP0dTS2942529425epsmtrp1T;
	Sat, 11 Nov 2023 01:42:11 +0000 (GMT)
X-AuditID: b6c32a4b-39fff700000025c8-80-654edbf313a3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	09.63.18939.2FBDE456; Sat, 11 Nov 2023 10:42:10 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111014205epsmtip116d5a49f5dbb5f8895269c15c9e2fe7b~WbhBDj_UO1783717837epsmtip1Q;
	Sat, 11 Nov 2023 01:42:05 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'David
 Airlie'" <airlied@gmail.com>, "'Daniel Vetter'" <daniel@ffwll.ch>, "'Maarten
 Lankhorst'" <maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'"
	<mripard@kernel.org>, "'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Rob
 Herring'" <robh+dt@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski+dt@linaro.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Andi Shyti'" <andi.shyti@kernel.org>, "'Jonathan Cameron'"
	<jic23@kernel.org>, "'Lars-Peter Clausen'" <lars@metafoo.de>, "'Lee Jones'"
	<lee@kernel.org>, "'Ulf Hansson'" <ulf.hansson@linaro.org>, "'Tomasz	Figa'"
	<tomasz.figa@gmail.com>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Linus Walleij'" <linus.walleij@linaro.org>, "'Thierry Reding'"
	<thierry.reding@gmail.com>, =?utf-8?Q?'Uwe_Kleine-K=C3=B6nig'?=
	<u.kleine-koenig@pengutronix.de>, "'Alessandro Zummo'"
	<a.zummo@towertech.it>, "'Alexandre Belloni'"
	<alexandre.belloni@bootlin.com>, "'Greg Kroah-Hartman'"
	<gregkh@linuxfoundation.org>, "'Jiri Slaby'" <jirislaby@kernel.org>, "'Liam
 Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'" <broonie@kernel.org>,
	"'Jaehoon	Chung'" <jh80.chung@samsung.com>, "'Sam Protsenko'"
	<semen.protsenko@linaro.org>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
In-Reply-To: <20231108104343.24192-15-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 14/17] arm64: dts: exynos7: add specific compatibles to
 several blocks
Date: Sat, 11 Nov 2023 07:12:04 +0530
Message-ID: <05aa01da1440$49a42e90$dcec8bb0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQKTd4SaAlvxtEuw1LziMA==
Content-Language: en-us
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA02Te0xbVRzHc25v7y11lWsHcga61DoisBSoQD2QMeccepORDd8GSVilN4BA
	aVpANkwk23hsBFh5DSvlMRoGHZM34TFk6VDkMXSjDBQbHgIDeSirA9nA2VLE/ff9/X6f7/2e
	37k5HBbfTDpzouUJjFIujRUSXLz1lrubyDx+gvHWrguR7s4IiX4YvYKhjJUqEhnvGDA08TAT
	oMKpGQLVdg1h6EmrmoXKeobYyPjwDwKdq6wj0NijdDaaPKvH0Ir2BZQzP8VCXYstJNLll7FR
	W3oFjtaMmRgq2LyKocbf7rFRU9kmQJlbfwFU2rOCo+GOEgL1PMkFyGTSA/T9NSOBin/8FkOD
	ldkk0s4VsFDFaguO0i9UsVFaVw+Jbi1lsNH9HAuy0VGKI32H5XvNS2o2GlfnA9R7/aMj7nS9
	+SxBl9am0F1r5TjdrjGRdKP+AkH/eu+Gpd/3Dt2trSXpiaxejG7SfUnrlgxsOnfLm85p1gO6
	aSCFvly6gdHmxv0hVGjMoShGKmOUAkYeES+LlkcGCo+/F/5muJ/EWywS+6PXhAK5NI4JFB4L
	DhG9FR1ruWChIEkam2hphUhVKqHX4UPK+MQERhAVr0oIFDIKWazCV+GpksapEuWRnnImIUDs
	7f2qnwU8FRNVvNTPUvSRyQUz1UQqqCYuAjsOpHxh7/w8fhFwOXyqE8DukTHMVjwAcKi+E+wW
	DX0tuxZDQxnbNmgHsG9Qu1PMA9g6uQqsFEGJYFtlOmEdOFCdPDjcPY1bB3ZUEKzvGduG9lJh
	MG1gxOLmcHDKFd7UKa2SR/nDXGOSleBRz8G+r2a2nSzqIKyqWGTZDiGAG7NVbKt2oI7C28V/
	kzbGCS5810NaYyHVzoU3dFrcZjgG21dz2Ta9F/7e20zatDNcyE0nrbmQouGVTWdbOwouX60D
	Nv06vGkswa0Ii3KHdR1etqhnYfbjGczm5MHMdL6NdoXnVkZ2Ql2gOitrJ5SGG5nr26F86i6A
	c0WOl4BA89SSmqeW1Dy1jOb/4HKA68E+RqGKi2RUfgofOfP57u+OiI9rBNuvz+N4G5ie/NPT
	ADAOMADIYQkdeD/5BjN8nkx6+gyjjA9XJsYyKgPws9y7muXsGBFveb7yhHCxr7+3r0Qi8fX3
	kYiFTrzFNK2MT0VKE5gYhlEwyv98GMfOORX7OGjZfjQ/JvL5wQq34AUXbrS6d3+K5KQTKfZY
	7XCUix8A03rnUEl/4dtBiuRnpECQOlNuDHv5bqG9x3r1ix7q5YmYr10/8yt+l+sfevKLgAOe
	Li9t9YeNBj3KMBdNvT9Ng4V/su/PRlbUevL70xqdObKGM6c0R7l5ig99fv4lcF9gUW6G3sSt
	oevFQscPKtfCpfZF2W8cKX9lRqJHfZfGPqFCK+bGG3TR6+EybUB+057TyfOaWTeRKMwUcF7h
	Nrap2fIKWKhxO6HXX6ubTj7QCfGgVaJKfr066XZW3sDlPfnf1HSmyliq4RzlSPeU+fCnsUqe
	fTM776B2oMv8OO28EFdFScUeLKVK+i+P59dVBgUAAA==
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA02Sf1CTdRzH+z57frG7cQ+DHU9DPZppSkFSUB+7zn5Y+MSZqVfXSd7llEfw
	3IDbxKNxkWGNHzYGSQQrfgnN24ATBihwAblNAQUEmsrOLaSYhhKW4A4KIsaq47/Xfd+v9/v7
	/eNLC8T9hJQ+knKMV6XIFTJSiJ+3ydZFPry1i9+i/Q6gdvg6Bb03z2CQM22kwDFsxWDsUS6C
	r8YnSKjvHMRg6XyRACrtgwQ4Hj0g4WTNORJG/9QScDvbjMF0+Roo+HVcAJ33WymoPV1JQJu2
	GgevIxeD4oWzGFh+uUFAc+UCgtzFWQQV9mkcfuz4lgT7kh6B221GcLnOQULptS4M+mt0FJTf
	KRZA9R+tOGjzjAR83mmnwDaVQ8DdgmVlvqMCB3PH8l7LVBEBt4pOI+hpeP/VzVzjTDbJVdRn
	cp3eKpxrN7gpzmLOIznXje+Xz/v2cN3l9RQ3dqoH45prP+Fqp6wEp1/cwhW0mBHXfDWT+7pi
	HuNmLOt2MwnClxN5xZHjvOrZbQeEyaaJIZR2kcqwdVkEJ1AVmY8CaJaJYa1NlUQ+EtJi5gJi
	5xqc/wZh7M2mQsrPwazp77uUX7qDWF1RP+YLSCaSbavRrhRCGKeIvep6xy8NInbA274SBDBv
	so32UeTjYCaBHb1kWi7TNM5sYH+oVflQxGxl9Y7jPkPEBLF9ZRO4jwXM06zH6fmfjdX3Bf73
	hLPzHiPhv/Z1dqB0jvI7oezkJTtViMSGVVOGVVOGVVOGVZUqhJuRhE9TK5OUh9Kio9RypTo9
	JSnqUKrSglY+XMTeNmQ8txhlRRiNrIilBbIQ0VDMTl4sSpR/pOFVqR+q0hW82orCaFwWKlqv
	yEsUM0nyY/xRnk/jVf+lGB0gPYHtDY0NqWu9oLkW2hxd6nyuW+URre/LiI+V6ENcmyo+DVpb
	4HGcOrknZuZA2cOisqz6EWm5NOmFJ8fHPpM8iI/ax+lyicdHJHmz762p8iRfLBYrwtDsQkuJ
	27T0hkrf8+UVYXbT4e0bJJLAhrh57rCbakl4e7f9d5HuLN7+2saOQOdfkyNyGR50z3vwmXRt
	T+9AWhKWsPXepO35rJmndrk1+4c2H31J+oVpbcRjcZcXDwZk5adivTrbN53KqWFNxoviwODh
	V/rH5oZuC02j1/d5S1w73nVC6xPJmdsjibcaTV39P6Fw9baM2J9Lruz4rbu4UBN+xvWBLXF/
	XX5ciO3jnPhNMlydLI+OEKjU8n8AXsvKZd8DAAA=
X-CMS-MailID: 20231111014211epcas5p4b26dc900621444ea64a82f649b928e02
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104452epcas5p2bfd50a819f3a6739f88fb7063cc7201d
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104452epcas5p2bfd50a819f3a6739f88fb7063cc7201d@epcas5p2.samsung.com>
	<20231108104343.24192-15-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 2G4RIW6WJMP25NS735GEPXT26VMNXANE
X-Message-ID-Hash: 2G4RIW6WJMP25NS735GEPXT26VMNXANE
X-MailFrom: alim.akhtar@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2G4RIW6WJMP25NS735GEPXT26VMNXANE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Exynos7 reuses several devices from older designs, thus historically we k=
ept
> the old (block's) compatible only.  This works fine and there is no bug h=
ere,
> however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to Exynos7 in front of all old-SoC-like compatib=
les.
> This will also help reviews of new code using existing DTS as template.  =
No
> functional impact on Linux drivers behavior.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  arch/arm64/boot/dts/exynos/exynos7.dtsi =7C 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
(...)

