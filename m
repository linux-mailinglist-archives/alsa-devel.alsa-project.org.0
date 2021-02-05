Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7531025A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 02:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FCA61661;
	Fri,  5 Feb 2021 02:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FCA61661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612489607;
	bh=NEKaj9avmopu+4ejYYNfGvZ3Gep4a5UNSzYjtZhKkKA=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUrtiwL0rofcKZMFOppgauW4toGMqVS10xzXiBScClZdKhCExJzyyb1Ik8eK49NfK
	 Vwuqj1NFyJqSh2zz/lYhNOaxxkUgk72MO+dX7uNZ2DEEvzlETAcVPn247dU6PQhRT3
	 gpvXbxfixhHndBbx29Ac8rACRY3lwoIEbmpdQrtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620B9F801F7;
	Fri,  5 Feb 2021 02:45:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2432F80171; Fri,  5 Feb 2021 02:45:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DBEEF80154
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 02:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DBEEF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Nr2rCmig"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210205014452epoutp019538cdfcf13c5483da2b54ea8403239a~gtqZhnDMq0691906919epoutp01d
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 01:44:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210205014452epoutp019538cdfcf13c5483da2b54ea8403239a~gtqZhnDMq0691906919epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612489492;
 bh=pAy9f5tg31NpVD3ZXP6DR2FvVm7psVqhEKVTP7Bg00s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Nr2rCmigc5tPiYMp0JFtEQMSRYg6ond420LH5nSRmfrBULTeaB7HAc1KiZnXjkD7V
 M3gwsqJp/bEzIw0o7xLSLVdejPw+4F0McFzxP32BxZA/5MXR9oaqJ19oA+fnihMAO7
 XcASw04tMDoZtUMVl/dsG5Sc3uXI+I2mieWYs/9E=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210205014451epcas1p1dba7d4811da2106c83426bccd15fd073~gtqYrvhlD1880518805epcas1p1C;
 Fri,  5 Feb 2021 01:44:51 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4DWysD5DfHz4x9Q2; Fri,  5 Feb
 2021 01:44:48 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D4.D7.63458.013AC106; Fri,  5 Feb 2021 10:44:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210205014448epcas1p1e63dcbba6426162d3feb244144ee7bbb~gtqVgczLv1184211842epcas1p1t;
 Fri,  5 Feb 2021 01:44:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210205014447epsmtrp230987f1ded57a800e5f945f01bd3380a~gtqVfcfLm2604226042epsmtrp2V;
 Fri,  5 Feb 2021 01:44:47 +0000 (GMT)
X-AuditID: b6c32a36-c6d65a800000f7e2-b2-601ca31049f0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.48.13470.F03AC106; Fri,  5 Feb 2021 10:44:47 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210205014447epsmtip2b0f4623ea2b77bb66c72d52e9763bac0~gtqVI2rh13051430514epsmtip2F;
 Fri,  5 Feb 2021 01:44:47 +0000 (GMT)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Mark
 Brown <broonie@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <49c77228-75fa-8e0a-0cb9-57afdd3f6b86@samsung.com>
Date: Fri, 5 Feb 2021 11:00:55 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20210204112502.88362-1-hdegoede@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRmVeSWpSXmKPExsWy7bCmga7AYpkEgw1PNSyuXDzEZPFywmFG
 i6kPn7BZfPqwn9XiSusmRos3x6czWdz/epTRYsXZyYwWl3fNYbO43biCzeLze6CSX/+fMVms
 vX2HyYHXY8PnJjaPnbPusnss3vOSyWPTqk42jzvX9rB5zDsZ6DF9zn9Gj/f7rrJ59G1Zxejx
 eZNcAFdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO
 0PFKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALLAr3ixNzi0rx0veT8XCtDAwMj
 U6DChOyMPcf2MRZ08lTsf/GTrYHxDGcXIyeHhICJxPYl95i7GLk4hAR2MEr8ud7MCOF8YpSY
 P+spO4TzjVFiefsGNpiW450/oBJ7GSWuvGiG6n/PKLFz/nQmkCphgQSJPw+vMoEkRATuMkn8
 6HgNVsUM0vL653x2kCo2AS2J/S9ugM3lF1CUuPrjMSOIzStgJzHn+R1WEJtFQEXi8IbDzCC2
 qECYxMltLVA1ghInZz5hAbE5BSwltjRNA9vMLCAucevJfChbXmL72zlgiyUEPnBIHNrSxwrx
 hIvE032/oR4Slnh1fAs7hC0l8fndXqh4tcTKk0fYIJo7GCW27L8A1WwssX/pZKANHEAbNCXW
 79KHCCtK7Pw9lxFiMZ/Eu689rCAlEgK8Eh1tQhAlyhKXH9xlgrAlJRa3d7JNYFSaheSdWUhe
 mIXkhVkIyxYwsqxiFEstKM5NTy02LDBCjvBNjOC0rWW2g3HS2w96hxiZOBgPMUpwMCuJ8Ca2
 SSUI8aYkVlalFuXHF5XmpBYfYjQFBvBEZinR5Hxg5sgriTc0NTI2NrYwMTQzNTRUEudNNHgQ
 LySQnliSmp2aWpBaBNPHxMEp1cA0bfM7vn1Xoz5IvY3Kv/Mq92Ti9/U73Oex/AnnMT5+4NPN
 os+Res8PHT9ye8L+YLMZc90Pa237NP/pqWdcPdHZqw7PzA3dzP1iyb+DAdF7ZzIfTXHykwjb
 uVo9ehWT4W3fOq6PGenxTM0h05JKrN7/XC134ameeAZjuNrKGu0XeTPvXPkWVOaqXeKcqB50
 zU73i1Ehr92EzCVOEV+PRMl+md/EWWFZM2+j4eukSTvLpCV2vpvwb5v0wXlnbTzPFl190yK6
 deHN2B0dLW6rDHN/3z3+fL7aRRnXbi/N1pAjp/Ub58jXhhpt1Cna9COwUTLsrtexF+L3D76u
 OOL9XO6Hg2nBRfbnBxfrtk0t8+9kUWIpzkg01GIuKk4EAIH6pZ5kBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsWy7bCSvC7/YpkEgxk/jSyuXDzEZPFywmFG
 i6kPn7BZfPqwn9XiSusmRos3x6czWdz/epTRYsXZyYwWl3fNYbO43biCzeLze6CSX/+fMVms
 vX2HyYHXY8PnJjaPnbPusnss3vOSyWPTqk42jzvX9rB5zDsZ6DF9zn9Gj/f7rrJ59G1Zxejx
 eZNcAFcUl01Kak5mWWqRvl0CV8aeY/sYCzp5Kva/+MnWwHiGs4uRk0NCwETieOcP9i5GLg4h
 gd2MEgcmvGKGSEhKTLt4FMjmALKFJQ4fLoaoecso8Xv9bxaQGmGBBIk/D68ygSREBO4ySaw5
 tYINxGEW2MsosXBjKytIlZBAD6PEzIuhIDabgJbE/hc32EBsfgFFias/HjOC2LwCdhJznt8B
 q2cRUJE4vOEw2BWiAmESO5c8ZoKoEZQ4OfMJ2GZOAUuJLU3TwOLMAuoSf+ZdYoawxSVuPZkP
 FZeX2P52DvMERuFZSNpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLz
 czcxgqNXS3MH4/ZVH/QOMTJxMB5ilOBgVhLhTWyTShDiTUmsrEotyo8vKs1JLT7EKM3BoiTO
 e6HrZLyQQHpiSWp2ampBahFMlomDU6qBSXPrZtas1v7+rOlpsxzvn7H/+eT1LbWyyMJTUfrm
 7z9zzT+6UOXzRlE1JW+Zt0HT9t3aeT79NX/n8hU1vicVNFSWrNW0jmxVj+p4GbXp5LSLOg+P
 3FMwVjeSZLLbeF37cZrH0gnq2w78t3y2d0VFvc8NY66VpQvq+ff6ymnz2Ojczd23QFyU6+gN
 4Y61CoHLjjKfOVGzy/gtm3DvEs59M4/O+PODc9Gt+VVi548fMN328YJEoO5lS6WZlodbrjWk
 PHet+HhlAnuwzVKGrtT3F9XX8G1UE3jxR6vm5HXGTPHus2xpp+VqztTMN5GfaqmvU1SwY+6t
 stj3z2wPHfxZctD4h0ekxbrm/dpXjstnViixFGckGmoxFxUnAgBCZcgvTQMAAA==
X-CMS-MailID: 20210205014448epcas1p1e63dcbba6426162d3feb244144ee7bbb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210204112515epcas1p27a866811ba15a8cd8b0be9a3f7bf86e5
References: <CGME20210204112515epcas1p27a866811ba15a8cd8b0be9a3f7bf86e5@epcas1p2.samsung.com>
 <20210204112502.88362-1-hdegoede@redhat.com>
Cc: patches@opensource.cirrus.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On 2/4/21 8:24 PM, Hans de Goede wrote:
> Hi all,
> 
> Here is v4 of my series to rework the arizona codec jack-detect support
> to use the snd_soc_jack helpers instead of direct extcon reporting.
> 
> This is a resend with some extra *-by tags collected and with the extcon
> folks added to the "To:" list, which I somehow missed with the original
> v4 posting, sorry.
> 
> This is done by reworking the extcon driver into an arizona-jackdet
> library and then modifying the codec drivers to use that directly,
> replacing the old separate extcon child-devices and extcon-driver.
> 
> This brings the arizona-codec jack-detect handling inline with how
> all other ASoC codec driver do this. This was developed and tested on
> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> 
> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> 
> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
> support for Intel Bay Trail boards with WM5102 codec" series and there
> are various interdependencies between the patches in this series.
> 
> Lee Jones, the MFD maintainer has agreed to take this series upstream
> through the MFD tree and to provide an immutable branch for the ASoC
> and extcon subsystems to merge.
> 
> Mark and extcon-maintainers may we have your ack for merging these
> through the MFD tree ?


About patch2~patch6, I agree to take these patches to MFD tree.
Acke-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
