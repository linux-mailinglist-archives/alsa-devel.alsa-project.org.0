Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377C630D51
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AF95163A;
	Sat, 19 Nov 2022 09:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AF95163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847288;
	bh=xwROaTzGKNxdo+RwPJ+M02tH8KMtSYg1hTOrH/6F3VI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhDLjQJoZamlNg90+aMf/aoybvtGEVtUDTDkwyWqcrb1Fyp3dioK+nhfIy1nQYnDt
	 sdHhi9esSvN/q3OBnZ7WmM0gL0F9HfSYfZr+biPHi+rgk1uQH6pkoD0nT5mB4fqn2p
	 p0//AmFkKJxA0x3RGZ7jrgA+ZKTICXhw7CW795ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD1DF8016A;
	Sat, 19 Nov 2022 09:40:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC195F80169; Wed, 16 Nov 2022 13:39:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0939F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 13:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0939F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.b="L0A9Edju"
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGBqDqg003782; Wed, 16 Nov 2022 12:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sVd/c0WnzKKlxFndTgFHpEQ6SdR1MS3OqNaMGVWAB3Q=;
 b=L0A9Edju7qrc1wChvgY30UZwAZL9bQWvwXJDE0a5Ybh/iwfPRECWKFLEYyx3P3EdbR8x
 T9rj0KAPMELqBihA2v8Z3Mu/SMF9Ct3rzDNS5tOWll3cOT9HHzVSdXDXn6ZyaeGWVmv9
 NqyBP1GS6CESc5l/n5VcKDT76heBZ4akGofc0bcg3lSnLUBee0VOAFqqwyGUcFVfGKhC
 YPQ727XpviCrsJTE96IsfQPhm32aFX2L8ewzcHjv59eLbfj+S0/7XHg4L5KLG5njFJ7v
 lgG2Kd3qHFkvKhWj2LszjwNCDBfzDNwlqq20Q8iIX5+8vrkM/EPApc/GC1C5CZ9/kUXW vg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvyc9h3p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 12:39:14 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGCZPF2023726;
 Wed, 16 Nov 2022 12:39:13 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3kt34a13a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 12:39:13 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AGCdBob21627396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Nov 2022 12:39:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867EF58067;
 Wed, 16 Nov 2022 12:39:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9863E58055;
 Wed, 16 Nov 2022 12:39:08 +0000 (GMT)
Received: from [9.211.85.81] (unknown [9.211.85.81])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 16 Nov 2022 12:39:08 +0000 (GMT)
Message-ID: <62786a02-3647-485e-a5c1-92b3008e34b1@linux.ibm.com>
Date: Wed, 16 Nov 2022 13:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 5/7] s390/ism: don't pass bogus GFP_ flags to
 dma_alloc_coherent
To: Christoph Hellwig <hch@lst.de>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-6-hch@lst.de>
From: Wenjia Zhang <wenjia@linux.ibm.com>
In-Reply-To: <20221113163535.884299-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yfN9kWLbQneuTBIV0jE6gRqijVr8R_IG
X-Proofpoint-ORIG-GUID: yfN9kWLbQneuTBIV0jE6gRqijVr8R_IG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=746 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160087
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:31 +0100
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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



On 13.11.22 17:35, Christoph Hellwig wrote:
> dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
> for allocation context control.  Don't pass __GFP_COMP which makes no
> sense for an allocation that can't in any way be converted to a page
> pointer.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/s390/net/ism_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
I'm fine with that.

Acked-by: Wenjia Zhang <wenjia@linux.ibm.com>
