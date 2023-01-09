Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79D661DBB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 05:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A356EC6AD;
	Mon,  9 Jan 2023 05:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A356EC6AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673237941;
	bh=jUAbdNcQ+IkEKfM0vHJD5axga6TTnsV5uSQRawhFiG8=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TP6bB5urhcfqzpMtaBq7jyLV3DkuVacwIdqjh2cFOxjxtA+sWoIg7jRopwCfYF7LI
	 ClwMjF7Uc3r3kWA5WPV1VCR7uecaUB3qYHvKsAUXyzO9heN6WjsCwgy6WZ5xAJaa9d
	 riyxZYps7OaRv7QNpZ6liLHDKChe3gd3S6ImATEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5681F80544;
	Mon,  9 Jan 2023 05:17:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E97F8030F; Mon,  9 Jan 2023 05:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7413DF80425
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 05:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7413DF80425
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=Wc4U2cEL
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230109041657epoutp01b247249d420582cc311b7cf1bb74959b~4iO372Dkz0413904139epoutp01T
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 04:16:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230109041657epoutp01b247249d420582cc311b7cf1bb74959b~4iO372Dkz0413904139epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673237817;
 bh=94ESABnEYG2rv76V0vtqvXxgsfCD+B21vNH8V9t1i28=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Wc4U2cELcd+rC9M5m9z/K03f6/nmHqEjcKl/fVSD5BnTdFBonAKBruvWIm0/n7I61
 QhNYXQdKNlNau4lQYVSPzl56iZMs7SlV4SFgBGa2dXwSmGk5BR7uJZrs6Orph2V3pt
 a8MiEPD/MgpVJsQHQnVAX6895Ox/gS0eCfhhB/+s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230109041656epcas5p1116cb2bec49328974e7d5cb808912ccb~4iO3XjiG12962529625epcas5p1u;
 Mon,  9 Jan 2023 04:16:56 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Nr0yH0HsYz4x9Q7; Mon,  9 Jan
 2023 04:16:55 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7D.3C.03362.6359BB36; Mon,  9 Jan 2023 13:16:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230109040551epcas5p2d5487bd8ca6ba7c1bb46636da17010f5~4iFL6Rgb71880818808epcas5p20;
 Mon,  9 Jan 2023 04:05:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230109040551epsmtrp25a2d1f4fc81436d2eab687cc2da131f7~4iFL5SsLl1699616996epsmtrp2D;
 Mon,  9 Jan 2023 04:05:51 +0000 (GMT)
X-AuditID: b6c32a4b-287ff70000010d22-e0-63bb95366cc5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F2.08.10542.F929BB36; Mon,  9 Jan 2023 13:05:51 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230109040549epsmtip1b09684e2b271f3e23b1813f34b1581d1~4iFJvDDO00547905479epsmtip1b;
 Mon,  9 Jan 2023 04:05:49 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>
In-Reply-To: <Y7RuMmvNnAx+oyyl@sirena.org.uk>
Subject: RE: [PATCH v2 1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
Date: Mon, 9 Jan 2023 09:35:47 +0530
Message-ID: <051d01d923df$a96ea460$fc4bed20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH5OglsonJNs2LrkABkwml8apZdSgNMbZkqANhEDZkCsq2Xp64ei3kg
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRmVeSWpSXmKPExsWy7bCmpq7Z1N3JBhMfWVg8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxktvh2pYPJ4vKuOWwWM87vY7JYtPULu0Xnrn5Wi1kXdrBa
 tO49wm5x+E07q8WG72sZHfg9NnxuYvPYOesuu8emVZ1sHneu7WHz2Pd2GZtH35ZVjB7rt1xl
 8fi8SS6AIyrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNct
 MwfoeiWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgUmBXnFibnFpXrpeXmqJlaGB
 gZEpUGFCdsaWrn+MBe85K5pvzWZvYJzC0cXIySEhYCKx7VMvI4gtJLCbUWLaexkI+xOjxJfP
 3F2MXED2Z0aJR3snsMM0vG48yAaR2MUocezZJGaIjheMEvN+ZYDYbALmEov2LgWbKiKgLnF0
 00ZWkAZmgS5miQ1H3rGAJDgFdCWufJsCViQsECDxb/UesEEsAioSL859YAOxeQUsJVb9eM4I
 YQtKnJz5BKyXWUBeYvvbOcwQFylI/Hy6jBVimZvEibPv2SBqxCWO/uxhBlksIfCGQ+LShFWs
 EA0uEjd3vWaCsIUlXh3fAvWalMTnd3vZIOx8iWkfm6HsCom2jxug6u0lDlyZA3QEB9ACTYn1
 u/QhwrISU0+tY4LYyyfR+/sJVDmvxI55MLaqxPrlmxghbGmJfdf3Mk5gVJqF5LVZSF6bheSF
 WQjbFjCyrGKUTC0ozk1PLTYtMM5LLYfHd3J+7iZGcNrW8t7B+OjBB71DjEwcjIcYJTiYlUR4
 SzftShbiTUmsrEotyo8vKs1JLT7EaAoM74nMUqLJ+cDMkVcSb2hiaWBiZmZmYmlsZqgkzpu6
 dX6ykEB6YklqdmpqQWoRTB8TB6dUA1PY3aKWB/6OsevFTyddPb5qF8tNNUkWX/t71b6CXrs2
 zw9bOSG+RP/WWb8NEQf2dPTND3QUXWny9VJDxIaPy75ejbPxeCnvklYsm/txi7sDa7Bmmtr5
 l1G69qGrmZ4KzvZIKM431Z9qdHVrzdGi2hstjx517uP+93aivmvVwRPq2h/rHZNv7Oj/qvYl
 7+2yKfaNrO8/zDnky/vQIHKG4TGv2sCjfgumq2g5T/7Lmv4k9LpMQ1cRX/ly2zMmB2dJXOgR
 WOlpd7/g2HMtniDN9hXHeIunHOrXmGL7Z/a+t28sYoRTJnaFvT/i+/v0AuOUciYm7e4r3Ktj
 TH/qa9vxJbyukhBUnFXPutXASTItS4mlOCPRUIu5qDgRAHntTeBkBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsWy7bCSnO78SbuTDd6tkrJ4MG8bm8WVi4eY
 LA5t3spuMfXhEzaL+UfOsVr0vXjIbPHtSgeTxeVdc9gsZpzfx2SxaOsXdovOXf2sFrMu7GC1
 aN17hN3i8Jt2VosN39cyOvB7bPjcxOaxc9Zddo9NqzrZPO5c28Pmse/tMjaPvi2rGD3Wb7nK
 4vF5k1wARxSXTUpqTmZZapG+XQJXxpauf4wF7zkrmm/NZm9gnMLRxcjJISFgIvG68SAbiC0k
 sINRYsXGKoi4tMT0/j1sELawxMp/z9m7GLmAap4xSsw7s4gVJMEmYC6xaO9SRhBbREBd4uim
 jawgRcwCM5glDt26xArR8YhR4m3LerAOTgFdiSvfpoB1CAv4SXzpbgBbwSKgIvHi3Acwm1fA
 UmLVj+eMELagxMmZT1i6GDmApupJtG0ECzMLyEtsfzuHGeI6BYmfT5exQhzhJnHi7Hs2iBpx
 iaM/e5gnMArPQjJpFsKkWUgmzULSsYCRZRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4m
 RnDsamntYNyz6oPeIUYmDsZDjBIczEoivKWbdiUL8aYkVlalFuXHF5XmpBYfYpTmYFES573Q
 dTJeSCA9sSQ1OzW1ILUIJsvEwSnVwDR1Y+T6k08ORP+qKfHmvW3dGzeVQ7fCtNZo76WZc0zs
 Aqq+6XzL4Wiqvfh/g+xPc+9FWxZMjdf4H2nAsW9P/Vm36/PZPE4uF/l826krR7uD1+JdqbPM
 PgGbS7P3/JLde/BV6a1fbjEKb6XEWx89iP6kWVnC+6rg76PtmW93yJjrvHW++Nnk+uOnjHmZ
 D5Nceq4dCr2tfPfnjdJjSwU+X3xwiPOkUNvmqjOd84JzX8x5olV0x3FN/r43Ip/WMJ/5XWng
 onwpQSE+4ZGSYVn+G8UJIbOctt+q45FiuWyoGFvexGw76VfCot8HenS+lP6bv521qS7t3ie1
 z6tlkjll3hcfm7zLUq/nrk9exzbVA/ZKLMUZiYZazEXFiQCCSRn8TAMAAA==
X-CMS-MailID: 20230109040551epcas5p2d5487bd8ca6ba7c1bb46636da17010f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230103045651epcas5p417960d84f4aa934b0ae1a150ee5fee08
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045651epcas5p417960d84f4aa934b0ae1a150ee5fee08@epcas5p4.samsung.com>
 <20230103045613.100309-2-p.rajanbabu@samsung.com>
 <Y7RuMmvNnAx+oyyl@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: 03 January 2023 11:35 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> Cc: lgirdwood@gmail.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com; alsa-devel@alsa-project.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org
> Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: Add FSD I2S controller
> bindings
> 
> On Tue, Jan 03, 2023 at 10:26:09AM +0530, Padmanabhan Rajanbabu wrote:
> 
> > +
> > +      tesla,fsd-i2s: with all the available features of Exynos7 I2S,
> > +      supporting only stereo channel playback and capture.
> 
> The driver claims that 7.1 is also supported.

For I2S mode, data lines for channel 3 to 6 are not routed out of the SoC.
i.e FSD SoC has only SDO0 line routed out. SDO1 and 2 are floating pins. 

So Exynos7-I2S in FSD SoC supports only stereo playback and capture in
I2S mode. I'll reword the description in the next patch set to reflect the
above information.

Thanks,
Padmanabhan R.

