Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D615C198C92
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 08:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789A11666;
	Tue, 31 Mar 2020 08:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789A11666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585637565;
	bh=sn2wZ0peyG2Mn4oFZ/eT/h61xUTwsBzAECWM4Wcw79Y=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBANdLmlOxk9c1fOqgirQw0pcBBW8Zzdu/L++sx83gtpvbH4dhGQBbznMdcB5vgrn
	 RWMIHQRb9cbXIf5y8ZgtL1V4hiKonDV1EhMzFw2PhZ5XSxTaR1eSef1CNbHPT1/ryi
	 QyPnSoe5T+IPQWmKnCddHiWxKpJxJH3JxrbJbhh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80964F80146;
	Tue, 31 Mar 2020 08:51:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DBE5F8014F; Tue, 31 Mar 2020 08:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D234F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D234F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="MrG4AXus"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200331065046epoutp04f9a69172b93244a44a2c2d9d9d56cf9e~BUNteubxR0608606086epoutp04b
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 06:50:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200331065046epoutp04f9a69172b93244a44a2c2d9d9d56cf9e~BUNteubxR0608606086epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585637446;
 bh=BHA2V+jRjcICflCvpthHsegisMizrMw9lwUrKLxnm9A=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=MrG4AXusSqAEe+h+fhS15KFVXc9gD2r4E6/DkZaaWqjyelj9zzAedsJUGgEKNBKY0
 BEx8YjiVbP+Y4vPawee/XUv+5gKwdpiEt5ZuCD4h9YUOsqDEocJIygtR5/zXojXAdK
 1CC+Eis/gxEZGjHwj9nIp3vCa0Du5KPTW0mXn/uU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200331065042epcas2p40e4afe8478da44a04ac18d66cc1161e0~BUNo-mJMm0114901149epcas2p4Z;
 Tue, 31 Mar 2020 06:50:42 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48s0Mh6CkSzMqYkZ; Tue, 31 Mar
 2020 06:50:40 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.77.04105.048E28E5; Tue, 31 Mar 2020 15:50:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331065038epcas2p17915ca6eb6d95d25218cd22390bafd7d~BUNlQeaA22230822308epcas2p1r;
 Tue, 31 Mar 2020 06:50:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331065038epsmtrp1a15d40bae08b808ec9343c20cfe2840a~BUNlPevDG1710017100epsmtrp1y;
 Tue, 31 Mar 2020 06:50:38 +0000 (GMT)
X-AuditID: b6c32a47-173ff70000001009-62-5e82e840d03c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.F6.04158.D38E28E5; Tue, 31 Mar 2020 15:50:38 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331065037epsmtip1385bfa362afef57e972b599244ba431f~BUNlHW6Kg1583215832epsmtip1d;
 Tue, 31 Mar 2020 06:50:37 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: 
Subject: [PATCH 0/3] fixes for topology
Date: Tue, 31 Mar 2020 15:50:37 +0900
Message-ID: <012501d60728$af92ad40$0eb807c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQE8i8ZtjI711u7LMsI3xetGlRxONgKEfuIyqYD+kZCAABUsMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d17dzetxW2uOkmPdSuiwNpmW1fLiOwxegqaQYR21du23Ivd
 rRf9oUa+Vk7FSNeTkkJFNDGzotKpzKQySymToKjQkiIzjMKsbXfB/vuecz7ncL6/35Hgsmoy
 WmK0ODi7hTXRZCTR0rFcG7NhJC9N2dUey/T3eTHm7LsPJFPZ4iKYif5CjOnqu4YxjT/rEdOZ
 W4FtEOsax/NI3R3PG7GuqbaI1JU01yJdQ/MAkSTaZ1pn4Ngszq7gLJnWLKNFn0BvT05PTNdo
 laoYVRyzhlZYWDOXQG/akRSzxWjy70ErDrMmpz+VxPI8vWr9OrvV6eAUBivvSKA5W5bJplLZ
 VvKsmXda9CszreZ4lVKp1vjJAyaDxzWJ2R4TR+vP/sBykA8vRhESoFbDeIkPFaNIiYxqRdD3
 8lQo+I7APfxFJAQTCNpKavwVSbDl5+95gW4ZdR+B7wwjMJ8QDF2tJgIMScXDaRcdYOQUwI+7
 3ViAwalyBHUjw8E5EZQUSqfWBpgoahkUVA6RAU1QS+FZRTER0FIqDnonvbigZ8Kjqg/BPE6p
 obruMibohXD7y4WQGwX8+nhdJOTlcL4oHxd22Ah/c2uDOwA1SsJQTbVI8LIJnj44LvRGwWdf
 s1jQ0fDJnS8W+JMIvj6ZDBUqEBS5ZIKOheaLPZgwZzF0vg7tNgMKO/6IhbQUCvNDNA03e6ZC
 NMClRnEpoj1hxjxhxjxhxjxhZq4gohbN5my8Wc/xalts+Fc3oeCFrtjailqe7vAiSoLo6dK3
 A7lpMhF7mD9m9iKQ4LRcSu7OSZNJs9hjxzm7Nd3uNHG8F2n8D1+GR8/KtPrv3eJIV2nUWq0y
 TsNotGqGniNtmja4X0bpWQeXzXE2zv6/D5NEROegSzGpzoyU5zXZC3zy3raN5Zs/fytxv09M
 HB2/qM5vrUrNfpFycFpZ2cP+X3td8fUZGfdGMerbLXlS49ypEz0T+kVb9jhvpO7sbth1KK8t
 2Xp5zaITp3ZOjJVGZbvr42rayVd9nbcK5hvKz/UMjhWsTe213Ws3fncvOTJmjGzpvr6Ne0YT
 vIFVrcDtPPsPmzorebcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSnK7di6Y4g+kLmCyuXDzEZDH14RM2
 ixnbulksvl3pYLI4enExk8WG72sZLY40TmFyYPfY8LmJzWPnrLvsHptWdbJ59G1ZxeixfstV
 lgDWKC6blNSczLLUIn27BK6MWd1/mArOsFSsnfqFqYHxOHMXIweHhICJxPdfMl2MXBxCArsZ
 JQ4cnMXSxcgJFJeQ+DD/DDuELSxxv+UIK0TRc0aJaf2b2UGa2QSsJHq6lUBqRIDqv+w6wQRS
 wywwi1Hi1ZzZUA09jBJXfzazgjRwCvBKTPhnDdIgLKAu0T7jNhuIzSKgKnFhShfYYl4BS4nz
 fw4xQ9iCEidnPgGLMwMd2ni4G8qWl9j+dg4zxHEKEj+fLmOFiItIzO5sY4Y4yEnif+MqpgmM
 wrOQjJqFZNQsJKNmIWlfwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOJ60tHYw
 njgRf4hRgINRiYf3wdXGOCHWxLLiytxDjBIczEoivGz+DXFCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeeXzj0UKCaQnlqRmp6YWpBbBZJk4OKUaGKN8E1aFbz/Le2vSKiH9yRd2a9ZvytrxhHHV
 Lu45s7y2zvJde2FfbepmwTqT0KR2mbwo8dMqi342hX0KjDVLVvOevcHPxUTWK6Rg3+o7jMez
 d5apOnxIC5c65Ss/+Xvnwy9pt36uvPxZT36agX2nok5Go+Ysl5L5eTLvWZqcm6Z9vev2ap6Z
 phJLcUaioRZzUXEiAAltfpajAgAA
X-CMS-MailID: 20200331065038epcas2p17915ca6eb6d95d25218cd22390bafd7d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb
References: <CGME20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb@epcas2p2.samsung.com>
 <000d01d60665$be93a920$3bbafb60$@samsung.com> 
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

Hi, Mark

I found out the problem of my email client. Automatic line break..
I'm sorry and please ignore previous email I sent.
I'll give more attention to my email.

Thank you.
Lee

Gyeongtaek Lee (3):
  ASoC: dapm: connect virtual mux with default value
  ASoC: topology: use name_prefix for new kcontrol
  ASoC: fix regwmask

 sound/soc/soc-dapm.c     | 11 ++++++++++-
 sound/soc/soc-ops.c      |  4 ++--
 sound/soc/soc-topology.c |  2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)


base-commit: 76ccd234269bd05debdbc12c96eafe62dd9a6180
--
2.21.0



