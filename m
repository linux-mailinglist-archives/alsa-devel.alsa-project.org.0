Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37075322969
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 12:21:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB701676;
	Tue, 23 Feb 2021 12:20:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB701676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614079295;
	bh=6Jj6VT+yCuPUzyV/LE/RiYE6blDHikqPok/zc4KAstI=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8Vk5JW2Qi7zVTqEb5PzWg0CxCUQlpINLCfHl+1SA/vD4l4tR93tM3pOro3zoM384
	 uQW1uwYP4tBLttfn6xUpBKBKWywGK1eet1gZ7x1e/V8zhCtKVy+tVYYsO1QTa/vpzR
	 dGEkR2r2d+22VvMBdkC9TgxnFtzI45VNc1YLH+dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 155E1F8016D;
	Tue, 23 Feb 2021 12:20:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F34BF8016A; Tue, 23 Feb 2021 12:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC053F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 12:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC053F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="TNPDvIRn"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223111939euoutp02504e628e8f5e775c198cdce6fa4683ae~mXHYxz1OI0930909309euoutp02Q
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:19:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223111939euoutp02504e628e8f5e775c198cdce6fa4683ae~mXHYxz1OI0930909309euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614079179;
 bh=LbWJUdduFkHgNfNk0wbaVHurcHgPx71ed+zU6XjkdJk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TNPDvIRn58HcZUx5iJNC0Bvio1WCojtGLRaYbHNziHpnwTsTTZzCmuPbb0a4hXYq8
 ga5xWg7an33v5Z2m3EfWBdiM2r7jGPP5f5brPC9KTs6+w/g2MXyS/jw4jAhOgXoUAe
 7sjPiqyL88UvRv7KTULCTHXV7P+0DVOZS90Mr6ak=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210223111938eucas1p19448416d6e04eb86da1794fa928aab03~mXHYjLQln0815308153eucas1p14;
 Tue, 23 Feb 2021 11:19:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AF.66.45488.AC4E4306; Tue, 23
 Feb 2021 11:19:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210223111938eucas1p159e83546a78b34adb4b498290ef0e4bc~mXHX6hwuJ0518705187eucas1p1i;
 Tue, 23 Feb 2021 11:19:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223111938eusmtrp13f89fcbe20d4aca60c0b40d1b1ba5ea0~mXHX5zU7c1113711137eusmtrp1o;
 Tue, 23 Feb 2021 11:19:38 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-00-6034e4ca258a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.B0.21957.AC4E4306; Tue, 23
 Feb 2021 11:19:38 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223111937eusmtip1025b69facbdac7e25460e0443e54e74a~mXHXYhlsg0454704547eusmtip1c;
 Tue, 23 Feb 2021 11:19:37 +0000 (GMT)
Subject: Re: [PATCH v2 5/6] ASoC: samsung: snow: remove useless test
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <b99c0de2-4744-f2cd-399b-90cb3b540768@samsung.com>
Date: Tue, 23 Feb 2021 12:19:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-6-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd1TT0wSDPb/MrK4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewRHHZpKTmZJalFunbJXBl
 rP53kq2gga3i+tk+1gbGNtYuRk4OCQETiZt7VjN3MXJxCAmsYJT43bucDSQhJPCFUeLcJneI
 xGdGicnXrrHBdMybvYYNIrGcUeJD5wYo5yOjxOn9H4HmcnAIC7hIzJhsBdIgIhAnsfzLeXYQ
 m1nAR2Les3csIDabgKFE79E+RpByXgE7iRt/jEHCLAKqEmtOPQUrFxVIkvj7+yYTiM0rIChx
 cuYTsFZOAS+JJU/bGSFGikvcejKfCcKWl9j+dg7YNxICZzgk5iz/ygxxtItE07SfUA8IS7w6
 voUdwpaROD25hwWioZlRomf3bXYIZwKjxP3jCxghqqwl7pz7xQZyKbOApsT6XfoQYUeJtt6Z
 7CBhCQE+iRtvBSGO4JOYtG06M0SYV6KjTQiiWkXi96rpTBC2lET3k/8sExiVZiF5bRaSd2Yh
 eWcWwt4FjCyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAhPM6X/Hv+5gXPHqo94hRiYO
 xkOMEhzMSiK8bHeNEoR4UxIrq1KL8uOLSnNSiw8xSnOwKInz7tq6Jl5IID2xJDU7NbUgtQgm
 y8TBKdXAlH/rbtVvPUGJa31v2Ssq5zxfJ3IuZlFA0OtF0ydGbPm1dOKq9+8sr0TxFahqz57O
 37d//ZRjbrlHWO4V34j7sOygOMedVU/PRAdwr03Ilj5+0vvg81rJyHN796+ru1Zcf34129lY
 VrOdrw/tEzflYjHfsoD/XP8yr6+LXNYosNWpT9f2aF7u9dq89HzRvttvPvre1/dLv3llR0r3
 /83mLzv/5/7M2DyjslzHI5bf3H1X5FvPSbF6tXLJ4rd1p7UF896wvLf1TbH+6Vv6TyzCLng1
 q8w5pbmsL+CTk4H3+6UPFjnrK7b8mL2uzr30xMUN3x2DhZ+/uedY1JNYxaPCaXzce/qpCamu
 N885LVgu4q/EUpyRaKjFXFScCACg2HD1nwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7qnnpgkGLx4xm5x5eIhJoupD5+w
 WZw/v4Hd4tf/Z0wWLze/YXJg9djwuYnNY9OqTjaPeScDPTafrg5gidKzKcovLUlVyMgvLrFV
 ija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWP3vJFtBA1vF9bN9rA2Mbaxd
 jJwcEgImEvNmr2HrYuTiEBJYyihx/P40pi5GDqCElMT8FiWIGmGJP9e6oGreM0rMnH6OFaRG
 WMBFYsZkK5AaEYE4id0LD7GA2MwCPhLznr1jgai/yygx+/sfdpAEm4ChRO/RPkaQXl4BO4kb
 f4xBwiwCqhJrTj0FKxEVSJJYP/0mE4jNKyAocXLmE7CZnAJeEkuetjNCzFeX+DPvEjOELS5x
 68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P
 3cQIjKhtx35u3sE479VHvUOMTByMhxglOJiVRHjZ7holCPGmJFZWpRblxxeV5qQWH2I0Bfpn
 IrOUaHI+MKbzSuINzQxMDU3MLA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQWgTTx8TBKdXANHfO
 7kmHtz/hfF7q4X//4H/Lfq9Ji1e/ufL6UODkecx8gfOfHuvdtM9i5xKGy59mt/SF/fZYmDav
 ch3jF2MlPddtbddqJT9tsdWe9f/xXvmWfja31c9PnXvG+2Va4eedphZnbnyeuKp2wW+t5isb
 u2OckjZO055zOdfZ9Jx63MYD/sdLvs9sflLctWpXnH1Q6XazO3fZX3GEBt8V3f9OqvHJtFec
 YhM/MH723fVk/Rm9gkR/P+NerfcTg/ee3Tjr1TqmeMWwg3xv9f2MZr2469gmtYknLsrAJu/l
 ltn+xdfmOXB5JlQFTpz7orJFaEqhrnBCwrHVQSs9+l94KP66t+TmEZ1VljlzuRWz3D7O+/hF
 iaU4I9FQi7moOBEABuGeKTEDAAA=
X-CMS-MailID: 20210223111938eucas1p159e83546a78b34adb4b498290ef0e4bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213326eucas1p1b20db2e2b60807363e609efd9d3ec89c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213326eucas1p1b20db2e2b60807363e609efd9d3ec89c
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213326eucas1p1b20db2e2b60807363e609efd9d3ec89c@eucas1p1.samsung.com>
 <20210222213306.22654-6-pierre-louis.bossart@linux.intel.com>
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
> sound/soc/samsung/snow.c:112:2: style:inconclusive: Found duplicate
> branches for 'if' and 'else'. [duplicateBranch]
>  if (rtd->num_codecs > 1)
>  ^
> sound/soc/samsung/snow.c:114:2: note: Found duplicate branches for
> 'if' and 'else'.
>  else
>  ^
> sound/soc/samsung/snow.c:112:2: note: Found duplicate branches for
> 'if' and 'else'.
>  if (rtd->num_codecs > 1)
>  ^
> 
> Fixes: 7de6b6bc1a58 ("ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer")
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

