Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0766B6B2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 05:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232854ECB;
	Mon, 16 Jan 2023 05:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232854ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673844290;
	bh=XxEMduc1BuwlDpgZ1rgKqkHY6KJfCsE81V00TpBTEc8=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E1Qusi0OvPzc4ViX+D2fb/LzMa3ekpL6B7CzHP5KAue0I2wOgzrZv/Gh+MwoVl5zJ
	 a5TwPHaE54hn3yptHPru3za3SMnxXPrmHPRgTyCKsY8LFd3x6ekdmTA24pUY9MQfXU
	 eKT3We+BKKRDX2iELBeF56wrnvgkKTJPUPlRlDvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CFCF80083;
	Mon, 16 Jan 2023 05:43:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1132BF80482; Mon, 16 Jan 2023 05:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF692F8023B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 05:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF692F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=VFuHZDxi
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230116044337epoutp031a6bfdf4a1ad0febdf05cc40adbb9c2d~6sHKLsCi_1064710647epoutp03y
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 04:43:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230116044337epoutp031a6bfdf4a1ad0febdf05cc40adbb9c2d~6sHKLsCi_1064710647epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673844217;
 bh=IvJBdGIdcYRMsJ9xPD6Iz04fX+aKGWGqsKip4KPnIoI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=VFuHZDxiXzeyrSAlGaC8qdrk9IIMfxl4pJq3yArQFH60bcN2IdoGF12DzCkkRK4Hx
 cU+nhfFaNGENtkkpB9e3T1W5qJt2rz/KxoadpfAKvH2sru5BGhdTRwAXvVRX+V5ha1
 q8Qen37flaoYqVLP+lLEZFLbqYucXLfIvIFBZBvs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20230116044337epcas5p4670c73cd881c3bc1784b8569782f9eae~6sHJ0I_6B0552205522epcas5p4G;
 Mon, 16 Jan 2023 04:43:37 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4NwKCq31Wjz4x9Pp; Mon, 16 Jan
 2023 04:43:35 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.C9.62806.6F5D4C36; Mon, 16 Jan 2023 13:43:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230116040959epcas5p4ec43384242bc9c14fca04aa9a3650d31~6rpy7eJZ_3108631086epcas5p47;
 Mon, 16 Jan 2023 04:09:59 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230116040959epsmtrp115ae447bde732b8e42b12fe00fe605a2~6rpy6dxLH1798717987epsmtrp1L;
 Mon, 16 Jan 2023 04:09:59 +0000 (GMT)
X-AuditID: b6c32a4a-ea5fa7000000f556-1b-63c4d5f652f5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.5F.10542.71EC4C36; Mon, 16 Jan 2023 13:09:59 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230116040957epsmtip221bd062b3f2cd134ef14021df01805ae~6rpwufDFS2521725217epsmtip2o;
 Mon, 16 Jan 2023 04:09:57 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <e5cd9794-d8ce-7285-5da2-7f3b6bf8dc2a@linaro.org>
Subject: RE: [PATCH v3 2/5] ASoC: samsung: i2s: add support for FSD I2S
Date: Mon, 16 Jan 2023 09:39:56 +0530
Message-ID: <039d01d92960$665c6230$33152690$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHLbZyfFuOXMbrDWpBwvoqdO4xuvAKyiR4/AjNceAgCN7SsGK6C+E4g
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjN7fvRFlPyKDju2KbNU7KBAi0r+JgiJjpscBGS/WO2ZPBS3lpC
 aZu+suEiDEVA2AYKwdVSgWkGFnUQbBlWS7SFmDri6Ky6qUwwKIyBkyKQ6n61fbjx3/nOPed+
 93z3XgEi/gWPExRpjYxBS2tIPALtdyckJC3dGlJKHR1CarytH6d8XhePcl2w86mWiUmcah+6
 gVEN0xMI5fw9yC35jvComw4LTpl+HORRp+zP+FSdoxGjzKMDGFXtHOJT7tlajOpdPg92EIre
 hUO44qJ5jK/o667DFfdvX8YVg3OduKLB1g0UPbZbqGKhb12e4IPibWqGLmQMEkar1BUWaVWZ
 5J7383fmp6VLZUmyDGoLKdHSJUwmueu9vKTsIk0wAin5hNaUBqk8mmXJlO3bDLpSIyNR61hj
 JsnoCzV6uT6ZpUvYUq0qWcsY35FJpalpQWFBsdp39gimb1hT1jpejVSCTmE9EAggIYePZgvq
 QYRATFwC8B9TD+AKP4BLh+dxrlgA8PqvTl49EIYdNy4+RrkFB4CBJ1/zuWIawOqmY2hIhRNb
 4Cnnt+G9YggfDwbO1oYtCFEDoNN7HoRUQmI7nDL1YCEcTeyGF2aseAijRDysejwV1oiIDOgP
 LGIcjoKeE5PhDgixHn4/Z0G4M0lg4FEnxvGxcDjwZZiPIbJh7R9Pwo0h8VQAzX9aMc6wC7ZO
 X8E5HA1nrtn4HI6DvzXWrGAdPD5ftaIpgzXzvSsDyIJXfBY0ND6ESIA9jhSOfgO2XP+Ox50h
 En71YnJFLoIDbS9xPOzp6gMcfg0O3nGCo4A0r4pmXhXNvCqO+f9uHQDtBq8yerZExbBp+lQt
 8+l/V67UlfSB8BtPzBkAE+NPk12AJwAuAAUIGSPa63ArxaJCev9njEGXbyjVMKwLpAXnfQyJ
 W6vUBT+J1pgvk2dI5enp6fKMt9NlZKyIsbcrxYSKNjLFDKNnDC99PIEwrpL35u6IO6cP/Dyz
 oRlRewMPDsxpYMuofV+zcCTrjLopz3m53qZpdNUVfyPcfLfES45GfnxQcfrdoz88/7u+T/z6
 4SmvIS23wrj87AvfuXaPtH+M3W+K6qWzKxrKYz8vEj9XV5xoGp66F3lfVj65t2pdoOyMb328
 bM+AyD1bXnctQChHrHH7eHby0KXlrY7Na7GortzWTbk5jQ+y3hK3RN/zG8cenlNamv6yum8X
 dGzc5G+2xAxajDdHrWaP9ODJhauLCQmJvZkfUVvlHS/aHVo0x5Nyd7itEmPM6I6f/FBzNbXt
 FXRNrNqv2tA9AxZP2jz00ocbWx+q5CNdZeadpjkSZdW0LBExsPS/ClfgrmwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSvK74uSPJBi9XKlo8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxkttj7Gij27UoHk8XlXXPYLGac38dksWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8aV1R2sBX3cFbMftDI3MC7j7GLk5JAQMJE4t/MZ
 SxcjF4eQwA5GicZtq5kgEtIS0/v3sEHYwhIr/z1nhyh6xijR9Gg9I0iCTcBcYtHepYwgCRGB
 R0wSc+c/YgNxmAW6GCWO/13JDNHynlFidctXsFmcAnYSz2esZwWxhQXcJTa/WgkWZxFQlWh+
 9hxsLK+ApcSnn19ZIWxBiZMzn7CA2MwC2hK9D1sZIWx5ie1v5zBD3Kcg8fPpMlaIuLjE0Z89
 YHERATeJ9vfvWCYwCs9CMmoWklGzkIyahaR9ASPLKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0
 veT83E2M4GjW0trBuGfVB71DjEwcjIcYJTiYlUR4/XYdThbiTUmsrEotyo8vKs1JLT7EKM3B
 oiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qB6dQ216aWUyeeHnTTi2dZ9mrp17dczcc/zHrX
 HX+1lC3xZmbShvtCO7p8vrsyGRsusk8qtXR4eGDiTQ99Q1vl1fLqM5dU/1ri+7Qg7Gxm/xaj
 w2KzcgIvWcYsf9xbPCv1fPc/vXCWcKUnvdIPvmT9ENATNVp73j+z8/S74rgp5/e/Ls7gcDNs
 2DbZpuN78tWT2p/8cmJuG72ZPiXkf37e75faWoL/fVQcam980nkosV8st+CV4eGiCS/nnXum
 73bk+8Ujv05939ojd+auo+Ed1fSd2396hiSvjNLOzT297sJU3RYz54T411ZhEutvfozI0N9j
 w5PXcl7a5AbT343RhmstbEMOqK1h2FJkM0l7lhJLcUaioRZzUXEiAM9MmPBVAwAA
X-CMS-MailID: 20230116040959epcas5p4ec43384242bc9c14fca04aa9a3650d31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230113121821epcas5p4ebd116d75f12dafeb09391eb6f7a2646
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121821epcas5p4ebd116d75f12dafeb09391eb6f7a2646@epcas5p4.samsung.com>
 <20230113121749.4657-3-p.rajanbabu@samsung.com>
 <e5cd9794-d8ce-7285-5da2-7f3b6bf8dc2a@linaro.org>
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
> Sent: 15 January 2023 08:33 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH v3 2/5] ASoC: samsung: i2s: add support for FSD I2S
> 
> On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> > Add support for enabling I2S controller on FSD platform.
> >
> > FSD I2S controller is based on Exynos7 I2S controller, supporting 2CH
> > playback/capture in I2S mode and 7.1CH playback/capture in TDM mode.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Drop. It's for the bugs. Just be sure that the code compiles without W=1
> warnings.

Okay, got it. I'll drop it in the upcoming patchset.

> 
> 
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > ---
> >  sound/soc/samsung/i2s-regs.h |  1 +
> >  sound/soc/samsung/i2s.c      | 53
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> Best regards,
> Krzysztof


