Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A203066B753
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 07:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EBE75001;
	Mon, 16 Jan 2023 07:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EBE75001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673849458;
	bh=QHJl3TWNbC6Tn8Fq18IXgx/MjfEo//YjmkgAonhshzU=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sOMuKpG9NY3dZgzIkfb9t7Bzm/w0iBNwEGYa88G0AmQv75D47KRBCIgJoMzqQs+ui
	 phee77FcCZXSTySHFhm5+l/+EmrWbXh9Q3NzLNjq6gVrdhHvEJRZ75zRKoxxW4NM3/
	 mGJU5kvWP9X5hWbkGHaxHiwXt98RqxD4YtXyaIpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6767F8023B;
	Mon, 16 Jan 2023 07:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E13F8024C; Mon, 16 Jan 2023 07:10:05 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 48548F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 07:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48548F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=kjCzWwms
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230116060954epoutp04c60510b367c7ef4f2e5b6782b6cb1cde~6tSfwdZ1d1360913609epoutp04i
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 06:09:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230116060954epoutp04c60510b367c7ef4f2e5b6782b6cb1cde~6tSfwdZ1d1360913609epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673849394;
 bh=9gvL9idkaGcmNbQzssHRGrdNsRLaMqUed16ixUCKeZw=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=kjCzWwms65GFrJbam4dyVuwssqQWq4UcsB7dmwDo6N7F9f6kZMNcDl+VSoNPhMKV8
 Qv6gQEydlf1lRPZfofuZlpVJ+ZqfrTVTZODTzexDmLGxIKHHjnhmJa4saBiSyxLLqN
 8POCHSf2GCSXr6ZHrcNlyY2O1uI2fxy1uQu0k044=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20230116060953epcas5p476ae84b4e0fb46b8b1539551e0475d71~6tSfD2WcW2725727257epcas5p4V;
 Mon, 16 Jan 2023 06:09:53 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NwM7M6vrPz4x9Q8; Mon, 16 Jan
 2023 06:09:51 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.D6.62806.F2AE4C36; Mon, 16 Jan 2023 15:09:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230116060345epcas5p248d9bb568a7122bd8becc096f3762084~6tNH7j52p1331613316epcas5p2L;
 Mon, 16 Jan 2023 06:03:45 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230116060345epsmtrp26c31aa0e901ae2c622a0209a2a0ab260~6tNH6rCRx0487804878epsmtrp2O;
 Mon, 16 Jan 2023 06:03:45 +0000 (GMT)
X-AuditID: b6c32a4a-ea5fa7000000f556-19-63c4ea2f61e6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.5D.10542.1C8E4C36; Mon, 16 Jan 2023 15:03:45 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230116060343epsmtip25fc21a710998207fca10eaefc85a3b17~6tNFuKuQ92862528625epsmtip2u;
 Mon, 16 Jan 2023 06:03:42 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <3c2c4da5-c63b-dd2a-c918-4b8163a52512@linaro.org>
Subject: RE: [PATCH v3 1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
Date: Mon, 16 Jan 2023 11:33:42 +0530
Message-ID: <03f901d92970$4ad8abd0$e08a0370$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHLbZyfFuOXMbrDWpBwvoqdO4xuvAINteJuAY/BJ08BexyC2K6TQHTQ
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmuq7+qyPJBpNbzSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW+x9DRT7dqWDyeLyrjlsFjPO72OyWLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCMq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnF
 J0DXLTMH6AUlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5q
 iZWhgYGRKVBhQnbGnA9/2ArOclRsfLCErYFxPXsXIyeHhICJxI4bTxhBbCGB3YwSN/YZdTFy
 AdmfGCVafy5ghHA+M0pcvX+FFaZj95r1bBCJXYwSz1dPgqp6wSjxfeVksLlsAuYSi/YuBUuI
 CFxhkvi5up0FxGEWaGOU2HtxLdhGTgE7iZ8z7jCD2MICARItH26A2SwCqhITdv9nAbF5BSwl
 GvYdYYSwBSVOznwCFmcWkJfY/nYOM8RNChI/ny5jhYiLSxz92QMWFxFwk9i+7jnYYgmBNxwS
 a+/ehXrCRWLrwn8sELawxKvjW6DBISXx+d1eNgg7X2Lax2You0Ki7eMGJgjbXuLAlTlAvRxA
 yzQl1u/ShwjLSkw9tY4J4gY+id7fT6DKeSV2zIOxVSXWL9/ECGFLS+y7vpdxAqPSLCSvzULy
 2iwk78xC2LaAkWUVo2RqQXFuemqxaYFRXmo5PMqT83M3MYLTuJbXDsaHDz7oHWJk4mA8xCjB
 wawkwuu363CyEG9KYmVValF+fFFpTmrxIUZTYHhPZJYSTc4HZpK8knhDE0sDEzMzMxNLYzND
 JXHe1K3zk4UE0hNLUrNTUwtSi2D6mDg4pRqYRHLX9WbwKSq3Lo6um9aXUPx+TzXbz3vTZGwf
 Tkib0Wvx7Ei0gcLPxbN8Q1uCzuf8CXjLof57cdqGu3ViLc1c3le+SnotZik9f8cyZ7toQKj7
 F+f3lq0zy233ZeReNsxenNq8QmvzW3XuYnv3Twf4T2q/s77zt3DFsbslNQGrxMprbP4kO+WE
 zWicM2/tccaYriiLlsmMC+ytvjlZcr5Wq5VZet1Yze67wY9IrvJoufdbulmXBAdVr5p0ew/n
 imWXcoXnqB1l0XZc0HxT6OPRgiq11AnXCzeJ/eO8ueq8e+/aMBb9iCV9jXuKtQKmxc1z3uU8
 0/9FZ9GE7ZV2Amx3LSyMPVjn3tt49P5Tsy9KLMUZiYZazEXFiQACkcBrbAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsWy7bCSvO7BF0eSDS5uEbV4MG8bm8WVi4eY
 LA5t3spuMfXhEzaL+UfOsVr0vXjIbLH3NVDs25UOJovLu+awWcw4v4/JYtHWL+wWnbv6WS1m
 XdjBatG69wi7xeE37awWG76vZXQQ8NjwuYnNY+esu+wem1Z1snncubaHzWPf22VsHn1bVjF6
 rN9ylcXj8ya5AI4oLpuU1JzMstQifbsErow5H/6wFZzlqNj4YAlbA+N69i5GTg4JAROJ3WvW
 s3UxcnEICexglHi+bS8bREJaYnr/HihbWGLlv+fsEEXPGCX+928B62YTMJdYtHcpI0hCROAR
 k8Tc+Y/ARjELdDFKHP+7khmi5T3Q3BmrWUBaOAXsJH7OuAOU4OAQFvCT6LmkDRJmEVCVmLD7
 P1gJr4ClRMO+I4wQtqDEyZlPwOLMAtoSvQ9bGSFseYntb+cwQ5ynIPHz6TJWiLi4xNGfPWBx
 EQE3ie3rnrNMYBSehWTULCSjZiEZNQtJ+wJGllWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ
 +bmbGMGxrKW1g3HPqg96hxiZOBgPMUpwMCuJ8PrtOpwsxJuSWFmVWpQfX1Sak1p8iFGag0VJ
 nPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9OsC5XngoNYlc+L7ChPeJBvbR/8eeXag1xZJV61
 MW6+U8Uq3z37L+1k8IvR+OOpL1OjeE8cmCQzh+3Lpw1X365JaBYw9E3cnhelbFn8Vnajf80z
 rqbleydsvGbz/15hzt7sxzEpfpyaVpk283ZzKMUcKEzzSz3PNF3s2HGt5IizGWaH/bh9Dk8w
 CL507rTjQn4HNq0v32cqRoWuvJhct8GM1WL6dMU3kzOyTmqpc5VNc4ljvehr52Je6qjj+iLG
 oWLRJgPd188UJr07mFeb8euK1f3MqSeOWB0SdftyRaLwoV/w/0XisrEMFRsCzlzY9Nb1/c6p
 MnNDotn+HWIW1thecSXg5nKrY7luqxRTopVYijMSDbWYi4oTAUTV6wxUAwAA
X-CMS-MailID: 20230116060345epcas5p248d9bb568a7122bd8becc096f3762084
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230113121816epcas5p469f952d775cdd709de18ec63b24cedf7
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121816epcas5p469f952d775cdd709de18ec63b24cedf7@epcas5p4.samsung.com>
 <20230113121749.4657-2-p.rajanbabu@samsung.com>
 <3c2c4da5-c63b-dd2a-c918-4b8163a52512@linaro.org>
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
> Sent: 15 January 2023 08:32 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add FSD I2S controller
> bindings
> 
> On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> > Add bindings for FSD CPU DAI driver which supports stereo channel
> > audio playback and capture on FSD platform.
> >
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

Thank you for reviewing the patch.

Regards,
Padmanabhan R.


