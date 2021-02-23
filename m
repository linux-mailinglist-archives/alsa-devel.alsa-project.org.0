Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60064322917
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 11:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7771676;
	Tue, 23 Feb 2021 11:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7771676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614077785;
	bh=sdnAsYVMjuZ//80PwrpxKDnjEHlnTj/h59u6RQv3/D8=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P14tBzCXu+IPlCfdGyxD/VSgjuCUfORKqpkvO6EGY79n8S9LhnlLNL7+zuXrRoreh
	 bhnhd87tazJylpP+YN74CLDqC4MUKo8yvCFmVwTjgpU6xReMxYYyeix6EVxkeMN+nz
	 RE5Eyt/AXuW8NtB6Y9WAmUf49/anFfwoQUHxvMXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BB8F80169;
	Tue, 23 Feb 2021 11:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5D2F8016A; Tue, 23 Feb 2021 11:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1834F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1834F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="OoHXK6IP"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223105427euoutp0268ed6421f22cb2dfbf85c9188614b061~mWxYokQCc2519625196euoutp02N
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:54:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223105427euoutp0268ed6421f22cb2dfbf85c9188614b061~mWxYokQCc2519625196euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614077667;
 bh=X3LS8wSTHitJstWYI+nFdWJetockK/tMvKN3Q2LHOjg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OoHXK6IPrgha/Px8BqzbgmgUaDqbMla+md7fTdzO3wNnLpuhuPV4xt+jIZOEC6c+2
 uyGO3boI3JlcAec9A/J7EEQH2aupWxDFhLngXchBl1sIc0RJm1+c/tyGS1KEQ4m8qT
 Ggy5Bc5S48qoQ1rhvkH0+nPBccokwKox9S8orgyI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210223105421eucas1p1adce9bbf05f800539f726b0c928b4033~mWxTzKds-1589115891eucas1p1e;
 Tue, 23 Feb 2021 10:54:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 32.D1.45488.DDED4306; Tue, 23
 Feb 2021 10:54:21 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210223105421eucas1p1fbaa8188db5592cfcc715df6f0eb86c8~mWxTN2ONx1589615896eucas1p1k;
 Tue, 23 Feb 2021 10:54:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223105421eusmtrp136ba9f0ae2acde36b285c27140fcaf13~mWxTNGJiy3114931149eusmtrp1B;
 Tue, 23 Feb 2021 10:54:21 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-2f-6034dedd18ff
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.5C.21957.DDED4306; Tue, 23
 Feb 2021 10:54:21 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223105420eusmtip1d77a04a04ae4d0628ef26bf14dd0d91e~mWxSvg9jX2626626266eusmtip1i;
 Tue, 23 Feb 2021 10:54:20 +0000 (GMT)
Subject: Re: [PATCH v2 2/6] ASoC: samsung: i2s: remove unassigned variable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <90f6235a-84b1-3214-38d4-e4d265532685@samsung.com>
Date: Tue, 23 Feb 2021 11:54:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-3-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned2790wSDN5PsrS4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewRHHZpKTmZJalFunbJXBl
 TFv0kK3gPnPFj08tjA2MbcxdjJwcEgImEr9mfGTvYuTiEBJYwSjRcGkxE4TzhVFi0omnTCBV
 QgKfGSWeL/SF6bjUvRCqaDmjxKW5R6HaPwJ1vGpnA6kSFvCSeDa7iR3EFhGIk1j+5TyYzSzg
 IzHv2TsWEJtNwFCi92gfI4jNK2AncWzHZ7AaFgFVibaDG8HmiAokSfz9fZMJokZQ4uTMJ2C9
 nEDz13/6zQQxU1zi1pP5ULa8xPa3c5hBDpIQOMIhsW3RNXaIs10kZn/uZYWwhSVeHd8CFZeR
 OD25hwWioZlRomf3bXYIZwKjxP3jCxghqqwl7pz7BXQSB9AKTYn1u/Qhwo4SJ99+YQcJSwjw
 Sdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1SoSv1dNZ4KwpSS6n/xnmcCoNAvJa7OQvDMLyTuzEPYu
 YGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZhkTv87/nUH44pXH/UOMTJxMB5ilOBg
 VhLhZbtrlCDEm5JYWZValB9fVJqTWnyIUZqDRUmcd9fWNfFCAumJJanZqakFqUUwWSYOTqkG
 pqn7Tq/0WJVx8tfT5Fcvi7TmPTsZ0SPj9eFs580gt8SKxJK86pQPXasCBAsYDznosCqtijoq
 Z+Ozs3ieo1Hc0a89i8P3ymUGzSpYrjp7Ys3H6+cn+K8/n8oT91tR69tTl3trarN2fb5z/86s
 5OmOhyrt3rtuVdb9Zzv3whTbyQs9RaPLrSUTbYXFnzY+5Lmc+eNd4mfN7zHha095SfE/ZYha
 p6236ctx+y75NTYW2zL2tcyW0emYO/+R9XPr0pqQ0kmhi/wlXsWse3i5+N1mzml//0kYNIqr
 52QvS9tTYGddFFvl08Wz60rQo5ZQA9U3j63sEh4HfBdaW7rp1EvjBO21qg9WHnJ+WZ6y9f42
 eyWW4oxEQy3mouJEAIe8J4+hAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7p375kkGPTt5LO4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlTFv0kK3gPnPFj08tjA2Mbcxd
 jJwcEgImEpe6FzJ1MXJxCAksZZR427mesYuRAyghJTG/RQmiRljiz7UuNoia94wS/2atAWsW
 FvCSeDa7iR3EFhGIk9i98BALiM0s4CMx79k7MFtI4C6jxLJ/OSA2m4ChRO/RPkYQm1fATuLY
 js9gvSwCqhJtBzeygdiiAkkS66ffZIKoEZQ4OfMJ2BxOoF3rP/1mgpivLvFn3iVmCFtc4taT
 +VBxeYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMj
 MKa2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuFlu2uUIMSbklhZlVqUH19UmpNafIjRFOificxS
 osn5wKjOK4k3NDMwNTQxszQwtTQzVhLn3Tp3TbyQQHpiSWp2ampBahFMHxMHp1QDE79fvtH6
 eU+8/Faq3Zi6wOKF1Uyp40r904L3L3zyciu727IvJgpOMy75eT3Wm3BD3ee/v2w2X0lo5+sV
 pbmVv5as7L+X1bln8tr1m4K6+lPTH9ueCd7/1CCB3/f5xTOuncJOGhpKT84fu9XF/0157sNF
 3PtEjLTXH9/yYuOqJW53ZC4zBzxXUlORYbwz8/wmZaFtRbvXFdY8jLkTFzPRYUpF6Foexoqz
 SmUGBzLU/s8zevHJeoYpq7J892a+vtS1D74V7uw5ZvXQccW7aEWlNfaLlNZV/4v5pbC3d16u
 3wtz3Z0X2AR6A9N/3FBaN3VhlleSwZ1nf1Xf6/dlNzWseq8R5XSLSdLMNTcpxT3QR4mlOCPR
 UIu5qDgRANnYZ1oyAwAA
X-CMS-MailID: 20210223105421eucas1p1fbaa8188db5592cfcc715df6f0eb86c8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213324eucas1p120567e24675e3d74005187df39771372
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213324eucas1p120567e24675e3d74005187df39771372
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213324eucas1p120567e24675e3d74005187df39771372@eucas1p1.samsung.com>
 <20210222213306.22654-3-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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

On 22.02.2021 22:33, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/i2s.c:1159:18: style: Variable 'dai' is not assigned
> a value. [unassignedVariable]
>  struct i2s_dai *dai;
>                  ^
> 
> This variable is only used for a sizeof(*dai).
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
