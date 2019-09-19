Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B80B79C2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 14:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305CE1675;
	Thu, 19 Sep 2019 14:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305CE1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568897451;
	bh=D0w226/++sdIGZDOU6aY4SwyR+eZBdVUXG/0gvcl18g=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GCRz0ZtFvhCrGJOsJvSN4pOYZw/buLj9wLItsdpUS2YCiGbFoE6bniquiTFDCINgW
	 Ho9XLnvDy2tjKf3bDMijbv1My5jQ13uI/Fd1qLbIhdYukCKLrB6k6YZ55Ttv4l3Vo3
	 OGwINdjsqmTdS/XiK4yuZiky7uzbQYeQ1HJD6pwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A227EF80307;
	Thu, 19 Sep 2019 14:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF7B5F80307; Thu, 19 Sep 2019 14:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7BD3F80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7BD3F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="NoGkTjPL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919124900euoutp014d8457514c082cd559f851b039ac7e85~F19GTadzy1496714967euoutp01w
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 12:49:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919124900euoutp014d8457514c082cd559f851b039ac7e85~F19GTadzy1496714967euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568897340;
 bh=J22Qpfy7n8Y1XcaV/gdgpvRYNyZpeC/UESeqfLD2sEM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NoGkTjPLIGcnAWh377fCEaNMPcpjLizEIiyoh9OuDHhNDxa6fSEAIyKLVuzxM87Rf
 8gWqcLxe7l+k/o3UXL62WOJhy3HcsO2A/AkHaPbcx0KChfGDnts4plGBDJlJK07E/F
 AKJxRwAeYddikBQmDvCwEfR3BGp923EWIhezSUEc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919124859eucas1p291f22b7c17376e4bf10628a6f54e12a6~F19FpudbC1013810138eucas1p2l;
 Thu, 19 Sep 2019 12:48:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.5A.04374.B39738D5; Thu, 19
 Sep 2019 13:48:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190919124858eucas1p2cb801bef09b778fba0e4b5a83fef7203~F19E6YY6M2105921059eucas1p2B;
 Thu, 19 Sep 2019 12:48:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190919124858eusmtrp24513783b173cc557bd84222d9ba5e919~F19EsHn330718807188eusmtrp2H;
 Thu, 19 Sep 2019 12:48:58 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-0d-5d83793bc4d6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.77.04117.A39738D5; Thu, 19
 Sep 2019 13:48:58 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190919124857eusmtip20c1e572b804df4737ffb2072e0598532~F19EGM0Ab0452004520eusmtip2Z;
 Thu, 19 Sep 2019 12:48:57 +0000 (GMT)
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
Date: Thu, 19 Sep 2019 14:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919075924.GB13195@pi3>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHfc/Z2Tlax16n5ZOG1iro5o0KDlmSEDhJunyISrFc7aCW07F5
 SYMyxVBT0WBNl+A+dLFVqMvM7jFXIwvnZagVmrc+VIroNJFM23aI/PZ7/s//fZ7nDy9DSjqp
 ACY1PZNXp8vTpGIvUcu7+Y6QyNzCxPDW4TWcvctMcE3VDRSnHR4Tc/YiE+LqLB0UZ7M10twv
 ezHBmUZ7Ka7a9orgHloGaM4x+Zriil5aaK6rfobYz8oaHQVi2VP9AC0zGUvEske3Lst0tUtI
 VtFsRDKHKegIHe+1V8GnpWbz6rCoJK+Ub4uRqk76Qv6khcpH5eJS5MkA3gUPtCNkKfJiJLge
 wRvbFUIoZhDcflRDuFwS7EDwe/D4vxdaR7lIMN1FMPFpjhKKCQTG0TaRy+WL40Cbv+je4Ye3
 Qt8fwUTibgI+Gz8iV0OMI6D8bYWTGYbFUTBflOiSRXgzjLwtpVy8Gp+A6aE2N7PYB97XjLnn
 ezpnfu+2upnE/lAwc48SOBieTNSSwqVTNDTpVgl8AAxTfyiBfeGHtZkWeB0sPa1zRwZciKDs
 +RdaKCoRfLUakOCKhDZrF+U6lHRubngWJsjR0F7RT7hkwN7QP+Ej3OAN11t0pCCzUHxVIrg3
 wW+jjhA4AK6NLYkqkVS/LJl+WRr9sjT6/3sNSGRE/nyWRpnMa3am8zmhGrlSk5WeHHo2Q2lC
 zn/2YdE624peLZwxI8wg6Up2fU5hooSSZ2tylWYEDCn1Y2t3FyRKWIU8N49XZ5xWZ6XxGjMK
 ZERSf/aix1CCBCfLM/nzPK/i1f+6BOMZkI8OVZ28OTy7hYvvCd74Zf7K47Smiu0Jg3te8nOz
 dzKN2Wf6TpbHbsh7UWKOaG8JKb3UVz+u8GBw57SdCp+6EVgXW/X1ErtQeDSKW6Ea1+XtaFdV
 xhmUa31Tv2kV5+Kiv7PTSVNNPzueD/TuiwnKkAefus8drPHpWTgWU0bTyWWHF6UiTYo8Yhup
 1sj/AmOlecpjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7pWlc2xBheXKltcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHuUnk1RfmlJqkJG
 fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbTf9YFF9grGt4fYW1g
 7GXrYuTkkBAwkZj6uZeli5GLQ0hgKaPEtontrF2MHEAJKYn5LUoQNcISf651sUHUvGaUmDPt
 FiNIQljAR2Jqwz+wQSICmhLX/35nBSliFrjEJDH/zU5GiI57jBJ3HhxgAqliEzCU6D3axwiy
 gVfATuJnayxImEVAVeLR0S5WEFtUIELi8I5ZYAt4BQQlTs58wgJicwIteHnpOJjNLKAu8Wfe
 JWYIW1yi6ctKVghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0u
 zUvXS87P3cQIjOBtx35u2cHY9S74EKMAB6MSD69CeXOsEGtiWXFl7iFGCQ5mJRHeOaZNsUK8
 KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wueSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
 S1KzU1MLUotg+pg4OKUaGG3lGjVnaS4tabthbaak6MLWp5/PPmuaQmPr7G9s6k2CTifefj9v
 aX30vLzPmoRE9TU5K1PfOR307vf9H1R3NuRHwt3nOqkJAcUJcv/+bdxt7XBLtSB1w7Yddi8j
 bjYXHLn7kun56yUHlnXedr/1q2VPc8HphLxN05iCt31jNHrQzRLPajTrnhJLcUaioRZzUXEi
 AGE/0KD2AgAA
X-CMS-MailID: 20190919124858eucas1p2cb801bef09b778fba0e4b5a83fef7203
X-Msg-Generator: CA
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
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

On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
>> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
>> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
>> part of the wm8994 driver so they can be further handled in the audio
>> CODEC part.
>
> I think these are needed only for the codec so how about getting them in
> codec's probe?

The clocks are specified in the (I2C slave device) DT node which corresponds
to the device as a whole and to which binds the MFD driver.  AFAICT those
clocks are only needed by the CODEC sub-driver but in general such clocks
could be used to provide device's system clock used by other functionalities 
than audio.  We are doing something similar for other MFD drivers already
and I would rather stick to one pattern. IMHO it's clearer to see what
device the clocks belong to that way.

-- 
Regards,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
