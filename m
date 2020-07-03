Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B603213F2E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 20:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12BAB16C0;
	Fri,  3 Jul 2020 20:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12BAB16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593799767;
	bh=5iogMd7yz99uXe9u1jct/jqhPQTK+vVWmPaDxjClMNw=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ezo/aVAnd3ca2kdpM6JTH6TgxNDfXg9q7EN+luMcGdD2DdzEq7NO0Q3i9cJzZiW8m
	 wRbt95OuLbMk7p3SYFMh0OwQB1OIOBPUhel6E8TX8EMZcB6XfAc1sAz7PULUTR3DQ4
	 GtxDI/qk5USJ9vPbYnSbcX9Bs0Gr1vVCVgPlU17E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D115F8021D;
	Fri,  3 Jul 2020 20:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04282F80217; Fri,  3 Jul 2020 20:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1615F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 20:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1615F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="fH/4YEMc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200703180733euoutp019ef0d43042466974f6350af35981e4cd~eUFdCmoLh0454004540euoutp01u
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 18:07:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200703180733euoutp019ef0d43042466974f6350af35981e4cd~eUFdCmoLh0454004540euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593799653;
 bh=70bj60STKB80rOnkSFyQI/YuWqofuzC2wl3VVj689IQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=fH/4YEMcA2LodrTI/daUKxlD0MWVGe3XaNoHQ5r2h5GF2w6ec51XYEii0Vlkcly+d
 dP9WJmnN6xyAnLO12nAxpSK2+HipNs6vg1ldi7qO4UQDt2gmDob7S73FgpBI3jhFA5
 5kWUjdiPtqT+Ut018CPNBC8E50crh01VEgiLlDjc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200703180733eucas1p2f008451ed38148d09c3be4fac6adaa55~eUFckRTwB2636026360eucas1p2Z;
 Fri,  3 Jul 2020 18:07:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D1.E3.06456.5E37FFE5; Fri,  3
 Jul 2020 19:07:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200703180732eucas1p2d892bde2008ef5b783a041ed194198b9~eUFcQJuqT1177511775eucas1p21;
 Fri,  3 Jul 2020 18:07:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200703180732eusmtrp1827a4f6922fb396ce87071f27e726fd7~eUFcPh8bG0919209192eusmtrp1p;
 Fri,  3 Jul 2020 18:07:32 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-20-5eff73e5b7fd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F9.FE.06314.4E37FFE5; Fri,  3
 Jul 2020 19:07:32 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200703180732eusmtip24b72fb42ea4bb4fbcf34697077c19ce1~eUFbk_jJb0813408134eusmtip22;
 Fri,  3 Jul 2020 18:07:32 +0000 (GMT)
Subject: Re: [PATCH 2/8] ASoC: samsung: spdif: fix kernel-doc
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <de4b95f5-72b8-fa22-e437-7740e5ce51f5@samsung.com>
Date: Fri, 3 Jul 2020 20:07:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702165901.164100-3-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djPc7pPi//HGez7zm9x5eIhJoupD5+w
 WZw/v4Hd4tuVDiaLy7vmsFl07upntfj1/xmTxcUVX5gsNnxfy2jxcvMbJgcujw2fm9g8ds66
 y+6xaVUnm8e8k4Ee+94uY/Po27KK0WP9lqssHptPV3t83iQXwBnFZZOSmpNZllqkb5fAldGw
 ag97wSfGirOPPjE1MF5k7GLk5JAQMJG4cPgUexcjF4eQwApGiRUti1ggnC+MEuem3GIBqRIS
 +MwocWirP0zHjWuLoDqWM0r83vWFCcL5yCjxZ+VCdpAqYQFbifZzi9hAbBGBOInlX86DdTAL
 tDFJHH7/ihkkwSZgKNF7tA/sEF4BO4mOm9+YQGwWARWJx09XgQ0SFYiV6Fu6gA2iRlDi5Mwn
 QCdxcHAKeEsceMMBEmYWEJe49WQ+E4QtL7H97RxmkF0SAi/ZJdon34Z61EVi9sJPzBC2sMSr
 41vYIWwZidOTe1ggGpoZJXp232aHcCYwStw/vgCq21rizrlfbCCbmQU0Jdbv0ocIO0p03djA
 DBKWEOCTuPFWEOIIPolJ26ZDhXklOtqEIKpVJH6vms4EYUtJdD/5zzKBUWkWks9mIXlnFpJ3
 ZiHsXcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwjZ3+d/zTDsavl5IOMQpwMCrx
 8L44+TdOiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUS
 SE8sSc1OTS1ILYLJMnFwSjUwRn0Ks15nn7RUe3ej+QI+puT7mmkBX9n2b+Zy3fkrnMnJiPdf
 5dI264PiijW7D7NV+rS4imQdF/54qLlxfd2V3nb+W2IK84ytrP5sWRXVknni56M9ETXTm9kk
 Kufb2XI/ExXaKsxatEbnfm9Lf9/hF1KTpryPXvVineSTkOySd/qVJWVOCS1KLMUZiYZazEXF
 iQBaKrheXwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xe7pPiv/HGTz+ZWFx5eIhJoupD5+w
 WZw/v4Hd4tuVDiaLy7vmsFl07upntfj1/xmTxcUVX5gsNnxfy2jxcvMbJgcujw2fm9g8ds66
 y+6xaVUnm8e8k4Ee+94uY/Po27KK0WP9lqssHptPV3t83iQXwBmlZ1OUX1qSqpCRX1xiqxRt
 aGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl9Gwag97wSfGirOPPjE1MF5k7GLk
 5JAQMJG4cW0RexcjF4eQwFJGiR3/j7J1MXIAJaQk5rcoQdQIS/y51sUGUfOeUaLnSi87SEJY
 wFai/dwiNhBbRCBOYvfCQywgRcwCbUwS31f1MEJ03GeUaFn7HayKTcBQovdoH9hqXgE7iY6b
 35hAbBYBFYnHT1eBTRUViJX4dm8LG0SNoMTJmU9YQC7iFPCWOPCGAyTMLKAu8WfeJWYIW1zi
 1pP5TBC2vMT2t3OYJzAKzULSPQtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yf
 u4kRGLfbjv3cvIPx0sbgQ4wCHIxKPLwTjv+NE2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVq
 UX58UWlOavEhRlOg3yYyS4km5wNTSl5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTU
 gtQimD4mDk6pBsaafskfm+y6Pf0uRivUF38PerZwxkyu1Us4JjTb1b/f0nST09hVfFkkw2+P
 P0Klbg1bMg2mWYaXMOr4/3Vot4w5Fhu7VWJjjvR2madO9X28Sd0cvUxe2+KO5vBHnet9HRmZ
 /TJVw+Cnxbufny6t2LjkjnVE4fUExi6zp9k/U6wdGsJa4pfdU2Ipzkg01GIuKk4EAOhKcpLx
 AgAA
X-CMS-MailID: 20200703180732eucas1p2d892bde2008ef5b783a041ed194198b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200702165920eucas1p1348effa5cbe7fb4682946525c3aeb31b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702165920eucas1p1348effa5cbe7fb4682946525c3aeb31b
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <CGME20200702165920eucas1p1348effa5cbe7fb4682946525c3aeb31b@eucas1p1.samsung.com>
 <20200702165901.164100-3-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 broonie@kernel.org
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

On 02.07.2020 18:58, Pierre-Louis Bossart wrote:
> Fix W=1 warnings - typos with structure fields
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
