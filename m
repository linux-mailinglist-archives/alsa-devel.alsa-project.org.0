Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954868C4E1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 18:32:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28C6E0E;
	Mon,  6 Feb 2023 18:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28C6E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675704722;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:Subject:References:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=rTiOivrgzBPwgcmV1chha3UQsDIoimM5claUyRXfLcWPn/RM7Q6oAkSn6VRxSy2Kc
	 Rmrr1022krpZ1ou6+hBWREh8FlFKxuU+Xoa5C1XwB7M9/V3Fx/52eWF54B60nyx4Gz
	 t1g2O5loHauKnuBDja6YoafkVcSvD29T20RXmVyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4017FF8014B;
	Mon,  6 Feb 2023 18:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE2FAF804F1; Mon,  6 Feb 2023 18:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_DNSWL_LOW,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6462F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 18:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6462F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rwSORPyO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675704645; bh=NltPgNlAdNktVwNhm4U0mgyHunfEMjd5nRrvofIXPOo=;
 h=X-UI-Sender-Class:Date:Subject:References:From:To:Cc;
 b=rwSORPyOb2xYhLcjtIo8XGP62jumCLxZYBmwQWTIiRldGeZrAU4/xTGcuQ6LKTK6j
 mJ3uFotgaQxkIXKqfPVfJjddODj1b+QdB+EzDV0A9BWIribr2W0qS+SvAotCaPffvQ
 o2X1190c/Hl0/fK9HE8cBqUWAkuRaQcQHZVybCPMbEgOJ4zoFd1qqTXT6at+Q3z1/E
 TPL7hFD0wb+skN1tXQ76S0sezAlfieBT8i3+cD48FiqFcCVPosh1me/Jc17OwS+img
 dfOMP0gwlk6sTrOryGRs3ygF309K9tDkv4KxNF+tAuvmgihvNK/lO/Z/bwFnzuJ1I+
 3cR3yMxPsWxvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.95.155.152] ([109.42.113.120]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Ed-1oSgG1393d-013K5p; Mon, 06
 Feb 2023 18:30:44 +0100
Date: Mon, 06 Feb 2023 18:30:44 +0100
Subject: Re:Motu 896Mk3Hybrid dump
X-Priority: 3
Message-ID: <rbih9oyihq4crt3olr-o19zohmq8w36-ipfswlyypvjp5a8src-wcww6tahyaki-q7v6tx-j5yh81-vzf7pq-qn78wo-tww8q3-2h35ww-sk0mu3-7fsog578xr2k-jfqgg5-rvg5aw-mhtapx-pch8v9t7epgq.1675704644475@email.android.com>
References: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation> <63DF98FE.2060604@gmx.de>
 <Y+BXPeHLp+qoKJcv@workstation>
From: "M. Armsby" <m.armsby@gmx.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-Provags-ID: V03:K1:WqUsOzc1Imvg0qz4PeawheqmhI96/drosyG/Wcwgmqe0zo/iRec
 zeGC4By8M9XZHhSkb1DcHI3Xl62wCip8z1YlOSbjUNLxrARQ9XTPJrFPM6gFi9J0/rb7f9n
 5M2ZKsY9jfOOXI9CYVV3qU6a9lzE4Vj3ss9+rfee1/lnmwCSou4JSFkV6IZfYpKZgMY72ji
 ixcYzRH8tak0f89o1B0Yg==
UI-OutboundReport: notjunk:1;M01:P0:kDTQbUVGh7k=;kUI0/5vpwtlYN/sCvnzigx2zfkV
 cwupleOCX34uhU5w+MCoMimZ5L9ztnasNPoFD7XHB+LOcoKPSk20LZ/Y7aR7qiHPlIGSiQCDw
 UniGvDgnkXup8c+MqEHiiwtqr++9Z8QVL+iOSPMRw5q6qy5Nx9gf+tLGm/HYx9lBKnRzNt022
 vvSWFHDjkoiMYrSgZKXQUmV2IC86vS4RBA/mWRJviELqgGgRnBLETbPpDBPVppK51NhBd9Ymg
 +wlhNLBsYhlIWAzcbvKCS9FGRAyrpc6JKoyjvU7vqzU2B/HFhmgvrnQ8uW23ElplkkX0JPBxV
 27MTD0jHFNkAoPwq2SR2HsNmyi+RmyYAxle5grKAGEBbTE8HEeW8SXQx3+CMS590h0YF+SwFL
 7Xr/Pv9wGe9zhN5Y2lquKQbyYcZqBToBkfFfjsIYQ+qH1qctaSyiSd9ohU++Zvp3uKVULc3My
 lLruQv/UBmt9OgZffzmwAVZQXGNqw5nWfoY3lVGPhhPo1bpRflq8nBxb1nlDf8Vg8fMr2AqY6
 tfEKFldU8B6TPS4TVPP3cHtWapELgykjx+oqGcC3AZOyPF8jqA+gqKMOtc75nwOfYZ1oIZ61D
 i0XWQRqwRL1nNUEWypCCoBvXCCeOiICd0PANcbJkKFXpbyO3Ds11WA2ONgDgBm2nd7rWV5OXn
 6fPiuFcKsvqHfOAFZAncRDDqJyVwVMgk82pvD0DbpRLVbgM3EzxI50bIn2bBQTffpzmOyNAFm
 ADvr0LLC7CgYFEtj78CPpgKnJbsPyQPc+qn+2YmygluKxIB0YEFCYqWI0eqAdF6XDewJQX/gw
 XYvpQlDbvhHjm0WbpIuq77Y5rVASLBQeVpfpwaUH9WfUfL5GPgOhhGq8zDpGMmoLtlKd1BrnY
 WmygVLXT1FFoknFwAiMGDNXy1f5zQbVucoxNcSIfsn6/2YuceUstWlPtQqH8MOT34AFLqbJvi
 1QuR53F2KDBq1rFLOb/62Nf9wJI=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: ALSA mail List <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

