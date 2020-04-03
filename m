Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211119CED6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 05:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1601679;
	Fri,  3 Apr 2020 05:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1601679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585884006;
	bh=pQlYwPpglr1NNKYzzXXPFeoWhay5d56mg3hJUkEmtes=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YWkQ1ViI0O+DMZEDb+alFFpLMLGIiB1tFtMlH46UUkccfUkTyKWI7LDced4ELxFAT
	 tuQyLjQiwe/k3HzgGBaCM2nHg5XNjtMGvPOTCMmi7+j1CJ+gAxWqk9YLM378HgQcKB
	 oz3hvTEkx0gGZaoU0rhjcCHnrZYfSXJKUDj8sfWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA43F8015C;
	Fri,  3 Apr 2020 05:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44028F8014C; Fri,  3 Apr 2020 05:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0FC4F800C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 05:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FC4F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XboiI0E6"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200403031801epoutp033fa130795406041b85eb972f84ef575d~CMPzcetH80745007450epoutp03W
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 03:18:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200403031801epoutp033fa130795406041b85eb972f84ef575d~CMPzcetH80745007450epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585883881;
 bh=IDU5itCzN8DZ3mUkUp7p+SLSxiIelnKTu75lBDkqQv0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XboiI0E6aY1ydKCisC7afjG5kgv4FzYmMyaZDISN/sbs8jBiyBBYiUlqYjjAdrmal
 Js8Ip6SnJ0Imx9Wo0X/u5IejfXJiaNUNIovUlcdEyBEP9UA5FkTIFdRhRcd+FfdChY
 PzLRkk/e/J4R7JGpMi9OplVCOXhkiPmPKfXqyEmQ=
Received: from epcpadp2 (unknown [182.195.40.12]) by epcas1p3.samsung.com
 (KnoxPortal) with ESMTP id
 20200403031801epcas1p3e19d2b9625832f07afb19e823f4f8e25~CMPzQK7dR0543805438epcas1p3y;
 Fri,  3 Apr 2020 03:18:01 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200403022148epcas2p26dd2bc9071a69f08102af082d813cd36~CLetywk651079510795epcas2p2P;
 Fri,  3 Apr 2020 02:21:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200403022148epsmtrp2c9ee0f25f97aeb8fa3901700e812b844~CLetxzA630245202452epsmtrp2F;
 Fri,  3 Apr 2020 02:21:48 +0000 (GMT)
X-AuditID: b6c32a29-2c7ff70000000fb8-e0-5e869dbbff1b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.98.04024.BBD968E5; Fri,  3 Apr 2020 11:21:47 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200403022147epsmtip2a2a0a08d7a8651f1fdd8a4806fb81e3a~CLetmjFQn1572115721epsmtip2D;
 Fri,  3 Apr 2020 02:21:47 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/1] reviving ack callback for 5.7(latest)
Date: Fri, 3 Apr 2020 11:21:47 +0900
Message-ID: <1019298652.01585883881138.JavaMail.epsvc@epcpadp2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYJXmpGjBi4iooxR12iuKfPzVxgmQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXnf33LY4g/13bCyuXDzEZDH14RM2
 i5eHNC1mbOtmsXh1eBejxbcrHUwWRy8uZrLY8H0to8WRxilMDpweGz43sXnsnHWX3WPTqk42
 j29nJrJ49G1ZxeixfstVlgC2KC6blNSczLLUIn27BK6MddfWsRb8Z6n4de4XYwPjb+YuRk4O
 CQETiRvHW9m7GLk4hAR2M0osnzmDDSIhIfFh/hl2CFtY4n7LEVaIoueMEhOWXWYBSbAJ6Ep8
 uXcHbJKIgK/ElUctjCBFzAIbgIomP2QCSQgLWElcnXAMbCqLgIrEyZm3GEFsXgFLiZ/bp7JA
 2IJA8SdgNrOAtsTTm0+hbHmJ7W/nQJ2qIPHz6TJWiGV6Eksan7BD1IhIzO5sY57AKDgLyahZ
 SEbNQjJqFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxguNHS3MH4+Ul8YcY
 BTgYlXh4GQ62xgmxJpYVV+YeYpTgYFYS4XWcARTiTUmsrEotyo8vKs1JLT7EKM3BoiTO+zTv
 WKSQQHpiSWp2ampBahFMlomDU6qBkS290G95/6FHGVPnFG9uc9OYc+bgtX0L6/MubfrB3r93
 t4B0VX/4+v9flvnfmjp3xnJVFbZT55yav5dpqzzfF5KzznjtXishe41J/8/8P3qc68neD59q
 rZxTlwRd2vl36Sl1ib3sMzIPHLawCmM5/bBC9+6dL6sFc8rilrafLJltIzApeerzDjclluKM
 REMt5qLiRAA+9vypmwIAAA==
X-CMS-MailID: 20200403022148epcas2p26dd2bc9071a69f08102af082d813cd36
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20200403022148epcas2p26dd2bc9071a69f08102af082d813cd36
References: <CGME20200403022148epcas2p26dd2bc9071a69f08102af082d813cd36@epcas2p2.samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, cpgs@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

ACK callback is useful to notify application pointer in DMA buffer to DSP,
because it is called after application pointer is updated in ALSA.
DSP can use the pointer to control preprocessing, detect underrun and so on.
I'd like to revive it from 5.4 if it is possible.
This patch is created in for-linus branch.

Gyeongtaek Lee (1):
  ASoC: soc-component: add snd_soc_component_ack()

 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 14 ++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 19 insertions(+)


base-commit: 52ac54e1de31af2d40f10dd4e711e774655e091b
-- 
2.21.0



