Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEEE16F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 13:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243451663;
	Mon, 29 Apr 2019 13:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243451663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556537839;
	bh=Ub6Ixj1al3OUrSpaoA+BvZ0SV8NnfCclUMM9QVixXgk=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTHURqreF2Yn39wuvv72liuAkNlE1mqeRMEU39sPUgR5txvvPG22ZfKwYVzalGRgt
	 xewhcmYE3DiEg+qTgyOGztTbmw58vlQnfUH5rdLhbKCIWzzCNKCnzbqUSmTZ/GGBXg
	 10NAgFA+sQ4wFlVYHpWtKpqMkY8JNS3L6njZMQoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BF8F80C41;
	Mon, 29 Apr 2019 13:35:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2D4F80CAB; Mon, 29 Apr 2019 13:35:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C049F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 13:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C049F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="pe8x+kdF"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190429113525euoutp019ec4ed7ce4181844f4ca01c7e34e6972~Z7tBkRUW31129511295euoutp01f
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:35:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190429113525euoutp019ec4ed7ce4181844f4ca01c7e34e6972~Z7tBkRUW31129511295euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1556537725;
 bh=HO2ZJ8Ll+pZUDBtpcpKVOq0yNghGYf/inaeqvcLAf+A=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pe8x+kdFYwZTMwtAqIiDNUJhSu5cazrREI1pDPx0Kmr5yjYAPlykGwI4o0aae0xsb
 aFNQIGzgl4hLITgrVCFWNTLxhiFCUPFXgieBGsTbwOvUNASDDtk2UkQK+TsB38mWLK
 0Z0/vMF60OVur+jSM3PGjNYVs2uhdM0WKvEwGncg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190429113524eucas1p12f75949c187e00cfa60a9dde8afeff91~Z7tBRYD9S2618126181eucas1p1x;
 Mon, 29 Apr 2019 11:35:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 24.9E.04298.C71E6CC5; Mon, 29
 Apr 2019 12:35:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190429113523eucas1p2c1524b1f760f1c136610cded21722514~Z7tAjUS0s2467924679eucas1p2x;
 Mon, 29 Apr 2019 11:35:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190429113523eusmtrp2c8c27fe794bb42212cc1bb7b00f9724f~Z7tAVNNwG1406214062eusmtrp2P;
 Mon, 29 Apr 2019 11:35:23 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-65-5cc6e17c824f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 90.D6.04146.B71E6CC5; Mon, 29
 Apr 2019 12:35:23 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190429113523eusmtip27e51e94e0b4ff4b742458d27a5d6e909~Z7s-xuBnS2530125301eusmtip2G;
 Mon, 29 Apr 2019 11:35:23 +0000 (GMT)
To: Jyri Sarha <jsarha@ti.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <294d5558-880c-b4dc-9556-750f11d63b45@samsung.com>
Date: Mon, 29 Apr 2019 13:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d7f59227fb1cac029dc54a3c6d5740a6f579c0d6.1556284767.git.jsarha@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRT23f3YnTi5TsNDRtagDwO/qh8XikoKu0hRgZCUaMsus9Qpm1pa
 kJbopiQZOHMiE9PMj3SZ8yMUYitHapqmaRpN00oUkTJDDVt67yT/Pec5z3POc15eCpONEFup
 q6pkTq1SxMtJV7y5c7nP/9ZEZ2TQgM6HGey3iJg72jmCMb7qJZjBxXmSqXtJMHk6LcHoCirE
 jOHHEsE42lvFTOWYGWcajKMkU6A3o2NurGnhDsmWrZhxtnq6RMy+z78nYku0xQTbWKMjWXue
 TcTaRlpE7ELj9rOSC66Hr3DxV1M5deCRS66x1WVaMmlFdGO4/AvKQM2iXCShgD4IqzormYtc
 KRn9BMGfbAcSil8ITG+suFAsIBiqWCY3LDnf9CKhUYVg/lOu0z+H4BE/TEJ50mcgq8fEYy86
 HV5m2fm5GN2LoK60AF9vkLQfrD7/yIuk9BGwto+J1zFO74Lc0Ume30JHgL3TRAgaD3hTPMV7
 JXQ4DGbn8BqM9oW75hJMwN4wOmXk4wE9J4aG7kKxkPsEOGa6MAF7woytyclvA0eb0fkct8H+
 JAsTzFoEZlOb03AIrLb+tRTU2gY/aHgRKNAhMDv8gaeBdoeROQ8hgzs8aC7CBFoK2myZoN4J
 9rdm50BvqHy3SN5HcsOmywybrjFsusbwf28ZwmuQN5eiSVBymmAVdz1Ao0jQpKiUATGJCY1o
 7b91/7X9bEWLA5ctiKaQ3E26Y+Z1pIxQpGrSEiwIKEzuJWVta5T0iiItnVMnRqtT4jmNBflQ
 uNxbetNl/KKMViqSuTiOS+LUG10RJdmagfIjgn5/x/foy31PdSR2nfLyPH80fCm6toKdrs2K
 7su8Vt8d6tPSFHdg/un4592zMUURxj8TN+QQl50+ZV3uCD0t64j6HaJs2xvW59Kz6HecK3zc
 WTVbrwppbYjNEUeNlX6d+KUnqpKXQzLPDe2vXdHXF5109C2EPXy2o8Z/8jp7Xo5rYhXB+zC1
 RvEPU3Zq62sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xe7rVD4/FGLxoULW4cvEQk0VTx1tW
 i/lHzrFaXPn6ns1izQFWi+7ODlaLzolL2C1mffzBavF/zw52i6W3t7JYrJ9/i81i4rStjA48
 Hhs+N7F5LPi1lcVj5YvZ7B6X+3qZPGZ3zGT12LSqk83jfvdxJo/jN7YzeXzeJBfAGaVnU5Rf
 WpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsXJBB1vBL6aK
 64seMTYwbmPqYuTkkBAwkWh/Ng3I5uIQEljKKPH01FNGiIS4xO75b5khbGGJP9e62CCKXjNK
 rJv1B6xbWMBX4v2x92BFIgJVEis3bGMFsZkFzjFKnPkrBtEAZE9p+ApWxCagKfF38002EJtX
 wE7i8J7b7CA2i4CqRNetx2BxUYEIiTPvV7BA1AhKnJz5BMzmFAiRuNLWzgaxQF3iz7xLzBC2
 vETz1tlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpec
 n7uJERjP24793LyD8dLG4EOMAhyMSjy8Cq+OxgixJpYVV+YeYpTgYFYS4fU4DhTiTUmsrEot
 yo8vKs1JLT7EaAr03ERmKdHkfGCqySuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpa
 kFoE08fEwSnVwOht9G/hNKdN+kdVrNcvunE8/F1u6bJ99+wK85Ydcl15t+RG+dmoc2496zIT
 P31hnbeXt/6hRvUMji3v3O/7cX4MF5Q/9JhR2otnYVO56mndS3Hzy19nhOwwfhA8U8/4TaVI
 UeH12ztYQyttLAsPJO3fYTJh0f1N//eIlx2fZ9vVpzxLhi/3looSS3FGoqEWc1FxIgDAdRo0
 /QIAAA==
X-CMS-MailID: 20190429113523eucas1p2c1524b1f760f1c136610cded21722514
X-Msg-Generator: CA
X-RootMTR: 20190426132355epcas3p40fcbf7481983626cf389781af9a11d00
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190426132355epcas3p40fcbf7481983626cf389781af9a11d00
References: <cover.1556284767.git.jsarha@ti.com>
 <CGME20190426132355epcas3p40fcbf7481983626cf389781af9a11d00@epcas3p4.samsung.com>
 <d7f59227fb1cac029dc54a3c6d5740a6f579c0d6.1556284767.git.jsarha@ti.com>
Cc: fabrizio.castro@bp.renesas.com, robh@kernel.org, architt@codeaurora.org,
 Songjun.Wu@atmel.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, voice.shen@atmel.com
Subject: Re: [alsa-devel] [PATCH v7 6/6] drm/bridge: sii902x: Implement HDMI
 audio support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMjYuMDQuMjAxOSAxNToyMywgSnlyaSBTYXJoYSB3cm90ZToKPiBJbXBsZW1lbnQgSERNSSBh
dWRpbyBzdXBwb3J0IGJ5IHVzaW5nIEFTb0MgSERNSSBjb2RlYy4gVGhlIGNvbW1pdAo+IGltcGxl
bWVudHMgdGhlIG5lY2Vzc2FyeSBjYWxsYmFja3MgYW5kIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBI
RE1JCj4gY29kZWMgYW5kIHJlZ2lzdGVycyBhIHZpcnR1YWwgcGxhdGZvcm0gZGV2aWNlIGZvciB0
aGUgY29kZWMgdG8gYXR0YWNoLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJoYSA8anNhcmhh
QHRpLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
