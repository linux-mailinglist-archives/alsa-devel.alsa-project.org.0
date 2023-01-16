Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE866B6B5
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 05:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A489D4ECF;
	Mon, 16 Jan 2023 05:44:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A489D4ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673844312;
	bh=pgvEcYju+rD+UFDIw6eA7thqcwBTfxA7yIML+81V0pM=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hTafKfJskprn60xWYkPc3VBlZWH+CmMQv0djOwBY25Hyzw73ifVsSiftdSdohTNXc
	 QA9chom0kBL927GFHlE94vp95T/iHiGaYj+V7T56YkPbULX4Wajq/5UPMGUzcU/9AZ
	 VbIjeW6ViD1fQN6TFw0pKfSMZ9NhvaK7ushkoMYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C89F80543;
	Mon, 16 Jan 2023 05:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F871F80240; Mon, 16 Jan 2023 05:43:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A59D7F80240
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 05:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A59D7F80240
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=dXGZKSmc
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230116044342epoutp0425f1091f93d6a03c329eaf97dda791cf~6sHOoNeTW0088400884epoutp04B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 04:43:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230116044342epoutp0425f1091f93d6a03c329eaf97dda791cf~6sHOoNeTW0088400884epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673844222;
 bh=n7BZvoflkuNhnPh0ZpFa77pKeZYigLwPZNCe45bKa9w=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=dXGZKSmcJNRRYI+7xlS/OM93YQ7HM1Of14TSku03Zrj5ZC/vXNGQ+XmEQsuhXkjfD
 efKp938+Mc7Ql5oX2GzQx1ZxEqKiYcQ4iNsnSR++5bxwDnHxQ3HkEm90TsAxVVA3Kr
 scwVxImfCVPPmQarDicshQNxv2bNMueJVvMYIk04=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230116044341epcas5p122fbee5783fdc59d864b2c6eb95aa49f~6sHOLScDM0180301803epcas5p1e;
 Mon, 16 Jan 2023 04:43:41 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4NwKCv22qYz4x9QF; Mon, 16 Jan
 2023 04:43:39 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EB.A9.02301.BF5D4C36; Mon, 16 Jan 2023 13:43:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230116042127epcas5p2b6f0a54ea77bb62968d509bdb69b0245~6rzzvN82e0597105971epcas5p2r;
 Mon, 16 Jan 2023 04:21:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230116042127epsmtrp22762e5dfc02c251ce5b2be99cab0cece~6rzzuRSbs0843808438epsmtrp2b;
 Mon, 16 Jan 2023 04:21:27 +0000 (GMT)
X-AuditID: b6c32a49-473fd700000108fd-1d-63c4d5fbbbed
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.64.02211.7C0D4C36; Mon, 16 Jan 2023 13:21:27 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230116042125epsmtip11323f9b660214aa2d565a8be356e74b6~6rzxjtIYZ1376013760epsmtip1K;
 Mon, 16 Jan 2023 04:21:25 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <55e2d839-1488-c5a9-0ef8-55248554b86a@linaro.org>
Subject: RE: [PATCH v3 3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Date: Mon, 16 Jan 2023 09:51:24 +0530
Message-ID: <03a201d92962$007c4be0$0174e3a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHLbZyfFuOXMbrDWpBwvoqdO4xuvAGu/e0AAurkpccB9uxfPK6HXyZA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRmVeSWpSXmKPExsWy7bCmhu7vq0eSDdq3c1k8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxkttj7Gij27UoHk8XlXXPYLGac38dksWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AtKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyM/V+PMBUcFKhY+vcmawPjKd4uRk4OCQETiZWzpjJ2MXJxCAnsZpR4+f0Z
 E4TziVHiyuRVrBDON0aJKTfWMMO0fLz5H6pqL6NE64937BDOC0aJmwdfgFWxCZhLLNq7FGyw
 iMAVJomfq9tZQBxmgTZGib0X1zKCVHEK2Ekcf7aLDcQWFvCW+NL3mwnEZhFQlbi98CNYDa+A
 pcTl3WugbEGJkzOfsIDYzALyEtvfzoG6SUHi59NlrBBxcYmjP3vA4iICbhIv1t0Ge0JC4AOH
 xJuTZ1khGlwkWv93M0LYwhKvjm9hh7ClJD6/28sGYedLTPvYDGVXSLR93MAEYdtLHLgyB+gI
 DqBlmhLrd+lDhGUlpp5axwRxA59E7+8nUOW8EjvmwdiqEuuXb4JaKy2x7/pexgmMSrOQvDYL
 yWuzkLwzC2HbAkaWVYySqQXFuempxaYFhnmp5fA4T87P3cQITuRanjsY7z74oHeIkYmD8RCj
 BAezkgiv367DyUK8KYmVValF+fFFpTmpxYcYTYHhPZFZSjQ5H5hL8kriDU0sDUzMzMxMLI3N
 DJXEeVO3zk8WEkhPLEnNTk0tSC2C6WPi4JRqYHL3bzxdcn/v3v8mjEsW3U291hC5k0dkmr2t
 mtjPrnDR+Txzct77vdlZ0nbihgP3yju/2Y48FN+6f0W34SkGxw+7uCR2eInpBuoGHZ6gUfHn
 0b/F82zf+9x7Z3XZ8+zUhPSTAnUePf73tifxqjYyCIpnGwXdChJu336iQeHPjGUTFuVmaN8t
 8vJ7bNuxydUiqWb5scVVjW+U9pYppDa/DtL/6OLC++Lwk+XdLb+d2CfmulZP3BHC2b2IzWPb
 0cSdi3znRvLMV3bp+3D/gZXCE7nWIA8nuYZWji8sxWXM5qaiuqocW9ek6s1xXs4mv3m7xIcN
 u4Idr8vJKK9XTW2yfXrKJMb80P2P16/cCJ8/T4mlOCPRUIu5qDgRAKvr2CltBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSnO7xC0eSDa7vVrV4MG8bm8WVi4eY
 LA5t3spuMfXhEzaL+UfOsVr0vXjIbLH3NVDs25UOJovLu+awWcw4v4/JYtHWL+wWnbv6WS1m
 XdjBatG69wi7xeE37awWG76vZXQQ8NjwuYnNY+esu+wem1Z1snncubaHzWPf22VsHn1bVjF6
 rN9ylcXj8ya5AI4oLpuU1JzMstQifbsEroz9X48wFRwUqFj69yZrA+Mp3i5GTg4JAROJjzf/
 M3UxcnEICexmlGi/dpAFIiEtMb1/DxuELSyx8t9zdoiiZ4wSZw8dBitiEzCXWLR3KSNIQkTg
 EZPE3PmP2EAcZoEuRonjf1cyQ7S8Z5SYdPsgK0gLp4CdxPFnu8DmCgt4S3zp+80EYrMIqErc
 XviREcTmFbCUuLx7DZQtKHFy5hOwdcwC2hK9D1sZIWx5ie1v5zBD3Kcg8fPpMlaIuLjE0Z89
 YHERATeJF+tus05gFJ6FZNQsJKNmIRk1C0n7AkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnp
 esn5uZsYwdGspbmDcfuqD3qHGJk4GA8xSnAwK4nw+u06nCzEm5JYWZValB9fVJqTWnyIUZqD
 RUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QDU8wJvX8TeFXVZnPV1d878OmgvPxes2DuizOk
 PpSKfbzEr31444Mc3jVx/YrFb1e6Kvl/KduwfXdf95aHBu499afbXi6erqK4UvAqX9df32Me
 AoEaklufLFgUJ/Uzx7PW1krQjl35latYRtrenVF+vp73Xn+wS6s4EZJlpRqS9Pj5rr3zv39T
 KPfIO1649pHT+pdhdev6m18kSdxMu2Wfe3feLGvDTxe4zMucolzmNrGzLk5r0xL5ZaC/5u3b
 uC+2iSJF77QyKq9EfdzYODVNp/hieaH1xT2KG3Z/WVa6OD+2v1Bh+abfBfc+cYtdSZnRwJVm
 0hJpJWUQu5tXWSSyftKDsEAvrW/3az0meNUosRRnJBpqMRcVJwIA1V73+FUDAAA=
X-CMS-MailID: 20230116042127epcas5p2b6f0a54ea77bb62968d509bdb69b0245
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed@epcas5p3.samsung.com>
 <20230113121749.4657-4-p.rajanbabu@samsung.com>
 <55e2d839-1488-c5a9-0ef8-55248554b86a@linaro.org>
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
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: 15 January 2023 08:35 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH v3 3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
> 
> On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> > Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla FSD
> > platform.
> >
> > FSD SoC has 2 I2S instances driving stereo channel I2S audio playback
> > and capture with external DMA support.
> >
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > ---
> >  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
> >  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 +++++++++
> >  arch/arm64/boot/dts/tesla/fsd.dtsi         | 34 ++++++++++++++++++++++
> >  3 files changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > index 1db6ddf03f01..cf5f2ce4d2a7 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > @@ -38,6 +38,14 @@
> >  	status = "okay";
> >  };
> >
> > +&i2s_0 {
> > +	status = "okay";
> > +};
> > +
> > +&i2s_1 {
> > +	status = "okay";
> > +};
> > +
> 
> You need to rebase.

This patch series has been rebased on top of for-next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

I'll rebase the DT patches on top of next/dt64 of
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git  and 
driver changes on top of for-next of broonie/sound.git

> 
> >  &ufs {
> >  	status = "okay";
> >  };
> 
> Best regards,
> Krzysztof


