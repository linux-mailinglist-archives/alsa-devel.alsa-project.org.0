Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D86C3A0F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 18:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9191607;
	Tue,  1 Oct 2019 18:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9191607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569946238;
	bh=zM1MI9co2yHuqSMbYdQs+CCRXyCxy9oqGWjEUstYg38=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6H0FikW08D2uN0XR75e62l6hQcKT8sGgtX+cCnpTEm2z7mMf+YkLQe9pkVjjypUg
	 47tH9mAFSMW6wQcHLb0rTI8CBth28VckcYc1cwnEnxZ1XxFKZJgrM6paGmdQwRznxD
	 MBFe7N7w+Gaal4hz+tF4kttymKFxU2efT4V+BzVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E245EF80519;
	Tue,  1 Oct 2019 18:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23D0F80506; Tue,  1 Oct 2019 18:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF43AF80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 18:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF43AF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Z2xdSNUc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191001160847euoutp02f721e9482af2214c1cf91f1e82b81e23~Jka9MWwvk0445104451euoutp02J
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:08:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191001160847euoutp02f721e9482af2214c1cf91f1e82b81e23~Jka9MWwvk0445104451euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569946127;
 bh=aeBFIpROmYwqIt3R+Td4SgN1ucgpQ4MSQHRjCu6ZAU0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Z2xdSNUcC1MJEBpa6c7Lb25TYdIBgCNZDRtfvuuzf0ROpwBMlmAh4MtyYcpoEjq4i
 LRm/i+Na7IOSFs9qV5WuhgYZkoVs1OWEtUIGPj/dBIGobso7u+efK2doxnHWSgHsWA
 ZXtHLOGNZskuRi6ToDzoVDiOPcAX0JpURA7rclLE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191001160846eucas1p18b6de26fbfd58d945485e808123e97d0~Jka8fZbtp0151001510eucas1p1z;
 Tue,  1 Oct 2019 16:08:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.D1.04374.E0A739D5; Tue,  1
 Oct 2019 17:08:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191001160846eucas1p1caab8bcc93d4f3e1c2c8d47409811535~Jka8IzuXC2213422134eucas1p1S;
 Tue,  1 Oct 2019 16:08:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191001160846eusmtrp1944436ecc5b274994be8d80538c18968~Jka8H-4ua0290602906eusmtrp1a;
 Tue,  1 Oct 2019 16:08:46 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-ed-5d937a0eee54
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 22.1F.04117.D0A739D5; Tue,  1
 Oct 2019 17:08:45 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191001160845eusmtip1720184b381ba80719f24142ef4bbbc26~Jka7UMqGT0531405314eusmtip1t;
 Tue,  1 Oct 2019 16:08:45 +0000 (GMT)
To: broonie@kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6d76dfa4-f75c-70d7-977d-63f3ecb5f485@samsung.com>
Date: Tue, 1 Oct 2019 18:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001123625.19370-2-s.nawrocki@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTuvR/bVdt4va52sDCY/dFIM4suJqISNehH/ogoQ3TpZYmf7Kbm
 svKD/FZEK20oagbarKZLXJ9aM7+KnAMrQUarhEiwoK1CEs3tKvnvOec85zzPA4ch2Qk6kEnP
 vsDrsjWZKokvNTi2ZNsr1zcl7TM+UHAzdivB9beYaO7Gp3kJN3PNjDibrU/K/Z6pJDjzl/c0
 12IbIrj7rxxSzvVjmObsPW4i1k/d5yqVqB8bHFK12VglUT+8c1Xd3LqK1PUDRqR2mYMSpIm+
 0Wl8Zno+rwuPSfE9P2z0yzXQF539NqoYtVPVyIcBfACctR+IauTLsLgHwczNKYlYuBE0dznW
 Jy4EndNT0o0V69OvyINZ3I2gb0ArkhYRVH+3kJ5BAD4DnYYXhAcr8HaYa60iPSQStxHwzTjs
 JUlwBNSN1nsvyXAMuP489y5QeDcsvl2iPXgbPg0/nSO0yPGHyVvzXuM+OBq6Z8u9d0ishFL3
 XVrEu8Cy2OoVA/xZCnWWt6Ro+wiMuV9IRBwAC+MD63F2wpumWkpcKENQ+3ROKhYNCD6OdyCR
 dRhGxu1rEsyaRAiYnoSL7Th4N9Al9bQBy2F20V80IYfGwWZSbMugspwV2bvhr7GZEHEg1Myv
 Ug1IZdgUzbApjmFTHMN/3Q5EGZGSzxOytLwQmc0XhAmaLCEvWxuWmpNlRmv/9WZl/NcjNLR8
 zoowg1RbZbMnm5JYWpMvFGZZETCkSiGLXm5MYmVpmkI9r8tJ1uVl8oIV7WAolVJ2aYvzLIu1
 mgt8Bs/n8rqNKcH4BBYjPypjdDKkitUfDc+tOFhUEtqenru/5FlhLT4+fSJq8pj85YolQc++
 jsyIv0xO34sNU4T2HkhcZh1xwTFBE705V5Kf2U4ttA6Z/G9r1FyUINfVWK5PmlLbSpfKDgku
 f3nQmbT3loKWjmAtt5wSUT4a/G5hj9tZpKwwKePt1LCKEs5rIkJJnaD5B8g04BJbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7q8VZNjDZZNsbG4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VouLK74wOXB7bPjc
 xOaxc9Zddo9NqzrZPDYvqfeYPuc/o0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZ
 WlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl7F/FXTCLteLBxvMsDYzzWboYOTkkBEwk
 Du1+ztjFyMUhJLCUUeLqu/2sXYwcQAkpifktShA1whJ/rnWxgdhCAq8ZJRZf0AWxhQUiJRbO
 OsAEYosIiEncntPJDDKHWWAuk0Tfv80sEEMPMkpMWPSTHaSKTcBQovdoHyOIzStgJ/H5+16w
 bhYBFYm3Z3+ygtiiAhESh3fMgqoRlDg58wnYpZwCNhLLb7Qxg9jMAuoSf+ZdgrLFJZq+rGSF
 sOUltr+dwzyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMBo
 3Xbs55YdjF3vgg8xCnAwKvHwNgRNjhViTSwrrsw9xCjBwawkwmvzZ1KsEG9KYmVValF+fFFp
 TmrxIUZToOcmMkuJJucDE0leSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+
 Jg5OqQZGrblntU9lJS9fk9LuoS+40sdM6hBXttGV4J5aK3aFnkqWYtcnPyd/8ExIE/Vsu+32
 uuCCzIUJKzifiN1heqO7cIs4A9OLkx77/uas/xzqeCLwktrTyfXq1VOVBN5s+3uRx/HS9beP
 7xfNVrHeaREUujC4/JOpkcQ5VgP1M37sq9pLGmXXsNYpsRRnJBpqMRcVJwIALwb+hOwCAAA=
X-CMS-MailID: 20191001160846eucas1p1caab8bcc93d4f3e1c2c8d47409811535
X-Msg-Generator: CA
X-RootMTR: 20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
 <CGME20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41@eucas1p2.samsung.com>
 <20191001123625.19370-2-s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v3 RESEND 2/3] ASoC: samsung: arndale: Add
 support for WM1811 CODEC
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

On 10/1/19 14:36, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I forgot to add carry the tag:
 Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
